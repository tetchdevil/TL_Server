--����NPC
--����ү
--Ԫ������

--**********************************
--�¼��������
--**********************************
function x002059_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"��Ԫ����������ǰ·���ţ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
