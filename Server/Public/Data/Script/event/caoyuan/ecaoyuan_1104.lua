     --ɱ�ֵ�������
--���ͷ��
--MisDescBegin
--�ű���
x211104_g_ScriptId = 211104

--��һ�������ID
x211104_g_MissionIdPre = 543

--�����
x211104_g_MissionId = 544

--����Ŀ��npc
x211104_g_Name	="��Ǿ" 

--������߱��
x211104_g_ItemId = 40002064

--���������������
x211104_g_ItemNeedNum = 1

--�������
x211104_g_MissionKind = 31

--����ȼ�
x211104_g_MissionLevel = 54

--�Ƿ��Ǿ�Ӣ����
x211104_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x211104_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

--������Ҫ�õ�����Ʒ
x211104_g_DemandItem={{id=40002064,num=1}}		--������1λ

--�����ı�����
x211104_g_MissionName="���ͷ��"
x211104_g_MissionInfo="��˵Ĵ������ľԪ������������ʯ���ϣ������ҵ����������ˡ���ȥ��������ɱ�ˣ����ҵ������û�����"  --��������
x211104_g_MissionTarget="ɱ�����ͷ���ľԪ"		--����Ŀ��
x211104_g_ContinueInfo="�ѵ�ֻ����������ɱ����ľԪ��"		--δ��������npc�Ի�
x211104_g_MissionComplete="лл�㡭��"					--�������npc˵���Ļ�

x211104_g_MoneyBonus=1032
x211104_g_ItemBonus={{id=30002001,num=1},{id=10412001,num=1}}
x211104_g_RadioItemBonus={{id=10100001,num=1},{id=10210001,num=1},{id=10220001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x211104_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x211104_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x211104_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,x211104_g_MissionName)
		AddText(sceneId,x211104_g_ContinueInfo)
		for i, item in x211104_g_DemandItem do
			AddItemDemand( sceneId, item.id, item.num )
		end
		EndEvent( )
		bDone = x211104_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x211104_g_ScriptId,x211104_g_MissionId,bDone)
	--���������������
	elseif x211104_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x211104_g_MissionName)
			AddText(sceneId,x211104_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x211104_g_MissionTarget)
			AddMoneyBonus( sceneId, x211104_g_MoneyBonus )
			for i, item in x211104_g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
			for i, item in x211104_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( sceneId)
		DispatchMissionInfo(sceneId,selfId,targetId,x211104_g_ScriptId,x211104_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x211104_OnEnumerate( sceneId, selfId, targetId )
	--�ж��Ƿ������ǰ������
	if	IsMissionHaveDone( sceneId, selfId, x211104_g_MissionIdPre ) <= 0 then
		return
	end
	--��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x211104_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    if IsHaveMission(sceneId,selfId,x211104_g_MissionId) > 0 then
		AddNumText(sceneId,x211104_g_ScriptId,x211104_g_MissionName);
    --���������������
    elseif x211104_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x211104_g_ScriptId,x211104_g_MissionName);
    end
end

--**********************************
--����������
--**********************************
function x211104_CheckAccept( sceneId, selfId )
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
function x211104_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x211104_g_MissionId, x211104_g_ScriptId, 1, 0, 1 )
	misIndex = GetMissionIndexByID(sceneId,selfId,x211104_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0 (����������)
end

--**********************************
--����
--**********************************
function x211104_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x211104_g_MissionId )
end

--**********************************
--����
--**********************************
function x211104_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x211104_g_MissionName)
		AddText(sceneId,x211104_g_MissionComplete)
		AddMoneyBonus( sceneId, x211104_g_MoneyBonus )
		for i, item in x211104_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
		for i, item in x211104_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x211104_g_ScriptId,x211104_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x211104_CheckSubmit( sceneId, selfId )
	for i, item in x211104_g_DemandItem do
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
function x211104_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x211104_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
			for i, item in x211104_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
			for i, item in x211104_g_RadioItemBonus do
				if item.id == selectRadioId then
					AddItem( sceneId,item.id, item.num )
				end
			end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddMoney(sceneId,selfId,x211104_g_MoneyBonus );
			ret = DelMission( sceneId, selfId, x211104_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId,selfId, x211104_g_MissionId )
				--�۳�������Ʒ
				for i, item in x211104_g_DemandItem do
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
function x211104_OnKillObject( sceneId, selfId, objdataId ,objId)--������˼�������š����objId�������λ�úš�����objId
	if GetName(sceneId,objId) == "��ľԪ"	  then
		num = GetMonsterOwnerCount(sceneId,objId)--ȡ�������������ӵ�з���Ȩ������
		for i=0,num-1 do
			humanObjId = GetMonsterOwnerID(sceneId,objId,i)--ȡ��ӵ�з���Ȩ���˵�objId
			if IsHaveMission(sceneId,humanObjId,x211104_g_MissionId) > 0 then	--��������ӵ������	
				if (GetItemCount(sceneId,humanObjId,x211104_g_ItemId) < x211104_g_ItemNeedNum) then
					AddMonsterDropItem(sceneId,objId,humanObjId,x211104_g_ItemId)    --��������������(���߻������ʬ�����)
				end
			end
		end
	end
end

--**********************************
--���������¼�
--**********************************
function x211104_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x211104_OnItemChanged( sceneId, selfId, itemdataId )
	if itemdataId == x211104_g_ItemId then
		x211104_g_ItemNum = GetItemCount(sceneId,selfId,x211104_g_ItemId)
		if x211104_g_ItemNum < x211104_g_ItemNeedNum then
			BeginEvent(sceneId)
				strText = format("�ѵõ�����������%d/1", x211104_g_ItemNum )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			--ȡ�����������ֵ
			misIndex = GetMissionIndexByID(sceneId,selfId,x211104_g_MissionId)
			num = GetMissionParam(sceneId,selfId,misIndex,0)
			if num == 1 then	--�������״̬��1,˵��������ɵ�������ְ���Ʒ���ٵ��������״̬
				SetMissionByIndex(sceneId,selfId,misIndex,0,0)
			end
		elseif x211104_g_ItemNum == x211104_g_ItemNeedNum then
			misIndex = GetMissionIndexByID(sceneId,selfId,x211104_g_MissionId)
			num = GetMissionParam(sceneId,selfId,misIndex,0)
			--����Ʒ�����ﵽҪ�����ʱ������ɱ�־��Ȼ��0,��������־���ó�1
			if num == 0 then
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			end
			--��ʾ�õ���Ʒ����
			BeginEvent(sceneId)
				strText = format("�ѵõ�����������%d/1", x211104_g_ItemNeedNum )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end
