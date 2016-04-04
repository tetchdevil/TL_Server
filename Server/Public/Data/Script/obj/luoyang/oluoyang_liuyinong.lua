--����NPC		��ֲnpc   1��ֲ����   2��ֲ����˵��
--����ũ
--��ͨ

--�ű���
x000105_g_ScriptId = 000156

--��ӵ�е��¼�Id�б�
estudy_zhongzhi = 713511
elevelup_zhongzhi = 713570
edialog_zhongzhi = 713610
x000105_g_eventList={estudy_zhongzhi,elevelup_zhongzhi}		--,edialog_zhongzhi}
--MessageNum = 1		--MessageNum�ǶԻ���ţ����ڵ��ò�ͬ�Ի�
--**********************************
--�¼��б�
--**********************************
function x000105_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		if GetLevel(sceneId,selfId) < 10 then
			AddText(sceneId,"����㵽��10�����ҾͿ��Խ̸�����ֲׯ�ڵı����ˡ�")
		else
			AddText(sceneId,"������ô�ã�������ֲׯ�ڵĺ�ʱ������")
		end
	for i, eventId in x000105_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x000105_OnDefaultEvent( sceneId, selfId,targetId )
	x000105_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000105_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x000105_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x000105_g_ScriptId )
		return
	end
end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x000105_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000105_g_eventList do
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
function x000105_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x000105_g_eventList do
		if missionScriptId == findId then
			x000105_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x000105_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000105_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x000105_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000105_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x000105_OnDie( sceneId, selfId, killerId )
end