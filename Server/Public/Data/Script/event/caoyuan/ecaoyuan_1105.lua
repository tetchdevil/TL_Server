--�ͻ�����
--������ţ
--MisDescBegin
--�ű���
x211105_g_ScriptId = 211105

--ǰ������
x211105_g_MissionIdPre  = 544

--�����
x211105_g_MissionId = 545

--�������
x211105_g_MissionKind = 31

--����ȼ�
x211105_g_MissionLevel = 55

--�Ƿ��Ǿ�Ӣ����
x211105_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x211105_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

--������Ҫ����Ʒ
x211105_g_DemandItem={{id=40002064,num=1}}		--������1λ

--�����ı�����
x211105_g_MissionName="������ţ"
x211105_g_MissionInfo="�Բ����Ҷ��㷢����ô��Ƣ������������������������ˣ��ҿ��ܾ�Ҫ�����ˡ������Ұ���������͸��ڷ�կ����ϰɡ�"
x211105_g_MissionTarget="��������Ǿ������������ϡ�"
x211105_g_ContinueInfo="���ǿ������Ҹ����"
x211105_g_MissionComplete="�����������Ǹ��Ͱ�һ�������˵�Ѿͷ���ǿ�����"

--����ID
x211105_g_ItemID = 40002064

--����
--g_ItemBonus={{id=30002001,num=1},{id=10412001,num=1}}

--�ջ���
x211105_g_Name = "���"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x211105_OnDefaultEvent( sceneId, selfId, targetId )
	--����ѽӴ�����
    if IsMissionHaveDone( sceneId, selfId, x211105_g_MissionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x211105_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x211105_g_Name then
			--���ͽ�����ǰ��������Ϣ
    		BeginEvent(sceneId)
				AddText(sceneId,x211105_g_ContinueInfo);
				AddItemDemand( sceneId, x211105_g_ItemID, 1 );
    		EndEvent(sceneId)
    		done = x211105_CheckSubmit( sceneId, selfId );
   			DispatchMissionDemandInfo(sceneId,selfId,targetId,x211105_g_ScriptId,x211105_g_MissionId,done)
 		end
    --���������������
    elseif x211105_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x211105_g_Name then
			--�����������ʱ��ʾ����Ϣ
	    	BeginEvent(sceneId)
				AddText(sceneId,x211105_g_MissionName)
				AddText(sceneId,x211105_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x211105_g_MissionTarget)
			AddMoneyBonus( sceneId, g_MoneyBonus )
			for i, item in g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
			for i, item in g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
	    	EndEvent(sceneId)
	    	DispatchMissionInfo(sceneId,selfId,targetId,x211105_g_ScriptId,x211105_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x211105_OnEnumerate( sceneId, selfId, targetId )
	--�ж��Ƿ������ǰ������
	if	IsMissionHaveDone( sceneId, selfId, x211105_g_MissionIdPre ) <= 0 then
		return
	end
	
	--��������ɹ��������
	if IsMissionHaveDone( sceneId, selfId, x211105_g_MissionId ) > 0 then
		return 
	elseif IsHaveMission(sceneId,selfId,x211105_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x211105_g_Name then
			AddNumText(sceneId, x211105_g_ScriptId,x211105_g_MissionName)
		end
	--���������������
	elseif x211105_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x211105_g_Name then
			AddNumText(sceneId, x211105_g_ScriptId, x211105_g_MissionName);
		end
	end
end

--**********************************
--��ⴥ������
--**********************************
function x211105_CheckAccept( sceneId, selfId )
	--bDone = IsMissionHaveDone( sceneId, selfId, x211105_g_MissionIdPre );
	--if bDone > 0 then
		return 1;
	--else
	--	return 0;
	--end
end

--**********************************
--����
--**********************************
function x211105_OnAccept( sceneId, selfId )
--	misIndex = GetMissionIndexByID(sceneId,selfId,x211105_g_MissionId)			--�õ���������к�
--	SetMissionByIndex(sceneId,selfId,misIndex,0,1)		--�������кŰ���������ĵ�0λ��1 (����������)
	--������������б�
	--����������Ʒ
	BeginAddItem( sceneId )
		AddItem( sceneId, x211105_g_ItemID, 1 )
	ret = EndAddItem( sceneId, selfId )
	if ret > 0 then 
		ret = AddMission( sceneId,selfId, x211105_g_MissionId, x211105_g_ScriptId, 0, 0, 0 )	
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			--����2�����д��AddMission֮��
			misIndex = GetMissionIndexByID(sceneId,selfId,x211105_g_MissionId)			--�õ���������к�
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)		--�������кŰ���������ĵ�0λ��1 (����������)
		else
			BeginEvent(sceneId)
				strText = "�������ʧ��"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	else
		BeginEvent(sceneId)
			strText = "��������,�޷���������"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end

--**********************************
--����
--**********************************
function x211105_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    res = DelMission( sceneId, selfId, x211105_g_MissionId )
	if res > 0 then
		--��ȥ������Ʒ
		DelItem( sceneId, selfId, x211105_g_ItemID, 1 )
	end
end

--**********************************
--����
--**********************************
function x211105_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x211105_g_MissionName)
		AddText(sceneId,x211105_g_MissionComplete)
		AddMoneyBonus( sceneId, g_MoneyBonus )
		for i, item in g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
		for i, item in g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent()
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x211105_g_ScriptId,x211105_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x211105_CheckSubmit( sceneId, selfId )
    itemNum = GetItemCount( sceneId, selfId, x211105_g_ItemID );
    if itemNum > 0 then
    	return 1;
    end
	return 0
end

--**********************************
--�ύ����ɣ�
--**********************************
function x211105_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	ret = x211105_CheckSubmit( sceneId, selfId );
	if ret > 0 then
		--ɾ����������б��ж�Ӧ������
		ret = DelMission( sceneId, selfId, x211105_g_MissionId )
		if ret > 0 then
    		MissionCom( sceneId, selfId, x211105_g_MissionId )
			DelItem( sceneId,selfId,x211105_g_ItemID,1)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x211105_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x211105_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x211105_OnItemChanged( sceneId, selfId, itemdataId )
end
