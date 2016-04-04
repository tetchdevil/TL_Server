--̫�� ������

--�ű���
x004001_g_scriptId = 004001

--��ӵ�е��¼�ID�б�
x004001_g_eventList={210405, 210406, 210407, 210408, 210409}	

--**********************************
--�¼��б�
--**********************************
function x004001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	
	local IsDone475 = IsMissionHaveDone(sceneId,selfId,475)	
	local IsDone476 = IsMissionHaveDone(sceneId,selfId,476)	
	local IsDone477 = IsMissionHaveDone(sceneId,selfId,477)	
	local IsDone478 = IsMissionHaveDone(sceneId,selfId,478)	
	local IsDone479 = IsMissionHaveDone(sceneId,selfId,479)
		
	
	if(IsDone475 == 0) then	
		AddText(sceneId, "��������ȥɱ��һЩ���ϻ���Ϊ���ӵ�פ��ɨ���ϰ��ɡ�")
	elseif(IsDone476 == 0) then	
		AddText(sceneId, "ȥɱ��10�������ˣ�Ӯ�ñ�Ӧ���������ǵ�������")	
	elseif(IsDone477 == 0) then	
		AddText(sceneId, "ȥɱ��10��ˮ����Ӯ�ñ�Ӧ���������ǵ�������")	
	elseif(IsDone478 == 0) then	
		AddText(sceneId, " ���Ұ�������͸��ҵ���ͬѧ��������")
	elseif(IsDone479 == 0) then	
		AddText(sceneId, "ȥ���Ź�ǰ���ҵ�����η������")
	end
	
	for i, eventId in x004001_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x004001_OnDefaultEvent( sceneId, selfId,targetId )
	x004001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x004001_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x004001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x004001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x004001_g_eventList do
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
function x004001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x004001_g_eventList do
		if missionScriptId == findId then
			x004001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x004001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x004001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x004001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x004001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x004001_OnDie( sceneId, selfId, killerId )
end
