--ɱ�ֵ���
--������
--MisDescBegin
--�ű���
x211201_g_ScriptId = 211201

--��һ�������ID
--g_MissionIdPre = 39

--�����
x211201_g_MissionId = 551

--Ŀ��NPC
x211201_g_Name	="��ͼ"

--������߱��
x211201_g_ItemId = 40002068

--���������������
x211201_g_ItemNeedNum = 10

--�������
x211201_g_MissionKind = 32

--����ȼ�
x211201_g_MissionLevel = 56

--�Ƿ��Ǿ�Ӣ����
x211201_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x211201_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

--������Ҫ�õ�����Ʒ
x211201_g_DemandItem={{id=40002068,num=10}}		--������1λ

--�����ı�����
x211201_g_MissionName="������"
x211201_g_MissionInfo="�벻����Ƥ��ô�������ҷ����ˣ��ܲ����ٰ���Ū10����Ƥ����˵����Ƥ��ֵǮ���ԣ����ٰ���Ū10�Ű�������Ƥ"  --��������
x211201_g_MissionTarget="�õ�10�Ű���Ƥ"		--����Ŀ��
x211201_g_ContinueInfo="Ū������Ƥ��ô��"		--δ��������npc�Ի�
x211201_g_MissionComplete="̫лл����"					--�������npc˵���Ļ�

x211201_g_MoneyBonus=1032
x211201_g_ItemBonus={{id=30002001,num=1},{id=10412001,num=1}}
x211201_g_RadioItemBonus={{id=10100001,num=1},{id=10210001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x211201_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x211201_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x211201_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,x211201_g_MissionName)
		AddText(sceneId,x211201_g_ContinueInfo)
		for i, item in x211201_g_DemandItem do
			AddItemDemand( sceneId, item.id, item.num )
		end
		EndEvent( )
		bDone = x211201_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x211201_g_ScriptId,x211201_g_MissionId,bDone)
	--���������������
	elseif x211201_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,x211201_g_MissionName)
		AddText(sceneId,x211201_g_MissionInfo)
		AddText(sceneId,"#{M_MUBIAO}")
		AddText(sceneId,x211201_g_MissionTarget)
		AddMoneyBonus( sceneId, x211201_g_MoneyBonus )
		for i, item in x211201_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
			for i, item in x211201_g_RadioItemBonus do
					AddRadioItemBonus( sceneId, item.id, item.num )
				end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x211201_g_ScriptId,x211201_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x211201_OnEnumerate( sceneId, selfId, targetId )
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x211201_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    if IsHaveMission(sceneId,selfId,x211201_g_MissionId) > 0 then
		AddNumText(sceneId,x211201_g_ScriptId,x211201_g_MissionName);
    --���������������
    elseif x211201_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x211201_g_ScriptId,x211201_g_MissionName);
    end
end

--**********************************
--����������
--**********************************
function x211201_CheckAccept( sceneId, selfId )
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
function x211201_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x211201_g_MissionId, x211201_g_ScriptId, 1, 0, 1 )
	misIndex = GetMissionIndexByID(sceneId,selfId,x211201_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0 (����������)
end

--**********************************
--����
--**********************************
function x211201_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x211201_g_MissionId )
end

--**********************************
--����
--**********************************
function x211201_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x211201_g_MissionName)
    AddText(sceneId,x211201_g_MissionComplete)
    AddMoneyBonus( sceneId, x211201_g_MoneyBonus )
    for i, item in x211201_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    for i, item in x211201_g_RadioItemBonus do
		AddRadioItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x211201_g_ScriptId,x211201_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x211201_CheckSubmit( sceneId, selfId )
	for i, item in x211201_g_DemandItem do
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
function x211201_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x211201_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x211201_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		for i, item in x211201_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddMoney(sceneId,selfId,x211201_g_MoneyBonus );
			ret = DelMission( sceneId, selfId, x211201_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId,selfId, x211201_g_MissionId )
				--�۳�������Ʒ
				for i, item in x211201_g_DemandItem do
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
function x211201_OnKillObject( sceneId, selfId, objdataId ,objId)--������˼�������š����objId�������λ�úš�����objId
	if objdataId == 1830 then
		num = GetMonsterOwnerCount(sceneId,objId)--ȡ�������������ӵ�з���Ȩ������
		for i=0,num-1 do
			humanObjId = GetMonsterOwnerID(sceneId,objId,i)--ȡ��ӵ�з���Ȩ���˵�objId
			if IsHaveMission(sceneId,humanObjId,x211201_g_MissionId) > 0 then	--��������ӵ������	
				if (GetItemCount(sceneId,humanObjId,x211201_g_ItemId) < x211201_g_ItemNeedNum) then
					AddMonsterDropItem(sceneId,objId,humanObjId,x211201_g_ItemId)    --��������������(���߻������ʬ�����)
				end
			end
		end
	end
end

--**********************************
--���������¼�
--**********************************
function x211201_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x211201_OnItemChanged( sceneId, selfId, itemdataId )
	if itemdataId == x211201_g_ItemId then
		x211201_g_ItemNum = GetItemCount(sceneId,selfId,x211201_g_ItemId)
		if x211201_g_ItemNum < x211201_g_ItemNeedNum then
			BeginEvent(sceneId)
				strText = format("�ѵõ�����Ƥ%d/10", x211201_g_ItemNum )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			--ȡ�����������ֵ
			misIndex = GetMissionIndexByID(sceneId,selfId,x211201_g_MissionId)
			num = GetMissionParam(sceneId,selfId,misIndex,0)
			if num == 1 then	--�������״̬��1,˵��������ɵ�������ְ���Ʒ���ٵ��������״̬
				SetMissionByIndex(sceneId,selfId,misIndex,0,0)
			end
		elseif x211201_g_ItemNum == x211201_g_ItemNeedNum then
			misIndex = GetMissionIndexByID(sceneId,selfId,x211201_g_MissionId)
			num = GetMissionParam(sceneId,selfId,misIndex,0)
			--����Ʒ�����ﵽҪ�����ʱ������ɱ�־��Ȼ��0,��������־���ó�1
			if num == 0 then
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			end
			--��ʾ�õ���Ʒ����
			BeginEvent(sceneId)
				strText = format("�ѵõ�����Ƥ%d/10", x211201_g_ItemNeedNum )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end
