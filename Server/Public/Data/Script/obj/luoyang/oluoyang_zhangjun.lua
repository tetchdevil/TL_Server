--����NPC
--�ſ�
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000098_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�ſ��������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
