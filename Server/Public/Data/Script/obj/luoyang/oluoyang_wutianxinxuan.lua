--����NPC
--��������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000048_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�����кܶ�Ķ���ֵ������ѧϰ�������ǡ����ӱ�������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
