--����NPC
--��ӱ
--��ͨ

--**********************************
--�¼��������
--**********************************
function x002025_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�����ò�ȡ֮�е�����������Ǯׯ�����ڸ��ض��зֺŵģ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
