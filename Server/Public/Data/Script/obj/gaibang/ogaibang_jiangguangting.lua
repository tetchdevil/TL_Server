--ؤ��NPC
--����ͤ
--��ͨ

--**********************************
--�¼��������
--**********************************
function x010010_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�������ؤ����ӣ��ҿ��Խ������ǵļ��ܡ���������������ڻ�û����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
