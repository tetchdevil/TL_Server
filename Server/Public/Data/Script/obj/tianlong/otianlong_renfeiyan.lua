--����NPC
--�η���
--��ͨ

--**********************************
--�¼��������
--**********************************
function x013013_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�η��࣬�Ҿ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
