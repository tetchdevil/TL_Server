--�䵱NPC
--�ž���
--��ͨ

--**********************************
--�¼��������
--**********************************
function x012007_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"��������䵱���ӣ��ҿ��Խ�����׵ļ��ܡ���������������ڻ�û����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
