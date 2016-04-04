--��ңNPC
--ʯ��¶
--��ͨ

--�ű���
x014006_g_ScriptId = 014006

--��ӵ�е��¼�
estudy_liuyifenggu = 713537
elevelup_liuyifenggu = 713596
edialog_liuyifenggu = 713611
--��ӵ�е��¼�ID�б�
x014006_g_eventList={estudy_liuyifenggu,elevelup_liuyifenggu}	
--MessageNum = 1		--MessageNum�ǶԻ���ţ����ڵ��ò�ͬ�Ի�
--**********************************
--�¼��б�
--**********************************
function x014006_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"�ҵļ���ֻ�̱��ɵ��ӡ�")
	for i, eventId in x014006_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x014006_OnDefaultEvent( sceneId, selfId,targetId )
	x014006_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x014006_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x014006_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x014006_g_ScriptId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x014006_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x014006_g_eventList do
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
function x014006_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x014006_g_eventList do
		if missionScriptId == findId then
			x014006_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x014006_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x014006_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x014006_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x014006_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x014006_OnDie( sceneId, selfId, killerId )
end