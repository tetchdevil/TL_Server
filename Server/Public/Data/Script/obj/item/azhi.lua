--ʯ��  ���µ�����

--�ű���
x300018_g_scriptId = 300008


--��ӵ�е��¼�ID�б�
x300018_g_eventList={211708}

--**********************************
--�¼��������
--**********************************
function x300018_OnDefaultEvent( sceneId, selfId,targetId )
	x300018_OnEventRequest( sceneId, selfId, targetId, 211708 )
end

--**********************************
--ˢ���¼�
--**********************************
function x300018_OnEventRequest( sceneId, selfId, targetId, eventId )
	CallScriptFunction( 211708, "OnDefaultEvent",sceneId, selfId, targetId )
end

--**********************************
--���ܴ�NPC������
--**********************************
function x300018_OnMissionAccept( sceneId, selfId, targetId )
	--ret = CallScriptFunction( 211708, "CheckAccept", sceneId, selfId )
	--if ret > 0 then
	--	CallScriptFunction( 211708, "OnAccept", sceneId, selfId )
	--end
	--return
end

--**********************************
--�ܾ���NPC������
--**********************************
function x300018_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x300018_g_eventList do
		if missionScriptId == findId then
			UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

function x300018_IsSkillLikeScript( sceneId, selfId)
	return 0;
end
