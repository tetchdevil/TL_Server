--��ңNPC
--�ع�
--��ͨ

--**********************************
--�¼��������
--**********************************
function x014008_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�عۣ����������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
