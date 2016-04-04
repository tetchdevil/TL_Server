--ɱ�ֵ�������
--ͻϮ
--MisDescBegin
--�ű���
x211309_g_ScriptId = 211309

--��һ�������ID
--g_MissionIdPre =

--�����
x211309_g_MissionId = 569

--����Ŀ��npc
x211309_g_Name	="���հ��Ǵ�" 

--������߱��
x211309_g_ItemId = 40002099

--���������������
x211309_g_ItemNeedNum = 1

--�������
x211309_g_MissionKind = 33

--����ȼ�
x211309_g_MissionLevel = 80

--�Ƿ��Ǿ�Ӣ����
x211309_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x211309_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������Ҫɱ���Ĺ�
x211309_g_DemandKill = {{id=1955,num=5}}		--������1λ

--������Ҫ�õ�����Ʒ
x211309_g_DemandItem={{id=40002099,num=1}}
--�����Ƕ�̬**************************************************************

--�����ı�����
x211309_g_MissionName="ͻϮ"
x211309_g_MissionInfo="���ǵĹ�Ʒ�ո��͸��ɹ����������ǿ϶����ڷ������������ɲ��ܴ����ȥɱ��5��ѩɽç�Ǻ���ʯ�Ҳ������찢�裬��Ů����������Ĵ�����"  --��������
x211309_g_MissionTarget="ɱ��5��ѩɽç�ǣ�ɱ����ʯ�Ұ��裬�õ�Ů�����������"		--����Ŀ��
x211309_g_ContinueInfo="���Ů����������Ĵ�����ô����Ҫɱ��5��ѩɽç��"		--δ��������npc�Ի�
x211309_g_MissionComplete="���������Ǵ��ȫʤ��Ҫ�ú���ףһ��"					--�������npc˵���Ļ�

x211309_g_MoneyBonus=1032
x211309_g_ItemBonus={{id=30002001,num=1},{id=10412001,num=1}}
x211309_g_RadioItemBonus={{id=10100001,num=1},{id=10210001,num=1}}
x211309_g_DemandTrueKill ={{name="ѩɽç��",num=5}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x211309_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x211309_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x211309_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x211309_g_MissionName)
			AddText(sceneId,x211309_g_ContinueInfo)
			for i, item in x211309_g_DemandItem do
				AddItemDemand( sceneId, item.id, item.num )
			end
		EndEvent( )
		bDone = x211309_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x211309_g_ScriptId,x211309_g_MissionId,bDone)
	--���������������
	elseif x211309_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x211309_g_MissionName)
			AddText(sceneId,x211309_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x211309_g_MissionTarget)
			AddMoneyBonus( sceneId, x211309_g_MoneyBonus )
			for i, item in x211309_g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
			for i, item in x211309_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x211309_g_ScriptId,x211309_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x211309_OnEnumerate( sceneId, selfId, targetId )
	--��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x211309_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    if IsHaveMission(sceneId,selfId,x211309_g_MissionId) > 0 then
		AddNumText(sceneId,x211309_g_ScriptId,x211309_g_MissionName);
	--���������������
    elseif x211309_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x211309_g_ScriptId,x211309_g_MissionName);
    end
end

--**********************************
--����������
--**********************************
function x211309_CheckAccept( sceneId, selfId )
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
function x211309_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x211309_g_MissionId, x211309_g_ScriptId, 1, 0, 1 )
	misIndex = GetMissionIndexByID(sceneId,selfId,x211309_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0 (����������)
SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0
end

--**********************************
--����
--**********************************
function x211309_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    ret = DelMission( sceneId, selfId, x211309_g_MissionId )
	if ret > 0 then
		--��������м����������
		ItemCount = GetItemCount(sceneId,selfId,x211309_g_ItemId)
		--ɾ���������
		if ItemCount > 0 then
			DelItem(sceneId,selfId,x211309_g_ItemId,ItemCount)
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
function x211309_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x211309_g_MissionName)
		AddText(sceneId,x211309_g_MissionComplete)
		AddMoneyBonus( sceneId, x211309_g_MoneyBonus )
		for i, item in x211309_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
		for i, item in x211309_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x211309_g_ScriptId,x211309_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x211309_CheckSubmit( sceneId, selfId )
	for i, item in x211309_g_DemandItem do
		itemCount = GetItemCount( sceneId, selfId, item.id )
		if itemCount < item.num then
			return 0
		end
	end
	misIndex = GetMissionIndexByID(sceneId,selfId,x211309_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,1)
    if num < x211309_g_DemandTrueKill[1].num then
       return 0
    end
	return 1
end

--**********************************
--�ύ
--**********************************
function x211309_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x211309_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
			for i, item in x211309_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
			for i, item in x211309_g_RadioItemBonus do
				if item.id == selectRadioId then
					AddItem( sceneId,item.id, item.num )
				end
			end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddMoney(sceneId,selfId,x211309_g_MoneyBonus );
			ret = DelMission( sceneId, selfId, x211309_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId,selfId, x211309_g_MissionId )
				--�۳�������Ʒ
				for i, item in x211309_g_DemandItem do
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
function x211309_OnKillObject( sceneId, selfId, objdataId ,objId)--������˼�������š����objId�������λ�úš�����objId
	if objdataId == 537 then
		num = GetMonsterOwnerCount(sceneId,objId)--ȡ�������������ӵ�з���Ȩ������
		for i=0,num-1 do
			humanObjId = GetMonsterOwnerID(sceneId,objId,i)--ȡ��ӵ�з���Ȩ���˵�objId
			if IsHaveMission(sceneId,humanObjId,x211309_g_MissionId) > 0 then	--��������ӵ������	
				if (GetItemCount(sceneId,humanObjId,x211309_g_ItemId) < x211309_g_ItemNeedNum) then
					AddMonsterDropItem(sceneId,objId,humanObjId,x211309_g_ItemId)    --��������������(���߻������ʬ�����)
				end
			end
		end
	end
	if GetName(sceneId,objId) == x211309_g_DemandTrueKill[1].name	  then
		misIndex = GetMissionIndexByID(sceneId,selfId,x211309_g_MissionId)
		num = GetMissionParam(sceneId,selfId,misIndex,1)
		if num < x211309_g_DemandTrueKill[1].num then
			--�����ʱɱ����5ֻ�ֲ����Ѿ��õ���������Ʒ,�����ɱ�־��1
			if num == 4 and GetItemCount( sceneId, selfId, x211309_g_ItemId ) >= x211309_g_ItemNeedNum then
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			end				
			SetMissionByIndex(sceneId,selfId,misIndex,1,num+1)
			BeginEvent(sceneId)
				strText = format("��ɱ��ѩɽç�� %d/5", GetMissionParam(sceneId,selfId,misIndex,1) )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end

--**********************************
--���������¼�
--**********************************
function x211309_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x211309_OnItemChanged( sceneId, selfId, itemdataId )
	if itemdataId == x211309_g_ItemId then
		x211309_g_ItemNum = GetItemCount(sceneId,selfId,x211309_g_ItemId)
		if x211309_g_ItemNum < x211309_g_ItemNeedNum then
			BeginEvent(sceneId)
				strText = format("�ѵõ�Ů�����������%d/1", x211309_g_ItemNum )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			--ȡ�����������ֵ
			misIndex = GetMissionIndexByID(sceneId,selfId,x211309_g_MissionId)
			num = GetMissionParam(sceneId,selfId,misIndex,0)
			if num == 1 then	--�������״̬��1,˵��������ɵ�������ְ���Ʒ���ٵ��������״̬
				SetMissionByIndex(sceneId,selfId,misIndex,0,0)
			end
		elseif x211309_g_ItemNum == x211309_g_ItemNeedNum then
			misIndex = GetMissionIndexByID(sceneId,selfId,x211309_g_MissionId)
			num = GetMissionParam(sceneId,selfId,misIndex,0)
			--����Ʒ�����ﵽҪ�����ʱ������ɱ�־��Ȼ��0,��������־���ó�1
			if num == 0 then
				if x211309_CheckSubmit( sceneId, selfId ) == 1 then
					SetMissionByIndex(sceneId,selfId,misIndex,0,1)
				end
			end
			--��ʾ�õ���Ʒ����
			BeginEvent(sceneId)
				strText = format("�ѵõ�Ů�����������%d/1", x211309_g_ItemNeedNum )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end
