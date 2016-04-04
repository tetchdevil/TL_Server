--����NPC
--�۷�
--��ͨ

x009013_g_scriptId = 009013
--��ӵ�е��¼�ID�б�
x009013_g_eventList={220000,220001,220002,220003,220004,220005,220006,220007,220008,220009,220010,220011,220012,220013,220014,220015,220016,220017,220018,220019,220020,220021,220022,220023,220024,220025,220026,220027}
--**********************************
--�¼��������
--**********************************
function x009013_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"���ǻ۷����ҷ�����")
		CallScriptFunction( x009013_g_eventList[1], "OnEnumerate",sceneId, selfId, targetId )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x009013_OnDefaultEvent( sceneId, selfId,targetId )
	x009013_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x009013_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x009013_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x009013_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x009013_g_eventList do
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
function x009013_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x009013_g_eventList do
		if missionScriptId == findId then
			x009013_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x009013_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x009013_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x009013_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x009013_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x009013_OnDie( sceneId, selfId, killerId )
end
