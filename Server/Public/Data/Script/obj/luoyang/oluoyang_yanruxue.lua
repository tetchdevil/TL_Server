--�ű���
x000088_g_scriptId = 000088

--��ӵ�е��¼�ID�б�
x000088_g_eventList={801010}

--**********************************
--�¼��������
--**********************************
--function x000088_OnDefaultEvent( sceneId, selfId,targetId )
--	for i, eventId in x000088_g_eventList do
--		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
--	end
--end

function x000088_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"���鲻��ô��Ϊʲô�����������أ�")
		
		AddNumText(sceneId,x000088_g_scriptId,"�޸ķ���",-1,1)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x000088_OnEventRequest( sceneId, selfId, targetId, eventId )

		CallScriptFunction( 801010, "OnEnumerate",sceneId, selfId, targetId )
end
