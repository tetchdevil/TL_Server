--ʯ��NPC
--֣����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x026005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"����֣����~~")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
