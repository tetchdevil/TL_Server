--����NPC
--����
--��ͨ

x013003_g_scriptId = 013003

--**********************************
--�¼��������
--**********************************
function x013003_OnDefaultEvent( sceneId, selfId,targetId )
	x013003_g_MenPai = GetMenPai(sceneId, selfId)
	if x013003_g_MenPai == 6 then
		BeginEvent(sceneId)
			AddText(sceneId,"����Ϊʦ�к��°���")
			AddNumText(sceneId, x013003_g_scriptId, "ѧϰ����",-1,0)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
			BeginEvent(sceneId)
			AddText(sceneId,"���ı��ۣ�ʩ����ƶɮ�к��°���")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x013003_OnEventRequest( sceneId, selfId, targetId, eventId )
	DispatchXinfaLevelInfo( sceneId, selfId, targetId, 6 );
end
