--����NPC
--��ʮ��
--��ͨ

x002034_g_scriptId=002034

--**********************************
--�¼��������
--**********************************
function x002034_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"����ȥ���")
		AddNumText(sceneId,x002034_g_scriptId,"��������",-1,0)
		AddNumText(sceneId,x002034_g_scriptId,"��������",-1,1)
		AddNumText(sceneId,x002034_g_scriptId,"����ɽ",-1,2)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002034_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		SetPos(  sceneId, selfId, 40, 152)	
	elseif	GetNumText()==1	then
		SetPos(  sceneId, selfId, 160, 277)	
	elseif	GetNumText()==2	then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 6,43,172)
	end
end
