--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000094_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"���ǻ��ɣ�������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
