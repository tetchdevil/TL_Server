--�䵱NPC
--��Զɽ
--��ͨ


x012010_g_scriptId = 012010

--**********************************
--�¼��������
--**********************************
function x012010_OnDefaultEvent( sceneId, selfId,targetId )
	x012010_g_MenPai = GetMenPai(sceneId, selfId)
	if x012010_g_MenPai == 3 then
		BeginEvent(sceneId)
			AddText(sceneId,"����Ϊʦ�к��°���")
			AddNumText(sceneId, x012010_g_scriptId, "ѧϰ����",-1,0)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
			BeginEvent(sceneId)
			AddText(sceneId,"��������ʲô�£�")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x012010_OnEventRequest( sceneId, selfId, targetId, eventId )
	DispatchXinfaLevelInfo( sceneId, selfId, targetId, 3 );
end
