--����NPC		����npc		1ѧϰ���Ҽ���		2��ҽ����˵��
--�໯��
--�����npc

--�ű���
x001042_g_ScriptId = 001042

--��ӵ�е��¼�Id�б�
estudy_fengren = 713506
elevelup_fengren = 713565
edialog_fengren = 713602
--��ӵ�е��¼�ID�б�
x001042_g_eventList={estudy_fengren,elevelup_fengren}	--,edialog_fengren}	
MessageNum = 1		--MessageNum�ǶԻ���ţ����ڵ��ò�ͬ�Ի�

x001042_g_shoptableindex=68
--**********************************
--�¼��б�
--**********************************
function x001042_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"����ѧϰ���Ҽ���ô��")
	for i, eventId in x001042_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	AddNumText(sceneId,g_scriptId,"����ͼ��",-1,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x001042_OnDefaultEvent( sceneId, selfId,targetId )
	x001042_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001042_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		DispatchShopItem( sceneId, selfId,targetId, x001042_g_shoptableindex )
	end
	for i, findId in x001042_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001042_g_ScriptId )
		return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x001042_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001042_g_eventList do
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
function x001042_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x001042_g_eventList do
		if missionScriptId == findId then
			x001042_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x001042_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001042_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x001042_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001042_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x001042_OnDie( sceneId, selfId, killerId )
end
