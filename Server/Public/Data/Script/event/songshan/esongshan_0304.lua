--��������
--����ҩ
--MisDescBegin
--�ű���
x210304_g_ScriptId = 210304

--�����
x210304_g_MissionId = 464

--Ŀ��NPC
x210304_g_Name	="���"

--�������
x210304_g_MissionKind = 14

--����ȼ�
x210304_g_MissionLevel = 25

--�Ƿ��Ǿ�Ӣ����
x210304_g_IfMissionElite = 0

--������
x210304_g_MissionName="����ҩ"
x210304_g_MissionInfo=[[
    ��������ݰ���ҩ���������ˡ�]]
x210304_g_MissionTarget="�Ѱ���ҩ�������"
x210304_g_ContinueInfo="�Ѱ���ҩ����������𣬿��ȥ�ɡ�"		--δ��������npc�Ի�
x210304_g_MissionComplete="���������ˡ�"
x210304_g_MoneyBonus=12000

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210304_OnDefaultEvent( sceneId, selfId, targetId )

	--��������ɹ��������
  if( IsMissionHaveDone(sceneId,selfId,x210304_g_MissionId) > 0 ) then
  	return
	elseif( IsHaveMission(sceneId,selfId,x210304_g_MissionId) > 0)  then
		if GetName(sceneId, targetId) == x210304_g_Name then
			x210304_OnComplete( sceneId, selfId, targetId );
		else
			x210304_OnContinue( sceneId, selfId, targetId );
		end
	elseif x210304_CheckAccept(sceneId,selfId) > 0 then --���������������
		if GetName(sceneId,targetId) ~= x210304_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId);
				AddText(sceneId, x210304_g_MissionName);
				AddText(sceneId, x210304_g_MissionInfo);
				AddText(sceneId, "#{M_MUBIAO}");
				AddText(sceneId, x210304_g_MissionTarget);
			EndEvent( );
			DispatchMissionInfo(sceneId,selfId,targetId,x210304_g_ScriptId,x210304_g_MissionId)
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x210304_OnEnumerate( sceneId, selfId, targetId )
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210304_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x210304_g_MissionId) > 0 then
			AddNumText(sceneId, x210304_g_ScriptId, x210304_g_MissionName);
    --���������������
    elseif x210304_CheckAccept(sceneId,selfId) > 0 then
			if GetName(sceneId,targetId) ~= x210304_g_Name then
				AddNumText(sceneId, x210304_g_ScriptId, x210304_g_MissionName);
			end
    end
end

--**********************************
--����������
--**********************************
function x210304_CheckAccept( sceneId, selfId )
	--��Ҫ2�����ܽ�
	if GetLevel( sceneId, selfId ) >= 15 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210304_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId, selfId, x210304_g_MissionId, x210304_g_ScriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x210304_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210304_g_MissionId )
end

--**********************************
--����
--**********************************
function x210304_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	print("===============x210304_OnContinue============");
  BeginEvent(sceneId)
		AddText(sceneId, x210304_g_MissionName)
		AddText(sceneId, x210304_g_ContinueInfo)
  EndEvent( )
	DispatchMissionDemandInfo(sceneId, selfId, targetId, x210304_g_ScriptId, x210304_g_MissionId, 0);
end

--**********************************
--���
--**********************************
function x210304_OnComplete( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
  BeginEvent(sceneId)
		AddText(sceneId, x210304_g_MissionName)
		AddText(sceneId, x210304_g_MissionComplete)
  EndEvent( )
  DispatchMissionContinueInfo(sceneId, selfId, targetId, x210304_g_ScriptId, x210304_g_MissionId);
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210304_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x210304_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210304_CheckSubmit( sceneId, selfId, selectRadioId ) then
		--���������
		AddMoney(sceneId,selfId,x210304_g_MoneyBonus );
		DelMission( sceneId,selfId,  x210304_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId,  x210304_g_MissionId )
	end
end

--**********************************
--ɱ����������
--**********************************
function x210304_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210304_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210304_OnItemChanged( sceneId, selfId, itemdataId )
end
