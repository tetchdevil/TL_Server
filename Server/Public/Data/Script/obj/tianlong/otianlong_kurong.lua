--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x013000_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"���ٴ�ʦ")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
