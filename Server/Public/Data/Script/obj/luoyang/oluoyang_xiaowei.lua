--����NPC
--Уξ
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000091_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"����������Уξ")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
