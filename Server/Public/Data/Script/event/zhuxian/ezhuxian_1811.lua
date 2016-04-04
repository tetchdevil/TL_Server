--�ͻ�����
--��ˮһ��1

--�ű���
x201811_g_scriptId = 201811

--��һ�������ID
x201811_g_missionIdPre = 59

--�����
x201811_g_missionId = 61

--Ŀ��NPC
x201811_g_name	="����"

--����ID
x201811_g_ItemID = 10105003

--�����ı�����
x201811_g_missionName="��ˮһ��1"
x201811_g_missionInfo="����"
x201811_g_missionRenWuMuBiao="����Ŀ�꣺\n�Ѷ�����������"
x201811_g_missionRenContinueInfo="���㣬�����Ҵ�����"
x201811_g_missionRenSubmitInfo="лл���ٶ����"

--**********************************
--������ں���
--**********************************
function x201811_OnDefaultEvent( sceneId, selfId, targetId )
	
    --����ѽӴ�����
    if IsMissionHaveDone( sceneId, selfId, x201811_g_missionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x201811_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x201811_g_name then
			--���ͽ�����ǰ��������Ϣ
    		BeginEvent(sceneId)
    		AddText(sceneId,x201811_g_missionRenContinueInfo);
    		AddItemDemand( sceneId, x201811_g_ItemID, 1 );
    		EndEvent(sceneId)
    		
    		done = x201811_CheckSubmit( sceneId, selfId );
   			DispatchMissionDemandInfo(sceneId,selfId,targetId,x201811_g_scriptId,x201811_g_missionId,done)
 		end
    --���������������
    elseif x201811_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x201811_g_name then
			--�����������ʱ��ʾ����Ϣ
	    	BeginEvent(sceneId)
    		AddText(sceneId,x201811_g_missionName);
    		AddText(sceneId,x201811_g_missionInfo);
    		AddText(sceneId,x201811_g_missionRenWuMuBiao);
	    	EndEvent(sceneId)
	    	DispatchMissionInfo(sceneId,selfId,targetId,x201811_g_scriptId,x201811_g_missionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x201811_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x201811_g_missionIdPre) <= 0 then
    	return
    end
	--��������ɹ��������
    if IsMissionHaveDone( sceneId, selfId, x201811_g_missionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x201811_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x201811_g_name then
			AddNumText(sceneId, x201811_g_scriptId,x201811_g_missionName)
		end
    --���������������
    elseif x201811_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x201811_g_name then
			AddNumText(sceneId, x201811_g_scriptId, x201811_g_missionName);
		end
    end
end

--**********************************
--��ⴥ������
--**********************************
function x201811_CheckAccept( sceneId, selfId )
	bDone = IsMissionHaveDone( sceneId, selfId, x201811_g_missionIdPre );
	if bDone > 0 then
		return 1;
	else
		return 0;
	end
end

--**********************************
--����
--**********************************
function x201811_OnAccept( sceneId, selfId )

	--������������б�
	--����������Ʒ
	BeginAddItem( sceneId )
	AddItem( sceneId, x201811_g_ItemID, 1 )
	ret = EndAddItem( sceneId, selfId )

	if ret > 0 then 
		AddItemListToHuman(sceneId,selfId)
		ret = AddMission( sceneId,selfId, x201811_g_missionId, x201811_g_scriptId, 0, 0, 0 )
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
		end
	end
end

--**********************************
--����
--**********************************
function x201811_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    res = DelMission( sceneId, selfId, x201811_g_missionId )
	if res > 0 then
		--��ȥ������Ʒ
		DelItem( sceneId, selfId, x201811_g_ItemID, 1 )
	end
end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x201811_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x201811_g_missionRenSubmitInfo);
    EndEvent(sceneId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x201811_g_scriptId,x201811_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x201811_CheckSubmit( sceneId, selfId )
    itemNum = GetItemCount( sceneId, selfId, x201811_g_ItemID );
    if itemNum > 0 then
    	return 1;
    end
	return 0
end

--**********************************
--�ύ����ɣ�
--**********************************
function x201811_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	ret = x201811_CheckSubmit( sceneId, selfId );
	if ret > 0 then
		--ɾ����������б��ж�Ӧ������
		ret = DelMission( sceneId, selfId, x201811_g_missionId );
		if ret > 0 then
    		DelItem( sceneId,selfId,x201811_g_ItemID,1)
			MissionCom( sceneId, selfId, x201811_g_missionId )
			CallScriptFunction( 201812, "OnDefaultEvent",sceneId, selfId, targetId)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x201811_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x201811_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x201811_OnItemChanged( sceneId, selfId, itemdataId )
end
