--����NPC
--��ͷ
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000072_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"���ھֺڰ������������������ѣ���˲��ܱ�֤����ʮ�겻��һ���ڡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
