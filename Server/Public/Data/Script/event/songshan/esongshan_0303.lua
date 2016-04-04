--��������
--����ȥ��
--MisDescBegin
--�ű���
x210303_g_ScriptId = 210303

--�����
x210303_g_MissionId = 463

--��һ�������ID
x210303_g_MissionIdPre_1 = 460
x210303_g_MissionIdPre_2 = 461
x210303_g_MissionIdPre_3 = 462

--Ŀ��NPC
x210303_g_Name	="½��"

--�������
x210303_g_MissionKind = 14

--����ȼ�
x210303_g_MissionLevel = 25

--�Ƿ��Ǿ�Ӣ����
x210303_g_IfMissionElite = 0

--������
x210303_g_MissionName="����ȥ��"
x210303_g_MissionInfo=[[
    ���������������ج�Σ���Ҳ�ѹ֣�����������Ժ�����˺ö���¡�
    �������̫ү��Ѫ������ʱ�򣬲�������ͻ�С�����Ǻ��¡���ʱ��������˲��������Ǽ�����Ѫ��
    ȥ��½��½���п��㰲���ҩ�ɡ�]]
x210303_g_MissionTarget="�ҵ�½��"
x210303_g_ContinueInfo="���ҵ�½�����𣬿��ȥ�Ұɡ�"		--δ��������npc�Ի�
x210303_g_MissionComplete="����������"
x210303_g_MoneyBonus=12000

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210303_OnDefaultEvent( sceneId, selfId, targetId )

	--��������ɹ��������
  if( IsMissionHaveDone(sceneId,selfId,x210303_g_MissionId) > 0 ) then
  	return
	elseif( IsHaveMission(sceneId,selfId,x210303_g_MissionId) > 0)  then
		if GetName(sceneId, targetId) == x210303_g_Name then
			x210303_OnComplete( sceneId, selfId, targetId );
		else
			x210303_OnContinue( sceneId, selfId, targetId );
		end
	elseif x210303_CheckAccept(sceneId,selfId) > 0 then --���������������
		if GetName(sceneId,targetId) ~= x210303_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId);
				AddText(sceneId, x210303_g_MissionName);
				AddText(sceneId, x210303_g_MissionInfo);
				AddText(sceneId, "#{M_MUBIAO}");
				AddText(sceneId, x210303_g_MissionTarget);
			EndEvent( );
			DispatchMissionInfo(sceneId,selfId,targetId,x210303_g_ScriptId,x210303_g_MissionId)
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x210303_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x210303_g_MissionIdPre_1) <= 0 or 	IsMissionHaveDone(sceneId,selfId,x210303_g_MissionIdPre_2) <= 0 or IsMissionHaveDone(sceneId,selfId,x210303_g_MissionIdPre_3) <= 0 then
    	return
    end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210303_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x210303_g_MissionId) > 0 then
			AddNumText(sceneId, x210303_g_ScriptId, x210303_g_MissionName);
    --���������������
    elseif x210303_CheckAccept(sceneId,selfId) > 0 then
			if GetName(sceneId,targetId) ~= x210303_g_Name then
				AddNumText(sceneId, x210303_g_ScriptId, x210303_g_MissionName);
			end
    end
end

--**********************************
--����������
--**********************************
function x210303_CheckAccept( sceneId, selfId )
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
function x210303_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId, selfId, x210303_g_MissionId, x210303_g_ScriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x210303_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210303_g_MissionId )
end

--**********************************
--����
--**********************************
function x210303_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	print("===============x210303_OnContinue============");
  BeginEvent(sceneId)
		AddText(sceneId, x210303_g_MissionName)
		AddText(sceneId, x210303_g_ContinueInfo)
  EndEvent( )
	DispatchMissionDemandInfo(sceneId, selfId, targetId, x210303_g_ScriptId, x210303_g_MissionId, 0);
end

--**********************************
--���
--**********************************
function x210303_OnComplete( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
  BeginEvent(sceneId)
		AddText(sceneId, x210303_g_MissionName)
		AddText(sceneId, x210303_g_MissionComplete)
  EndEvent( )
  DispatchMissionContinueInfo(sceneId, selfId, targetId, x210303_g_ScriptId, x210303_g_MissionId);
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210303_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x210303_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210303_CheckSubmit( sceneId, selfId, selectRadioId ) then
		--���������
		AddMoney(sceneId,selfId,x210303_g_MoneyBonus );
		DelMission( sceneId,selfId,  x210303_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId,  x210303_g_MissionId )
	end
end

--**********************************
--ɱ����������
--**********************************
function x210303_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210303_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210303_OnItemChanged( sceneId, selfId, itemdataId )
end
