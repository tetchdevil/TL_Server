--����NPC
--������
--�������
--�ű���
x000030_g_scriptId = 000030

--��ӵ�е��¼�ID�б�
x000030_g_eventList={600000}

--**********************************
--�¼��������
--**********************************
function x000030_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"������ʲô�����صĶ����أ�")
		
		AddNumText(sceneId,x000030_g_scriptId,"�������",-1,1)
		AddNumText(sceneId,x000030_g_scriptId,"�鿴����б�",-1,2)
		AddNumText(sceneId,x000030_g_scriptId,"�������Ա��Ϣ",-1,3)
		AddNumText(sceneId,x000030_g_scriptId,"�鿴�����ϸ��Ϣ",-1,4)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x000030_OnEventRequest( sceneId, selfId, targetId, eventId )
	local sel = GetNumText();
	for i, eventId in x000030_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId, sel)
	end
end
