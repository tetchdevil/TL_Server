--����NPC
--Ŭ����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000081_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"������������ϼ�������һ����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
