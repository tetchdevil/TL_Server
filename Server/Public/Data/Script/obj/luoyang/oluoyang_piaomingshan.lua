--����NPC
--������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000046_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"���������ơ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
