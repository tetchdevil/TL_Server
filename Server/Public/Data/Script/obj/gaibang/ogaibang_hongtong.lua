--ؤ��NPC
--��ͨ
--��ͨ

--**********************************
--�¼��������
--**********************************
function x010012_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"��ͨ�����񷢲���")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
