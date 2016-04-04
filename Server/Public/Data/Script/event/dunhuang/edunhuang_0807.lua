--ɱ������
--Ī�߿�
--MisDescBegin
--�ű���
x210807_g_ScriptId = 210807

--��һ�������ID
--g_MissionIdPre = 

--�����
x210807_g_MissionId = 517

--����Ŀ��npc
x210807_g_Name	="���ӻ�"

--�������
x210807_g_MissionKind = 19

--����ȼ�
x210807_g_MissionLevel = 9

--�Ƿ��Ǿ�Ӣ����
x210807_g_IfMissionElite = 0

--******���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������******
--�����Ƿ��Ѿ����
x210807_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������Ҫɱ���Ĺ�
x210807_g_DemandKill ={{id=1570,num=10}}		--������1λ

--******�����Ƕ�̬******

--�����ı�����
x210807_g_MissionName="Ī�߿�"
x210807_g_MissionInfo="ɱ��10������̽�ӣ�"
x210807_g_MissionTarget="ɱ��10������̽��"
x210807_g_ContinueInfo="���Ѿ�ɱ��10������̽����"
x210807_g_MissionComplete="��ϲ��ɱ����"

--������
x210807_g_MoneyBonus=10200
x210807_g_ItemBonus={{id=20101001,num=1}}
--g_RadioItemBonus={{id=10100001,num=1},{id=10210001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210807_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x210807_g_MissionId) > 0 then
	--	return
	--end
		--����ѽӴ�����
		if IsHaveMission(sceneId,selfId,x210807_g_MissionId) > 0 then
			--���������������Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x210807_g_MissionName)
				AddText(sceneId,x210807_g_ContinueInfo)
			--for i, item in g_DemandItem do
			--	AddItemDemand( sceneId, item.id, item.num )
			--end
			EndEvent( )
			bDone = x210807_CheckSubmit( sceneId, selfId )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x210807_g_ScriptId,x210807_g_MissionId,bDone)
			--���������������
		elseif x210807_CheckAccept(sceneId,selfId) > 0 then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x210807_g_MissionName)
				AddText(sceneId,x210807_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210807_g_MissionTarget)
				AddMoneyBonus( sceneId, x210807_g_MoneyBonus )
			for i, item in x210807_g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210807_g_ScriptId,x210807_g_MissionId)
		end
	end

--**********************************
--�о��¼�
--**********************************
function x210807_OnEnumerate( sceneId, selfId, targetId )
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x210807_g_MissionId) > 0 then
		return 
	end
		--����ѽӴ�����
    --else
		if IsHaveMission(sceneId,selfId,x210807_g_MissionId) > 0 then
			AddNumText(sceneId,x210807_g_ScriptId,x210807_g_MissionName);
			--���������������
		elseif x210807_CheckAccept(sceneId,selfId) > 0 then
			AddNumText(sceneId,x210807_g_ScriptId,x210807_g_MissionName);
		end
	end

--**********************************
--����������
--**********************************
function x210807_CheckAccept( sceneId, selfId )
	--��Ҫ10�����ܽ�
	if GetLevel( sceneId, selfId ) >= 10 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210807_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210807_g_MissionId, x210807_g_ScriptId, 1, 0, 0 )	--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x210807_g_MissionId)	--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)	--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)	--�������кŰ���������ĵ�1λ��0
end

--**********************************
--����
--**********************************
function x210807_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210807_g_MissionId )
end

--**********************************
--����
--**********************************
function x210807_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x210807_g_MissionName)
		AddText(sceneId,x210807_g_MissionComplete)
		AddMoneyBonus( sceneId, x210807_g_MoneyBonus )
		for i, item in x210807_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x210807_g_ScriptId,x210807_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210807_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x210807_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,1)
    if num == x210807_g_DemandKill[1].num then
		return 1
	end
	return 0
end

--**********************************
--�ύ
--**********************************
function x210807_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x210807_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
			for i, item in x210807_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
		ret = EndAddItem(sceneId,selfId)
		--���������
	if ret > 0 then
			AddMoney(sceneId,selfId,x210807_g_MoneyBonus );
			--�۳�������Ʒ
			--for i, item in g_DemandItem do
			--	DelItem( sceneId, selfId, item.id, item.num )
			--end
		ret = DelMission( sceneId, selfId, x210807_g_MissionId )
		if ret > 0 then
			MissionCom( sceneId, selfId, x210807_g_MissionId )
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
function x210807_OnKillObject( sceneId, selfId, objdataId )

	if objdataId == x210807_g_DemandKill[1].id then
		misIndex = GetMissionIndexByID(sceneId,selfId,x210807_g_MissionId)
		num = GetMissionParam(sceneId,selfId,misIndex,1)
		if num < x210807_g_DemandKill[1].num then
		--��������ɱ�־����Ϊ1
		if num == x210807_g_DemandKill[1].num - 1 then
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
		end
		--���ô������+1
			SetMissionByIndex(sceneId,selfId,misIndex,1,num+1)
				BeginEvent(sceneId)
		strText = format("��ɱ��������%d/10", GetMissionParam(sceneId,selfId,misIndex,1) )
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
		end
	end
 
end

--**********************************
--���������¼�
--**********************************
function x210807_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210807_OnItemChanged( sceneId, selfId, itemdataId )
end

