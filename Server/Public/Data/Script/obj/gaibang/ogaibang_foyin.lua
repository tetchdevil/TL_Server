--ؤ��NPC
--��ӡ
--��ͨ

--**********************************
--�¼��������
--**********************************
function x010002_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"ǰЩ�������˼�����У������档����������ؤ���档")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
