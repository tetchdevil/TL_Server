--����NPC
--�ղ�ɢ
--һ��

--**********************************
--�¼��������
--**********************************
function x001033_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�ղ�ɢ������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
