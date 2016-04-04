--ʯ�� �Ǻ�
--MisDescBegin
--�ű���
x211701_g_ScriptId = 211701

--�����
x211701_g_MissionId = 601

--����Ŀ��npc
x211701_g_Name	="֣��"

--�������
x211701_g_MissionKind = 29

--����ȼ�
x211701_g_MissionLevel = 21

--�Ƿ��Ǿ�Ӣ����
x211701_g_IfMissionElite = 0

--******���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������******
--�����Ƿ��Ѿ����
x211701_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������Ҫɱ���Ĺ�
x211701_g_DemandKill ={{id=1865,num=10}}		--������1λ

--******�����Ƕ�̬******

--�����ı�����
x211701_g_MissionName="ʯ���е�����"
x211701_g_MissionInfo="���Ѿ����֣������������Ǿ���Ϯ�����ա�ɱ��10ֻ�����ǣ�Ϊ���ճ���һ����"
x211701_g_MissionTarget="ΪԲ�´��������ɱ��10ֻ����"
x211701_g_ContinueInfo="���Ѿ�ɱ��10ֻ���룿û�оͼ�����"
x211701_g_MissionComplete="��ϲ��ɱ����"

--������
x211701_g_MoneyBonus=10200
x211701_g_Exp = 3000
x211701_g_ItemBonus={{id=30002001,num=1}}


--MisDescEnd
--**********************************
--������ں���
--**********************************
function x211701_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
	if IsMissionHaveDone(sceneId,selfId,x211701_g_MissionId) > 0 then
		return
	end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x211701_g_MissionId) > 0 then

		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x211701_g_MissionName)
			AddText(sceneId,x211701_g_ContinueInfo)
		--for i, item in g_DemandItem do
		--	AddItemDemand( sceneId, item.id, item.num )
		--end
		EndEvent( )
		bDone = x211701_CheckSubmit( sceneId, selfId )
	        DispatchMissionDemandInfo(sceneId,selfId,targetId,x211701_g_ScriptId,x211701_g_MissionId,bDone)
		--���������������
	elseif x211701_CheckAccept(sceneId,selfId) > 0 then
	
		if GetName(sceneId,targetId) ~= x211701_g_Name then
		
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x211701_g_MissionName)
				AddText(sceneId,x211701_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x211701_g_MissionTarget)
				AddMoneyBonus( sceneId, x211701_g_MoneyBonus )
				
			for i, item in x211701_g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
			
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x211701_g_ScriptId,x211701_g_MissionId)
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x211701_OnEnumerate( sceneId, selfId, targetId )
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x211701_g_MissionId) > 0 then
		return 
	end
		--����ѽӴ�����
    --else
		if IsHaveMission(sceneId,selfId,x211701_g_MissionId) > 0 then
			AddNumText(sceneId,x211701_g_ScriptId,x211701_g_MissionName);
			--���������������
		elseif x211701_CheckAccept(sceneId,selfId) > 0 then
			AddNumText(sceneId,x211701_g_ScriptId,x211701_g_MissionName);
		end
end

--**********************************
--����������
--**********************************
function x211701_CheckAccept( sceneId, selfId )
	--��Ҫ60�����ܽ�
	if GetLevel( sceneId, selfId ) >= 60 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x211701_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x211701_g_MissionId, x211701_g_ScriptId, 1, 0, 0 )	--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x211701_g_MissionId)	--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)	--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)	--�������кŰ���������ĵ�1λ��0
end

--**********************************
--����
--**********************************
function x211701_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x211701_g_MissionId )
end

--**********************************
--����
--**********************************
function x211701_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x211701_g_MissionName)
		AddText(sceneId,x211701_g_MissionComplete)
		AddMoneyBonus( sceneId, x211701_g_MoneyBonus )
		for i, item in x211701_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end		
    EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x211701_g_ScriptId,x211701_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x211701_CheckSubmit( sceneId, selfId )
    misIndex = GetMissionIndexByID(sceneId,selfId,x211701_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,1)
    if num == x211701_g_DemandKill[1].num then
	return 1
    end
    return 0
end

--**********************************
--�ύ
--**********************************
function x211701_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x211701_CheckSubmit( sceneId, selfId, selectRadioId ) then
    		BeginAddItem(sceneId)
			for i, item in x211701_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
			
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then		
		
			AddExp(sceneId,selfId,x211701_g_Exp)
			AddMoney(sceneId,selfId,x211701_g_MoneyBonus );
			
			ret = DelMission( sceneId, selfId, x211701_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId, selfId, x211701_g_MissionId )
					AddItemListToHuman(sceneId,selfId)
			end
		else
		--������û�мӳɹ�
			BeginEvent(sceneId)
				strText = "��������,�޷��������"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x211701_OnKillObject( sceneId, selfId, objdataId )

	if objdataId == x211701_g_DemandKill[1].id then
		misIndex = GetMissionIndexByID(sceneId,selfId,x211701_g_MissionId)
		num = GetMissionParam(sceneId,selfId,misIndex,1)
		if num < x211701_g_DemandKill[1].num then
		--��������ɱ�־����Ϊ1
		if num == x211701_g_DemandKill[1].num - 1 then
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
		end
		--���ô������+1
			SetMissionByIndex(sceneId,selfId,misIndex,1,num+1)
				BeginEvent(sceneId)
		strText = format("��ɱ������%d/10", GetMissionParam(sceneId,selfId,misIndex,1) )
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
		end
	end
 
end

--**********************************
--���������¼�
--**********************************
function x211701_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x211701_OnItemChanged( sceneId, selfId, itemdataId )
end
