--����NPC
--������
--��ͨ

x000101_g_scriptId = 000101

x000101_g_shoptableindex=17

--��ӵ�е��¼�ID�б�
x000101_g_eventList={311111}

--**********************************
--�¼��������
--**********************************
function x000101_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�����ҶԳ�����ʲô�����أ�")
		AddNumText(sceneId,x000101_g_scriptId,"���������Ʒ",-1,0)
		AddNumText(sceneId,x000101_g_scriptId,"��ͨ����ѧϰ",-1,1)
		AddNumText(sceneId,x000101_g_scriptId,"��ͯ",-1,2)
		AddNumText(sceneId,x000101_g_scriptId,"�ӳ�����",-1,3)
		AddNumText(sceneId,x000101_g_scriptId,"ѱ��",-1,4)
		AddNumText(sceneId,x000101_g_scriptId,"����������Ϣ",-1,5)
		AddNumText(sceneId,x000101_g_scriptId,"����",-1,6)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000101_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText() == 0	then
		DispatchShopItem( sceneId, selfId,targetId, x000101_g_shoptableindex )
	else
		local sel = GetNumText();
		for i, eventId in x000101_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId, sel)
		end
	end
end
