--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000018_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"С���������ع��ڼң�����¿డ��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
