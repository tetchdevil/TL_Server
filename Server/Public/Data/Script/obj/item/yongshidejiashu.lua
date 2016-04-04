--��ʿ�ļ���

--�ű���
x300000_g_scriptId = 300000


--��ӵ�е��¼�ID�б�
x300000_g_eventList={211208}

--**********************************
--�¼��������
--**********************************
function x300000_OnDefaultEvent( sceneId, selfId,targetId )
	x300000_OnEventRequest( sceneId, selfId, targetId, eventId )
end

--**********************************
--ˢ���¼�
--**********************************
function x300000_OnEventRequest( sceneId, selfId, targetId, eventId )
		CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
		return
end

--**********************************
--���ܴ�NPC������
--**********************************
function x300000_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x300000_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x300000_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x300000_g_eventList do
		if missionScriptId == findId then
			UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

function x300000_IsSkillLikeScript( sceneId, selfId)
	return 0;
end
