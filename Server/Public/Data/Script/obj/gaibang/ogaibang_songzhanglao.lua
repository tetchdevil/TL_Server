--ؤ��NPC
--�γ���
--��ͨ

--**********************************
--�¼��������
--**********************************
function x010005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"ؤ����Ҫ��չ׳�󣬻��治��ֻ������ؤ�����������һ�����ӣ�����ǰ�Ǹ����С�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
