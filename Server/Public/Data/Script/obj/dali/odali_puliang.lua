--����

--�ű���
x002023_g_scriptId = 002023

x002023_g_shoptableindex=1

--��ӵ�е��¼�ID�б�
x002023_g_eventList={210200,210201}

--**********************************
--�¼��б�
--**********************************
function x002023_UpdateEventList( sceneId, selfId,targetId )
	local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "����"
	else
		PlayerSex = "����"
	end
	BeginEvent(sceneId)
	AddText(sceneId,"  �����ƣ���������������������������߽���Ҫ���м����ֵı������У�"..PlayerName..PlayerSex.."����������һ���Լ�ϲ���İɡ�")
	AddNumText(sceneId,x002023_g_scriptId,"��������",-1,0)
	for i, eventId in x002023_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	
	
	ListMissionsNM( sceneId, selfId, targetId )
	
	
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x002023_OnDefaultEvent( sceneId, selfId,targetId )
	x002023_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002023_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText() == 0	then
		DispatchShopItem( sceneId, selfId,targetId, x002023_g_shoptableindex )
	end
	for i, findId in x002023_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
	
	
	RequestMissionNM( sceneId, selfId, targetId, eventId )
end

--**********************************
--���ܴ�NPC������
--**********************************
function x002023_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002023_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
	
	OnMissionAcceptNM( sceneId, selfId, targetId, missionScriptId )
end

--**********************************
--�ܾ���NPC������
--**********************************
function x002023_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x002023_g_eventList do
		if missionScriptId == findId then
			x002023_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x002023_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002023_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x002023_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002023_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
	
	
	SubmitMissionNM( sceneId, selfId, targetId, missionScriptId, selectRadioId )
end

--**********************************
--�����¼�
--**********************************
function x002023_OnDie( sceneId, selfId, killerId )
end
