--����NPC
--���ٻ�
--��ͨ

--**********************************
--�¼��������
--**********************************
function x011002_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"����ڹ��������ܰ��������ˣ�����ȥ���ݽ�ͷ��䰡��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
