--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x002052_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�����ǳ��������Ǽҹ����ء�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
