--����NPC
--����ï
--һ��

--**********************************
--�¼��������
--**********************************
function x001041_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"����ï�����ݹ�Ա")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
