--����NPC
--��������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x002054_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"��������в�ɽ�����ٶ���������������˽ܵ��飬�Ż������������������á�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
