--����NPC
--����ʹ
--����ѭ������

--�ű���
x311007_g_scriptId = 311007

--��ӵ�е��¼�ID�б�
x311007_g_eventList={311010}	

--**********************************
--�¼��б�
--**********************************
function x311007_UpdateEventList( sceneId, selfId,targetId )

	for i, eventId in x311007_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end

end

--**********************************
--�¼��������
--**********************************
function x311007_OnDefaultEvent( sceneId, selfId,targetId )
	x311007_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x311007_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x311007_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end
