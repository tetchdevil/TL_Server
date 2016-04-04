--ɱ�����������ͻ����棩
--��������2

--�ű���
x201802_g_scriptId = 201802

--��һ�������ID
x201802_g_missionIdPre = 41

--�����
x201802_g_missionId = 42

--����ID
x201802_g_ItemID = 10105003

--Ŀ��NPC
x201802_g_name	="������"

--�����ı�����
x201802_g_missionName="��������2"
x201802_g_missionInfo="�Ͷ���"
x201802_g_missionRenWuMuBiao="����Ŀ�꣺\n�Ͷ���"
x201802_g_missionRenContinueInfo="���Ǹ����"
x201802_g_missionRenSubmitInfo="�����"

--**********************************
--������ں���
--**********************************
function x201802_OnDefaultEvent( sceneId, selfId, targetId )
	
    --����ѽӴ�����
    if IsMissionHaveDone( sceneId, selfId, x201802_g_missionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x201802_g_missionId) > 0 then
		if g_targetId == targetId then
			--���ͽ�����ǰ��������Ϣ
    		BeginEvent(sceneId)
    		AddText(sceneId,x201802_g_missionRenContinueInfo);
    		AddItemDemand( sceneId, x201802_g_ItemID, 1 );
    		EndEvent(sceneId)
    		
    		done = x201802_CheckSubmit( sceneId, selfId );
   			DispatchMissionDemandInfo(sceneId,selfId,targetId,x201802_g_scriptId,x201802_g_missionId,done)
 		end
    --���������������
    elseif x201802_CheckAccept(sceneId,selfId) > 0 then
		if g_targetId ~= targetId then
			--�����������ʱ��ʾ����Ϣ
	    	BeginEvent(sceneId)
    		AddText(sceneId,x201802_g_missionName);
    		AddText(sceneId,x201802_g_missionInfo);
    		AddText(sceneId,x201802_g_missionRenWuMuBiao);
	    	EndEvent(sceneId)
	    	DispatchMissionInfo(sceneId,selfId,targetId,x201802_g_scriptId,x201802_g_missionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x201802_OnEnumerate( sceneId, selfId, targetId )
	--�����һ�δ�����һ������
	if 	IsMissionHaveDone(sceneId,selfId,x201802_g_missionIdPre) <= 0 then
    	return
    end
	--��������ɹ��������
    if IsMissionHaveDone( sceneId, selfId, x201802_g_missionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x201802_g_missionId) > 0 then
		if g_targetId == targetId then
			AddNumText(sceneId, x201802_g_scriptId,x201802_g_missionName)
		end
    --���������������
    elseif x201802_CheckAccept(sceneId,selfId) > 0 then
		if g_targetId ~= targetId then
			AddNumText(sceneId, x201802_g_scriptId, x201802_g_missionName);
		end
    end
end

--**********************************
--��ⴥ������
--**********************************
function x201802_CheckAccept( sceneId, selfId )
	bDone = IsMissionHaveDone( sceneId, selfId, x201802_g_missionIdPre );
	if bDone > 0 then
		return 1;
	else
		return 0;
	end
end

--**********************************
--����
--**********************************
function x201802_OnAccept( sceneId, selfId )

	--������������б�
	--����������Ʒ
	BeginAddItem( sceneId )
	AddItem( sceneId, x201802_g_ItemID, 1 )
	ret = EndAddItem( sceneId, selfId )

	if ret > 0 then 
		AddItemListToHuman(sceneId,selfId)
		ret = AddMission( sceneId,selfId, x201802_g_missionId, x201802_g_scriptId, 0, 0, 0 )
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
		end
	end
end

--**********************************
--����
--**********************************
function x201802_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    res = DelMission( sceneId, selfId, x201802_g_missionId )
	if res > 0 then
		--��ȥ������Ʒ
		DelItem( sceneId, selfId, x201802_g_ItemID, 1 )
	end
end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x201802_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x201802_g_missionRenSubmitInfo);
    EndEvent(sceneId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x201802_g_scriptId,x201802_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x201802_CheckSubmit( sceneId, selfId )
    itemNum = GetItemCount( sceneId, selfId, x201802_g_ItemID );
    if itemNum > 0 then
    	return 1;
    end
	return 0
end

--**********************************
--�ύ����ɣ�
--**********************************
function x201802_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	ret = x201802_CheckSubmit( sceneId, selfId );
	if ret > 0 then
		--ɾ����������б��ж�Ӧ������
		ret = DelMission( sceneId, selfId, x201802_g_missionId );
		if ret > 0 then
    		DelItem( sceneId,selfId,x201802_g_ItemID,1)
			MissionCom( sceneId, selfId, x201802_g_missionId )
			CallScriptFunction( 201901, "OnDefaultEvent",sceneId, selfId, targetId)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x201802_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x201802_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x201802_OnItemChanged( sceneId, selfId, itemdataId )
end
