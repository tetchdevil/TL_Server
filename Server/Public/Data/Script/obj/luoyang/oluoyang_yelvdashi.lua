--����NPC
--��СȪ
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000031_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�ʵ۱���Ҫ�����������ɲ�������ġ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
