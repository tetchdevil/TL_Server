--̫�� һ˿ϣ��
--MisDescBegin
--�ű���
x210402_g_ScriptId = 210402


--�����
x210402_g_MissionId = 472

--��һ�������ID
x210402_g_MissionIdPre = 471

--����Ŀ��npc
x210402_g_Name	="���" 


--������߱��
x210402_g_ItemId = 40002114

--���������������
x210402_g_ItemNeedNum = 1

--�������
x210402_g_MissionKind = 15

--����ȼ�
x210402_g_MissionLevel = 10

--�Ƿ��Ǿ�Ӣ����
x210402_g_IfMissionElite = 0

--******���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������******
--�����Ƿ��Ѿ����
x210402_g_IsMissionOkFail = 0		--�����ĵ�0λ

--******�����Ƕ�̬*****

--������Ҫ�õ�����Ʒ
x210402_g_DemandItem={{id=40002114,num=1}}		--Ҫ�ĳ�����ѽ�� ������1λ

--�����ı�����
x210402_g_MissionName="һ˿ϣ��"
x210402_g_MissionInfo="ɱ�����ص���ʹ���û������ϵ�����"  --��������
x210402_g_MissionTarget="ɱ�����ص���ʹ���û������ϵ�����"		--����Ŀ��
x210402_g_ContinueInfo="��û����ɣ���Ҫ����Ŭ��Ӵ"		--δ��������npc�Ի�
x210402_g_MissionComplete="�ţ����������������"					--�������npc˵���Ļ�

x210402_g_MoneyBonus=10200
x210402_g_Exp = 3000
x210402_g_ItemBonus={{id=30002001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210402_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	if IsMissionHaveDone(sceneId,selfId, x210402_g_MissionIdPre) <= 0 then
		return
	end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x210402_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x210402_g_MissionName)
			AddText(sceneId,x210402_g_ContinueInfo)
		for i, item in x210402_g_DemandItem do
			AddItemDemand( sceneId, item.id, item.num )
		end
		EndEvent( )
		bDone = x210402_CheckSubmit( sceneId, selfId )
	DispatchMissionDemandInfo(sceneId,selfId,targetId,x210402_g_ScriptId,x210402_g_MissionId,bDone)
		--���������������
	elseif x210402_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x210402_g_MissionName)
			AddText(sceneId,x210402_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x210402_g_MissionTarget)
			AddMoneyBonus( sceneId, x210402_g_MoneyBonus )
			for i, item in x210402_g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
			
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x210402_g_ScriptId,x210402_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x210402_OnEnumerate( sceneId, selfId, targetId )
	if IsMissionHaveDone(sceneId,selfId, x210402_g_MissionIdPre) <= 0 then
		return
	end
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x210402_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
		if IsHaveMission(sceneId,selfId,x210402_g_MissionId) > 0 then
			AddNumText(sceneId,x210402_g_ScriptId,x210402_g_MissionName);
			--���������������
		elseif x210402_CheckAccept(sceneId,selfId) > 0 then
			AddNumText(sceneId,x210402_g_ScriptId,x210402_g_MissionName);
		end
	end

--**********************************
--����������
--**********************************
function x210402_CheckAccept( sceneId, selfId )
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
function x210402_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210402_g_MissionId, x210402_g_ScriptId, 1, 0, 1 )
	misIndex = GetMissionIndexByID(sceneId,selfId,x210402_g_MissionId)		--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)	--�������кŰ���������ĵ�0λ��0 (����������)
end

--**********************************
--����
--**********************************
function x210402_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210402_g_MissionId )
end

--**********************************
--����
--**********************************
function x210402_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x210402_g_MissionName)
		AddText(sceneId,x210402_g_MissionComplete)
		AddMoneyBonus( sceneId, x210402_g_MoneyBonus )
		for i, item in x210402_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x210402_g_ScriptId,x210402_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210402_CheckSubmit( sceneId, selfId )
	for i, item in x210402_g_DemandItem do
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
function x210402_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x210402_CheckSubmit( sceneId, selfId, selectRadioId ) then
    		BeginAddItem(sceneId)
			for i, item in x210402_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
			
		ret = EndAddItem(sceneId,selfId)
		--����������
		if ret > 0 then		
		
			AddExp(sceneId,selfId,x210402_g_Exp)
			AddMoney(sceneId,selfId,x210402_g_MoneyBonus );			
			
			
			ret = DelMission( sceneId, selfId, x210402_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId, selfId, x210402_g_MissionId )
				
				--�۳�������Ʒ
				for i, item in x210402_g_DemandItem do
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
function x210402_OnKillObject( sceneId, selfId, objdataId ,objId)
	if objdataId == 543 then  --������ʷ �ξ���ʹ
		num = GetMonsterOwnerCount(sceneId,objId)--ȡ�������������ӵ�з���Ȩ������
		for i=0,num-1 do
			humanObjId = GetMonsterOwnerID(sceneId,objId,i)--ȡ��ӵ�з���Ȩ���˵�objId
			if IsHaveMission(sceneId,humanObjId,x210402_g_MissionId) > 0 then	--��������ӵ������	
				if (GetItemCount(sceneId,humanObjId,x210402_g_ItemId) < x210402_g_ItemNeedNum) then
					AddMonsterDropItem(sceneId,objId,humanObjId,x210402_g_ItemId)    --��������������(���߻������ʬ�����)
				end
			end
		end
	end
end

--**********************************
--���������¼�
--**********************************
function x210402_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210402_OnItemChanged( sceneId, selfId, itemdataId )
	if itemdataId == x210402_g_ItemId then
		x210402_g_ItemNum = GetItemCount(sceneId,selfId,x210402_g_ItemId)
		if x210402_g_ItemNum < x210402_g_ItemNeedNum then
			BeginEvent(sceneId)
				strText = format("�ѵõ�����%d/1", x210402_g_ItemNum )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			--ȡ�����������ֵ
			misIndex = GetMissionIndexByID(sceneId,selfId,x210402_g_MissionId)
			num = GetMissionParam(sceneId,selfId,misIndex,0)
			if num == 1 then	--�������״̬��1,˵��������ɵ�������ְ���Ʒ���ٵ��������״̬
				SetMissionByIndex(sceneId,selfId,misIndex,0,0)
			end
		elseif x210402_g_ItemNum == x210402_g_ItemNeedNum then
			misIndex = GetMissionIndexByID(sceneId,selfId,x210402_g_MissionId)
			num = GetMissionParam(sceneId,selfId,misIndex,0)
			--����Ʒ�����ﵽҪ�����ʱ������ɱ�־��Ȼ��0,��������־���ó�1
			if num == 0 then
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			end
			--��ʾ�õ���Ʒ����
			BeginEvent(sceneId)
				strText = format("�ѵõ�����%d/1", x210402_g_ItemNeedNum )
				AddText(sceneId,strText)
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end