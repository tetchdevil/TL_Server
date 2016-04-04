--ɱ�ֵ������� ����2 ��Ҫ����ĳЩ������߲��ܵ���
--����������
--MisDescBegin
--�ű���
x212102_g_ScriptId = 212102

--��һ�������ID
--g_MissionIdPre =

--�����
x212102_g_MissionId = 642

--����Ŀ��npc
x212102_g_Name	="����ҹ" 

--���ʱ��Ҫ�������ϵĵ��߱��
x212102_g_ItemId1 = 40002083		--���̽����

--���ʱ��Ҫ�������ϵĵ��ߵ�����
x212102_g_ItemNeedNum1 = 1

--������߱��
x212102_g_ItemId2 = 40002084		--����������

--���������������
x212102_g_ItemNeedNum2 = 1

--�������
x212102_g_MissionKind = 41

--����ȼ�
x212102_g_MissionLevel = 31

--�Ƿ��Ǿ�Ӣ����
x212102_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x212102_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

--������Ҫ�õ�����Ʒ
x212102_g_DemandItem={{id=40002083,num=1},{id=40002084,num=1}}		--������1λ

--�����ı�����
x212102_g_MissionName="����������"
x212102_g_MissionInfo="����������̽������ȥ��ܺ�������Ϳ��Եõ������Ŀ�����"  --��������
x212102_g_MissionTarget="����̽����ȥ��ܺ���"		--����Ŀ��
x212102_g_ContinueInfo="��õ���������ô"		--δ��������npc�Ի�
x212102_g_MissionComplete="�ɵò���"					--�������npc˵���Ļ�

x212102_g_MoneyBonus=1032
x212102_g_ItemBonus={{id=30002001,num=1},{id=10412001,num=1}}
x212102_g_RadioItemBonus={{id=10100001,num=1},{id=10210001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x212102_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x212102_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x212102_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,x212102_g_MissionName)
		AddText(sceneId,x212102_g_ContinueInfo)
		for i, item in x212102_g_DemandItem do
			AddItemDemand( sceneId, item.id, item.num )
		end
		EndEvent( )
		bDone = x212102_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x212102_g_ScriptId,x212102_g_MissionId,bDone)
	--���������������
	elseif x212102_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,x212102_g_MissionName)
		AddText(sceneId,x212102_g_MissionInfo)
		AddText(sceneId,"#{M_MUBIAO}")
		AddText(sceneId,x212102_g_MissionTarget)
		AddMoneyBonus( sceneId, x212102_g_MoneyBonus )
		for i, item in x212102_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
			for i, item in x212102_g_RadioItemBonus do
					AddRadioItemBonus( sceneId, item.id, item.num )
				end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x212102_g_ScriptId,x212102_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x212102_OnEnumerate( sceneId, selfId, targetId )
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x212102_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    if IsHaveMission(sceneId,selfId,x212102_g_MissionId) > 0 then
		AddNumText(sceneId,x212102_g_ScriptId,x212102_g_MissionName);
    --���������������
    elseif x212102_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x212102_g_ScriptId,x212102_g_MissionName);
    end
end

--**********************************
--����������
--**********************************
function x212102_CheckAccept( sceneId, selfId )
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
function x212102_OnAccept( sceneId, selfId )
	--������������
	BeginAddItem(sceneId)
		AddItem( sceneId,x212102_g_ItemId1, x212102_g_ItemNeedNum1 )
	ret = EndAddItem(sceneId,selfId)
	if ret > 0 then
		--������������б�
		AddMission( sceneId,selfId, x212102_g_MissionId, x212102_g_ScriptId, 1, 0, 1 )
		AddItemListToHuman(sceneId,selfId)
	else 
		BeginEvent(sceneId)
				strText = format("�����������޷���������", x212102_g_ItemNeedNum2 )
				AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end

--**********************************
--����
--**********************************
function x212102_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    ret = DelMission( sceneId, selfId, x212102_g_MissionId )
	if ret > 0 then
		--��������м����������
		ItemCount1 = GetItemCount(sceneId,selfId,x212102_g_ItemId1)
		ItemCount2 = GetItemCount(sceneId,selfId,x212102_g_ItemId2)
		--ɾ���������
		if ItemCount1 > 0 then
			DelItem(sceneId,selfId,x212102_g_ItemId1,ItemCount1)
		end
		if ItemCount2 > 0 then
			DelItem(sceneId,selfId,x212102_g_ItemId2,ItemCount2)
		end
	else
		BeginEvent(sceneId)
			strText = "�޷�ɾ������"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end

--**********************************
--����
--**********************************
function x212102_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x212102_g_MissionName)
    AddText(sceneId,x212102_g_MissionComplete)
    AddMoneyBonus( sceneId, x212102_g_MoneyBonus )
    for i, item in x212102_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    for i, item in x212102_g_RadioItemBonus do
		AddRadioItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x212102_g_ScriptId,x212102_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212102_CheckSubmit( sceneId, selfId )
	for i, item in x212102_g_DemandItem do
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
function x212102_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x212102_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x212102_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		for i, item in x212102_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddMoney(sceneId,selfId,x212102_g_MoneyBonus );
			ret = DelMission( sceneId, selfId, x212102_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId,selfId, x212102_g_MissionId )
				--�۳�������Ʒ
				for i, item in x212102_g_DemandItem do
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
function x212102_OnKillObject( sceneId, selfId, objdataId ,objId)--������˼�������š����objId�������λ�úš�����objId
	if objdataId == 1625 then
		num = GetMonsterOwnerCount(sceneId,objId)--ȡ�������������ӵ�з���Ȩ������
		for i=0,num-1 do
			humanObjId = GetMonsterOwnerID(sceneId,objId,i)--ȡ��ӵ�з���Ȩ���˵�objId
			if IsHaveMission(sceneId,humanObjId,x212102_g_MissionId) > 0 then	--��������ӵ������	
				if (GetItemCount(sceneId,humanObjId,x212102_g_ItemId2) < x212102_g_ItemNeedNum2) then	--����Ƿ��Ѿ��õ��㹻��������Ʒ
					if (HaveItem (sceneId,humanObjId,x212102_g_ItemId1) > 0) then	--��������Ƿ������Ҫ�����������
						AddMonsterDropItem(sceneId,objId,humanObjId,x212102_g_ItemId2)    --��������������(���߻������ʬ�����)
					end
				end
			end
		end
	end
end

--**********************************
--���������¼�
--**********************************
function x212102_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x212102_OnItemChanged( sceneId, selfId, itemdataId )
	if itemdataId == x212102_g_ItemId2 then
		x212102_g_ItemNum = GetItemCount(sceneId,selfId,x212102_g_ItemId2)
		if x212102_g_ItemNum < x212102_g_ItemNeedNum2 then
			BeginEvent(sceneId)
				strText = format("�ѵõ������Ŀ�����%d/1", x212102_g_ItemNum )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			--ȡ�����������ֵ
			misIndex = GetMissionIndexByID(sceneId,selfId,x212102_g_MissionId)
			num = GetMissionParam(sceneId,selfId,misIndex,0)
			if num == 1 then	--�������״̬��1,˵��������ɵ�������ְ���Ʒ���ٵ��������״̬
				SetMissionByIndex(sceneId,selfId,misIndex,0,0)
			end
		elseif x212102_g_ItemNum == x212102_g_ItemNeedNum2 then
			misIndex = GetMissionIndexByID(sceneId,selfId,x212102_g_MissionId)
			num = GetMissionParam(sceneId,selfId,misIndex,0)
			--����Ʒ�����ﵽҪ�����ʱ������ɱ�־��Ȼ��0,��������־���ó�1
			if num == 0 then
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			end
			--��ʾ�õ���Ʒ����
			BeginEvent(sceneId)
				strText = format("�ѵõ������Ŀ�����%d/1", x212102_g_ItemNeedNum2 )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end
