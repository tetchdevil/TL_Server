--����NPC
--֣����
--һ��

--**********************************
--�¼��������
--**********************************
function x001048_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"֣���٣�������̨����Ա")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
