--����NPC
--���к�
--��ͨ

--**********************************
--�¼��������
--**********************************
function x002017_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"��˵�����Ҫ�ٿ�ʲô���ִ�ᣬ��Ҳ���մ����֣���ѽѽ����������Ů�Ӱ���������ˮ�����������ϲ����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
