--����NPC		������npc		1ѧϰ����������		2��ҽ����˵��
--Ǿޱ
--��ͨ

--�ű���
x000113_g_ScriptId = 000113

--��ӵ�е��¼�Id�б�
estudy_yangshengfa = 713528
elevelup_yangshengfa = 713587
edialog_yangshengfa = 713602
--��ӵ�е��¼�ID�б�
x000113_g_eventList={estudy_yangshengfa,elevelup_yangshengfa}	--,edialog_yangshengfa}	
--MessageNum = 1		--MessageNum�ǶԻ���ţ����ڵ��ò�ͬ�Ի�
--**********************************
--�¼��б�
--**********************************
function x000113_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"����ѧϰ����������ô��")
	for i, eventId in x000113_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x000113_OnDefaultEvent( sceneId, selfId,targetId )
	x000113_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000113_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x000113_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x000113_g_ScriptId )
		return
	end
end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x000113_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000113_g_eventList do
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
function x000113_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x000113_g_eventList do
		if missionScriptId == findId then
			x000113_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x000113_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000113_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x000113_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000113_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x000113_OnDie( sceneId, selfId, killerId )
end
