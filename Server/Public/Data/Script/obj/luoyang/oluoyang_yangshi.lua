--����NPC
--��ʱ
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000040_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"����ʦ�����������ǾͲ��ߡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
