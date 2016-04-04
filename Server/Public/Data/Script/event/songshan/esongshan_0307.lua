--��������
--������ǽ
--MisDescBegin
--�ű���
x210307_g_ScriptId = 210307

--�����
x210307_g_MissionId = 467

--Ŀ��NPC
x210307_g_Name	="����"

--�������
x210307_g_MissionKind = 14

--����ȼ�
x210307_g_MissionLevel = 25

--�Ƿ��Ǿ�Ӣ����
x210307_g_IfMissionElite = 0

--������
x210307_g_MissionName="������ǽ"
x210307_g_MissionInfo=[[
    ǰЩ���ӣ����ϵ�������Ԫ˧д�Ÿ������ˣ�˵�ӷ�²���ɱ����еõ��˲��ϵ�����ȯ�����飬�鷳��ȥ�����ɣ�Ҳ���ܵõ�һЩ����ġ�
]]
x210307_g_MissionTarget="�ҵ�����"
x210307_g_ContinueInfo="�ҵ��������𣬿��ȥ�Ұɡ�"		--δ��������npc�Ի�
x210307_g_MissionComplete="���������ˡ�"
x210307_g_MoneyBonus=12000

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210307_OnDefaultEvent( sceneId, selfId, targetId )

	--��������ɹ��������
  if( IsMissionHaveDone(sceneId,selfId,x210307_g_MissionId) > 0 ) then
  	return
	elseif( IsHaveMission(sceneId,selfId,x210307_g_MissionId) > 0)  then
		if GetName(sceneId, targetId) == x210307_g_Name then
			x210307_OnComplete( sceneId, selfId, targetId );
		else
			x210307_OnContinue( sceneId, selfId, targetId );
		end
    --���������������
	elseif x210307_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210307_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId);
				AddText(sceneId, x210307_g_MissionName);
				AddText(sceneId, x210307_g_MissionInfo);
				AddText(sceneId, "#{M_MUBIAO}");
				AddText(sceneId, x210307_g_MissionTarget);
			EndEvent( );
			DispatchMissionInfo(sceneId,selfId,targetId,x210307_g_ScriptId,x210307_g_MissionId)
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x210307_OnEnumerate( sceneId, selfId, targetId )
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210307_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x210307_g_MissionId) > 0 then
			AddNumText(sceneId, x210307_g_ScriptId, x210307_g_MissionName);
    --���������������
    elseif x210307_CheckAccept(sceneId,selfId) > 0 then
			if GetName(sceneId,targetId) ~= x210307_g_Name then
				AddNumText(sceneId, x210307_g_ScriptId, x210307_g_MissionName);
			end
    end
end

--**********************************
--����������
--**********************************
function x210307_CheckAccept( sceneId, selfId )
	--��Ҫ2�����ܽ�
	if GetLevel( sceneId, selfId ) >= 15 and IsMissionHaveDone(sceneId, selfId, 466)==1 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210307_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId, selfId, x210307_g_MissionId, x210307_g_ScriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x210307_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210307_g_MissionId )
end

--**********************************
--����
--**********************************
function x210307_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	print("===============x210307_OnContinue============");
  BeginEvent(sceneId)
		AddText(sceneId, x210307_g_MissionName)
		AddText(sceneId, x210307_g_ContinueInfo)
  EndEvent( )
	DispatchMissionDemandInfo(sceneId, selfId, targetId, x210307_g_ScriptId, x210307_g_MissionId, 0);
end

--**********************************
--���
--**********************************
function x210307_OnComplete( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
  BeginEvent(sceneId)
		AddText(sceneId, x210307_g_MissionName)
		AddText(sceneId, x210307_g_MissionComplete)
  EndEvent( )
  DispatchMissionContinueInfo(sceneId, selfId, targetId, x210307_g_ScriptId, x210307_g_MissionId);
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210307_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x210307_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210307_CheckSubmit( sceneId, selfId, selectRadioId ) then
		--���������
		AddMoney(sceneId,selfId,x210307_g_MoneyBonus );
		DelMission( sceneId,selfId,  x210307_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId,  x210307_g_MissionId )
	end
end

--**********************************
--ɱ����������
--**********************************
function x210307_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210307_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210307_OnItemChanged( sceneId, selfId, itemdataId )
end
