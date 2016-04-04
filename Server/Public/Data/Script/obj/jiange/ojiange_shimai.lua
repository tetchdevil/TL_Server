--���� ʱ��

--�ű���
x007006_g_scriptId = 007006

--��ӵ�е��¼�ID�б�
x007006_g_eventList={210702,210703,210704,210705,210707}	

--**********************************
--�¼��б�
--**********************************
function x007006_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	
	local IsDone503 = IsMissionHaveDone(sceneId,selfId,503)	
	local IsDone504 = IsMissionHaveDone(sceneId,selfId,504)	
	local IsDone505 = IsMissionHaveDone(sceneId,selfId,505)	
	local IsDone507 = IsMissionHaveDone(sceneId,selfId,507)	
		
	
	if(IsDone503 == 0) then	
		AddText(sceneId,  "��һ��Կ���ں�Գ�������У�ȥ����������Ŷ������˵����������")
	elseif(IsDone504 == 0) then	
		AddText(sceneId, PlayerName.."��ɫ�ı���Կ�ף��ڲ����������С�")
	elseif(IsDone505 == 0) then	
		AddText(sceneId, "�Ͳ����һ��Կ���ˣ�����һ���޴��Ĺ���٪����������")
	elseif(IsDone507 == 0) then	
		AddText(sceneId, "�Ͳ����һ��Կ���ˣ��������Ҿ����޵���������")	
	end
	
	for i, eventId in x007006_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x007006_OnDefaultEvent( sceneId, selfId,targetId )
	x007006_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x007006_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x007006_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x007006_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x007006_g_eventList do
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
function x007006_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x007006_g_eventList do
		if missionScriptId == findId then
			x007006_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x007006_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x007006_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x007006_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x007006_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x007006_OnDie( sceneId, selfId, killerId )
end
