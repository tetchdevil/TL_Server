--����NPC
--������
--һ��

--**********************************
--�¼��������
--**********************************
function x001021_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"������ǮׯҲ���������ҵĲ�ҵ��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
