--��������

--�ű���
x006007_g_scriptId = 006007


--**********************************
--�¼��������
--**********************************
function x006007_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"����ʲô������?")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end


