--����NPC
--�Ǹ�ʢ
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000052_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�����̻᲻��֮��ͻῪʼȫ��Ӫҵ����ʱ�������������ѧϰһ����ҵ���ɡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
