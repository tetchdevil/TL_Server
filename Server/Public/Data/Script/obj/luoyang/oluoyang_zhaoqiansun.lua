--����NPC
--��Ǯ��
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000025_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"С��ǰ�ո��������ˣ�һ�����ҵĳ��ĸж��˷��档")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
