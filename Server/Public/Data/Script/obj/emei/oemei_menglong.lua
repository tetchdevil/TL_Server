--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x015009_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�������������ڶ��ҷ�������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
