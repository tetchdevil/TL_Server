--����NPC
--������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x015000_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

