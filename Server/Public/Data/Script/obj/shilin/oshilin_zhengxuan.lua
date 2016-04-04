--ʯ�� ֣��

--�ű���
x026000_g_scriptId = 026000

--��ӵ�е��¼�ID�б�
x026000_g_eventList={211700,211702,211703,211704,211707,211708,211709}	

--**********************************
--�¼��б�
--**********************************
function x026000_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	
	local IsDone600 = IsMissionHaveDone(sceneId,selfId,600)
	local IsDone602 = IsMissionHaveDone(sceneId,selfId,602)
	local IsDone603 = IsMissionHaveDone(sceneId,selfId,603)
	local IsDone604 = IsMissionHaveDone(sceneId,selfId,604)	
	local IsDone607 = IsMissionHaveDone(sceneId,selfId,607)
	local IsDone609 = IsMissionHaveDone(sceneId,selfId,609)
	
	--print("IsDone600:", IsDone600) 
	
	--if((IsHaveMission(sceneId,selfId,600) > 0 or IsHaveMission(sceneId,selfId,607) 
	--	or IsHaveMission(sceneId,selfId,603) > 0 or IsHaveMission(sceneId,selfId,604) > 0
	--	)
	--	or (IsDone600 ~= 0 or IsDone603 ~= 0 or IsDone604 ~= 0 or IsDone607 ~= 0)) then
	--	AddText(sceneId,  "�㻹���Ѿ���������û����ɣ�")
	--	EndEvent(sceneId)
	--	DispatchEventList(sceneId,selfId,targetId)
	--	return
	--end
	
		
	
	if(IsDone600 == 0) then	
		AddText(sceneId,  "ֻҪ��5�����ܵ�ëƤ�����Ǵ��������Щ���Ǿ����о��ˡ�")
	elseif(IsDone602 == 0) then
		AddText(sceneId,  "�����ҵĹ��°ɣ����ѣ��������뿪���ﻹ���ü���")	
	elseif(IsDone603 == 0) then
		AddText(sceneId, "�ҵ��غ���")	
	elseif(IsDone604 == 0) then
		AddText(sceneId, "�ҵ���콻��ʯ")
	elseif(IsDone607 == 0) then
		AddText(sceneId, "ȥɱ��10����ʦ��")
	 elseif(IsDone609 == 0) then
		AddText(sceneId, "ȥ��Ϫ����")	    				
	end
	
	for i, eventId in x026000_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	if	IsHaveMission(sceneId,selfId,602) > 0	then
		AddNumText(sceneId, x026000_g_scriptId,"��ʼ������",-1,0)
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x026000_OnDefaultEvent( sceneId, selfId,targetId )
	x026000_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x026000_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	IsHaveMission(sceneId,selfId,602) <= 0	then
		CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
	else
		misIndex = GetMissionIndexByID(sceneId,selfId,602)
		res = GetMissionParam( sceneId, selfId, misIndex, 1)
		if	GetNumText() == 0  then
			BeginEvent(sceneId)
				AddText(sceneId,"��ʼ����ô��ô����")
				AddNumText(sceneId, x026000_g_scriptId,"�����أ�",-1,1)
			EndEvent( )
			DispatchEventList(sceneId,selfId,targetId)
		elseif	GetNumText() == 1  then
			BeginEvent(sceneId)
				AddText(sceneId,"��������ô��ô����")
				AddNumText(sceneId, x026000_g_scriptId,"����أ�",-1,2)
			EndEvent( )
			DispatchEventList(sceneId,selfId,targetId)
		elseif	GetNumText() == 2  then
			BeginEvent(sceneId)
				AddText(sceneId,"�±߰���û��")
				SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
			EndEvent( )
			DispatchEventList(sceneId,selfId,targetId)
			BeginEvent(sceneId)
				strText = "�������"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
	for i, findId in x026000_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x026000_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x026000_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x026000_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x026000_g_eventList do
		if missionScriptId == findId then
			x026000_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x026000_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x026000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x026000_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x026000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x026000_OnDie( sceneId, selfId, killerId )
end
