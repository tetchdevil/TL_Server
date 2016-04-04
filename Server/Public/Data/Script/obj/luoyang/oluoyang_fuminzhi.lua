--����NPC		����npc		1ѧϰ���Ҽ���		2��ҽ����˵��
--����֮
--�����npc

--�ű���
x000067_g_ScriptId = 000067

--��ӵ�е��¼�Id�б�
estudy_fengren = 713506
elevelup_fengren = 713565
edialog_fengren = 713602
--��ӵ�е��¼�ID�б�
x000067_g_eventList={estudy_fengren,elevelup_fengren}	--,edialog_fengren}	
MessageNum = 1		--MessageNum�ǶԻ���ţ����ڵ��ò�ͬ�Ի�

x000067_g_shoptableindex=65
--**********************************
--�¼��б�
--**********************************
function x000067_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"����ѧϰ���Ҽ���ô��")
	for i, eventId in x000067_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	AddNumText(sceneId,g_scriptId,"����ͼ��",-1,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x000067_OnDefaultEvent( sceneId, selfId,targetId )
	x000067_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000067_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		DispatchShopItem( sceneId, selfId,targetId, x000067_g_shoptableindex )
	end
	for i, findId in x000067_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x000067_g_ScriptId )
		return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x000067_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000067_g_eventList do
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
function x000067_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x000067_g_eventList do
		if missionScriptId == findId then
			x000067_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x000067_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000067_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x000067_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000067_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x000067_OnDie( sceneId, selfId, killerId )
end
