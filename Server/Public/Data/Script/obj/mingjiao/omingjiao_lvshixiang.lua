--����NPC
--��ʦ��
--��ͨ

x011006_g_scriptId = 009002

--**********************************
--�¼��������
--**********************************
function x011006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"������ʥ����ʹ��ʦ�壬��Ҫ�������̣����������ҡ�")
		AddNumText(sceneId, x011006_g_scriptId, "��������",-1,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x011006_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetLevel( sceneId, selfId)<10	then
		BeginEvent(sceneId)
			AddText(sceneId,"�����̽��ֻ��10������֮�ˡ�")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		x011006_g_MenPai = GetMenPai(sceneId, selfId)
		BeginEvent(sceneId)
			if x011006_g_MenPai == 1 then
				AddText(sceneId, "����ЦҲ�ǿ��õģ����ǵ������Է�������һǧ�Ź�Ҳ����ġ�")
			--����ֵΪ9��ʾ������
			elseif x011006_g_MenPai==9	then	
				AddText(sceneId,"�Ժ����Ǳ���һ���ˣ�����Ⱦƣ���ӷֽ�")
				LuaFnJoinMenpai(sceneId, selfId, targetId, 1)
				BeginEvent(sceneId)
	  				AddText(sceneId,"���Ѿ��������̣�");
	  			EndEvent(sceneId)
	  			DispatchMissionTips(sceneId,leaderObjId)
				if	LuaFnGetSex( sceneId, selfId)==0	then
					LuaFnAwardTitle( sceneId, selfId,  0, 16)
					LuaFnMsg2Player( sceneId, selfId,"���Ѿ��������̣�",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 161, 0)
					LuaFnMsg2Player( sceneId, selfId,"������������Ů�ĳƺţ�",MSG2PLAYER_PARA)
					LuaFnDispatchAllTitle(sceneId, selfId);
				else
					LuaFnAwardTitle( sceneId, selfId,  0, 11)
					LuaFnMsg2Player( sceneId, selfId,"���Ѿ��������̣�",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 161, 0)
					LuaFnMsg2Player( sceneId, selfId,"������������ʿ�ĳƺţ�",MSG2PLAYER_PARA)
					LuaFnDispatchAllTitle(sceneId, selfId);
				end
			else
				AddText(sceneId,"���˺ò���ʡ����������������֮�ˣ�����������������")
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)		
	end
end
