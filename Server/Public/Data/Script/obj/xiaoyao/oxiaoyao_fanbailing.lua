--��ңNPC
--������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x014002_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"������~~")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
