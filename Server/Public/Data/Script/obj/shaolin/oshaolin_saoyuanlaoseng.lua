--����NPC
--ɨԺ��ɮ
--��ͨ

--**********************************
--�¼��������
--**********************************
function x009008_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"ɨԺ��ɮ")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
