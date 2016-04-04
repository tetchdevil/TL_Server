--��������
--Ѱ������
--MisDescBegin
--�ű���
x210801_g_ScriptId = 210801

--�����
x210801_g_MissionId = 511

--Ŀ��NPC
x210801_g_Name	="���е�"

--�������
x210801_g_MissionKind = 19

--����ȼ�
x210801_g_MissionLevel = 6

--�Ƿ��Ǿ�Ӣ����
x210801_g_IfMissionElite = 0

--������
x210801_g_MissionName="�ɳ�"
x210801_g_MissionInfo="�ҵ����Źص����ĺ������е�"
x210801_g_MissionTarget="�ҵ����Źص����ĺ������е�"
x210801_g_ContinueInfo="��糾���͵���ʲô������"
x210801_g_MissionComplete="����������"

x210801_g_MoneyBonus=10200
x210801_g_ItemBonus={{id=20101001,num=1}}


--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210801_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x210801_g_MissionId) > 0 ) then
    	return
    elseif( IsHaveMission(sceneId,selfId,x210801_g_MissionId) > 0)  then

	if GetName(sceneId,targetId) == x210801_g_Name then
		x210801_OnContinue( sceneId, selfId, targetId )
	end
	 --���������������
    elseif x210801_CheckAccept(sceneId,selfId) > 0 then

	if GetName(sceneId,targetId) ~= x210801_g_Name then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x210801_g_MissionName)
			AddText(sceneId,x210801_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x210801_g_MissionTarget)
			AddMoneyBonus( sceneId, x210801_g_MoneyBonus )
			for i, item in x210801_g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x210801_g_ScriptId,x210801_g_MissionId)
	end
    end
end

--**********************************
--�о��¼�
--**********************************
function x210801_OnEnumerate( sceneId, selfId, targetId )
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210801_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x210801_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210801_g_Name then
			AddNumText(sceneId, x210801_g_ScriptId,x210801_g_MissionName);
		end
    --���������������
    elseif x210801_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210801_g_Name then
			AddNumText(sceneId,x210801_g_ScriptId,x210801_g_MissionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x210801_CheckAccept( sceneId, selfId )
	--��Ҫ1�����ܽ�
	if GetLevel( sceneId, selfId ) >= 10 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210801_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210801_g_MissionId, x210801_g_ScriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x210801_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210801_g_MissionId )
end

--**********************************
--����
--**********************************
function x210801_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210801_g_MissionName)
		AddText(sceneId,x210801_g_ContinueInfo)
		AddMoneyBonus( sceneId, x210801_g_MoneyBonus )
		for i, item in x210801_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end

    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210801_g_ScriptId,x210801_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210801_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x210801_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210801_CheckSubmit( sceneId, selfId, selectRadioId ) then
		--���������
		AddMoney(sceneId,selfId,x210801_g_MoneyBonus );
		DelMission( sceneId,selfId,  x210801_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId,  x210801_g_MissionId )
	end
end

--**********************************
--ɱ����������
--**********************************
function x210801_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210801_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210801_OnItemChanged( sceneId, selfId, itemdataId )
end
