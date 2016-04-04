--��������ʹ

--�ű���
x311000_g_scriptId = 311000


--��ӵ�е��¼�ID�б�
x311000_g_eventList={311004,311005}

--**********************************
--�¼��б�
--**********************************
function x311000_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		local  PlayerSex=GetSex(sceneId,selfId)
		if PlayerSex == 0 then
			PlayerSex = "Ů��"
		else
			PlayerSex = "����"
		end
		AddText(sceneId,"  "..PlayerName.." �� ������̫��ʱ���ˡ� ��ɽ����̨�����ҵȴ���������ϣ��"..PlayerSex.."��Э��ƽ�ѡ�\n\n  ��Ҳ֪������Ժ�ѰѾ������ȫ�������ڱ����߾���ֻʣ��������������֮�ء�\n\n  ��˵�Ѿ����ں�֮�ڣ�������Ҳ�����ָ��ֺ�������ʿ������������ѶԸ��ģ���ֻ�п���"..PlayerSex.."����������\n")
		if	(IsHaveMission(sceneId,selfId,4001) > 0)  then
			CallScriptFunction( (311004), "OnEnumerate",sceneId, selfId, targetId )
		elseif	(IsHaveMission(sceneId,selfId,4002) > 0)  then
			CallScriptFunction( (311005), "OnEnumerate",sceneId, selfId, targetId )
		else
			local	r=random(0,1)
			CallScriptFunction( (311004+r), "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x311000_OnDefaultEvent( sceneId, selfId,targetId )
	--if ( IsHaveMission(sceneId,selfId,4001) > 0) then
	--	DelMission(sceneId,selfId,4001)	
	--elseif ( IsHaveMission(sceneId,selfId,4002) > 0) then
	--	DelMission(sceneId,selfId,4002)
	--end
	x311000_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x311000_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x311000_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x311000_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x311000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x311000_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x311000_g_eventList do
		if missionScriptId == findId then
			x311000_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x311000_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x311000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x311000_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x311000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x311000_OnDie( sceneId, selfId, killerId )
end
