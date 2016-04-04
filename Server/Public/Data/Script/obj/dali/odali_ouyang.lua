--����NPC		��ֲnpc   1��ֲ����   2��ֲ����˵��
--ŷ������
--��ͨ

--�ű���
x002053_g_ScriptId = 002053

--��ӵ�е��¼�Id�б�
estudy_zhongzhi = 713511
elevelup_zhongzhi = 713570
edialog_zhongzhi = 713610
x002053_g_eventList={estudy_zhongzhi,elevelup_zhongzhi}		--,edialog_zhongzhi}
--MessageNum = 1		--MessageNum�ǶԻ���ţ����ڵ��ò�ͬ�Ի�
--**********************************
--�¼��б�
--**********************************
function x002053_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"��ѧϰ�������ֲ����������һ��û�����Ǵ�����õ���ֲʦ����ֻҪ��ȼ��ﵽ10�����ҾͿ��Խ�������ֲׯ�ڵı����ˡ�")
		for i, eventId in x002053_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x002053_OnDefaultEvent( sceneId, selfId,targetId )
	x002053_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002053_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002053_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x002053_g_ScriptId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x002053_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002053_g_eventList do
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
function x002053_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x002053_g_eventList do
		if missionScriptId == findId then
			x002053_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x002053_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002053_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x002053_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002053_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x002053_OnDie( sceneId, selfId, killerId )
end
