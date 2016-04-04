--������

--�ű���
x311001_g_scriptId = 311001


--��ӵ�е��¼�ID�б�
x311001_g_eventList={311004}

--**********************************
--�¼��б�
--**********************************
function x311001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerSex=GetSex(sceneId,selfId)
		if PlayerSex == 0 then
			PlayerSex = "Ů��"
		else
			PlayerSex = "����"
		end
		AddText(sceneId,"  ��̨ɽ�Ѿ��ĵ�ϸ�����Ѿ���̽����� ԭ���Ǻ������Һ����Ľ�ݼҵ��൳�������ң� ��ͼ������\n\n  "..PlayerSex.."�� �������������̸������ ���׼�����ˣ�������ֱ������ǰ�����Ӻ�ɽС����ֱ���䳲Ѩ��\n")
		CallScriptFunction(311004, "OnEnumerate",sceneId, selfId, targetId )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x311001_OnDefaultEvent( sceneId, selfId,targetId )
	x311001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x311001_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x311001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x311001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x311001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x311001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x311001_g_eventList do
		if missionScriptId == findId then
			x311001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x311001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x311001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x311001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x311001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x311001_OnDie( sceneId, selfId, killerId )
end
