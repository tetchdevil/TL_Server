--����NPC
--ҵ��
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000096_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"ҵ�ˣ�С����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
