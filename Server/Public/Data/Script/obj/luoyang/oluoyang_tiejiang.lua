--����NPC   ���¸� ѧϰ���켼�� �������켼��
--����
--��ͨ

--�ű���
x000035_g_ScriptId = 000035

--��ӵ�е��¼�Id�б�
estudy_zhuzao = 713505
elevelup_zhuzao = 713564
edialog_zhuzao = 713604
--��ӵ�е��¼�ID�б�
x000035_g_eventList={estudy_zhuzao,elevelup_zhuzao}	--,edialog_zhuzao}	
MessageNum = 1		--MessageNum�ǶԻ���ţ����ڵ��ò�ͬ�Ի�

x000035_g_shoptableindex=64
--**********************************
--�¼��б�
--**********************************
function x000035_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"����ѧϰ���켼��ô��")
	for i, eventId in x000035_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	AddNumText(sceneId,g_scriptId,"����ͼ��",-1,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x000035_OnDefaultEvent( sceneId, selfId,targetId )
	x000035_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000035_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		DispatchShopItem( sceneId, selfId,targetId, x000035_g_shoptableindex )
	end
	for i, findId in x000035_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x000035_g_ScriptId )
		return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x000035_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000035_g_eventList do
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
function x000035_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x000035_g_eventList do
		if missionScriptId == findId then
			x000035_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x000035_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000035_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x000035_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000035_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x000035_OnDie( sceneId, selfId, killerId )
end
