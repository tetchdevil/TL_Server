--��ңNPC
--�����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x014004_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"���������ң���ӣ��ҿ��Խ�����¹�ļ��ܡ���������������ڻ�û����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
