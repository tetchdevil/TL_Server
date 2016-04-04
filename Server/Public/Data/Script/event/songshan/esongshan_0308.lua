--��������
--������ȯ
--MisDescBegin
--�ű���
x210308_g_ScriptId = 210308

--�����
x210308_g_MissionId = 468

--Ŀ��NPC
x210308_g_Name	="������"

--�������
x210308_g_MissionKind = 14

--����ȼ�
x210308_g_MissionLevel = 25

--�Ƿ��Ǿ�Ӣ����
x210308_g_IfMissionElite = 0

--������
x210308_g_MissionName="������ȯ"
x210308_g_MissionInfo=[[
    ������鵽��Ϊֹ�ɣ��һ������˪����Ҫ��׷����ȥ�ˡ�
ǰЩ���ӣ����ϵ�������Ԫ˧д�Ÿ������ˣ�˵�ӷ�²���ɱ����еõ��˲��ϵ�����ȯ�����飬�鷳��ȥ�����ɣ�Ҳ���ܵõ�һЩ����ġ�
]]
x210308_g_MissionTarget="�ҵ����ϵ�������"
x210308_g_ContinueInfo="���ҵ����ϵ����������𣿿�ȥ�Ұɣ�"
x210308_g_MissionComplete="���������ˡ�"
x210308_g_MoneyBonus=12000

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210308_OnDefaultEvent( sceneId, selfId, targetId )

	--��������ɹ��������
  if( IsMissionHaveDone(sceneId,selfId,x210308_g_MissionId) > 0 ) then
  	return
	elseif( IsHaveMission(sceneId,selfId,x210308_g_MissionId) > 0)  then
		if GetName(sceneId, targetId) == x210308_g_Name then
			x210308_OnComplete( sceneId, selfId, targetId );
		else
			x210308_OnContinue( sceneId, selfId, targetId );
		end
    --���������������
	elseif x210308_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210308_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId);
				AddText(sceneId, x210308_g_MissionName);
				AddText(sceneId, x210308_g_MissionInfo);
				AddText(sceneId, "#{M_MUBIAO}");
				AddText(sceneId, x210308_g_MissionTarget);
			EndEvent( );
			DispatchMissionInfo(sceneId,selfId,targetId,x210308_g_ScriptId,x210308_g_MissionId)
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x210308_OnEnumerate( sceneId, selfId, targetId )
    --��������ɹ��������
    print("������1? check:" .. IsMissionHaveDone(sceneId,selfId,x210308_g_MissionId));
    if IsMissionHaveDone(sceneId,selfId,x210308_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x210308_g_MissionId) > 0 then
			AddNumText(sceneId, x210308_g_ScriptId, x210308_g_MissionName);
    elseif x210308_CheckAccept(sceneId,selfId) > 0 then --���������������
      print("������?");
			if GetName(sceneId,targetId) ~= x210308_g_Name then
				AddNumText(sceneId, x210308_g_ScriptId, x210308_g_MissionName);
			end
    end
end

--**********************************
--����������
--**********************************
function x210308_CheckAccept( sceneId, selfId )
	--��Ҫ2�����ܽ�
	if GetLevel( sceneId, selfId ) >= 15 and IsMissionHaveDone(sceneId, selfId, 467)==1 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210308_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId, selfId, x210308_g_MissionId, x210308_g_ScriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x210308_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210308_g_MissionId )
end

--**********************************
--����
--**********************************
function x210308_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
  BeginEvent(sceneId)
		AddText(sceneId, x210308_g_MissionName)
		AddText(sceneId, x210308_g_ContinueInfo)
  EndEvent( )
  DispatchMissionDemandInfo(sceneId, selfId, targetId, x210308_g_ScriptId, x210308_g_MissionId, 0);
end

--**********************************
--���
--**********************************
function x210308_OnComplete( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
  BeginEvent(sceneId)
		AddText(sceneId, x210308_g_MissionName)
		AddText(sceneId, x210308_g_MissionComplete)
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x210308_g_ScriptId,x210308_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210308_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x210308_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210308_CheckSubmit( sceneId, selfId, selectRadioId ) then
		--���������
		AddMoney(sceneId,selfId,x210308_g_MoneyBonus );
		DelMission( sceneId,selfId,  x210308_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId,  x210308_g_MissionId )
	end
end

--**********************************
--ɱ����������
--**********************************
function x210308_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210308_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210308_OnItemChanged( sceneId, selfId, itemdataId )
end
