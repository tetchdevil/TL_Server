--����NPC
--������
--һ��

x001050_g_shoptableindex=27

--**********************************
--�¼��������
--**********************************
function x001050_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�����������񷻷���")
		AddNumText(sceneId,g_scriptId,"���������Ʒ",-1,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001050_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText() == 0	then
		DispatchShopItem( sceneId, selfId,targetId, x001050_g_shoptableindex )
	end
end
