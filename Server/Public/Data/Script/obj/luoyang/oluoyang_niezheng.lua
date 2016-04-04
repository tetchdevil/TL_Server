--����NPC
--����
--��ͨ

--�ű���
x000111_g_scriptId = 000111

--Ŀ��NPC
x000111_g_name	="����"

--��ӵ�е��¼�ID�б� {��ͽ, ��ʦ, ��ʦ, ���ʦ��}
x000111_g_RelationEventList={806008,806007,806006,806009}

--**********************************
--�¼��������
--**********************************
function x000111_OnDefaultEvent( sceneId, selfId, targetId )
	x000111_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�
--**********************************
function x000111_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId, "�ҿ��԰������ְ�ʦ������ͽ����ʽ����ͽҪС�İ�����ʦ������ͨ���Ǵ�����һ���ɹ������ӡ�")
		for i, eventId in x000111_g_RelationEventList do
			CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000111_OnEventRequest( sceneId, selfId, targetId, eventId )
	--��ͽ
	if eventId == 806008 then
		CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
		return
	end

	for i, findId in x000111_g_RelationEventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			x000111_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x000111_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000111_g_RelationEventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x000111_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x000111_g_RelationEventList do
		if missionScriptId == findId then
			x000111_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end
