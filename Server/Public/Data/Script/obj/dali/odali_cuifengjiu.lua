--����NPC
--�޷��
--��ͨ

x002026_g_scriptId=002026

--**********************************
--�¼��������
--**********************************
function x002026_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		if	GetLevel( sceneId, selfId)>=10	then	
			AddText(sceneId,"����ȥ���")
			AddNumText(sceneId,x002026_g_scriptId,"����",-1,0)
			AddNumText(sceneId,x002026_g_scriptId,"����",-1,1)
			AddNumText(sceneId,x002026_g_scriptId,"������",-1,2)
			AddNumText(sceneId,x002026_g_scriptId,"����",-1,3)
			AddNumText(sceneId,x002026_g_scriptId,"ؤ��",-1,4)
			AddNumText(sceneId,x002026_g_scriptId,"�䵱ɽ",-1,5)
			AddNumText(sceneId,x002026_g_scriptId,"����ɽ",-1,6)
			AddNumText(sceneId,x002026_g_scriptId,"���޺�",-1,7)
			AddNumText(sceneId,x002026_g_scriptId,"������",-1,8)
			AddNumText(sceneId,x002026_g_scriptId,"��ɽ",-1,9)
			AddNumText(sceneId,x002026_g_scriptId,"��ң��",-1,10)
			AddNumText(sceneId,x002026_g_scriptId,"����",-1,11)
			AddNumText(sceneId,x002026_g_scriptId,"����2",-1,12)
			AddNumText(sceneId,x002026_g_scriptId,"����3",-1,13)
		else
			AddText(sceneId,"10�����ϲŸ�����")
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002026_OnEventRequest( sceneId, selfId, targetId, eventId )
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		BeginEvent(sceneId)
			AddText(sceneId,"�������˻�������������վ����Ϊ���ṩ���ͷ���");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		if	GetNumText()==0	then
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 0,132,183)
		elseif	GetNumText()==1	then
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 1,164,84)
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
		elseif	GetNumText()==11	then
			if sceneId == 2 then	--�����Ҿ��ڴ���1�򲻴���
				BeginEvent(sceneId)
					AddText(sceneId,"���Ѿ��ڴ����ˡ�");
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			else
				CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 2,241,138)
			end
		elseif	GetNumText()==12	then
			if sceneId == 71 then	--�����Ҿ��ڴ���2�򲻴���
				BeginEvent(sceneId)
					AddText(sceneId,"���Ѿ��ڴ���2�ˡ�");
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			else
				CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 71,241,138)
			end
		elseif	GetNumText()==13	then
			if sceneId == 72 then	--�����Ҿ��ڴ���3�򲻴���
				BeginEvent(sceneId)
					AddText(sceneId,"���Ѿ��ڴ���3�ˡ�");
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			else
				CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 72,241,138)
			end
		end
	end
end
