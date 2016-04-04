--Ѱ������
--Ѱ�Ҷ���
--MisDescBegin
--�ű���
x211107_g_ScriptId = 211107

--ǰ������
x211107_g_MissionIdPre  = 546

--�����
x211107_g_MissionId = 547

--����Ŀ��npc
x211107_g_Name = "��Ǿ"

--������߱��
x211107_g_ItemId = 40002066

--���������������
x211107_g_ItemNeedNum = 1

--�������
x211107_g_MissionKind = 31

--����ȼ�
x211107_g_MissionLevel = 57

--�Ƿ��Ǿ�Ӣ����
x211107_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x211107_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

--������Ҫ�õ�����Ʒ
x211107_g_DemandItem={{id=40002066,num=1}}		--������1λ

--������
x211107_g_MissionName="Ѱ�Ҷ���"
x211107_g_MissionInfo="����˵������Ķ���ô�����Ǵ����ػ��Ŷ������������˻�������ģ����ܲ��ܰ��ҰѶ���������"
x211107_g_MissionTarget="�ҵ�����"
x211107_g_ContinueInfo="���Ѿ��ҵ�������ô��"
x211107_g_MissionComplete="̫��л���ˣ��Ҿ�����ʲô�������ˡ�"

--������
x211107_g_MoneyBonus=1032
x211107_g_ItemBonus={{id=30002001,num=1},{id=10412001,num=1}}
x211107_g_RadioItemBonus={{id=10100001,num=1},{id=10210001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x211107_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x211107_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x211107_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,x211107_g_MissionName)
		AddText(sceneId,x211107_g_ContinueInfo)
		for i, item in x211107_g_DemandItem do
			AddItemDemand( sceneId, item.id, item.num )
		end
		EndEvent( )
		bDone = x211107_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x211107_g_ScriptId,x211107_g_MissionId,bDone)
	--���������������
	elseif x211107_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,x211107_g_MissionName)
		AddText(sceneId,x211107_g_MissionInfo)
		AddText(sceneId,"#{M_MUBIAO}")
		AddText(sceneId,x211107_g_MissionTarget)
		AddMoneyBonus( sceneId, x211107_g_MoneyBonus )
		for i, item in x211107_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
			for i, item in x211107_g_RadioItemBonus do
					AddRadioItemBonus( sceneId, item.id, item.num )
				end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x211107_g_ScriptId,x211107_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x211107_OnEnumerate( sceneId, selfId, targetId )
	--�ж��Ƿ������ǰ������
	if	IsMissionHaveDone( sceneId, selfId, x211107_g_MissionIdPre ) <= 0 then
		return
	end

	--��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x211107_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    if IsHaveMission(sceneId,selfId,x211107_g_MissionId) > 0 then
		AddNumText(sceneId,x211107_g_ScriptId,x211107_g_MissionName);
    --���������������
    elseif x211107_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x211107_g_ScriptId,x211107_g_MissionName);
    end
end

--**********************************
--����������
--**********************************
function x211107_CheckAccept( sceneId, selfId )
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
function x211107_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x211107_g_MissionId, x211107_g_ScriptId, 0, 0, 1 )
	misIndex = GetMissionIndexByID(sceneId,selfId,x211107_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0 (����������)
end

--**********************************
--����
--**********************************
function x211107_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x211107_g_MissionId )
end

--**********************************
--����
--**********************************
function x211107_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x211107_g_MissionName)
    AddText(sceneId,x211107_g_MissionComplete)
    AddMoneyBonus( sceneId, x211107_g_MoneyBonus )
    for i, item in x211107_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    for i, item in x211107_g_RadioItemBonus do
		AddRadioItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x211107_g_ScriptId,x211107_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x211107_CheckSubmit( sceneId, selfId )
	for i, item in x211107_g_DemandItem do
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
function x211107_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x211107_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x211107_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		for i, item in x211107_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddMoney(sceneId,selfId,x211107_g_MoneyBonus );
			ret = DelMission( sceneId, selfId, x211107_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId,selfId, x211107_g_MissionId )
				--�۳�������Ʒ
				for i, item in x211107_g_DemandItem do
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
function x211107_OnKillObject( sceneId, selfId, objdataId ,objId)--������˼�������š����objId�������λ�úš�����objId
end

--**********************************
--���������¼�
--**********************************
function x211107_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x211107_OnItemChanged( sceneId, selfId, itemdataId )
	if itemdataId == x211107_g_ItemId then
		x211107_g_ItemNum = GetItemCount(sceneId,selfId,x211107_g_ItemId)		--��⵱ǰ���������Ʒ1ӵ�е�����
		if x211107_g_ItemNum < x211107_g_ItemNeedNum then
			BeginEvent(sceneId)
				strText = format("�ѵõ�����%d/1", x211107_g_ItemNum )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			--ȡ�����������ֵ
			misIndex = GetMissionIndexByID(sceneId,selfId,x211107_g_MissionId)
			num = GetMissionParam(sceneId,selfId,misIndex,0)
			if num == 1 then	--�������״̬��1,˵��������ɵ�������ְ���Ʒ���ٵ��������״̬
				SetMissionByIndex(sceneId,selfId,misIndex,0,0)
			end
		elseif x211107_g_ItemNum == x211107_g_ItemNeedNum then
			misIndex = GetMissionIndexByID(sceneId,selfId,x211107_g_MissionId)
			num = GetMissionParam(sceneId,selfId,misIndex,0)
			--����Ʒ�����ﵽҪ�����ʱ������ɱ�־��Ȼ��0,��������־���ó�1
			if num == 0 then
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			end
			--��ʾ�õ���Ʒ����
			BeginEvent(sceneId)
				strText = format("�ѵõ�����%d/1", x211107_g_ItemNeedNum )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end
