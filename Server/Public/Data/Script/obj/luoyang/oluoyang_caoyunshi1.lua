--����NPC
--����ʹ
--����ѭ������

--�ű���
x311006_g_scriptId = 311006

--��ӵ�е��¼�ID�б�
x311006_g_eventList={311010}	

--**********************************
--�¼��б�
--**********************************
function x311006_UpdateEventList( sceneId, selfId,targetId )

	for i, eventId in x311006_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end

end

--**********************************
--�¼��������
--**********************************
function x311006_OnDefaultEvent( sceneId, selfId,targetId )
	x311006_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x311006_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x311006_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

