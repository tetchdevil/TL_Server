--����NPC
--��˷�
--��ͨ

x001028_g_scriptId=001028

--**********************************
--�¼��������
--**********************************
function x001028_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"����ȥ���")
		AddNumText(sceneId,x001028_g_scriptId,"����",-1,0)
		AddNumText(sceneId,x001028_g_scriptId,"����",-1,1)
		AddNumText(sceneId,x001028_g_scriptId,"������",-1,2)
		AddNumText(sceneId,x001028_g_scriptId,"����",-1,3)
		AddNumText(sceneId,x001028_g_scriptId,"ؤ��",-1,4)
		AddNumText(sceneId,x001028_g_scriptId,"�䵱ɽ",-1,5)
		AddNumText(sceneId,x001028_g_scriptId,"����ɽ",-1,6)
		AddNumText(sceneId,x001028_g_scriptId,"���޺�",-1,7)
		AddNumText(sceneId,x001028_g_scriptId,"������",-1,8)
		AddNumText(sceneId,x001028_g_scriptId,"��ɽ",-1,9)
		AddNumText(sceneId,x001028_g_scriptId,"��ң��",-1,10)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001028_OnEventRequest( sceneId, selfId, targetId, eventId )
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		BeginEvent(sceneId)
			AddText(sceneId,"�������˻�������������վ����Ϊ���ṩ���ͷ���");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		if	GetNumText()==0	then
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 0,132,183)
		elseif	GetNumText()==1	then
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 2,241,141)
		elseif	GetNumText()==2	then
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 9,95,146)
		elseif	GetNumText()==3	then
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 11, 98, 149)
		elseif	GetNumText()==4	then
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 10,92,153)
		elseif	GetNumText()==5	then
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 12,93,182)
		elseif	GetNumText()==6	then
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 15,89,144)
		elseif	GetNumText()==7	then
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 16,96,147)
		elseif	GetNumText()==8	then
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 13,96,139)
		elseif	GetNumText()==9	then
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 17,94,149)
		elseif	GetNumText()==10	then
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 14,66,143)
		end
	end
end
