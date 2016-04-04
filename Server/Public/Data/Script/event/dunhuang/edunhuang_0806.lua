--��������
--Ѱ������
--MisDescBegin
--�ű���
x210806_g_ScriptId = 210806

--�����
x210806_g_MissionId = 516

--Ŀ��NPC
x210806_g_Name	="������"

--�������
x210806_g_MissionKind = 19

--����ȼ�
x210806_g_MissionLevel = 9

--�Ƿ��Ǿ�Ӣ����
x210806_g_IfMissionElite = 0

--������
x210806_g_MissionName="�ع�"
x210806_g_MissionInfo="��ȥ������������������ɱ������ɹ����ֻҪ�������Ź����죬�ҾͿ����������ξ��ϵ���"
x210806_g_MissionTarget="�ҵ�������"
x210806_g_ContinueInfo="����������"
x210806_g_MissionComplete="����������"

x210806_g_MoneyBonus=10200
x210806_g_ItemBonus={{id=20101001,num=1}}


--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210806_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x210806_g_MissionId) > 0 ) then
    	return
    elseif( IsHaveMission(sceneId,selfId,x210806_g_MissionId) > 0)  then

	if GetName(sceneId,targetId) == x210806_g_Name then
		x210806_OnContinue( sceneId, selfId, targetId )
	end
	 --���������������
    elseif x210806_CheckAccept(sceneId,selfId) > 0 then

	if GetName(sceneId,targetId) ~= x210806_g_Name then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x210806_g_MissionName)
			AddText(sceneId,x210806_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x210806_g_MissionTarget)
			AddMoneyBonus( sceneId, x210806_g_MoneyBonus )
			for i, item in x210806_g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x210806_g_ScriptId,x210806_g_MissionId)
	end
    end
end

--**********************************
--�о��¼�
--**********************************
function x210806_OnEnumerate( sceneId, selfId, targetId )
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210806_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x210806_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210806_g_Name then
			AddNumText(sceneId, x210806_g_ScriptId,x210806_g_MissionName);
		end
    --���������������
    elseif x210806_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210806_g_Name then
			AddNumText(sceneId,x210806_g_ScriptId,x210806_g_MissionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x210806_CheckAccept( sceneId, selfId )
	--��Ҫ1�����ܽ�
	if GetLevel( sceneId, selfId ) >= 10 and IsMissionHaveDone(sceneId,selfId,515) > 0 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210806_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210806_g_MissionId, x210806_g_ScriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x210806_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210806_g_MissionId )
end

--**********************************
--����
--**********************************
function x210806_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210806_g_MissionName)
		AddText(sceneId,x210806_g_ContinueInfo)
		AddMoneyBonus( sceneId, x210806_g_MoneyBonus )
		for i, item in x210806_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end

    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210806_g_ScriptId,x210806_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210806_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x210806_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210806_CheckSubmit( sceneId, selfId, selectRadioId ) then
		--���������
		AddMoney(sceneId,selfId,x210806_g_MoneyBonus );
		DelMission( sceneId,selfId,  x210806_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId,  x210806_g_MissionId )
	end
end

--**********************************
--ɱ����������
--**********************************
function x210806_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210806_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210806_OnItemChanged( sceneId, selfId, itemdataId )
end
