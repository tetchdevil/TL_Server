--����NPC
--����
--һ��

--**********************************
--�¼��������
--**********************************
function x001004_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"��Ҳ�����μӿ��Ե���")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
