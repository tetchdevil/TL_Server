--����NPC

--����

--��ͨ



--**********************************

--�¼��������

--**********************************

function x000015_OnDefaultEvent( sceneId, selfId,targetId )

	BeginEvent(sceneId)

		AddText(sceneId,"  ���˹�����֮����ʵ���ǽ�������ԭ֮�������ó���������⼸�����ϵ�ͭ��Ҳ��ʼ�����ˡ�#r #r  �����˺�̫����æ������ˮ����ʧ��������·�Ѿ�������������ֻ�ܱ�ɹ�����Ӫ��ʵ������ί��˽�˸��ߺ�·���ˣ��ɱ��ܸߡ�#r #r  �������뻹����ͨ��·��Ϊ����֮����")

	EndEvent(sceneId)

	DispatchEventList(sceneId,selfId,targetId)

end

