--����NPC
--������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000044_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"��Ů��������������һ�����ˣ�������������Խ��Խ�����ˡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
