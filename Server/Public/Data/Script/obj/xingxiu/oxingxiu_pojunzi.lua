--����NPC
--�ƾ���
--��ͨ

--**********************************
--�¼��������
--**********************************
function x016008_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"����������޵��ӣ��ҿ��Խ�������ţ�ļ��ܡ���������������ڻ�û����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
