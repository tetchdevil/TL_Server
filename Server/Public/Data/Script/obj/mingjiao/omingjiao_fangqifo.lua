--����NPC
--���߷�
--��ͨ

x011003_g_scriptId=011003

--**********************************
--�¼��������
--**********************************
function x011003_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"���������ֵ�һ���Ƿ�����ʹ�����ֵ�һ������ʦ����ʹ��")
		if	GetLevel( sceneId, selfId)>=10  then	
			AddNumText(sceneId,x011003_g_scriptId,"����",-1,0)
			AddNumText(sceneId,x011003_g_scriptId,"����",-1,1)
		end
		AddNumText(sceneId,x011003_g_scriptId,"����",-1,2)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end


--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x011003_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 0,110,155)
	elseif	GetNumText()==1	then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 1,141,50)
	elseif	GetNumText()==2	then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 2,241,141)
	end
end
