--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000034_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"���ԭ������֮�ˣ��������ۻ���˼䣬ʵ����ϧ����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
