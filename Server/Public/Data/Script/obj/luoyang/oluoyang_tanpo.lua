--����NPC
--̷��
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000024_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"������ͷ��һ������ҩ�ġ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
