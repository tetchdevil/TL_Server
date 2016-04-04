--��������
--Ѱ��������
--MisDescBegin
--�ű���
x210804_g_ScriptId = 210804

--�����
x210804_g_MissionId = 514

--Ŀ��NPC
x210804_g_Name	="������"

--�������
x210804_g_MissionKind = 19

--����ȼ�
x210804_g_MissionLevel = 8

--�Ƿ��Ǿ�Ӣ����
x210804_g_IfMissionElite = 0

--������
x210804_g_MissionName="Ӫ��"
x210804_g_MissionInfo="��ȥ���콫������˵�Ҵ���ȥ�����ˡ�"
x210804_g_MissionTarget="�ҵ�������"
x210804_g_ContinueInfo="����������"
x210804_g_MissionComplete="����������"

x210804_g_MoneyBonus=10200
x210804_g_ItemBonus={{id=20101001,num=1}}


--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210804_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x210804_g_MissionId) > 0 ) then
    	return
    elseif( IsHaveMission(sceneId,selfId,x210804_g_MissionId) > 0)  then

	if GetName(sceneId,targetId) == x210804_g_Name then
		x210804_OnContinue( sceneId, selfId, targetId )
	end
	 --���������������
    elseif x210804_CheckAccept(sceneId,selfId) > 0 then

	if GetName(sceneId,targetId) ~= x210804_g_Name then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x210804_g_MissionName)
			AddText(sceneId,x210804_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x210804_g_MissionTarget)
			AddMoneyBonus( sceneId, x210804_g_MoneyBonus )
			for i, item in x210804_g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x210804_g_ScriptId,x210804_g_MissionId)
	end
    end
end

--**********************************
--�о��¼�
--**********************************
function x210804_OnEnumerate( sceneId, selfId, targetId )
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210804_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x210804_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210804_g_Name then
			AddNumText(sceneId, x210804_g_ScriptId,x210804_g_MissionName);
		end
    --���������������
    elseif x210804_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210804_g_Name then
			AddNumText(sceneId,x210804_g_ScriptId,x210804_g_MissionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x210804_CheckAccept( sceneId, selfId )
	--��Ҫ1�����ܽ�
	if GetLevel( sceneId, selfId ) >= 10 and IsMissionHaveDone(sceneId,selfId,511) > 0 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210804_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210804_g_MissionId, x210804_g_ScriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x210804_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210804_g_MissionId )
end

--**********************************
--����
--**********************************
function x210804_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210804_g_MissionName)
		AddText(sceneId,x210804_g_ContinueInfo)
		AddMoneyBonus( sceneId, x210804_g_MoneyBonus )
		for i, item in x210804_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end

    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210804_g_ScriptId,x210804_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210804_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x210804_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210804_CheckSubmit( sceneId, selfId, selectRadioId ) then
		--���������
		AddMoney(sceneId,selfId,x210804_g_MoneyBonus );
		DelMission( sceneId,selfId,  x210804_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId,  x210804_g_MissionId )
	end
end

--**********************************
--ɱ����������
--**********************************
function x210804_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210804_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210804_OnItemChanged( sceneId, selfId, itemdataId )
end
