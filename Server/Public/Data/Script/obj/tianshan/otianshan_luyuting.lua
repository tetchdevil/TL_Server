--��ɽNPC
--«��ͤ
--��ͨ

--**********************************
--�¼��������
--**********************************
function x017009_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"���������ɽ���ӣ��ҿ��Խ������ļ��ܡ���������������ڻ�û����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
