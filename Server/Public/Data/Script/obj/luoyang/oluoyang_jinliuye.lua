--����NPC
--����ү
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000100_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"����ү��Ԫ������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
