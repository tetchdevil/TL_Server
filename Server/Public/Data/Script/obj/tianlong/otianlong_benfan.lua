--ľ���︱������npc

--�ű���
x013007_g_scriptId = 402010


--��ӵ�е��¼�ID�б�
x013007_g_eventList={401010}

--**********************************
--�¼��б�
--**********************************
function x013007_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"  "..PlayerName.." �������ɣ�����ֻ�ܽ����������Ǵ�����ù��ġ��Ժ������µġ�\n")
		for i, findId in x013007_g_eventList do
			CallScriptFunction( x013007_g_eventList[i], "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x013007_OnDefaultEvent( sceneId, selfId,targetId )
	x013007_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x013007_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x013007_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x013007_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x013007_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x013007_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x013007_g_eventList do
		if missionScriptId == findId then
			x013007_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x013007_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x013007_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x013007_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x013007_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x013007_OnDie( sceneId, selfId, killerId )
end

