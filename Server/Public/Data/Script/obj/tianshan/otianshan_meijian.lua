--��ɽNPC
--÷��
--��ͨ

--**********************************
--�¼��������
--**********************************
function x017001_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"����÷�������������ڣ�����������ɽ")
		AddNumText(sceneId, g_scriptId, "��������",-1,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x017001_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetLevel( sceneId, selfId)<10	then
		BeginEvent(sceneId)
			AddText(sceneId,"ʩ�����ǵȵ�10��֮��������ʦѧ�հɣ�")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		x017001_g_MenPai = GetMenPai(sceneId, selfId)
		BeginEvent(sceneId)
			if x017001_g_MenPai == 7 then
				AddText(sceneId, "��������ǲΪʦ�ˣ�����������ɽ���ӣ�����ʲôʦ�ء�")
			--����ֵΪ9��ʾ������
			elseif x017001_g_MenPai==9	then	
				AddText(sceneId,"��ô�����ڿ�ʼ�����������ɽ�����µ����ˡ�")
				LuaFnJoinMenpai(sceneId, selfId, targetId, 7)
				BeginEvent(sceneId)
	  				AddText(sceneId,"���Ѿ�������ɽ�ɣ�");
	  			EndEvent(sceneId)
	  			DispatchMissionTips(sceneId,leaderObjId)
				if	LuaFnGetSex( sceneId, selfId)==0	then
					LuaFnAwardTitle( sceneId, selfId,  0, 86)
					LuaFnMsg2Player( sceneId, selfId,"���Ѿ�������ɽ�ɣ�",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 167, 0)
					LuaFnMsg2Player( sceneId, selfId,"��������ɽ��Ů�ĳƺţ�",MSG2PLAYER_PARA)
					LuaFnDispatchAllTitle(sceneId, selfId);
				else
					LuaFnAwardTitle( sceneId, selfId,  0, 81)
					LuaFnMsg2Player( sceneId, selfId,"���Ѿ�������ɽ�ɣ�",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 167, 0)
					LuaFnMsg2Player( sceneId, selfId,"��������ɽ��ʿ�ĳƺţ�",MSG2PLAYER_PARA)
					LuaFnDispatchAllTitle(sceneId, selfId);
				end
			else
				AddText(sceneId,"�����Ǳ�����ɵĸ�ͽ�ˣ����ǲ������")
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)		
	end
end
