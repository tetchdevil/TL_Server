--����NPC
--�����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000028_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"���������ν����Ĺ���û�ж���˭˵���ˣ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
