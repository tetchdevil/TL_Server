--��üɮ

--�ű���
x002007_g_scriptId = 002007

--��ӵ�е��¼�ID�б�
x002007_g_eventList={201103,201201,201202,201601,201602,210222,210230, 210231, 210232}

--**********************************
--�¼��б�
--**********************************
function x002007_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"�ຣ�ޱߣ���ͷ�ǰ��������ӷ�#r#r  �Դ�֪�����黨����ľ�����ÿ�����Ľ�����ʿ���ﲻ����������Щ���õ����鷢�����Ժ�Ҫʩ������æ���ǡ�");
	for i, eventId in x002007_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x002007_OnDefaultEvent( sceneId, selfId,targetId )
	x002007_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002007_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002007_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x002007_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002007_g_eventList do
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
function x002007_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x002007_g_eventList do
		if missionScriptId == findId then
			x002007_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x002007_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002007_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x002007_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002007_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x002007_OnDie( sceneId, selfId, killerId )
end
