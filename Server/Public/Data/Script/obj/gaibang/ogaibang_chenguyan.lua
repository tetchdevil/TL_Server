--�¹���

--�ű���
x010000_g_scriptId = 010000

--��ӵ�е��¼�ID�б�
x010000_g_eventList={200922,201021,201121}

--**********************************
--�¼��б�
--**********************************
function x010000_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"���ǳ¹��㣬��������ؤ����£�");
	for i, eventId in x010000_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	AddNumText(sceneId, x010000_g_scriptId, "��������",-1,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x010000_OnDefaultEvent( sceneId, selfId,targetId )
	x010000_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x010000_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		if	GetLevel( sceneId, selfId)<10	then
			BeginEvent(sceneId)
				AddText(sceneId,"�㻹�ǵȵ�10��֮��������ʦѧ�հɣ�")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else
			x010000_g_MenPai = GetMenPai(sceneId, selfId)
			BeginEvent(sceneId)
				if x010000_g_MenPai == 2 then
					AddText(sceneId, "��������ǲΪʦ�ˣ���������ؤ����ӣ�����ʲôʦ�ء�")
				--����ֵΪ9��ʾ������
				elseif x010000_g_MenPai==9	then	
					AddText(sceneId,"��ô�����ڿ�ʼ���������ؤ������µ����ˡ�")
					LuaFnJoinMenpai(sceneId, selfId, targetId, 2)
					BeginEvent(sceneId)
						AddText(sceneId,"���Ѿ�����ؤ�");
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,leaderObjId)
					if	LuaFnGetSex( sceneId, selfId)==0	then
						LuaFnAwardTitle( sceneId, selfId,  0, 26)
						LuaFnMsg2Player( sceneId, selfId,"���Ѿ�����ؤ�",MSG2PLAYER_PARA)
						LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 162, 0)
						LuaFnMsg2Player( sceneId, selfId,"������ؤ����Ů�ĳƺţ�",MSG2PLAYER_PARA)
						LuaFnDispatchAllTitle(sceneId, selfId);
					else
						LuaFnAwardTitle( sceneId, selfId,  0, 21)
						LuaFnMsg2Player( sceneId, selfId,"���Ѿ�����ؤ�",MSG2PLAYER_PARA)
						LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 162, 0)
						LuaFnMsg2Player( sceneId, selfId,"������ؤ����ʿ�ĳƺţ�",MSG2PLAYER_PARA)
						LuaFnDispatchAllTitle(sceneId, selfId);
					end
				else
					AddText(sceneId,"�����Ǳ�����ɵĸ�ͽ�ˣ�ؤ�ﲻ���㡣")
				end
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)		
		end
	end
	for i, findId in x010000_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x010000_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x010000_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x010000_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x010000_g_eventList do
		if missionScriptId == findId then
			x010000_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x010000_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x010000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x010000_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x010000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x010000_OnDie( sceneId, selfId, killerId )
end
