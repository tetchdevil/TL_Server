--����NPC
--����ˮ
--��ͨ

--**********************************
--�¼��������
--**********************************
function x015007_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"������Ƕ��ҵ��ӣ��ҿ��Խ������˵ļ��ܡ���������������ڻ�û����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
