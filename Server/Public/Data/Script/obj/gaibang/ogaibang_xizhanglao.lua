--ؤ��NPC
--�ɳ���
--��ͨ

--**********************************
--�¼��������
--**********************************
function x010007_OnDefaultEvent( sceneId, selfId,targetId )
	x010007_g_MenPai = GetMenPai(sceneId, selfId)
	if x010007_g_MenPai == 2 then
		BeginEvent(sceneId)
			AddText(sceneId,"����Ϊʦ�к��°���")
			AddNumText(sceneId, g_scriptId, "ѧϰ����",-1,0)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
			BeginEvent(sceneId)
			AddText(sceneId,"�������к��°���")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

function x010007_OnEventRequest( sceneId, selfId, targetId, eventId )
	DispatchXinfaLevelInfo( sceneId, selfId, targetId, 2 );
end
