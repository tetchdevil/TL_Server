--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x011013_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"���ң���������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
