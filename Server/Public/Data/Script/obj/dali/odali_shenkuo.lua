--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x002001_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"������кܶ�ֲ��Ϳ�ؼ�Ϊ������Ҳ�����ҴӴ���ǧ���������������ǲ�����а���")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
