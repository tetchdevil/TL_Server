--����NPC
--������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x016005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"���ǳ�����~~")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
