--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x016010_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"������������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
