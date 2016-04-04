--�ͻ�����
--������Ϭ1

--�ű���
x201601_g_scriptId = 201601

--��һ�������ID
x201601_g_missionIdPre = 37

--�����
x201601_g_missionId = 38

--����ID
x201601_g_ItemID = 10105003

--Ŀ��NPC
x201601_g_name	="��üɮ"

--�����ı�����
x201601_g_missionName="������Ϭ1"
x201601_g_missionInfo="����²��ð��ˣ��Һ����Ѿ������֣�����һ��ָ��������֮�ϡ�һ��ָ�Ƕμ������ഫ�����Ӳ���Ů�����Ӳ������ˣ�����Ĵ����֮��\"�����ӯ\"���ǵ����ϵµ�֮�Ӷ����졣\n��ʵ�λ�ӱ����������ģ�������ȥ�Ը�����\n�����ɣ���дһ��ʥּ���������üɮ����������ȥ��������"
x201601_g_missionRenWuMuBiao="����Ŀ�꣺\nʥּ������üɮ"
x201601_g_missionRenContinueInfo="��ü��ʦ��ʥ��ϣ����ȥ������ӣ�����ʥּ"
x201601_g_missionRenSubmitInfo="�����ӷ��������ѣ��Ҷ�����������ת��ʥ�ϣ�����Ͷ���ȥ��ס����̫��"

--**********************************
--������ں���
--**********************************
function x201601_OnDefaultEvent( sceneId, selfId, targetId )
	
    --����ѽӴ�����
    if IsMissionHaveDone( sceneId, selfId, x201601_g_missionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x201601_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x201601_g_name then
			--���ͽ�����ǰ��������Ϣ
    		BeginEvent(sceneId)
    		AddText(sceneId,x201601_g_missionRenContinueInfo);
    		AddItemDemand( sceneId, x201601_g_ItemID, 1 );
    		EndEvent(sceneId)
    		
    		done = x201601_CheckSubmit( sceneId, selfId );
   			DispatchMissionDemandInfo(sceneId,selfId,targetId,x201601_g_scriptId,x201601_g_missionId,done)
 		end
    --���������������
    elseif x201601_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x201601_g_name then
			--�����������ʱ��ʾ����Ϣ
	    	BeginEvent(sceneId)
    		AddText(sceneId,x201601_g_missionName);
    		AddText(sceneId,x201601_g_missionInfo);
    		AddText(sceneId,x201601_g_missionRenWuMuBiao);
	    	EndEvent(sceneId)
	    	DispatchMissionInfo(sceneId,selfId,targetId,x201601_g_scriptId,x201601_g_missionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x201601_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x201601_g_missionIdPre) <= 0 then
    	return
    end
	--��������ɹ��������
    if IsMissionHaveDone( sceneId, selfId, x201601_g_missionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x201601_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x201601_g_name then
			AddNumText(sceneId, x201601_g_scriptId,x201601_g_missionName)
		end
    --���������������
    elseif x201601_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x201601_g_name then
			AddNumText(sceneId, x201601_g_scriptId, x201601_g_missionName);
		end
    end
end

--**********************************
--��ⴥ������
--**********************************
function x201601_CheckAccept( sceneId, selfId )
	bDone = IsMissionHaveDone( sceneId, selfId, x201601_g_missionIdPre );
	if bDone > 0 then
		return 1;
	else
		return 0;
	end
end

--**********************************
--����
--**********************************
function x201601_OnAccept( sceneId, selfId )

	--������������б�
	--����������Ʒ
	BeginAddItem( sceneId )
	AddItem( sceneId, x201601_g_ItemID, 1 )
	ret = EndAddItem( sceneId, selfId )

	if ret > 0 then 
		AddItemListToHuman(sceneId,selfId)
		ret = AddMission( sceneId,selfId, x201601_g_missionId, x201601_g_scriptId, 0, 0, 0 )
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
		end
	end
end

--**********************************
--����
--**********************************
function x201601_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    res = DelMission( sceneId, selfId, x201601_g_missionId )
	if res > 0 then
		--��ȥ������Ʒ
		DelItem( sceneId, selfId, x201601_g_ItemID, 1 )
	end
end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x201601_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x201601_g_missionRenSubmitInfo);
    EndEvent(sceneId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x201601_g_scriptId,x201601_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x201601_CheckSubmit( sceneId, selfId )
    itemNum = GetItemCount( sceneId, selfId, x201601_g_ItemID );
    if itemNum > 0 then
    	return 1;
    end
	return 0
end

--**********************************
--�ύ����ɣ�
--**********************************
function x201601_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	ret = x201601_CheckSubmit( sceneId, selfId );
	if ret > 0 then
		--ɾ����������б��ж�Ӧ������
		ret = DelMission( sceneId, selfId, x201601_g_missionId );
		if ret > 0 then
    		DelItem( sceneId,selfId,x201601_g_ItemID,1)
			MissionCom( sceneId, selfId, x201601_g_missionId )
			CallScriptFunction( 201602, "OnDefaultEvent",sceneId, selfId, targetId)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x201601_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x201601_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x201601_OnItemChanged( sceneId, selfId, itemdataId )
end
