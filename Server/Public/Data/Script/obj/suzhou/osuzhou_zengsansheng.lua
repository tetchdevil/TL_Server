--����NPC ���ռ���NPC   �������ܣ�1���ռ��ܵ�ѧϰ 2���⹤�ռ���
--����ʡ
--��ͨ

--�ű���
x001047_g_ScriptId = 001047

--��ӵ�е��¼�Id�б�
estudy_gongyi = 713507
elevelup_gongyi = 713566
edialog_gongyi = 713606
--��ӵ�е��¼�ID�б�
x001047_g_eventList={estudy_gongyi,elevelup_gongyi}		--,edialog_gongyi}	
MessageNum = 1		--MessageNum�ǶԻ���ţ����ڵ��ò�ͬ�Ի�

x001047_g_shoptableindex=69
--**********************************
--�¼��б�
--**********************************
function x001047_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"����ѧϰ���ռ���ô��")
	for i, eventId in x001047_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	AddNumText(sceneId,g_scriptId,"����ͼ��",-1,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x001047_OnDefaultEvent( sceneId, selfId,targetId )
	x001047_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001047_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		DispatchShopItem( sceneId, selfId,targetId, x001047_g_shoptableindex )
	end
	for i, findId in x001047_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001047_g_ScriptId )
		return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x001047_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001047_g_eventList do
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
function x001047_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x001047_g_eventList do
		if missionScriptId == findId then
			x001047_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x001047_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001047_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x001047_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001047_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x001047_OnDie( sceneId, selfId, killerId )
end
