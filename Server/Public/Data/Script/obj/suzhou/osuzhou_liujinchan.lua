--����NPC
--�����
--һ��

--**********************************
--�¼��������
--**********************************
function x001038_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�и������ݿ��ԵĿ������ղ�ɢ���������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
