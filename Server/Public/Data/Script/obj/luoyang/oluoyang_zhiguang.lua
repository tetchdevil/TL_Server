--����NPC
--�ǹ�
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000020_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"����ƽ����������̫�ֻ࣬�ж������£����ܽ��ѡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
