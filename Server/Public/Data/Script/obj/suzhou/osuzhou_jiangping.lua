--����NPC		����npc		1�������㼼��		2���㼼��˵��
--��ƽ
--��ͨ
--��ʹ���¼���� 0-ѧϰ���� 2-ȷ��ѧϰ	3-����ѧϰ	
--�ű���
x001032_g_ScriptId = 001032

--�̵���
x001032_g_shoptableindex=73

--��ӵ�е��¼�Id�б�
estudy_diaoyu = 713510
elevelup_diaoyu = 713569
edialog_diaoyu = 713609
--��ӵ�е��¼�ID�б�
x001032_g_eventList={estudy_diaoyu,elevelup_diaoyu}	--,edialog_diaoyu}	
--MessageNum = 1		--MessageNum�ǶԻ���ţ����ڵ��ò�ͬ�Ի�
--**********************************
--�¼��б�
--**********************************
function x001032_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"����ѧϰ���㼼��ô��")
	for i, eventId in x001032_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	--�̵�ѡ��
	AddNumText(sceneId,g_scriptId,"���򹤾�",-1,ABILITY_TEACHER_SHOP)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x001032_OnDefaultEvent( sceneId, selfId,targetId )
	x001032_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001032_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText() == ABILITY_TEACHER_SHOP	then
		DispatchShopItem( sceneId, selfId,targetId, x001032_g_shoptableindex )
	end
	for i, findId in x001032_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001032_g_ScriptId )
		return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x001032_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001032_g_eventList do
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
function x001032_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x001032_g_eventList do
		if missionScriptId == findId then
			x001032_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x001032_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001032_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end

	end
end

--**********************************
--�ύ�����������
--**********************************
function x001032_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001032_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x001032_OnDie( sceneId, selfId, killerId )
end
