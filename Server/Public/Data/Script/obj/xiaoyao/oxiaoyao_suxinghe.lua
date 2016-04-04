--��ңNPC
--���Ǻ�
--��ͨ

x014000_g_scriptId = 014000

--**********************************
--�¼��������
--**********************************
function x014000_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�������Ǻ�~~")
	EndEvent(sceneId)
	AddNumText(sceneId, x014000_g_scriptId, "��������",-1,0)
	DispatchEventList(sceneId,selfId,targetId)
end


--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x014000_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetLevel( sceneId, selfId)<10	then
		BeginEvent(sceneId)
			AddText(sceneId,"ʩ�����ǵȵ�10��֮��������ʦѧ�հɣ�")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		x014000_g_MenPai = GetMenPai(sceneId, selfId)
		BeginEvent(sceneId)
			if x014000_g_MenPai == 8 then
				AddText(sceneId, "��������ǲΪʦ�ˣ�����������ң���ӣ�����ʲôʦ�ء�")
			--����ֵΪ9��ʾ������
			elseif x014000_g_MenPai==9	then	
				AddText(sceneId,"��ô�����ڿ�ʼ�����������ң�����µ����ˡ�")
				LuaFnJoinMenpai(sceneId, selfId, targetId, 8)
				BeginEvent(sceneId)
	  				AddText(sceneId,"���Ѿ�������ң�ɣ�");
	  			EndEvent(sceneId)
	  			DispatchMissionTips(sceneId,leaderObjId)
				if	LuaFnGetSex( sceneId, selfId)==0	then
					LuaFnAwardTitle( sceneId, selfId,  0, 56)
					LuaFnMsg2Player( sceneId, selfId,"���Ѿ�������ң�ɣ�",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 168, 0)
					LuaFnMsg2Player( sceneId, selfId,"��������ң��Ů�ĳƺţ�",MSG2PLAYER_PARA)
					LuaFnDispatchAllTitle(sceneId, selfId);
				else
					LuaFnAwardTitle( sceneId, selfId,  0, 51)
					LuaFnMsg2Player( sceneId, selfId,"���Ѿ�������ң�ɣ�",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 168, 0)
					LuaFnMsg2Player( sceneId, selfId,"��������ң��ʿ�ĳƺţ�",MSG2PLAYER_PARA)
					LuaFnDispatchAllTitle(sceneId, selfId);
				end
			else
				AddText(sceneId,"�����Ǳ�����ɵĸ�ͽ�ˣ����ǲ�����")
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)		
	end
end
