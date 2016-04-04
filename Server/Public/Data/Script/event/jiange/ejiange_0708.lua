--����  ����С��
--MisDescBegin
--�ű���
x210708_g_ScriptId = 210708

--�����
x210708_g_MissionId = 508

x210708_g_PreMissionId = 506

--����Ŀ��npc
x210708_g_Name	="����֦"

--�������
x210708_g_MissionKind = 18

--����ȼ�
x210708_g_MissionLevel = 6

--�Ƿ��Ǿ�Ӣ����
x210708_g_IfMissionElite = 0

--******���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������******
--�����Ƿ��Ѿ����
x210708_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������Ҫɱ���Ĺ�
x210708_g_DemandKill ={{id=550,num=1}}		--����ɱ������id
x210708_g_DemandTrueKill ={{name="����С��",num=1}}		--����ɱ����������

--******�����Ƕ�̬******

--�����ı�����
x210708_g_MissionName="����С��"
x210708_g_MissionInfo="ɱ������С��"
x210708_g_MissionTarget="ɱ������С��"
x210708_g_ContinueInfo="���Ѿ�ɱ������С��û�оͼ�����"
x210708_g_MissionComplete="��ϲ��ɱ����"

--������
x210708_g_MoneyBonus=12000
x210708_g_Exp = 3000
x210708_g_ItemBonus={{id=30002001,num=1}}



--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210708_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
	if IsMissionHaveDone(sceneId,selfId,x210708_g_MissionId) > 0 then
		return
	end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x210708_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x210708_g_MissionName)
			AddText(sceneId,x210708_g_ContinueInfo)
		--for i, item in g_DemandItem do
		--	AddItemDemand( sceneId, item.id, item.num )
		--end
		EndEvent( )
		bDone = x210708_CheckSubmit( sceneId, selfId )
	DispatchMissionDemandInfo(sceneId,selfId,targetId,x210708_g_ScriptId,x210708_g_MissionId,bDone)
		--���������������
	elseif x210708_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x210708_g_MissionName)
			AddText(sceneId,x210708_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x210708_g_MissionTarget)
			AddMoneyBonus( sceneId, x210708_g_MoneyBonus )
			
		for i, item in x210708_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
		
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x210708_g_ScriptId,x210708_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x210708_OnEnumerate( sceneId, selfId, targetId )
	if IsMissionHaveDone(sceneId,selfId,x210708_g_PreMissionId) <= 0 then
	--	return
	end
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x210708_g_MissionId) > 0 then
		return 
	end
		--����ѽӴ�����
    --else
	if IsHaveMission(sceneId,selfId,x210708_g_MissionId) > 0 then
		AddNumText(sceneId,x210708_g_ScriptId,x210708_g_MissionName);
		--���������������
	elseif x210708_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x210708_g_ScriptId,x210708_g_MissionName);
	end
end

--**********************************
--����������
--**********************************
function x210708_CheckAccept( sceneId, selfId )
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
function x210708_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210708_g_MissionId, x210708_g_ScriptId, 1, 0, 0 )	--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x210708_g_MissionId)	--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)	--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)	--�������кŰ���������ĵ�1λ��0
end

--**********************************
--����
--**********************************
function x210708_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210708_g_MissionId )
end

--**********************************
--����
--**********************************
function x210708_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x210708_g_MissionName)
		AddText(sceneId,x210708_g_MissionComplete)
		AddMoneyBonus( sceneId, x210708_g_MoneyBonus )
		for i, item in x210708_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end		
    EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x210708_g_ScriptId,x210708_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210708_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x210708_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,1)
    if num == x210708_g_DemandTrueKill[1].num then
		return 1
	end
	return 0
end

--**********************************
--�ύ
--**********************************
function x210708_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x210708_CheckSubmit( sceneId, selfId, selectRadioId ) then
    		BeginAddItem(sceneId)
			for i, item in x210708_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
			
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then		
		
			AddExp(sceneId,selfId,x210708_g_Exp)
			AddMoney(sceneId,selfId,x210708_g_MoneyBonus );
			
			ret = DelMission( sceneId, selfId, x210708_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId, selfId, x210708_g_MissionId )
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
function x210708_OnKillObject( sceneId, selfId, objdataId ,objId)
	if GetName(sceneId,objId) == x210708_g_DemandTrueKill[1].name	  then
		misIndex = GetMissionIndexByID(sceneId,selfId,x210708_g_MissionId)
		num = GetMissionParam(sceneId,selfId,misIndex,1)
		if num < x210708_g_DemandTrueKill[1].num then
			--��������ɱ�־����Ϊ1
			if num == x210708_g_DemandTrueKill[1].num - 1 then
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			end
			--���ô������+1
			SetMissionByIndex(sceneId,selfId,misIndex,1,num+1)
			BeginEvent(sceneId)
				strText = format("��ɱ������С��%d/1", GetMissionParam(sceneId,selfId,misIndex,1) )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end

--**********************************
--���������¼�
--**********************************
function x210708_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210708_OnItemChanged( sceneId, selfId, itemdataId )
end
