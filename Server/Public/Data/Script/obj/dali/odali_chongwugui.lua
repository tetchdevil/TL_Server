--����NPC
--�����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x002067_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
