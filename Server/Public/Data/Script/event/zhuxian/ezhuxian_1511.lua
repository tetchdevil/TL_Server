--�ͻ�����
--���ӷ���1

--�ű���
x201511_g_scriptId = 201511

--��һ�������ID
x201511_g_missionIdPre = 55

--�����
x201511_g_missionId = 56

--Ŀ��NPC
x201511_g_name	="��"

--����ID
x201511_g_ItemID = 10105003

--�����ı�����
x201511_g_missionName="���ӷ���1"
x201511_g_missionInfo="�����ڸ�������æ������Ұ��񵥽���������������"
x201511_g_missionRenWuMuBiao="����Ŀ�꣺\n���񵥽���������"
x201511_g_missionRenContinueInfo="�´��ˣ����ǲ̴������Ҵ�����ģ�������ϸ����"
x201511_g_missionRenSubmitInfo="����ʲô���飿"

--**********************************
--������ں���
--**********************************
function x201511_OnDefaultEvent( sceneId, selfId, targetId )
	
    --����ѽӴ�����
    if IsMissionHaveDone( sceneId, selfId, x201511_g_missionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x201511_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x201511_g_name then
			--���ͽ�����ǰ��������Ϣ
    		BeginEvent(sceneId)
    		AddText(sceneId,x201511_g_missionRenContinueInfo);
    		AddItemDemand( sceneId, x201511_g_ItemID, 1 );
    		EndEvent(sceneId)
    		
    		done = x201511_CheckSubmit( sceneId, selfId );
   			DispatchMissionDemandInfo(sceneId,selfId,targetId,x201511_g_scriptId,x201511_g_missionId,done)
 		end
    --���������������
    elseif x201511_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x201511_g_name then
			--�����������ʱ��ʾ����Ϣ
	    	BeginEvent(sceneId)
    		AddText(sceneId,x201511_g_missionName);
    		AddText(sceneId,x201511_g_missionInfo);
    		AddText(sceneId,x201511_g_missionRenWuMuBiao);
	    	EndEvent(sceneId)
	    	DispatchMissionInfo(sceneId,selfId,targetId,x201511_g_scriptId,x201511_g_missionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x201511_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x201511_g_missionIdPre) <= 0 then
    	return
    end
	--��������ɹ��������
    if IsMissionHaveDone( sceneId, selfId, x201511_g_missionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x201511_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x201511_g_name then
			AddNumText(sceneId, x201511_g_scriptId,x201511_g_missionName)
		end
    --���������������
    elseif x201511_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x201511_g_name then
			AddNumText(sceneId, x201511_g_scriptId, x201511_g_missionName);
		end
    end
end

--**********************************
--��ⴥ������
--**********************************
function x201511_CheckAccept( sceneId, selfId )
	bDone = IsMissionHaveDone( sceneId, selfId, x201511_g_missionIdPre );
	if bDone > 0 then
		return 1;
	else
		return 0;
	end
end

--**********************************
--����
--**********************************
function x201511_OnAccept( sceneId, selfId )

	--������������б�
	--����������Ʒ
	BeginAddItem( sceneId )
	AddItem( sceneId, x201511_g_ItemID, 1 )
	ret = EndAddItem( sceneId, selfId )

	if ret > 0 then 
		AddItemListToHuman(sceneId,selfId)
		ret = AddMission( sceneId,selfId, x201511_g_missionId, x201511_g_scriptId, 0, 0, 0 )
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
		end
	end
end

--**********************************
--����
--**********************************
function x201511_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    res = DelMission( sceneId, selfId, x201511_g_missionId )
	if res > 0 then
		--��ȥ������Ʒ
		DelItem( sceneId, selfId, x201511_g_ItemID, 1 )
	end
end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x201511_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x201511_g_missionRenSubmitInfo);
    EndEvent(sceneId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x201511_g_scriptId,x201511_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x201511_CheckSubmit( sceneId, selfId )
    itemNum = GetItemCount( sceneId, selfId, x201511_g_ItemID );
    if itemNum > 0 then
    	return 1;
    end
	return 0
end

--**********************************
--�ύ����ɣ�
--**********************************
function x201511_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	ret = x201511_CheckSubmit( sceneId, selfId );
	if ret > 0 then
		--ɾ����������б��ж�Ӧ������
		ret = DelMission( sceneId, selfId, x201511_g_missionId );
		if ret > 0 then
    		DelItem( sceneId,selfId,x201511_g_ItemID,1)
			MissionCom( sceneId, selfId, x201511_g_missionId )
			CallScriptFunction( 201512, "OnDefaultEvent",sceneId, selfId, targetId)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x201511_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x201511_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x201511_OnItemChanged( sceneId, selfId, itemdataId )
end
