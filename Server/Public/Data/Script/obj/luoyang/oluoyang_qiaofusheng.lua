--����NPC
--�Ǹ�ʢ
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000109_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�ҿ��Խ̸����Լ�����İ취��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
