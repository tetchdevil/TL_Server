--����NPC
--���
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000008_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�ҵܵܵĲ�ѧ����֮�ϣ�����̫���׳嶯�ˡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
