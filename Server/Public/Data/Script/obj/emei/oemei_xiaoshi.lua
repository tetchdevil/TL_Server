--����NPC
--Сʫ
--��ͨ

--**********************************
--�¼��������
--**********************************
function x015005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"Сʫ~~")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
