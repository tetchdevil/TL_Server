--����NPC
--������
--��ͨ

x002029_g_shoptableindex_1=8
x002029_g_shoptableindex_2=75

--**********************************
--�¼��������
--**********************************
function x002029_OnDefaultEvent( sceneId, selfId,targetId )
	function x002029_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"�������Ǵ�������ĵ��̡�����Դ���������һЩ��ͨ�Ĳ��Ϻ�������Ʒ��")
	AddNumText(sceneId,g_scriptId,"������ͨ����",-1,0)
--	AddNumText(sceneId,g_scriptId,"���������Ʒ",-1,1)
	for i, eventId in g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x002029_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText() == 0	then
		DispatchShopItem( sceneId, selfId,targetId, x002029_g_shoptableindex_1 )
--	else
--		DispatchShopItem( sceneId, selfId,targetId, x002029_g_shoptableindex_2 )
	end
end
