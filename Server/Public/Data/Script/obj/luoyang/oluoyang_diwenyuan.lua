--����NPC
--����Զ
--��ͨ

--�ű���
x000083_g_scriptId = 000083

x000083_g_missionName = "������Ӫ"

--**********************************
--�¼��б�
--**********************************
function x000083_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"����Ҫ�ڽ����Ͽ��������"..PlayerName.."��ͬʱ��Ҫð�ű����˿������ķ��հ���");
		--��������ɹ��������
		if GetCurCamp (sceneId, selfId) == 1 then
			AddNumText(sceneId, x000083_g_scriptId,"�ظ���ʼ��Ӫ",-1,0);
		--���������������
		else
			AddNumText(sceneId,x000083_g_scriptId,"����PK��Ӫ",-1,1);
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end


--**********************************
--�¼��������
--**********************************
function x000083_OnDefaultEvent( sceneId, selfId,targetId )
	x000083_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000083_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
			SetCurCamp (sceneId, selfId, 0)
		BeginEvent(sceneId)
  			AddText(sceneId,"���Ѿ��ظ�����ʼ��Ӫ��");
  		EndEvent(sceneId)
  		DispatchMissionTips(sceneId,selfId)
	elseif	GetNumText()==1	then
		SetCurCamp (sceneId, selfId, 1 )
		BeginEvent(sceneId)
	  		AddText(sceneId,"���Ѿ�����ΪPK��Ӫ��");
		EndEvent(sceneId)
	  	DispatchMissionTips(sceneId,selfId)
	end
end
