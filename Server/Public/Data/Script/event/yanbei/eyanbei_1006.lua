--ɱ������
--���ҵ��ױ�
--MisDescBegin
--�ű���
x211006_g_ScriptId = 211006

--��һ�������ID
x211006_g_MissionIdPre = 531

--�����
x211006_g_MissionId = 536

--Ŀ��NPC
x211006_g_Name	="Ү�����"

--�������
x211006_g_MissionKind = 30

--����ȼ�
x211006_g_MissionLevel = 28

--�Ƿ��Ǿ�Ӣ����
x211006_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x211006_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������Ҫɱ���Ĺ�
x211006_g_DemandKill ={{id=1695,num=10}}		--������1λ

--�����Ƕ�̬**************************************************************

--�����ı�����
x211006_g_MissionName="���ҵ��ױ�"
x211006_g_MissionInfo="�ɵ�10���ؼ�կ�ױ�"
x211006_g_MissionTarget="�ɵ�10���ؼ�կ�ױ�"
x211006_g_ContinueInfo="���Ѿ�ɱ��10���ؼ�կ�ױ�����"
x211006_g_MissionComplete="��ϲ��ɱ����"

--������
x211006_g_MoneyBonus=100
x211006_g_ItemBonus={{id=30002001,num=1}}
x211006_g_RadioItemBonus={{id=10100001,num=1},{id=10210001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x211006_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x211006_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
		if IsHaveMission(sceneId,selfId,x211006_g_MissionId) > 0 then
			--���������������Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x211006_g_MissionName)
				AddText(sceneId,x211006_g_ContinueInfo)
			--for i, item in g_DemandItem do
			--	AddItemDemand( sceneId, item.id, item.num )
			--end
			EndEvent( )
			bDone = x211006_CheckSubmit( sceneId, selfId )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x211006_g_ScriptId,x211006_g_MissionId,bDone)
		--���������������
		elseif x211006_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x211006_g_MissionName)
				AddText(sceneId,x211006_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x211006_g_MissionTarget)
				AddMoneyBonus( sceneId, x211006_g_MoneyBonus )
			for i, item in x211006_g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
			for i, item in x211006_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x211006_g_ScriptId,x211006_g_MissionId)
		end
	end

--**********************************
--�о��¼�
--**********************************
function x211006_OnEnumerate( sceneId, selfId, targetId )

	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x211006_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
    --else
		if IsHaveMission(sceneId,selfId,x211006_g_MissionId) > 0 then
			AddNumText(sceneId,x211006_g_ScriptId,x211006_g_MissionName);
			--���������������
		elseif x211006_CheckAccept(sceneId,selfId) > 0 then
			AddNumText(sceneId,x211006_g_ScriptId,x211006_g_MissionName);
		end
	end

--**********************************
--����������
--**********************************
function x211006_CheckAccept( sceneId, selfId )
	--��Ҫ2�����ܽ�
	if GetLevel( sceneId, selfId ) >= 1 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x211006_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x211006_g_MissionId, x211006_g_ScriptId, 1, 0, 0 )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x211006_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0
end

--**********************************
--����
--**********************************
function x211006_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x211006_g_MissionId )
end

--**********************************
--����
--**********************************
function x211006_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x211006_g_MissionName)
		AddText(sceneId,x211006_g_MissionComplete)
		AddMoneyBonus( sceneId, x211006_g_MoneyBonus )
		for i, item in x211006_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
		for i, item in x211006_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x211006_g_ScriptId,x211006_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x211006_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x211006_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,1)
    if num == x211006_g_DemandKill[1].num then
		return 1
	end
	return 0
end

--**********************************
--�ύ
--**********************************
function x211006_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x211006_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
			for i, item in x211006_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
			for i, item in x211006_g_RadioItemBonus do
				if item.id == selectRadioId then
					AddItem( sceneId,item.id, item.num )
				end
			end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddMoney(sceneId,selfId,x211006_g_MoneyBonus );
			--�۳�������Ʒ
			--for i, item in g_DemandItem do
			--	DelItem( sceneId, selfId, item.id, item.num )
			--end
			ret = DelMission( sceneId, selfId, x211006_g_MissionId )
	if ret > 0 then
		MissionCom( sceneId, selfId, x211006_g_MissionId )
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
function x211006_OnKillObject( sceneId, selfId, objdataId )

	if objdataId == x211006_g_DemandKill[1].id then
		misIndex = GetMissionIndexByID(sceneId,selfId,x211006_g_MissionId)
		num = GetMissionParam(sceneId,selfId,misIndex,1)
		if num < x211006_g_DemandKill[1].num then
		--��������ɱ�־����Ϊ1
		if num == x211006_g_DemandKill[1].num - 1 then
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
		end
		--���ô������+1
			SetMissionByIndex(sceneId,selfId,misIndex,1,num+1)
			BeginEvent(sceneId)
				strText = format("��ɱ���ؼ�կ�ױ�%d/10", GetMissionParam(sceneId,selfId,misIndex,1) )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
 
end

--**********************************
--���������¼�
--**********************************
function x211006_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x211006_OnItemChanged( sceneId, selfId, itemdataId )
end
