--����NPC
--����
--һ��

--**********************************
--�¼��������
--**********************************
function x001002_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"��˵���������������ϣ����ٷ��ں�������Ͳ����ˡ���˵��������������ָ�ϣ�Ϊʲô�����������ָ�أ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
