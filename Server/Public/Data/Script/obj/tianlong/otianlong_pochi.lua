--����NPC
--�Ƴ�
--��ͨ

--**********************************
--�¼��������
--**********************************
function x013006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�Ƴգ��黨�����ҵ���")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
