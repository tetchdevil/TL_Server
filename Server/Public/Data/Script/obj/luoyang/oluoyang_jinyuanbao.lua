--����NPC
--��Ԫ��
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000075_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�ҵ�Ǯׯ�������Ƕ�һ�޶��ġ���������Ȼ��������õġ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
