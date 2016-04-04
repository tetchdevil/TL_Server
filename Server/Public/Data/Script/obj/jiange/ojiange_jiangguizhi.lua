--���� ����֦

--�ű���
x007001_g_scriptId = 007001

--��ӵ�е��¼�ID�б�
x007001_g_eventList={210702, 210708,210709}	

--**********************************
--�¼��б�
--**********************************
function x007001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	
	local IsDone502 = IsMissionHaveDone(sceneId,selfId,502)	
	local IsDone508 = IsMissionHaveDone(sceneId,selfId,508)	
	local IsDone509 = IsMissionHaveDone(sceneId,selfId,509)		
		
	
	if(IsDone502 == 0) then	
		AddText(sceneId, "������ȥ����������ɣ�Ҳ�����ҵ�ʲô��ֵ���Ҳ˵������")
	elseif(IsDone508 == 0) then	
		AddText(sceneId, "����ȥ��������С�����ܼ������档")
	elseif(IsDone509 == 0) then	
		AddText(sceneId, "���������Ž����ػ����Ĺ㣬�����������������ǡ��ػ;��ڽ���ı�����")		
	end
	
	for i, eventId in x007001_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x007001_OnDefaultEvent( sceneId, selfId,targetId )
	x007001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x007001_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x007001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x007001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x007001_g_eventList do
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
function x007001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x007001_g_eventList do
		if missionScriptId == findId then
			x007001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x007001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x007001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x007001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x007001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x007001_OnDie( sceneId, selfId, killerId )
end
