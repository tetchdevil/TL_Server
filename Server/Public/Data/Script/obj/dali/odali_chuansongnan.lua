--����NPC
--��ǧ��
--��ͨ

x002035_g_scriptId=002035

--**********************************
--�¼��������
--**********************************
function x002035_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"������Σ�յģ�20���Ժ����ȥ���㻹�����ڴ������תת�ɡ�")
		AddNumText(sceneId,x002035_g_scriptId,"������",-1,0)
		AddNumText(sceneId,x002035_g_scriptId,"��������",-1,1)
		if	GetLevel(sceneId, selfId)>=20	then
			AddNumText(sceneId,x002035_g_scriptId,"����",-1,2)
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002035_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		SetPos(  sceneId, selfId, 282, 152)	
	elseif	GetNumText()==1	then
		SetPos(  sceneId, selfId, 40, 152)	
	elseif	GetNumText()==2	then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 24,280,37)
	end
end
