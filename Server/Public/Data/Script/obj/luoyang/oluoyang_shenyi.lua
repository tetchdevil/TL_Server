--����NPC
--��ҽ
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000064_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"����Ҫ������")
		AddNumText(sceneId,g_scriptId,"����",-1,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000064_OnEventRequest( sceneId, selfId, targetId, eventId )
	RestoreHp( sceneId, selfId)
	BeginEvent(sceneId)
		AddText(sceneId,"�������ֵ�Ѿ��ָ�");
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end
