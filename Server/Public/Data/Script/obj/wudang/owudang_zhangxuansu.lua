--�䵱NPC
--������
--��ͨ

x012006_g_scriptId = 012006

--**********************************
--�¼��������
--**********************************
function x012006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"����������")
		AddNumText(sceneId, x012006_g_scriptId, "��������",-1,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x012006_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetLevel( sceneId, selfId)<10	then
		BeginEvent(sceneId)
			AddText(sceneId,"�㻹�ǵȵ�10��֮��������ʦѧ�հɣ�")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		x012006_g_MenPai = GetMenPai(sceneId, selfId)
		BeginEvent(sceneId)
			if x012006_g_MenPai == 3 then
				AddText(sceneId, "��������ǲΪʦ�ˣ����������䵱���ӣ�����ʲôʦ�ء�")
			--����ֵΪ9��ʾ������
			elseif x012006_g_MenPai==9	then	
				AddText(sceneId,"��ô�����ڿ�ʼ����������䵱�����µ����ˡ�")
				LuaFnJoinMenpai(sceneId, selfId, targetId, 3)
				BeginEvent(sceneId)
	  				AddText(sceneId,"���Ѿ������䵱�ɣ�");
	  			EndEvent(sceneId)
	  			DispatchMissionTips(sceneId,leaderObjId)
				if	LuaFnGetSex( sceneId, selfId)==0	then
					LuaFnAwardTitle( sceneId, selfId,  0, 36)
					LuaFnMsg2Player( sceneId, selfId,"���Ѿ������䵱�ɣ�",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 163, 0)
					LuaFnMsg2Player( sceneId, selfId,"�������䵱��Ů�ĳƺţ�",MSG2PLAYER_PARA)
					LuaFnDispatchAllTitle(sceneId, selfId);
				else
					LuaFnAwardTitle( sceneId, selfId,  0, 31)
					LuaFnMsg2Player( sceneId, selfId,"���Ѿ������䵱�ɣ�",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 163, 0)
					LuaFnMsg2Player( sceneId, selfId,"�������䵱��ʿ�ĳƺţ�",MSG2PLAYER_PARA)
					LuaFnDispatchAllTitle(sceneId, selfId);
				end
			else
				AddText(sceneId,"�����Ǳ�����ɵĸ�ͽ�ˣ����ǲ����㡣")
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)		
	end
end
