--����NPC
--����
--һ��

--**********************************
--�¼��������
--**********************************
function x001014_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"���ǳ���")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
