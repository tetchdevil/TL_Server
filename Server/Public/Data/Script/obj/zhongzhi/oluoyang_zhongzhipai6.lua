--����
--��ֲ��6

--�ű���
x714026_g_ScriptId = 714026

event_xuanzezhiwu = 713550

--ֲ���Ʒ����б�
x714026_g_eventList={20104001,20104003,20104004,20104006,20104010,20104011,
			20105001,20105002,20105005,20105008,20105011} --ֲ��ı��,����eventId
--**********************************
--�¼��������
--**********************************
function x714026_OnDefaultEvent( sceneId, selfId,targetId )
	--PLANTFLAG[1] =0
	--PLANTFLAG[2] =0
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI)
	--�����Ҳ�����ֲ����
	if AbilityLevel == 0	then
		BeginEvent(sceneId)
			AddText(sceneId, "����ȥѧϰ��ֲ���ܰ�")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end
	--�����һ���ֲ����
	if AbilityLevel ~= 0	then
		BeginEvent(sceneId)
			AddText(sceneId, "��ѡ����Ҫ�ֵ�ֲ��")
			--ͨ��x714026_g_eventList��scriptglobal�е�ֲ���б��Աȣ������������ֲ���ܵȼ�����ʾ��Ӧֲ��
			for i, eventId in x714026_g_eventList do	--������������˿�����ֲ��ֲ���б�
				for j,g_ZhiWuId in V_ZHONGZHI_ID do		--����scriptglobal�е�����ֲ���б�
					if eventId == g_ZhiWuId then
						if AbilityLevel >= V_ZHONGZHI_NEEDLEVEL[j] then --��������ֲ���ܵȼ�>=��ֲ��Ҫ���ܵȼ�]
							AddNumText(sceneId, x714026_g_eventList[i], V_ZHONGZHI_NAME[j])
							break
						end
					end
				end
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x714026_OnEventRequest( sceneId, selfId, targetId, eventId )
	zhiwuId = eventId
	for i, findId in x714026_g_eventList do
		if zhiwuId == findId then
			CallScriptFunction( 713550, "OnDefaultEvent",sceneId, selfId, targetId, zhiwuId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC��������ʱ��������ӿڣ�
--**********************************
function x714026_OnMissionSubmit( sceneId, selfId, targetId, scriptId )
	for i, findId in x714026_g_eventList do
		if scriptId == findId then
			ret = CallScriptFunction( scriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( scriptId, "OnAccept", sceneId, selfId, ABILITY_ZHONGZHI )
				CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, ABILITY_ZHONGZHI )
			end
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x714026_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x714026_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, ABILITY_ZHONGZHI )	
			end
			return
		end
	end
end
