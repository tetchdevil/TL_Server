--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x009005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�Ҿ�������ʦ��Բ�ţ������μҲ��޸�ϵ��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
