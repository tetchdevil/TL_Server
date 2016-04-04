--�ػ� ���ӻ�

--�ű���
--g_scriptId = 008004

--��ӵ�е��¼�ID�б�
x008004_g_eventList={210807,210808}--212603,212606}	

--**********************************
--�¼��б�
--**********************************
function x008004_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
--	local IsDone511 = IsMissionHaveDone(sceneId,selfId,511)	
	
--	AddText("�þò����ˣ�"..PlayerName.."�������������Ĺ��ĺ������ˣ���Ҳ��\n\n���������ǵ�����λ�����ǵĽ���--�������콫���������е�ָ\n\n��ָ����ߵĽ�������������һǷ�������𻰡��������ں��γ�\n\n��ս�˰������Ǻ�������ƽ���˻���������֮�󣬵���Ҫ����ָ���Լ��ĸ�ĸ\n\n֮���ˡ�����������������������Щ���ı�ȥִ���������ɡ�\n\n���������һֱ��һЩ������Ʊ�ٸ�Ĺ�����ȥɱ��10�����Ʊ�\n\nٸ���ú�ص�����������")

	for i, eventId in x008004_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x008004_OnDefaultEvent( sceneId, selfId,targetId )
	x008004_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x008004_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x008004_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x008004_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x008004_g_eventList do
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
function x008004_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x008004_g_eventList do
		if missionScriptId == findId then
			x008004_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x008004_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x008004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x008004_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x008004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x008004_OnDie( sceneId, selfId, killerId )
end
