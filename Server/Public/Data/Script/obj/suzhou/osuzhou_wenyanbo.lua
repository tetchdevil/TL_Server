--����NPC
--���岩
--һ��

--**********************************
--�¼��������
--**********************************
function x001009_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"���ǵ�һ�������ݰɣ���ȥ��������԰�ֵ������ɡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
