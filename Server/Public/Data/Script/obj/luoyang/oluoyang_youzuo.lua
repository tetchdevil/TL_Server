--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000039_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"����ʦ�������ǣ����Ǿ�������ȵ���ѩΪֹ��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
