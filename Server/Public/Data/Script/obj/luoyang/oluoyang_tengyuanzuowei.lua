--����NPC
--��ԭ��Ϊ
--��ͨ

--�ű���
x000029_g_scriptId = 000029

--**********************************
--�¼��������
--**********************************
function x000029_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"������ԭ��Ϊ��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
