--����NPC
--���̻�
--��ͨ

x015003_g_scriptId = 015003

--**********************************
--�¼��������
--**********************************
function x015003_OnDefaultEvent( sceneId, selfId,targetId )
	x015003_g_MenPai = GetMenPai(sceneId, selfId)
	if x015003_g_MenPai == 4 then
		BeginEvent(sceneId)
			AddText(sceneId,"����Ϊʦ�к��°���")
			AddNumText(sceneId, x015003_g_scriptId, "ѧϰ����",-1,0)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
			BeginEvent(sceneId)
			AddText(sceneId,"���Ǵ��̻�")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x015003_OnEventRequest( sceneId, selfId, targetId, eventId )
	DispatchXinfaLevelInfo( sceneId, selfId, targetId, 4 );
end
