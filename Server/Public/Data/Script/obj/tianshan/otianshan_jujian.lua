--��ɽNPC
--�ս�
--��ͨ

--**********************************
--�¼��������
--**********************************
function x017004_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"���Ǿս�~~")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
