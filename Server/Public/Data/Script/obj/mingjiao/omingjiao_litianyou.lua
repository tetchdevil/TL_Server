--����NPC
--������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x011011_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�����ӣ����������ռ���")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
