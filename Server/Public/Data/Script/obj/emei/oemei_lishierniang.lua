--����NPC
--��ʮ����
--��ͨ

x015001_g_scriptId = 015001

--**********************************
--�¼��������
--**********************************
function x015001_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"��ʮ����")
		AddNumText(sceneId, x015001_g_scriptId, "��������",-1,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x015001_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetLevel( sceneId, selfId)<10	then
		BeginEvent(sceneId)
			AddText(sceneId,"ʩ�����ǵȵ�10��֮��������ʦѧ�հɣ�")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		x015001_g_MenPai = GetMenPai(sceneId, selfId)
		BeginEvent(sceneId)
			if x015001_g_MenPai == 4 then
				AddText(sceneId, "��������ǲΪʦ�ˣ��������Ҷ��ҵ��ӣ�����ʲôʦ�ء�")
			--����ֵΪ9��ʾ������
			elseif x015001_g_MenPai==9	then	
				AddText(sceneId,"��ô�����ڿ�ʼ��������Ҷ��ҵ����µ����ˡ�")
				LuaFnJoinMenpai(sceneId, selfId, targetId, 4)
				BeginEvent(sceneId)
	  				AddText(sceneId,"���Ѿ���������ɣ�");
	  			EndEvent(sceneId)
	  			DispatchMissionTips(sceneId,leaderObjId)
				if	LuaFnGetSex( sceneId, selfId)==0	then
					LuaFnAwardTitle( sceneId, selfId,  0, 66)
					LuaFnMsg2Player( sceneId, selfId,"���Ѿ���������ɣ�",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 164, 0)
					LuaFnMsg2Player( sceneId, selfId,"�����˶�����Ů�ĳƺţ�",MSG2PLAYER_PARA)
					LuaFnDispatchAllTitle(sceneId, selfId);
				else
					LuaFnAwardTitle( sceneId, selfId,  0, 61)
					LuaFnMsg2Player( sceneId, selfId,"���Ѿ���������ɣ�",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 164, 0)
					LuaFnMsg2Player( sceneId, selfId,"�����˶�����ʿ�ĳƺţ�",MSG2PLAYER_PARA)
					LuaFnDispatchAllTitle(sceneId, selfId);
				end
			else
				AddText(sceneId,"�����Ǳ�����ɵĸ�ͽ�ˣ����ǲ����㡣")
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)		
	end
end
