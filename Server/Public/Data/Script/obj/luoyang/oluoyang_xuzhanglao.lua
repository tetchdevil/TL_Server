--����NPC
--�쳤��
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000021_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"ؤ�������ִ�᲻�ü����ٿ�����ʱ����Ҫ��������һ���ش�����顣")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
