--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000036_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"��ү����ˡ�����ͨ����֮�������Ѿ��������ˡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
