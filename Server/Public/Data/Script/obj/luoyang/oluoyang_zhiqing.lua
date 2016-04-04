--����NPC     ����ѭ������
--����
--��ͨ

--�ű���
x000068_g_scriptId = 000068

--��ӵ�е��¼�ID�б�
x000068_g_eventList={230000,230001,230002,230003,230004,230005,230006,230007,230008,230009,230010,230011,230012}	


--**********************************
--�¼��б�
--**********************************
function x000068_UpdateEventList( sceneId, selfId,targetId )
		BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"  "..PlayerName.."ʩ���� ������̫���ˡ�#r#r  �㿴������º�Ժ�����Ź���������ʵ��̫�ࡣ һ������֮����һ������֮�໹���ˣ� ��ҩƷ�����ѡ��þ�ʵ���ѷ��������鷳ʩ���෽��롣#r#r  �������������#r  �嵨����ȴ��ͬ#r  �������Ǽ�����#r  ����һ�����湦#r")
		--for i, eventId in x000068_g_eventList do
			CallScriptFunction( x000068_g_eventList[1], "OnEnumerate",sceneId, selfId, targetId )
		--end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x000068_OnDefaultEvent( sceneId, selfId,targetId )
	x000068_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000068_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x000068_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x000068_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000068_g_eventList do
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
function x000068_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x000068_g_eventList do
		if missionScriptId == findId then
			x000068_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x000068_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000068_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x000068_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000068_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x000068_OnDie( sceneId, selfId, killerId )
end
