--����NPC
--������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x002011_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"��˵�Ҽҹ���ȥ̫���ˣ�Ҳ��֪����٣���ү����������Ҫ�������ˡ�xxx����/��������������Ҽҹ��ӵ���Ϣ��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
