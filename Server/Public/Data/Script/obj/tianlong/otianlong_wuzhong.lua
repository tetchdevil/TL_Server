--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x013009_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"���ң������Ա")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
