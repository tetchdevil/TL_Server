--��ɽNPC
--����
--��ͨ

x017002_g_scriptId = 009002

--**********************************
--�¼��������
--**********************************
function x017002_OnDefaultEvent( sceneId, selfId,targetId )
	x017002_g_MenPai = GetMenPai(sceneId, selfId)
	if x017002_g_MenPai == 7 then
		BeginEvent(sceneId)
			AddText(sceneId,"���Ҵ�ʦ���к��°���")
			AddNumText(sceneId, x017002_g_scriptId, "ѧϰ����",-1,0)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
			BeginEvent(sceneId)
			AddText(sceneId,"��������")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x017002_OnEventRequest( sceneId, selfId, targetId, eventId )
	DispatchXinfaLevelInfo( sceneId, selfId, targetId, 7 );
end
