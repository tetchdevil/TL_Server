--����NPC
--�˿�
--һ��

--**********************************
--�¼��������
--**********************************
function x001040_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�˿�������֪����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
