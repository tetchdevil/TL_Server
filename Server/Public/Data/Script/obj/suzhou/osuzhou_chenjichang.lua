--����NPC
--�¼���
--һ��

--**********************************
--�¼��������
--**********************************
function x001024_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�����Ұ��㣡")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
