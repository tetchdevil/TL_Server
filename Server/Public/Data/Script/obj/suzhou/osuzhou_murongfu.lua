--����NPC
--Ľ�ݸ�
--����

--**********************************
--�¼��������
--**********************************
function x001015_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"��λ������������ڸ�������һλ��ެ���")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
