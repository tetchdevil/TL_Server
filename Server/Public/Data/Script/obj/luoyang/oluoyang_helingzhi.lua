--�ű���
x000087_g_scriptId = 000087

--��ӵ�е��¼�ID�б�
x000087_g_eventList={801011}

--**********************************
--�¼��������
--**********************************
--function x000087_OnDefaultEvent( sceneId, selfId,targetId )
--	for i, eventId in x000087_g_eventList do
--		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
--	end
--end

function x000087_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"ֻҪ����Ⱦ�����Ϳ��Ըı�ͷ������ɫ�ˡ�")
		
		AddNumText(sceneId,x000087_g_scriptId,"�޸ķ�ɫ",-1,2)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x000087_OnEventRequest( sceneId, selfId, targetId, eventId )

	CallScriptFunction( 801011, "OnEnumerate",sceneId, selfId, targetId )

end
