--����NPC
--κ��
--һ��

--**********************************
--�¼��������
--**********************************
function x001035_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"÷��׮�ϴ�ܲż�����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
