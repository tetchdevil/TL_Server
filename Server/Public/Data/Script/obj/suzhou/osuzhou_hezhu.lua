--����NPC
--����
--һ��

--**********************************
--�¼��������
--**********************************
function x001010_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"����ǰϦ�������ݳ��е��̲ݷ���������ʫ�˴󷢰���")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
