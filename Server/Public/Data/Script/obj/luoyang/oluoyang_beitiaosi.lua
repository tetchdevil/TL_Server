--����NPC

--����˾

--��ͨ

x000047_g_ScriptId=000047

--**********************************
--�¼��������
--**********************************
function x000047_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"��������ԭ���̴󽫱���˾��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
