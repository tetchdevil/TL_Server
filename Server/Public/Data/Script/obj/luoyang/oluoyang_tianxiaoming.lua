--����NPC
--������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000104_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�������������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
