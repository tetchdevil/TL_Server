--����NPC
--��������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000033_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"��˵�úܶԣ�����ô�졣")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
