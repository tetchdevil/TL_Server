--����NPC
--�����
--��ͨ

x002036_g_scriptId=002036

--**********************************
--�¼��������
--**********************************
function x002036_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"����ȥ���")
		AddNumText(sceneId,x002036_g_scriptId,"������",-1,0)
		AddNumText(sceneId,x002036_g_scriptId,"��������",-1,1)
		AddNumText(sceneId,x002036_g_scriptId,"����",-1,2)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002036_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		SetPos(  sceneId, selfId, 282, 152)	
	elseif	GetNumText()==1	then
		SetPos(  sceneId, selfId, 160, 277)	
	elseif	GetNumText()==2	then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 7,40,278)
	end
end
