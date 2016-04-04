--ɱ�ֵ�������
--�����III
--MisDescBegin
--�ű���
x212006_g_ScriptId = 212006

--��һ�������ID
--g_MissionIdPre =

--�����
x212006_g_MissionId = 636

--����Ŀ��npc
x212006_g_Name	="����" 

--������߱��
x212006_g_ItemId = 40002089

--���������������
x212006_g_ItemNeedNum = 1

--�������
x212006_g_MissionKind = 40

--����ȼ�
x212006_g_MissionLevel = 78

--�Ƿ��Ǿ�Ӣ����
x212006_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x212006_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

--������Ҫ��Ʒ
x212006_g_DemandItem={{id=40002089,num=1}}

--�����ı�����
x212006_g_MissionName="�����III"
x212006_g_MissionInfo="�õ�������޵Ļ����"  --��������
x212006_g_MissionTarget="�õ�������޵Ļ����"		--����Ŀ��
x212006_g_ContinueInfo="������޵Ļ�����������ô?"		--δ��������npc�Ի�
x212006_g_MissionComplete="�ɵò���"					--�������npc˵�Ļ�

x212006_g_MoneyBonus=1032
x212006_g_ItemBonus={{id=30002001,num=1},{id=10412001,num=1}}
x212006_g_RadioItemBonus={{id=10100001,num=1},{id=10210001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x212006_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x212006_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x212006_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x212006_g_MissionName)
			AddText(sceneId,x212006_g_ContinueInfo)
			for i, item in x212006_g_DemandItem do
				AddItemDemand( sceneId, item.id, item.num )
			end
		EndEvent( )
		bDone = x212006_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x212006_g_ScriptId,x212006_g_MissionId,bDone)
	--���������������
	elseif x212006_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x212006_g_MissionName)
			AddText(sceneId,x212006_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x212006_g_MissionTarget)
			AddMoneyBonus( sceneId, x212006_g_MoneyBonus )
			for i, item in x212006_g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
			for i, item in x212006_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x212006_g_ScriptId,x212006_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x212006_OnEnumerate( sceneId, selfId, targetId )
	--��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x212006_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    if IsHaveMission(sceneId,selfId,x212006_g_MissionId) > 0 then
		AddNumText(sceneId,x212006_g_ScriptId,x212006_g_MissionName);
	--���������������
    elseif x212006_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x212006_g_ScriptId,x212006_g_MissionName);
    end
end

--**********************************
--����������
--**********************************
function x212006_CheckAccept( sceneId, selfId )
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
function x212006_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x212006_g_MissionId, x212006_g_ScriptId, 1, 0, 1 )
	misIndex = GetMissionIndexByID(sceneId,selfId,x212006_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0 (����������)
end

--**********************************
--����
--**********************************
function x212006_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x212006_g_MissionId )
end

--**********************************
--����
--**********************************
function x212006_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x212006_g_MissionName)
		AddText(sceneId,x212006_g_MissionComplete)
		AddMoneyBonus( sceneId, x212006_g_MoneyBonus )
		for i, item in x212006_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
		for i, item in x212006_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x212006_g_ScriptId,x212006_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212006_CheckSubmit( sceneId, selfId )
	for i, item in x212006_g_DemandItem do
		itemCount = GetItemCount( sceneId, selfId, item.id )
		if itemCount < item.num then
			return 0
		end
	end
	return 1
end

--**********************************
--�ύ
--**********************************
function x212006_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x212006_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
			for i, item in x212006_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
			for i, item in x212006_g_RadioItemBonus do
				if item.id == selectRadioId then
					AddItem( sceneId,item.id, item.num )
				end
			end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddMoney(sceneId,selfId,x212006_g_MoneyBonus );
			ret = DelMission( sceneId, selfId, x212006_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId,selfId, x212006_g_MissionId )
				--�۳�������Ʒ
				for i, item in x212006_g_DemandItem do
					DelItem( sceneId, selfId, item.id, item.num )
				end
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
function x212006_OnKillObject( sceneId, selfId, objdataId ,objId)--������˼�������š����objId�������λ�úš�����objId
	if objdataId == 2010 then
		num = GetMonsterOwnerCount(sceneId,objId)--ȡ�������������ӵ�з���Ȩ������
		for i=0,num-1 do
			humanObjId = GetMonsterOwnerID(sceneId,objId,i)--ȡ��ӵ�з���Ȩ���˵�objId
			if IsHaveMission(sceneId,humanObjId,x212006_g_MissionId) > 0 then	--��������ӵ������	
				if (GetItemCount(sceneId,humanObjId,x212006_g_ItemId) < x212006_g_ItemNeedNum) then
					AddMonsterDropItem(sceneId,objId,humanObjId,x212006_g_ItemId)    --��������������(���߻������ʬ�����)
				end
			end
		end
	end
end

--**********************************
--���������¼�
--**********************************
function x212006_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x212006_OnItemChanged( sceneId, selfId, itemdataId )
	if itemdataId == x212006_g_ItemId then
		x212006_g_ItemNum = GetItemCount(sceneId,selfId,x212006_g_ItemId)
		if x212006_g_ItemNum < x212006_g_ItemNeedNum then
			BeginEvent(sceneId)
				strText = format("�ѵõ�������޵Ļ����%d/1", x212006_g_ItemNum )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			--ȡ�����������ֵ
			misIndex = GetMissionIndexByID(sceneId,selfId,x212006_g_MissionId)
			num = GetMissionParam(sceneId,selfId,misIndex,0)
			if num == 1 then	--�������״̬��1,˵��������ɵ�������ְ���Ʒ���ٵ��������״̬
				SetMissionByIndex(sceneId,selfId,misIndex,0,0)
			end
		elseif x212006_g_ItemNum == x212006_g_ItemNeedNum then
			misIndex = GetMissionIndexByID(sceneId,selfId,x212006_g_MissionId)
			num = GetMissionParam(sceneId,selfId,misIndex,0)
			--����Ʒ�����ﵽҪ�����ʱ������ɱ�־��Ȼ��0,��������־���ó�1
			if num == 0 then
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			end
			--��ʾ�õ���Ʒ����
			BeginEvent(sceneId)
				strText = format("�ѵõ�������޵Ļ����%d/1", x212006_g_ItemNeedNum )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end
