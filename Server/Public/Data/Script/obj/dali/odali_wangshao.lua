--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x002000_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"����һ��������ƽ�Ҳ�����ǹ������ƣ�ֻҪ���δ�����������������Ҳ���İ��ˡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
