--����NPC
--�ϕN
--��ͨ

--�ű���
x000012_g_scriptId = 000012

--Ŀ��NPC
x000012_g_name	="�ϕN"

--��ӵ�е��¼�ID�б� {���, ���, ǿ�����, ��ͽ, ��ʦ, ��ʦ, ���ʦ��, ���, �Ͼ���ϵ, ��Լ}
x000012_g_RelationEventList={701602,806003,806005,806004,806008,806007,806006,806009} --,806001,806000,806002}

--������

--**********************************
--�¼��������
--**********************************
function x000012_OnDefaultEvent( sceneId, selfId, targetId )
	x000012_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�
--**********************************
function x000012_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId, "С������ɶҲ���ṩ�ˣ�����")
--		for i, eventId in x000012_g_RelationEventList do
--			CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
--		end
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000012_OnEventRequest( sceneId, selfId, targetId, eventId )
	--��ͽ
	if eventId == 806008 then
		CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
		return
	end

	--����ͽ����Ҫָ�������ڼ���
	if eventId == 806009 then
		CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId, GetNumText() )
		x000012_UpdateEventList( sceneId, selfId, targetId )
		return
	end

	for i, findId in x000012_g_RelationEventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			x000012_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x000012_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000012_g_RelationEventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x000012_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x000012_g_RelationEventList do
		if missionScriptId == findId then
			x000012_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end
