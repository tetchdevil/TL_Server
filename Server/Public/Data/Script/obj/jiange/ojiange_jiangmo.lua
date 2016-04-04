--���� ��ĩ

--�ű���
x007004_g_scriptId = 007004

--��ӵ�е��¼�ID�б�
x007004_g_eventList={210700, 210701, 210706}	

--**********************************
--�¼��б�
--**********************************
function x007004_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	
	local IsDone500 = IsMissionHaveDone(sceneId,selfId,500)	
	local IsDone501 = IsMissionHaveDone(sceneId,selfId,501)	
	local IsDone506 = IsMissionHaveDone(sceneId,selfId,506)		
	
	if(IsDone500 == 0) then	
		AddText(sceneId, "����ȥɱ��10�������Գ") 
	elseif(IsDone501 == 0) then	
		AddText(sceneId, "����ȥɱ��10�������Գ")
	elseif(IsDone506 == 0) then	
		AddText(sceneId, "����ȥɱ��10������٪��")
	else
		AddText(sceneId, "��û����")
	end
	for i, eventId in x007004_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x007004_OnDefaultEvent( sceneId, selfId,targetId )
	x007004_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x007004_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x007004_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x007004_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x007004_g_eventList do
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
function x007004_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x007004_g_eventList do
		if missionScriptId == findId then
			x007004_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x007004_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x007004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x007004_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x007004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x007004_OnDie( sceneId, selfId, killerId )
end
