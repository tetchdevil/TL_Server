--����NPC
--�κ��
--��ͨ

--**********************************
--�¼��������
--**********************************
function x013012_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�κ�籣�����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
