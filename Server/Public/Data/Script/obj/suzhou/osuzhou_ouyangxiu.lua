--����NPC
--ŷ����
--һ��

--**********************************
--�¼��������
--**********************************
function x001001_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�Ҿ��ú����Ĵ�д�ø�Ϊ��ɫ��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
