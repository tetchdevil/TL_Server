--����NPC
--����
--��ͨ

x009002_g_scriptId = 009002

--**********************************
--�¼��������
--**********************************
function x009002_OnDefaultEvent( sceneId, selfId,targetId )
	x009002_g_MenPai = GetMenPai(sceneId, selfId)
	if x009002_g_MenPai == 0 then
		BeginEvent(sceneId)
			AddText(sceneId,"����Ϊʦ�к��°���")
			AddNumText(sceneId, x009002_g_scriptId, "ѧϰ����",-1,0)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
			BeginEvent(sceneId)
			AddText(sceneId,"�������ѣ�ʩ����ƶɮ�к��°���")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x009002_OnEventRequest( sceneId, selfId, targetId, eventId )
	DispatchXinfaLevelInfo( sceneId, selfId, targetId, 0 );
end
