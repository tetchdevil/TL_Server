--����NPC
--ѩ����
--һ��

--**********************************
--�¼��������
--**********************************
function x001036_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"��������ѩ����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
