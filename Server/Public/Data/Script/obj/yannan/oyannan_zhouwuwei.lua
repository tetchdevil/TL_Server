--����η

--�ű���
x018005_g_scriptId = 018005


--��ӵ�е��¼�ID�б�
x018005_g_eventList={210900,210901,210906, 210409}

--**********************************
--�¼��б�
--**********************************
function x018005_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"�����ɱ�û�з�����Ĺ��ƣ����ǰ��ջ��Ƕ����Ʋ��֣���˵���ܵ��ˡ������������š�")
	for i, eventId in x018005_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x018005_OnDefaultEvent( sceneId, selfId,targetId )
	x018005_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x018005_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x018005_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x018005_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x018005_g_eventList do
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
function x018005_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x018005_g_eventList do
		if missionScriptId == findId then
			x018005_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x018005_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x018005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x018005_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x018005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x018005_OnDie( sceneId, selfId, killerId )
end