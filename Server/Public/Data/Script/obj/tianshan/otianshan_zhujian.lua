--��ɽNPC
--��
--��ͨ

--**********************************
--�¼��������
--**********************************
function x017003_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"������~~")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
