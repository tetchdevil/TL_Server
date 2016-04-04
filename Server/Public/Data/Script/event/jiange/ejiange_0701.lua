--���� �����Գ
--MisDescBegin
--�ű���
x210701_g_ScriptId = 210701

--�����
x210701_g_MissionId = 501


--����Ŀ��npc
x210701_g_Name	="��ĩ"

--�������
x210701_g_MissionKind = 18

--����ȼ�
x210701_g_MissionLevel = 3

--�Ƿ��Ǿ�Ӣ����
x210701_g_IfMissionElite = 0


--�����Ƿ��Ѿ����
x210701_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������Ҫɱ���Ĺ�
x210701_g_DemandKill ={{id=1510,num=10}}		--������1λ


--�����ı�����
x210701_g_MissionName="�����Գ"
x210701_g_MissionInfo="ɱ��10�������Գ"
x210701_g_MissionTarget="ɱ��10�������Գ"
x210701_g_ContinueInfo="���Ѿ�ɱ��10ֻ�����Գ��û�оͼ�����"
x210701_g_MissionComplete="��ϲ��ɱ����"

--������
x210701_g_MoneyBonus=12000
x210701_g_Exp = 3000

x210701_g_ItemBonus={{id=30002001,num=1}}


--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210701_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
	if IsMissionHaveDone(sceneId,selfId, x210701_g_MissionId) > 0 then			
		return		
	end
	

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x210701_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x210701_g_MissionName)
			AddText(sceneId,x210701_g_ContinueInfo)
		--for i, item in g_DemandItem do
		--	AddItemDemand( sceneId, item.id, item.num )
		--end
		EndEvent( )
		bDone = x210701_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x210701_g_ScriptId,x210701_g_MissionId,bDone)
			--���������������
	elseif x210701_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x210701_g_MissionName)
			AddText(sceneId,x210701_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x210701_g_MissionTarget)
			AddMoneyBonus( sceneId, x210701_g_MoneyBonus )
			
			for i, item in x210701_g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
		
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x210701_g_ScriptId,x210701_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x210701_OnEnumerate( sceneId, selfId, targetId )
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x210701_g_MissionId) > 0 then
		return 
	end
		--����ѽӴ�����
    --else
    
	if IsHaveMission(sceneId,selfId,x210701_g_MissionId) > 0 then
		AddNumText(sceneId,x210701_g_ScriptId,x210701_g_MissionName);
		--���������������
	elseif x210701_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x210701_g_ScriptId,x210701_g_MissionName);
	end
end

--**********************************
--����������
--**********************************
function x210701_CheckAccept( sceneId, selfId )
	--��Ҫ1�����ܽ�
	if GetLevel( sceneId, selfId ) >= 1 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210701_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210701_g_MissionId, x210701_g_ScriptId, 1, 0, 0 )	--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x210701_g_MissionId)	--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)	--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)	--�������кŰ���������ĵ�1λ��0
end

--**********************************
--����
--**********************************
function x210701_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210701_g_MissionId )
end

--**********************************
--����
--**********************************
function x210701_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x210701_g_MissionName)
		AddText(sceneId,x210701_g_MissionComplete)
		AddMoneyBonus( sceneId, x210701_g_MoneyBonus )
		for i, item in x210701_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end		
    EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x210701_g_ScriptId,x210701_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210701_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x210701_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,1)
    if num == x210701_g_DemandKill[1].num then
		return 1
	end
	return 0
end

--**********************************
--�ύ
--**********************************
function x210701_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x210701_CheckSubmit( sceneId, selfId, selectRadioId ) then
    		BeginAddItem(sceneId)
			for i, item in x210701_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
			
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then		
		
			AddExp(sceneId,selfId,x210701_g_Exp)
			AddMoney(sceneId,selfId,x210701_g_MoneyBonus );
			
			ret = DelMission( sceneId, selfId, x210701_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId, selfId, x210701_g_MissionId )
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
function x210701_OnKillObject( sceneId, selfId, objdataId )
	--print("ɱ�������Գ", objdataId)

	if objdataId == x210701_g_DemandKill[1].id then
		misIndex = GetMissionIndexByID(sceneId,selfId,x210701_g_MissionId)
		num = GetMissionParam(sceneId,selfId,misIndex,1)
		if num < x210701_g_DemandKill[1].num then
		--��������ɱ�־����Ϊ1
		if num == x210701_g_DemandKill[1].num - 1 then
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
		end
		
		--���ô������+1
		SetMissionByIndex(sceneId,selfId,misIndex,1,num+1)
		BeginEvent(sceneId)
		strText = format("��ɱ�������Գ%d/10", GetMissionParam(sceneId,selfId,misIndex,1) )
		--print(strText)
		AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		end
	end
 
end

--**********************************
--���������¼�
--**********************************
function x210701_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210701_OnItemChanged( sceneId, selfId, itemdataId )
end
