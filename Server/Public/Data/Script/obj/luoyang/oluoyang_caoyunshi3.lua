--����NPC
--����ʹ
--����ѭ������

--�ű���
x311008_g_scriptId = 311008

--��ӵ�е��¼�ID�б�
x311008_g_eventList={311010}	

--**********************************
--�¼��б�
--**********************************
function x311008_UpdateEventList( sceneId, selfId,targetId )

	for i, eventId in x311008_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end

end

--**********************************
--�¼��������
--**********************************
function x311008_OnDefaultEvent( sceneId, selfId,targetId )
	x311008_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x311008_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x311008_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end
