--����NPC
--����
--һ��

--**********************************
--�¼��������
--**********************************
function x001022_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"����ү�����ݵ��������������Ʋ��֡�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
