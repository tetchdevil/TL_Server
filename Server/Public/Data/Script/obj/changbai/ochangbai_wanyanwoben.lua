--�����ӱ�

--�ű���
x022006_g_scriptId = 022006

--��ӵ�е��¼�ID�б�
x022006_g_eventList={}	

--**********************************
--�¼��б�
--**********************************
function x022006_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"�������˶����ҵķ�²,��Ҫ���ҵ�")
	for i, eventId in x022006_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x022006_OnDefaultEvent( sceneId, selfId,targetId )
	if IsHaveMission(sceneId,selfId,MISSION_561) > 0 then			--�ж�����Ƿ�ӵ��561������
		misIndex = GetMissionIndexByID(sceneId,selfId,MISSION_561)
		num = GetMissionParam(sceneId,selfId,misIndex,3)
		if num ~= 1 then
			SetMissionByIndex(sceneId,selfId,misIndex,3,1)			--����������ĵ���λ����Ϊ1
			BeginEvent(sceneId)
				strText = "�ҵ������ӱ�"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			--�������2����Ҳ�ҵ��ˣ���������־�趨Ϊ���
			if GetMissionParam(sceneId,selfId,misIndex,1) == 1 and GetMissionParam(sceneId,selfId,misIndex,2) == 1 then
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			end
		end
	end
	x022006_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x022006_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x022006_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x022006_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x022006_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x022006_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x022006_g_eventList do
		if missionScriptId == findId then
			x022006_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x022006_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x022006_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x022006_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x022006_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x022006_OnDie( sceneId, selfId, killerId )
end
