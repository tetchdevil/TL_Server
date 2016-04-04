--��������
--Ѱ������
--MisDescBegin
--�ű���
x210809_g_ScriptId = 210809

--�����
x210809_g_MissionId = 519

--Ŀ��NPC
x210809_g_Name	="���"

--�������
x210809_g_MissionKind = 19

--����ȼ�
x210809_g_MissionLevel = 9

--�Ƿ��Ǿ�Ӣ����
x210809_g_IfMissionElite = 0

--������
x210809_g_MissionName="���"
x210809_g_MissionInfo="����һ�����ѣ��Ǵ��ܲ���ү���ᣬ���в������������ɽ����������Ժ��������˵��һЩ��ɽ����ľ�˵����顣�����ȥ��������������顣"
x210809_g_MissionTarget="�ҵ���ɽ������Ժ�Ĳ��"
x210809_g_ContinueInfo="����������"
x210809_g_MissionComplete="����������"

x210809_g_MoneyBonus=10200
x210809_g_ItemBonus={{id=20101001,num=1}}


--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210809_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x210809_g_MissionId) > 0 ) then
    	return
    elseif( IsHaveMission(sceneId,selfId,x210809_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x210809_g_Name then
			x210809_OnContinue( sceneId, selfId, targetId )
		end
	 --���������������
    elseif x210809_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210809_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x210809_g_MissionName)
				AddText(sceneId,x210809_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210809_g_MissionTarget)
				AddMoneyBonus( sceneId, x210809_g_MoneyBonus )
				for i, item in x210809_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210809_g_ScriptId,x210809_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x210809_OnEnumerate( sceneId, selfId, targetId )
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210809_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x210809_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210809_g_Name then
			AddNumText(sceneId, x210809_g_ScriptId,x210809_g_MissionName);
		end
    --���������������
    elseif x210809_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210809_g_Name then
			AddNumText(sceneId,x210809_g_ScriptId,x210809_g_MissionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x210809_CheckAccept( sceneId, selfId )
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
function x210809_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210809_g_MissionId, x210809_g_ScriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x210809_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210809_g_MissionId )
end

--**********************************
--����
--**********************************
function x210809_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210809_g_MissionName)
		AddText(sceneId,x210809_g_ContinueInfo)
		AddMoneyBonus( sceneId, x210809_g_MoneyBonus )
		for i, item in x210809_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end

    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210809_g_ScriptId,x210809_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210809_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x210809_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210809_CheckSubmit( sceneId, selfId, selectRadioId ) then
		--���������
		AddMoney(sceneId,selfId,x210809_g_MoneyBonus );
		DelMission( sceneId,selfId,  x210809_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId,  x210809_g_MissionId )
	end
end

--**********************************
--ɱ����������
--**********************************
function x210809_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210809_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210809_OnItemChanged( sceneId, selfId, itemdataId )
end
