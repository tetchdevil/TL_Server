--����NPC
--����
--һ��

--**********************************
--�¼��������
--**********************************
function x001003_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"����Ŀ������ʺܸߣ����������ĸ���������Ŀ�����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
