--����NPC
--�輿
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000045_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"������������һ��Ů��ʦʦ�ļҡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
