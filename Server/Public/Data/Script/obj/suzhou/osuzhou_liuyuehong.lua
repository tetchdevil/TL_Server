--����NPC
--���º�
--һ��

--**********************************
--�¼��������
--**********************************
function x001025_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�����ڿ�ʼ����ֻ������һ����Ҫ���ң�����ƭ�ң���Ӧ�ҵ�ÿһ�����鶼Ҫ������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
