--����NPC
--ʢ����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x013011_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"ʢ�������Ҿ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
