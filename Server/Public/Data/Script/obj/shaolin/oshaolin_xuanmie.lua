--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x009011_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"����������ֵ��ӣ��ҿ��Խ������ϻ��ļ��ܡ���������������ڻ�û����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
