--����NPC
--̷��
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000023_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"��Щҩ�Ķ��ܲ��������ҩ�����������ˡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
