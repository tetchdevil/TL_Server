--��������
--Ѱ������
--MisDescBegin
--�ű���
x210909_g_ScriptId = 210909

--�����
x210909_g_MissionId = 529

--Ŀ��NPC
x210909_g_Name	="����"

--�������
x210909_g_MissionKind = 29

--����ȼ�
x210909_g_MissionLevel = 25

--�Ƿ��Ǿ�Ӣ����
x210909_g_IfMissionElite = 0

--������
x210909_g_MissionName="Ѱ������"
x210909_g_MissionInfo="����ȥ������"
x210909_g_MissionTarget="�ҵ��㱱������"
x210909_g_MissionComplete="����������"
x210909_g_MoneyBonus=909

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210909_OnDefaultEvent( sceneId, selfId, targetId )

    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x210909_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x210909_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x210909_g_Name then
			x210909_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x210909_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210909_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x210909_g_MissionName)
				AddText(sceneId,x210909_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210909_g_MissionTarget)
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210909_g_ScriptId,x210909_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x210909_OnEnumerate( sceneId, selfId, targetId )
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210909_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x210909_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210909_g_Name then
			AddNumText(sceneId, x210909_g_ScriptId,x210909_g_MissionName);
		end
    --���������������
    elseif x210909_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210909_g_Name then
			AddNumText(sceneId,x210909_g_ScriptId,x210909_g_MissionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x210909_CheckAccept( sceneId, selfId )
	--��Ҫ1�����ܽ�
	if GetLevel( sceneId, selfId ) >= 1 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210909_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210909_g_MissionId, x210909_g_ScriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x210909_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210909_g_MissionId )
end

--**********************************
--����
--**********************************
function x210909_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210909_g_MissionName)
		AddText(sceneId,x210909_g_MissionComplete)
		AddMoneyBonus( sceneId, x210909_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210909_g_ScriptId,x210909_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210909_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x210909_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210909_CheckSubmit( sceneId, selfId, selectRadioId ) then
		--���������
		AddMoney(sceneId,selfId,x210909_g_MoneyBonus );
		DelMission( sceneId,selfId,  x210909_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId,  x210909_g_MissionId )
	end
end

--**********************************
--ɱ����������
--**********************************
function x210909_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210909_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210909_OnItemChanged( sceneId, selfId, itemdataId )
end
