--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000009_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�����ע�������Ϊ�ˣ����������ں���������ȥ�ģ��ɺ���ͳ��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
