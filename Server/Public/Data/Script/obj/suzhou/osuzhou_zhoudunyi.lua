--����NPC
--�ܶ���
--һ��

--**********************************
--�¼��������
--**********************************
function x001006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�����ˣ��ҿ����㣡")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
