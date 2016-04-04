--��̰

--�ű���
x002044_g_scriptId = 002044


--��ӵ�е��¼�ID�б�
x002044_g_eventList={210209}

--**********************************
--�¼��б�
--**********************************
function x002044_UpdateEventList( sceneId, selfId,targetId )
	
	local  Menpai=LuaFnGetMenPai(sceneId,selfId)
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "ʦ��"
	else
		PlayerSex = "ʦ��"
	end
	
	BeginEvent(sceneId)	
	if Menpai == OR_WUMENPAI then
		AddText(sceneId,"  ƶɮ��̰���ڴ��������³��ҡ�#r#r  �������Ǵ����ʼ���Ժ����λ��ү�����������С�#r#r  �����书�����������һָ֮������ɱ���ס�")
	elseif Menpai == OR_DALI then
		AddText(sceneId,"  "..PlayerSex.."������书�����ÿ죬�����ҵ���������")
	else
		AddText(sceneId,"  �þ�û�м������ˣ��������������ʣ���ϧû�����Ҵ��������£����ڽ����ε���")
	end
	
	if	GetLevel( sceneId, selfId)<=10	then
		AddNumText(sceneId,x002044_g_scriptId,"ȥ�����¿���",-1,0)
	end
	misIndex = GetMissionIndexByID(sceneId,selfId,1060)			--�õ���������к�
	if	IsHaveMission(sceneId,selfId,1060) > 0	 then
		if	GetMissionParam( sceneId, selfId, misIndex,0) < 1  and	 GetMissionParam( sceneId, selfId, misIndex,2) == 1   then
			AddNumText(sceneId,x002044_g_scriptId,"������ʦ�ָ������",2,1)
		end
	end
	for i, eventId in x002044_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x002044_OnDefaultEvent( sceneId, selfId,targetId )
	x002044_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002044_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		if IsHaveMission(sceneId,selfId,4021) > 0 then
			BeginEvent(sceneId)
				AddText(sceneId,"�������˻���������������վ����Ϊ���ṩ���ͷ���");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else	
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 13,96,139)
		end
	elseif	GetNumText()==1	then
		misIndex = GetMissionIndexByID(sceneId,selfId,1060)			--�õ���������к�
		DelItem (  sceneId, selfId, 40002115, 1)	
		SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
		BeginEvent(sceneId)
			AddText(sceneId,"���ȥ���߻۷�ʦ�֣����������Ѿ��յ��ˣ�лл��")
		EndEvent( )
		DispatchEventList(sceneId,selfId,targetId)
		BeginEvent(sceneId)
			AddText(sceneId,"������ɣ�")
		EndEvent( )
		DispatchMissionTips(sceneId,selfId)
	else
		for i, findId in x002044_g_eventList do
			if eventId == findId then
				CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
				return
			end
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x002044_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002044_g_eventList do
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
function x002044_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x002044_g_eventList do
		if missionScriptId == findId then
			x002044_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x002044_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002044_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x002044_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002044_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x002044_OnDie( sceneId, selfId, killerId )
end