--����NPC
--������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x002068_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
