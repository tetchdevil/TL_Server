--����NPC
--��ʦ
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000073_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"��ʲô����Ҫ���ھְ�æ���͵��𣿱���һ�ٸ����ġ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
