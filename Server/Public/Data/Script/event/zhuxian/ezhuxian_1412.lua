--�ͻ�����
--��ȡ������2

--�ű���
x201412_g_scriptId = 201412

--��һ�������ID
x201412_g_missionIdPre = 54

--�����
x201412_g_missionId = 55

--Ŀ��NPC
x201412_g_name	="�̱�"

--����ID
x201412_g_ItemID = 10105003

--�����ı�����
x201412_g_missionName="��ȡ������2"
x201412_g_missionInfo="����"
x201412_g_missionRenWuMuBiao="����Ŀ�꣺\n�Ѷ��������̱�"
x201412_g_missionRenContinueInfo="����Ķ���"
x201412_g_missionRenSubmitInfo="лл"

--**********************************
--������ں���
--**********************************
function x201412_OnDefaultEvent( sceneId, selfId, targetId )
	
    --����ѽӴ�����
    if IsMissionHaveDone( sceneId, selfId, x201412_g_missionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x201412_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x201412_g_name then
			--���ͽ�����ǰ��������Ϣ
    		BeginEvent(sceneId)
    		AddText(sceneId,x201412_g_missionRenContinueInfo);
    		AddItemDemand( sceneId, x201412_g_ItemID, 1 );
    		EndEvent(sceneId)
    		
    		done = x201412_CheckSubmit( sceneId, selfId );
   			DispatchMissionDemandInfo(sceneId,selfId,targetId,x201412_g_scriptId,x201412_g_missionId,done)
 		end
    --���������������
    elseif x201412_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x201412_g_name then
			--�����������ʱ��ʾ����Ϣ
	    	BeginEvent(sceneId)
    		AddText(sceneId,x201412_g_missionName);
    		AddText(sceneId,x201412_g_missionInfo);
    		AddText(sceneId,x201412_g_missionRenWuMuBiao);
	    	EndEvent(sceneId)
	    	DispatchMissionInfo(sceneId,selfId,targetId,x201412_g_scriptId,x201412_g_missionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x201412_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x201412_g_missionIdPre) <= 0 then
    	return
    end
	--��������ɹ��������
    if IsMissionHaveDone( sceneId, selfId, x201412_g_missionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x201412_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x201412_g_name then
			AddNumText(sceneId, x201412_g_scriptId,x201412_g_missionName)
		end
    --���������������
    elseif x201412_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x201412_g_name then
			AddNumText(sceneId, x201412_g_scriptId, x201412_g_missionName);
		end
    end
end

--**********************************
--��ⴥ������
--**********************************
function x201412_CheckAccept( sceneId, selfId )
	bDone = IsMissionHaveDone( sceneId, selfId, x201412_g_missionIdPre );
	if bDone > 0 then
		return 1;
	else
		return 0;
	end
end

--**********************************
--����
--**********************************
function x201412_OnAccept( sceneId, selfId )

	--������������б�
	--����������Ʒ
	BeginAddItem( sceneId )
	AddItem( sceneId, x201412_g_ItemID, 1 )
	ret = EndAddItem( sceneId, selfId )

	if ret > 0 then 
		AddItemListToHuman(sceneId,selfId)
		ret = AddMission( sceneId,selfId, x201412_g_missionId, x201412_g_scriptId, 0, 0, 0 )
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
		end
	end
end

--**********************************
--����
--**********************************
function x201412_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    res = DelMission( sceneId, selfId, x201412_g_missionId )
	if res > 0 then
		--��ȥ������Ʒ
		DelItem( sceneId, selfId, x201412_g_ItemID, 1 )
	end
end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x201412_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x201412_g_missionRenSubmitInfo);
    EndEvent(sceneId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x201412_g_scriptId,x201412_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x201412_CheckSubmit( sceneId, selfId )
    itemNum = GetItemCount( sceneId, selfId, x201412_g_ItemID );
    if itemNum > 0 then
    	return 1;
    end
	return 0
end

--**********************************
--�ύ����ɣ�
--**********************************
function x201412_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	ret = x201412_CheckSubmit( sceneId, selfId );
	if ret > 0 then
		--ɾ����������б��ж�Ӧ������
		ret = DelMission( sceneId, selfId, x201412_g_missionId );
		if ret > 0 then
    		DelItem( sceneId,selfId,x201412_g_ItemID,1)
			MissionCom( sceneId, selfId, x201412_g_missionId )
			CallScriptFunction( 201511, "OnDefaultEvent",sceneId, selfId, targetId)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x201412_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x201412_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x201412_OnItemChanged( sceneId, selfId, itemdataId )
end
