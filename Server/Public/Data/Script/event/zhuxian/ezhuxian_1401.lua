--�ͻ�����
--������1

--�ű���
x201401_g_scriptId = 201401

--��һ�������ID
x201401_g_missionIdPre = 33

--�����
x201401_g_missionId = 34

--����ID
x201401_g_ItemID = 10105003

--Ŀ��NPC
x201401_g_name	="������"

--�����ı�����
x201401_g_missionName="������1"
x201401_g_missionInfo="���Ѳ���������Сԩ�ҵ��ˡ�����������������æ����������н�����������������������æ�����Ů��������������һ���������ȵġ����ˣ�ǧ��������ɷ򿴵�������С�"
x201401_g_missionRenWuMuBiao="����Ŀ�꣺\n�����н���������"
x201401_g_missionRenContinueInfo="�����ӷ������Ҹ���Ľ��У���Ů�����˶���������ȥ��æ"
x201401_g_missionRenSubmitInfo="�⣬���Ǳ����ģ��ӷ���...�ӷ���...�������ҶԲ����㡣��Ů�������ˣ�����������ϸ�ȥ"

--**********************************
--������ں���
--**********************************
function x201401_OnDefaultEvent( sceneId, selfId, targetId )
	
    --����ѽӴ�����
    if IsMissionHaveDone( sceneId, selfId, x201401_g_missionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x201401_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x201401_g_name then
			--���ͽ�����ǰ��������Ϣ
    		BeginEvent(sceneId)
    		AddText(sceneId,x201401_g_missionRenContinueInfo);
    		AddItemDemand( sceneId, x201401_g_ItemID, 1 );
    		EndEvent(sceneId)
    		
    		done = x201401_CheckSubmit( sceneId, selfId );
   			DispatchMissionDemandInfo(sceneId,selfId,targetId,x201401_g_scriptId,x201401_g_missionId,done)
 		end
    --���������������
    elseif x201401_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x201401_g_name then
			--�����������ʱ��ʾ����Ϣ
	    	BeginEvent(sceneId)
    		AddText(sceneId,x201401_g_missionName);
    		AddText(sceneId,x201401_g_missionInfo);
    		AddText(sceneId,x201401_g_missionRenWuMuBiao);
	    	EndEvent(sceneId)
	    	DispatchMissionInfo(sceneId,selfId,targetId,x201401_g_scriptId,x201401_g_missionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x201401_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x201401_g_missionIdPre) <= 0 then
    	return
    end
	--��������ɹ��������
    if IsMissionHaveDone( sceneId, selfId, x201401_g_missionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x201401_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x201401_g_name then
			AddNumText(sceneId, x201401_g_scriptId,x201401_g_missionName)
		end
    --���������������
    elseif x201401_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x201401_g_name then
			AddNumText(sceneId, x201401_g_scriptId, x201401_g_missionName);
		end
    end
end

--**********************************
--��ⴥ������
--**********************************
function x201401_CheckAccept( sceneId, selfId )
	bDone = IsMissionHaveDone( sceneId, selfId, x201401_g_missionIdPre );
	if bDone > 0 then
		return 1;
	else
		return 0;
	end
end

--**********************************
--����
--**********************************
function x201401_OnAccept( sceneId, selfId )

	--������������б�
	--����������Ʒ
	BeginAddItem( sceneId )
	AddItem( sceneId, x201401_g_ItemID, 1 )
	ret = EndAddItem( sceneId, selfId )

	if ret > 0 then 
		AddItemListToHuman(sceneId,selfId)
		ret = AddMission( sceneId,selfId, x201401_g_missionId, x201401_g_scriptId, 0, 0, 0 )
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
		end
	end
end

--**********************************
--����
--**********************************
function x201401_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    res = DelMission( sceneId, selfId, x201401_g_missionId )
	if res > 0 then
		--��ȥ������Ʒ
		DelItem( sceneId, selfId, x201401_g_ItemID, 1 )
	end
end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x201401_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x201401_g_missionRenSubmitInfo);
    EndEvent(sceneId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x201401_g_scriptId,x201401_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x201401_CheckSubmit( sceneId, selfId )
    itemNum = GetItemCount( sceneId, selfId, x201401_g_ItemID );
    if itemNum > 0 then
    	return 1;
    end
	return 0
end

--**********************************
--�ύ����ɣ�
--**********************************
function x201401_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	ret = x201401_CheckSubmit( sceneId, selfId );
	if ret > 0 then
		--ɾ����������б��ж�Ӧ������
		ret = DelMission( sceneId, selfId, x201401_g_missionId );
		if ret > 0 then
    		DelItem( sceneId,selfId,x201401_g_ItemID,1)
			MissionCom( sceneId, selfId, x201401_g_missionId )
			CallScriptFunction( 201402, "OnDefaultEvent",sceneId, selfId, targetId)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x201401_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x201401_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x201401_OnItemChanged( sceneId, selfId, itemdataId )
end
