--����NPC
--�ֹ���
--��ͨ

--**********************************
--�¼��������
--**********************************
function x013008_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�ֹ��壬��Ա")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
