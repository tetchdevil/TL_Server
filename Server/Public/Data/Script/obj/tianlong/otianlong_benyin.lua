--����

--�ű���
x013001_g_scriptId = 013001

--**********************************
--�¼��������
--**********************************
function x013001_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"���ı���ʩ����ƶɮ�к��°���")
		AddNumText(sceneId, x013001_g_scriptId, "��������",-1,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x013001_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
			if	GetLevel( sceneId, selfId)<10	then
				BeginEvent(sceneId)
					AddText(sceneId,"ʩ�����ǵȵ�10��֮��������ʦѧ�հɣ�")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			else
				x013001_g_MenPai = GetMenPai(sceneId, selfId)
				BeginEvent(sceneId)
					if x013001_g_MenPai == 6 then
						AddText(sceneId, "��������ǲΪʦ�ˣ��������������µ��ӣ�����ʲôʦ�ء�")
					--����ֵΪ9��ʾ������
					elseif x013001_g_MenPai==9	then	
						AddText(sceneId,"��ô�����ڿ�ʼ��������������µ����µ����ˡ�")
						LuaFnJoinMenpai(sceneId, selfId, targetId, 6)
						BeginEvent(sceneId)
							AddText(sceneId,"���Ѿ����������£�");
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,leaderObjId)
						if	LuaFnGetSex( sceneId, selfId)==0	then
							LuaFnAwardTitle( sceneId, selfId,  0, 46)
							LuaFnMsg2Player( sceneId, selfId,"���Ѿ����������£�",MSG2PLAYER_PARA)
							LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 166, 0)
							LuaFnMsg2Player( sceneId, selfId,"������������Ů�ĳƺţ�",MSG2PLAYER_PARA)
							LuaFnDispatchAllTitle(sceneId, selfId);
						else
							LuaFnAwardTitle( sceneId, selfId,  0, 41)
							LuaFnMsg2Player( sceneId, selfId,"���Ѿ����������£�",MSG2PLAYER_PARA)
							LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 166, 0)
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
	for i, findId in g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end
