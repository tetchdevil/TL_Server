--����NPC
--����
--��Ů

--����
x805008_g_shoptableindex=7

x805008_g_scriptId=805008

--**********************************
--�¼��������
--**********************************
function x805008_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�����ý����Ｖ��")
		AddNumText(sceneId,x805008_g_scriptId,"���ý�����һ��",-1,1)
		AddNumText(sceneId,x805008_g_scriptId,"���ý���������",-1,2)
		AddNumText(sceneId,x805008_g_scriptId,"���ý���������",-1,3)
		AddNumText(sceneId,x805008_g_scriptId,"���ý������ļ�",-1,4)
		AddNumText(sceneId,x805008_g_scriptId,"���ý������弶",-1,5)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x805008_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1 then
		CityBuildingChange(sceneId, selfId, 1, 1)
	elseif GetNumText() == 2 then
		CityBuildingChange(sceneId, selfId, 1, 2)
	elseif GetNumText() == 3 then
		CityBuildingChange(sceneId, selfId, 1, 3)
	elseif GetNumText() == 4 then
		CityBuildingChange(sceneId, selfId, 1, 4)
	elseif GetNumText() == 5 then
		CityBuildingChange(sceneId, selfId, 1, 5)
	end
	
end
