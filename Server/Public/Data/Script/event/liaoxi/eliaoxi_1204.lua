--Ѱ������
--�ؽ�����
--MisDescBegin
--�ű���
x211204_g_ScriptId = 211204
--�����
x211204_g_MissionId = 554

x211204_g_Name = "Ү�ɽ�"

--������߱��
x211204_g_ItemId1 = 20003003
x211204_g_ItemId2 = 20005018


--���������������
x211204_g_ItemNeedNum1 = 10
x211204_g_ItemNeedNum2 = 10

--�������
x211204_g_MissionKind = 32

--����ȼ�
x211204_g_MissionLevel = 59

--�Ƿ��Ǿ�Ӣ����
x211204_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x211204_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

--������Ҫ�õ�����Ʒ
x211204_g_DemandItem={{id=20003003,num=10},{id=20005018,num=10}}	--������1λ

--������
x211204_g_MissionName="�ؽ�����"
x211204_g_MissionInfo="��Ҫ�ؽ�����,������ҵ�10�������10��ľͷ"
x211204_g_MissionTarget="�ҵ�10�������10��ľͷ"
x211204_g_ContinueInfo="���ҵ��ҵ�10�������10��ľͷ��û�У�"
x211204_g_MissionComplete="�ɵĲ���"

x211204_g_MoneyBonus=1032
x211204_g_ItemBonus={{id=30002001,num=1},{id=10412001,num=1}}
x211204_g_RadioItemBonus={{id=10100001,num=1},{id=10210001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x211204_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x211204_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x211204_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,x211204_g_MissionName)
		AddText(sceneId,x211204_g_ContinueInfo)
		for i, item in x211204_g_DemandItem do
			AddItemDemand( sceneId, item.id, item.num )
		end
		EndEvent( )
		bDone = x211204_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x211204_g_ScriptId,x211204_g_MissionId,bDone)
	--���������������
	elseif x211204_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,x211204_g_MissionName)
		AddText(sceneId,x211204_g_MissionInfo)
		AddText(sceneId,"#{M_MUBIAO}")
		AddText(sceneId,x211204_g_MissionTarget)
		AddMoneyBonus( sceneId, x211204_g_MoneyBonus )
		for i, item in x211204_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
			for i, item in x211204_g_RadioItemBonus do
					AddRadioItemBonus( sceneId, item.id, item.num )
				end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x211204_g_ScriptId,x211204_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x211204_OnEnumerate( sceneId, selfId, targetId )
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x211204_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    if IsHaveMission(sceneId,selfId,x211204_g_MissionId) > 0 then
		AddNumText(sceneId,x211204_g_ScriptId,x211204_g_MissionName);
    --���������������
    elseif x211204_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x211204_g_ScriptId,x211204_g_MissionName);
    end
end

--**********************************
--����������
--**********************************
function x211204_CheckAccept( sceneId, selfId )
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
function x211204_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x211204_g_MissionId, x211204_g_ScriptId, 0, 0, 1 )
	misIndex = GetMissionIndexByID(sceneId,selfId,x211204_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0 (����������)
end

--**********************************
--����
--**********************************
function x211204_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x211204_g_MissionId )
end

--**********************************
--����
--**********************************
function x211204_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x211204_g_MissionName)
    AddText(sceneId,x211204_g_MissionComplete)
    AddMoneyBonus( sceneId, x211204_g_MoneyBonus )
    for i, item in x211204_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    for i, item in x211204_g_RadioItemBonus do
		AddRadioItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x211204_g_ScriptId,x211204_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x211204_CheckSubmit( sceneId, selfId )
	for i, item in x211204_g_DemandItem do
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
function x211204_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x211204_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x211204_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		for i, item in x211204_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddMoney(sceneId,selfId,x211204_g_MoneyBonus );
			ret = DelMission( sceneId, selfId, x211204_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId,selfId, x211204_g_MissionId )
				--�۳�������Ʒ
				for i, item in x211204_g_DemandItem do
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
function x211204_OnKillObject( sceneId, selfId, objdataId ,objId)--������˼�������š����objId�������λ�úš�����objId
end

--**********************************
--���������¼�
--**********************************
function x211204_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x211204_OnItemChanged( sceneId, selfId, itemdataId )
	if itemdataId == x211204_g_ItemId1 then
		x211204_g_ItemNum = GetItemCount(sceneId,selfId,x211204_g_ItemId1)		--��⵱ǰ���������Ʒ1ӵ�е�����
		if x211204_g_ItemNum < x211204_g_ItemNeedNum1 then
			BeginEvent(sceneId)
				strText = format("�ѵõ�����%d/10", x211204_g_ItemNum )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		else
			BeginEvent(sceneId)
				strText = format("�ѵõ�����%d/10", x211204_g_ItemNeedNum1 )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	elseif itemdataId == x211204_g_ItemId2 then
		x211204_g_ItemNum = GetItemCount(sceneId,selfId,x211204_g_ItemId2)
		if x211204_g_ItemNum < x211204_g_ItemNeedNum2 then
			BeginEvent(sceneId)
				strText = format("�ѵõ�ľͷ%d/10", x211204_g_ItemNum )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		else
			BeginEvent(sceneId)
				strText = format("�ѵõ�ľͷ%d/10", x211204_g_ItemNeedNum2 )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end
