--����NPC
--����ʯ
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000019_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"����ÿ�βμ���ϴ�����������̫�Ӷ�����ѡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
