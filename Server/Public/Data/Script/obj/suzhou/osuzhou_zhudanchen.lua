--����NPC
--�쵤��
--һ��

--**********************************
--�¼��������
--**********************************
function x001020_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"°�����ӵķ�ɮ���ƺ��������Ľ�ݼ���Ī����ϵ��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
