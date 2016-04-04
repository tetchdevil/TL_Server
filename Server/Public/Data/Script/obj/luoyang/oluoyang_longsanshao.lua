--����NPC ���ռ���NPC   �������ܣ�1���ռ��ܵ�ѧϰ 2���⹤�ռ���
--������
--��ͨ

--�ű���
x000106_g_ScriptId = 000106

--��ӵ�е��¼�Id�б�
estudy_gongyi = 713507
elevelup_gongyi = 713566
edialog_gongyi = 713606
--��ӵ�е��¼�ID�б�
x000106_g_eventList={estudy_gongyi,elevelup_gongyi}		--,edialog_gongyi}	
MessageNum = 1		--MessageNum�ǶԻ���ţ����ڵ��ò�ͬ�Ի�

x000106_g_shoptableindex=66
--**********************************
--�¼��б�
--**********************************
function x000106_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"����ѧϰ���ռ���ô��")
	for i, eventId in x000106_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	AddNumText(sceneId,g_scriptId,"����ͼ��",-1,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x000106_OnDefaultEvent( sceneId, selfId,targetId )
	x000106_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000106_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		DispatchShopItem( sceneId, selfId,targetId, x000106_g_shoptableindex )
	end
	for i, findId in x000106_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x000106_g_ScriptId )
		return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x000106_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000106_g_eventList do
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
function x000106_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x000106_g_eventList do
		if missionScriptId == findId then
			x000106_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x000106_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000106_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x000106_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000106_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x000106_OnDie( sceneId, selfId, killerId )
end
