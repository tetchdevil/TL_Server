--����NPC
--��������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x007003_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"��������~~")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
