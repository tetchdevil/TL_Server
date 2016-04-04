--������

--�ű���
x002016_g_scriptId = 002016

--��ӵ�е��¼�ID�б�
x002016_g_eventList={201801,201901, 210225, 210226, 210227, 210228, 210229}		--,201802

--**********************************
--�¼��б�
--**********************************
function x002016_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"С�ֵܣ����ǿ����ĵػ��������Բ�Ȱ�㲻�ذ��Լ����ɡ��������������ˡ���Щ����ģ����#r#r ��Щ��������Щ���ˣ������ڿ������¥����������͡�����ҹҹ�ϸ裬�������ҿ�����������Ҫ¥���ˣ������ˡ�");
	for i, eventId in x002016_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x002016_OnDefaultEvent( sceneId, selfId,targetId )
	x002016_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002016_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002016_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x002016_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002016_g_eventList do
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
function x002016_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x002016_g_eventList do
		if missionScriptId == findId then
			x002016_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x002016_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002016_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x002016_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002016_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x002016_OnDie( sceneId, selfId, killerId )
end
