--�䵱NPC
--������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x012003_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
