--����NPC
--����Ӱ
--һ��

--**********************************
--�¼��������
--**********************************
function x001029_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"���ھ���������������һ���������¹ʵļ�¼��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
