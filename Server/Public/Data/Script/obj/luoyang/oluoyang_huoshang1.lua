--����NPC
--����
--����ѭ������

--�ű���
x311009_g_scriptId = 311009

Step = 600

--��ӵ�е��¼�ID�б�
x311009_g_eventList={311010}

--**********************************
--�¼��������
--**********************************
function x311009_OnDefaultEvent( sceneId, selfId,targetId )
	if	PRE_TIME == nil then
		PRE_TIME = LuaFnGetCurrentTime()
	else
		DUA_TIME = LuaFnGetCurrentTime() - PRE_TIME
		if	DUA_TIME >= Step then
			EVENT_NOW = random(1,4)
			PRE_TIME = PRE_TIME + floor(DUA_TIME / Step) *Step;
		end
	end
	if	EVENT_NOW == nil then
		EVENT_NOW = random(1,4)
	end
	BeginEvent(sceneId)
	AddText(sceneId,"��ã������������������̡�")
	if	EVENT_NOW == 1 then
		AddNumText(sceneId,x311009_g_scriptId,"�������",-1,EVENT_NOW)
	elseif	EVENT_NOW == 2 then
		AddNumText(sceneId,x311009_g_scriptId,"��æ��̧���",-1,EVENT_NOW)
	elseif	EVENT_NOW == 3 then
		AddNumText(sceneId,x311009_g_scriptId,"��æ��ѹ�г�",-1,EVENT_NOW)
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x311009_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==1	then
		CallScriptFunction(311010, "OnEnumerate",sceneId, selfId, targetId)
	elseif	GetNumText()==2	then
		CallScriptFunction(311010, "OnFinishHaggleUp",sceneId, selfId)
	elseif	GetNumText()==3	then
		CallScriptFunction(311010, "OnFinishHaggleDown",sceneId, selfId)	
	end
end

