--����NPC
--˾���
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000007_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"����ʯ���Ҽᶨ����˼���ܣ������Һ�����ġ��������ι��ķ������԰���")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
