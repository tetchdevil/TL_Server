--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x016002_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"���Ǻ���~~")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
