--����NPC
--ʩȫ
--��ͨ

x016007_g_scriptId = 016007

--**********************************
--�¼��������
--**********************************
function x016007_OnDefaultEvent( sceneId, selfId,targetId )
	x016007_g_MenPai = GetMenPai(sceneId, selfId)
	if x016007_g_MenPai == 5 then
		BeginEvent(sceneId)
			AddText(sceneId,"����Ϊʦ�к��°���")
			AddNumText(sceneId, x016007_g_scriptId, "ѧϰ����",-1,0)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
			BeginEvent(sceneId)
			AddText(sceneId,"����ʩȫ")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x016007_OnEventRequest( sceneId, selfId, targetId, eventId )
	DispatchXinfaLevelInfo( sceneId, selfId, targetId, 5 );
end
