--����NPC
--�ڿ���
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000042_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�����ǵ����⣬Զ����Щ�ǵ�������͡��治��Ӧ����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
