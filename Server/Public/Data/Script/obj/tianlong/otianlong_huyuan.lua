--����NPC
--��Ժ
--��ͨ

--**********************************
--�¼��������
--**********************************
function x013019_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"��Ժ")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
