--����NPC
--����
--��Ů

--����
x805007_g_shoptableindex=7

x805007_g_scriptId=805007

--**********************************
--�¼��������
--**********************************
function x805007_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"���ǲ���ȱ���Ͷ����߰������ż��������ϸ����á�")
		AddNumText(sceneId,x805007_g_scriptId,"���򹤾�",-1,0)
		AddNumText(sceneId,x805007_g_scriptId,"������ľ��һ��",-1,1)
		AddNumText(sceneId,x805007_g_scriptId,"������ľ������",-1,2)
		AddNumText(sceneId,x805007_g_scriptId,"������ľ������",-1,3)
		AddNumText(sceneId,x805007_g_scriptId,"������ľ���ļ�",-1,4)
		AddNumText(sceneId,x805007_g_scriptId,"������ľ���弶",-1,5)
		AddNumText(sceneId,x805007_g_scriptId,"�ص���ڳ���",-1,6)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x805007_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1 then
		CityBuildingChange(sceneId, selfId, 2, 1)
	elseif GetNumText() == 2 then
		CityBuildingChange(sceneId, selfId, 2, 2)
	elseif GetNumText() == 3 then
		CityBuildingChange(sceneId, selfId, 2, 3)
	elseif GetNumText() == 4 then
		CityBuildingChange(sceneId, selfId, 2, 4)
	elseif GetNumText() == 5 then
		CityBuildingChange(sceneId, selfId, 2, 5)
	elseif GetNumText() == 6 then
		NewWorld(sceneId, selfId, 1, 177, 144)
	end
end
