--����NPC
--ҵ��
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000095_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"ҵ�գ�С����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
