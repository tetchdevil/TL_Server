--�ű���
x008001_g_scriptId = 008001

--��ӵ�е��¼�ID�б�
x008001_g_eventList={210800,210805,210806,210809,210709}

--**********************************
--�¼��б�
--**********************************
function x008001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"��������Ҫ����ס�ˣ�"..PlayerName.."������������Źأ����ر���������ȥɱ��10ֻɳ���ǰɡ�");
	for i, eventId in x008001_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x008001_OnDefaultEvent( sceneId, selfId,targetId )
	x008001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x008001_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x008001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x008001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x008001_g_eventList do
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
function x008001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x008001_g_eventList do
		if missionScriptId == findId then
			x008001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x008001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x008001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x008001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x008001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x008001_OnDie( sceneId, selfId, killerId )
end
