--����NPC
--����
--��Ҫ

--**********************************
--�¼��������
--**********************************
function x000016_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"����ʲô�ط������Һ��䡭��������������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
