--����NPC
--������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x016000_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"���Ƕ�����~~")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
