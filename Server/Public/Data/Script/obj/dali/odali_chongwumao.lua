--����NPC
--����è
--��ͨ

--**********************************
--�¼��������
--**********************************
function x002066_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"��~~~~~")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
