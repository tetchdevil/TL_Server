--����NPC
--�̱���
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000092_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"���ǲ̱���")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
