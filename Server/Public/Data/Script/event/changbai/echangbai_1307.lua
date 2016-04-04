--ɱ�ֵ�������
--��ҽ���䷽
--MisDescBegin
--�ű���
x211307_g_ScriptId = 211307

--��һ�������ID
--g_MissionIdPre =

--�����
x211307_g_MissionId = 567

--����Ŀ��npc
x211307_g_Name	="ͽ������" 

--������߱��
x211307_g_ItemId = 40002098

--���������������
x211307_g_ItemNeedNum = 1

--�������
x211307_g_MissionKind = 33

--����ȼ�
x211307_g_MissionLevel = 80

--�Ƿ��Ǿ�Ӣ����
x211307_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x211307_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

--������Ҫ�õ�����Ʒ
x211307_g_DemandItem={{id=40002098,num=1}}		--������1λ

--�����ı�����
x211307_g_MissionName="��ҽ���䷽"
x211307_g_MissionInfo="����ĶԲ������壬���Ұ���ҽ���䷽Ū���ˣ��Ҽǵ�����ѩ�˾�ס�صĸ������ʱ��Ū���ˣ������ѩ�˵õ�������ô�����û�����"  --��������
x211307_g_MissionTarget="������أ������ҽ���䷽��ѩ�����ж��"		--����Ŀ��
x211307_g_ContinueInfo="����ô�죬ѩ��̫�����ˣ�����ôŪ���䷽�������尡"		--δ��������npc�Ի�
x211307_g_MissionComplete="ʲô���䷽������ô�õ��ģ����ѩ�˴���ˣ�"					--�������npc˵���Ļ�

x211307_g_MoneyBonus=1032
x211307_g_ItemBonus={{id=30002001,num=1},{id=10412001,num=1}}
x211307_g_RadioItemBonus={{id=10100001,num=1},{id=10210001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x211307_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x211307_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x211307_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x211307_g_MissionName)
			AddText(sceneId,x211307_g_ContinueInfo)
			for i, item in x211307_g_DemandItem do
				AddItemDemand( sceneId, item.id, item.num )
			end
		EndEvent( )
		bDone = x211307_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x211307_g_ScriptId,x211307_g_MissionId,bDone)
	--���������������
	elseif x211307_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x211307_g_MissionName)
			AddText(sceneId,x211307_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x211307_g_MissionTarget)
			AddMoneyBonus( sceneId, x211307_g_MoneyBonus )
			for i, item in x211307_g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
			for i, item in x211307_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x211307_g_ScriptId,x211307_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x211307_OnEnumerate( sceneId, selfId, targetId )
	--��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x211307_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    if IsHaveMission(sceneId,selfId,x211307_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x211307_g_Name then
			AddNumText(sceneId,x211307_g_ScriptId,x211307_g_MissionName);
		end
	--���������������
    elseif x211307_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x211307_g_Name then
			AddNumText(sceneId,x211307_g_ScriptId,x211307_g_MissionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x211307_CheckAccept( sceneId, selfId )
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
function x211307_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x211307_g_MissionId, x211307_g_ScriptId, 1, 0, 1 )
	misIndex = GetMissionIndexByID(sceneId,selfId,x211307_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0 (����������)
end

--**********************************
--����
--**********************************
function x211307_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x211307_g_MissionId )
end

--**********************************
--����
--**********************************
function x211307_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x211307_g_MissionName)
		AddText(sceneId,x211307_g_MissionComplete)
		AddMoneyBonus( sceneId, x211307_g_MoneyBonus )
		for i, item in x211307_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
		for i, item in x211307_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x211307_g_ScriptId,x211307_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x211307_CheckSubmit( sceneId, selfId )
	for i, item in x211307_g_DemandItem do
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
function x211307_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x211307_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
			for i, item in x211307_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
			for i, item in x211307_g_RadioItemBonus do
				if item.id == selectRadioId then
					AddItem( sceneId,item.id, item.num )
				end
			end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddMoney(sceneId,selfId,x211307_g_MoneyBonus );
			ret = DelMission( sceneId, selfId, x211307_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId,selfId, x211307_g_MissionId )
				--�۳�������Ʒ
				for i, item in x211307_g_DemandItem do
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
function x211307_OnKillObject( sceneId, selfId, objdataId ,objId)--������˼�������š����objId�������λ�úš�����objId
	if objdataId == 1940 then
		num = GetMonsterOwnerCount(sceneId,objId)--ȡ�������������ӵ�з���Ȩ������
		for i=0,num-1 do
			humanObjId = GetMonsterOwnerID(sceneId,objId,i)--ȡ��ӵ�з���Ȩ���˵�objId
			if IsHaveMission(sceneId,humanObjId,x211307_g_MissionId) > 0 then	--��������ӵ������	
				if (GetItemCount(sceneId,humanObjId,x211307_g_ItemId) < x211307_g_ItemNeedNum) then
					AddMonsterDropItem(sceneId,objId,humanObjId,x211307_g_ItemId)    --��������������(���߻������ʬ�����)
				end
			end
		end
	end
end

--**********************************
--���������¼�
--**********************************
function x211307_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x211307_OnItemChanged( sceneId, selfId, itemdataId )
	if itemdataId == x211307_g_ItemId then
		x211307_g_ItemNum = GetItemCount(sceneId,selfId,x211307_g_ItemId)
		if x211307_g_ItemNum < x211307_g_ItemNeedNum then
			BeginEvent(sceneId)
				strText = format("�ѵõ���ҽ���䷽%d/1", x211307_g_ItemNum )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			--ȡ�����������ֵ
			misIndex = GetMissionIndexByID(sceneId,selfId,x211307_g_MissionId)
			num = GetMissionParam(sceneId,selfId,misIndex,0)
			if num == 1 then	--�������״̬��1,˵��������ɵ�������ְ���Ʒ���ٵ��������״̬
				SetMissionByIndex(sceneId,selfId,misIndex,0,0)
			end
		elseif x211307_g_ItemNum == x211307_g_ItemNeedNum then
			misIndex = GetMissionIndexByID(sceneId,selfId,x211307_g_MissionId)
			num = GetMissionParam(sceneId,selfId,misIndex,0)
			--����Ʒ�����ﵽҪ�����ʱ������ɱ�־��Ȼ��0,��������־���ó�1
			if num == 0 then
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			end
			--��ʾ�õ���Ʒ����
			BeginEvent(sceneId)
				strText = format("�ѵõ���ҽ���䷽%d/1", x211307_g_ItemNeedNum )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end
