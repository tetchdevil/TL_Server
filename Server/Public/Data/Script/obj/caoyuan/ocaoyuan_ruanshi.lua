--��ʵ

--�ű���
x020002_g_scriptId = 020002

--��ӵ�е��¼�ID�б�
x020002_g_eventList={211100,211109}	

--**********************************
--�¼��б�
--**********************************
function x020002_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"  ����Ǵ���"..PlayerName.." ������ʹ��㱱���ֵ������������Ĵ����ˡ�#r   ��Ȼ���˲�ԭ�����ʹ���������Щ���˷����ɡ������Ҹ���������ദ���ˣ����Ѿ�ϰ�ߣ��������Լ��Ǵ��ε������ˡ�#r    ��ʵ...�Ҿ��������������û��̤������ε������ء�#r   ������������ǰɡ�#r")
	for i, eventId in x020002_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x020002_OnDefaultEvent( sceneId, selfId,targetId )
	x020002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x020002_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x020002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x020002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x020002_g_eventList do
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
function x020002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x020002_g_eventList do
		if missionScriptId == findId then
			x020002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x020002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x020002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x020002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x020002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x020002_OnDie( sceneId, selfId, killerId )
end