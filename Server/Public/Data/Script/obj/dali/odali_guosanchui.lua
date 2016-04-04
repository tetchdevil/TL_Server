--����NPC  ����npc   ѧϰ���켼��   �������켼��
--������
--��ͨ

--�ű���
x002062_g_ScriptId = 002062

--��ӵ�е��¼�Id�б�
estudy_zhuzao = 713505
elevelup_zhuzao = 713564
edialog_zhuzao = 713604
--��ӵ�е��¼�ID�б�
x002062_g_eventList={estudy_zhuzao,elevelup_zhuzao}	--,edialog_zhuzao}	
--MessageNum = 1		--MessageNum�ǶԻ���ţ����ڵ��ò�ͬ�Ի�

x002062_g_shoptableindex=61
--**********************************
--�¼��б�
--**********************************
function x002062_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"����ĥһ����ʮ����һ����Ҫ��ѧϰ���������ļ��ܾ;����������￴���ɣ�")
	for i, eventId in x002062_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	AddNumText(sceneId,g_scriptId,"����ͼ��",-1,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x002062_OnDefaultEvent( sceneId, selfId,targetId )
	x002062_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002062_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		DispatchShopItem( sceneId, selfId,targetId, x002062_g_shoptableindex )
	end
	for i, findId in x002062_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x002062_g_ScriptId )
		return
	end
end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x002062_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002062_g_eventList do
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
function x002062_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x002062_g_eventList do
		if missionScriptId == findId then
			x002062_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x002062_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002062_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x002062_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002062_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x002062_OnDie( sceneId, selfId, killerId )
end
