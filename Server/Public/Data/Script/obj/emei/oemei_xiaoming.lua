--����NPC
--С��
--��ͨ

--**********************************
--�¼��������
--**********************************
function x015004_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"С��~~")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
