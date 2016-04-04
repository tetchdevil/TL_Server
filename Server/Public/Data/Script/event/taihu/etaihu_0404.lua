--̫��  �ѱ���ͷ­
--MisDescBegin
--�ű���
x210404_g_ScriptId = 210404

--�����
x210404_g_MissionId = 474

--��һ�������ID
x210404_g_MissionIdPre = 473

--����ID
x210404_g_ItemID = 40002071

--���������������
x210404_g_ItemNeedNum = 1

--�������
x210404_g_MissionKind = 15

--����ȼ�
x210404_g_MissionLevel = 10

--�Ƿ��Ǿ�Ӣ����
x210404_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x210404_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

--������Ҫ�õ�����Ʒ
x210404_g_DemandItem={{id=40002071,num=1}}		--������1λ

--�����ı�����
x210404_g_MissionName="�ѱ���ͷ­"
x210404_g_MissionInfo="ɱ��ˮ��ͷ��ѱ���������ͷ­�������"
x210404_g_MissionTarget="ɱ��ˮ��ͷ��ѱ���������ͷ­�������"
x210404_g_ContinueInfo="����ʲô����"
x210404_g_MissionComplete="Ŷ���յ�"



--�ջ���
x210404_g_Name = "���"

x210404_g_MoneyBonus=10200
x210404_g_Exp = 3000
x210404_g_ItemBonus={{id=30002001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210404_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�



	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x210404_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x210404_g_MissionName)
			AddText(sceneId,x210404_g_ContinueInfo)
		for i, item in x210404_g_DemandItem do
			AddItemDemand( sceneId, item.id, item.num )
		end
		EndEvent( )
		bDone = x210404_CheckSubmit( sceneId, selfId )
	DispatchMissionDemandInfo(sceneId,selfId,targetId,x210404_g_ScriptId,x210404_g_MissionId,bDone)
		--���������������
	elseif x210404_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x210404_g_MissionName)
			AddText(sceneId,x210404_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x210404_g_MissionTarget)
			AddMoneyBonus( sceneId, x210404_g_MoneyBonus )
			for i, item in x210404_g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
			
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x210404_g_ScriptId,x210404_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x210404_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x210404_g_MissionIdPre) <= 0 then
    	return
    end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210404_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x210404_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210404_g_Name then
			AddNumText(sceneId, x210404_g_ScriptId,x210404_g_MissionName,2,-1);
		end
	--���������������
    elseif x210404_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210404_g_Name then
			AddNumText(sceneId,x210404_g_ScriptId,x210404_g_MissionName,1,-1);
		end
    end
end
--**********************************
--����������
--**********************************
function x210404_CheckAccept( sceneId, selfId )
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
function x210404_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210404_g_MissionId, x210404_g_ScriptId, 1, 0, 1 )
	misIndex = GetMissionIndexByID(sceneId,selfId,x210404_g_MissionId)		--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)	--�������кŰ���������ĵ�0λ��0 (����������)
end

--**********************************
--����
--**********************************
function x210404_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210404_g_MissionId )
end

--**********************************
--����
--**********************************
function x210404_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x210404_g_MissionName)
		AddText(sceneId,x210404_g_MissionComplete)
		AddMoneyBonus( sceneId, x210404_g_MoneyBonus )
		for i, item in x210404_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x210404_g_ScriptId,x210404_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210404_CheckSubmit( sceneId, selfId )
	for i, item in x210404_g_DemandItem do
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
function x210404_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x210404_CheckSubmit( sceneId, selfId, selectRadioId ) then
    		BeginAddItem(sceneId)
			for i, item in x210404_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
			
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then		
		
			AddExp(sceneId,selfId,x210404_g_Exp)
			AddMoney(sceneId,selfId,x210404_g_MoneyBonus );			
			
			
			ret = DelMission( sceneId, selfId, x210404_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId, selfId, x210404_g_MissionId )
				
				--�۳�������Ʒ
				for i, item in x210404_g_DemandItem do
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
function x210404_OnKillObject( sceneId, selfId, objdataId ,objId)
	if objdataId == 544 then  --�ѱ�
		num = GetMonsterOwnerCount(sceneId,objId)--ȡ�������������ӵ�з���Ȩ������
		for i=0,num-1 do
			humanObjId = GetMonsterOwnerID(sceneId,objId,i)--ȡ��ӵ�з���Ȩ���˵�objId
			if IsHaveMission(sceneId,humanObjId,x210404_g_MissionId) > 0 then	--��������ӵ������	
				if (GetItemCount(sceneId,humanObjId,g_ItemId) < x210404_g_ItemNeedNum) then
					AddMonsterDropItem(sceneId,objId,humanObjId,g_ItemId)    --��������������(���߻������ʬ�����)
				end
			end
		end
	end
end

--**********************************
--���������¼�
--**********************************
function x210404_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210404_OnItemChanged( sceneId, selfId, itemdataId )
	if itemdataId == g_ItemId then
		x210404_g_ItemNum = GetItemCount(sceneId,selfId,g_ItemId)
		if x210404_g_ItemNum < x210404_g_ItemNeedNum then
			BeginEvent(sceneId)
				strText = format("�ѵõ��ѱ���ͷ­%d/1", x210404_g_ItemNum )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			--ȡ�����������ֵ
			misIndex = GetMissionIndexByID(sceneId,selfId,x210404_g_MissionId)
			num = GetMissionParam(sceneId,selfId,misIndex,0)
			if num == 1 then	--�������״̬��1,˵��������ɵ�������ְ���Ʒ���ٵ��������״̬
				SetMissionByIndex(sceneId,selfId,misIndex,0,0)
			end
		elseif x210404_g_ItemNum == x210404_g_ItemNeedNum then
			misIndex = GetMissionIndexByID(sceneId,selfId,x210404_g_MissionId)
			num = GetMissionParam(sceneId,selfId,misIndex,0)
			--����Ʒ�����ﵽҪ�����ʱ������ɱ�־��Ȼ��0,��������־���ó�1
			if num == 0 then
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			end
			--��ʾ�õ���Ʒ����
			BeginEvent(sceneId)
				strText = format("�ѵõ��ѱ���ͷ­%d/1", x210404_g_ItemNeedNum )
				AddText(sceneId,strText)
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end
