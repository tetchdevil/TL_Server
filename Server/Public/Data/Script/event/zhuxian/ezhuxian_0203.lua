--�ͻ�����
--��ֶ���3

--�ű���
x200203_g_scriptId = 200203

--ǰ������
x200203_g_missionIdPre  = 4;

--�����
x200203_g_missionId = 5

--�����ı�����
x200203_g_missionName="��ֶ���3"
x200203_g_missionInfo="���Ƚ�����Ž�����ʦ��"
--,������֮��,��ʦ��������������,��ʱ�ټ�����."
x200203_g_missionRenWuMuBiao="����Ŀ�꣺\n������֮���Ž����ް�Ȫ"
x200203_g_missionRenContinueInfo="���ǹ���֮���Ҹ������"
x200203_g_missionRenSubmitInfo="�����ô�鷳��ʲô"
--,˭����ţ�ɵ���,һ�����˲�������?"

--����ID
x200203_g_ItemID = 10105003

--����

--�ջ���
x200203_g_name = "�ް�Ȫ"


--**********************************
--������ں���
--**********************************
function x200203_OnDefaultEvent( sceneId, selfId, targetId )
	
    --����ѽӴ�����
    if IsMissionHaveDone( sceneId, selfId, x200203_g_missionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x200203_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x200203_g_name then
			--���ͽ�����ǰ��������Ϣ
    		BeginEvent(sceneId)
    		AddText(sceneId,x200203_g_missionRenContinueInfo);
    		AddItemDemand( sceneId, x200203_g_ItemID, 1 );
    		EndEvent(sceneId)
    		
    		done = x200203_CheckSubmit( sceneId, selfId );
   			DispatchMissionDemandInfo(sceneId,selfId,targetId,x200203_g_scriptId,x200203_g_missionId,done)
 		end
    --���������������
    elseif x200203_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200203_g_name then
			--�����������ʱ��ʾ����Ϣ
	    	BeginEvent(sceneId)
    		AddText(sceneId,x200203_g_missionName);
    		AddText(sceneId,x200203_g_missionInfo);
    		AddText(sceneId,x200203_g_missionRenWuMuBiao);
	    	EndEvent(sceneId)
	    	DispatchMissionInfo(sceneId,selfId,targetId,x200203_g_scriptId,x200203_g_missionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x200203_OnEnumerate( sceneId, selfId, targetId )

    if IsMissionHaveDone( sceneId, selfId, x200203_g_missionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x200203_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x200203_g_name then
			AddNumText(sceneId, x200203_g_scriptId,x200203_g_missionName)
		end
    --���������������
    elseif x200203_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200203_g_name then
			AddNumText(sceneId, x200203_g_scriptId, x200203_g_missionName);
		end
    end
end

--**********************************
--��ⴥ������
--**********************************
function x200203_CheckAccept( sceneId, selfId )
	bDone = IsMissionHaveDone( sceneId, selfId, x200203_g_missionIdPre );
	if bDone > 0 then
		return 1;
	else
		return 0;
	end
end

--**********************************
--����
--**********************************
function x200203_OnAccept( sceneId, selfId )

	--������������б�
	--����������Ʒ
	BeginAddItem( sceneId )
	AddItem( sceneId, x200203_g_ItemID, 1 )
	ret = EndAddItem( sceneId, selfId )

	if ret > 0 then 
		AddItemListToHuman(sceneId,selfId)
		ret = AddMission( sceneId,selfId, x200203_g_missionId, x200203_g_scriptId, 0, 0, 0 )
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
		end
	end
end

--**********************************
--����
--**********************************
function x200203_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    res = DelMission( sceneId, selfId, x200203_g_missionId )
	if res > 0 then
		--��ȥ������Ʒ
		DelItem( sceneId, selfId, x200203_g_ItemID, 1 )
	end
end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x200203_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x200203_g_missionRenSubmitInfo);
    EndEvent(sceneId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200203_g_scriptId,x200203_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200203_CheckSubmit( sceneId, selfId )
    itemNum = GetItemCount( sceneId, selfId, x200203_g_ItemID );
    if itemNum > 0 then
    	return 1;
    end
	return 0
end

--**********************************
--�ύ����ɣ�
--**********************************
function x200203_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	ret = x200203_CheckSubmit( sceneId, selfId );
	if ret > 0 then
		--ɾ����������б��ж�Ӧ������
		ret = DelMission( sceneId, selfId, x200203_g_missionId );
		if ret > 0 then
    		DelItem( sceneId,selfId,x200203_g_ItemID,1)
			MissionCom( sceneId, selfId, x200203_g_missionId )
			CallScriptFunction( 200301, "OnDefaultEvent",sceneId, selfId, targetId)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x200203_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x200203_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200203_OnItemChanged( sceneId, selfId, itemdataId )
end
