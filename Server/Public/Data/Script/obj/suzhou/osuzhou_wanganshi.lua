--����NPC
--����ʯ
--һ��

--**********************************
--�¼��������
--**********************************
function x001000_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"��䲻��η�����ڲ��㷨������֮�Բ�������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
