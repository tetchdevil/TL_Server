--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000110_OnDefaultEvent( sceneId, selfId,targetId )

	
	BeginEvent(sceneId)

		AddText(sceneId,"����԰�������ͬ�ı�ʯ�ϳ�Ϊһ�Ÿ�һ���ı�ʯ��ÿ�κϳ�����(��ʯ�ȼ�*10)�㾫����")
		AddNumText(sceneId,g_scriptId,"��ʯ�ϳ�",-1,0)

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
	
end


--**********************************
--�¼��б�ѡ��һ��
--**********************************

function x000110_OnEventRequest( sceneId, selfId, targetId, eventId )

		if	GetNumText()==0	then
		
			BeginUICommand(sceneId)
				UICommand_AddInt(sceneId,targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 23)
			
			return
		end
		
end
