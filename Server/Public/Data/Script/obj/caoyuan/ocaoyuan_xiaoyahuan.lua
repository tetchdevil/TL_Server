--Ѿ��

--�ű���
x020005_g_scriptId = 020005

--**********************************
--�¼��б�
--**********************************
function x020005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �Ҷ������������ˣ�����һֱ���Һ��ס�#r  ���ƽ��˵���˺ܺã�����ôһ�㶼�������أ�������Ҳ˵�������ء�#r  �������ʲô����Ը��Һ��ˣ�����������ͷȥ�����졣")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
