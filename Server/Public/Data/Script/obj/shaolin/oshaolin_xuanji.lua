--����NPC
--����
--��ͨ

x009003_g_scriptId = 009003

--**********************************
--�¼��������
--**********************************
function x009003_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�������ţ�ʩ����ƶɮ�к��°���")
		AddNumText(sceneId, x009003_g_scriptId, "��������",-1,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x009003_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetLevel( sceneId, selfId)<10	then
		BeginEvent(sceneId)
			AddText(sceneId,"ʩ�����ǵȵ�10��֮��������ʦѧ�հɣ�")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		x009003_g_MenPai = GetMenPai(sceneId, selfId)
		BeginEvent(sceneId)
			if x009003_g_MenPai == 0 then
				AddText(sceneId, "��������ǲΪʦ�ˣ������������ֵ��ӣ�����ʲôʦ�ء�")
			--����ֵΪ9��ʾ������
			elseif x009003_g_MenPai==9	then	
				AddText(sceneId,"��ô�����ڿ�ʼ������������ֵ����µ����ˡ�")
				LuaFnJoinMenpai(sceneId, selfId, targetId, 0)
				BeginEvent(sceneId)
	  				AddText(sceneId,"���Ѿ����������ɣ�");
	  			EndEvent(sceneId)
	  			DispatchMissionTips(sceneId,leaderObjId)
				if	LuaFnGetSex( sceneId, selfId)==0	then
					LuaFnAwardTitle( sceneId, selfId,  0, 6)
					LuaFnMsg2Player( sceneId, selfId,"���Ѿ����������ɣ�",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 160, 0)
					LuaFnMsg2Player( sceneId, selfId,"������������Ů�ĳƺţ�",MSG2PLAYER_PARA)
					LuaFnDispatchAllTitle(sceneId, selfId);
				else
					LuaFnAwardTitle( sceneId, selfId,  0, 1)
					LuaFnMsg2Player( sceneId, selfId,"���Ѿ����������ɣ�",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 160, 0)
					LuaFnMsg2Player( sceneId, selfId,"������������ʿ�ĳƺţ�",MSG2PLAYER_PARA)
					LuaFnDispatchAllTitle(sceneId, selfId);
				end
			else
				AddText(sceneId,"�����Ǳ�����ɵĸ�ͽ�ˣ�ˡ������������С���ݲ�����������")
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)		
	end
end
