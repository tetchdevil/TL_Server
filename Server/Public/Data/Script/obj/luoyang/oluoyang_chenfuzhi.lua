--����NPC
--�·�֮
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000112_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"��ͱ��˽�����ҿ��Ը�����д�����ס�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
