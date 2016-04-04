--��������
--����ʦѰ����ƮƮ
--MisDescBegin
--�ű���
x210220_g_ScriptId = 210220

--�����
x210220_g_MissionId = 700

--��һ�������ID
--g_MissionIdPre = 

--Ŀ��NPC
x210220_g_Name	="��ƮƮ"

--�������
x210220_g_MissionKind = 13

--����ȼ�
x210220_g_MissionLevel = 7

--�Ƿ��Ǿ�Ӣ����
x210220_g_IfMissionElite = 0

--������
x210220_g_MissionName="���֣���׽����"
x210220_g_MissionInfo="������·���벻��Ҫһ���ɰ���С�һ������㣿ȥ���񷻷�����ƮƮ���￴���ɡ�"
x210220_g_MissionTarget="ȥ��һ����ƮƮ[265,128]��׽��"
x210220_g_MissionComplete="�ҵ���þ��ˣ����ھͽ̸�����ô��׽���"
x210220_g_MoneyBonus=360
x210220_g_SignPost = {x = 263, z = 129, tip = "��ƮƮ"}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210220_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x210220_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x210220_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x210220_g_Name then
			x210220_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x210220_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210220_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x210220_g_MissionName)
				AddText(sceneId,x210220_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210220_g_MissionTarget)
				AddMoneyBonus( sceneId, x210220_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210220_g_ScriptId,x210220_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x210220_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    --if 	IsMissionHaveDone(sceneId,selfId,g_MissionIdPre) <= 0 then
    --	return
    --end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210220_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x210220_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210220_g_Name then
			AddNumText(sceneId, x210220_g_ScriptId,x210220_g_MissionName,2,-1);
		end
    --���������������
    elseif x210220_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210220_g_Name then
			AddNumText(sceneId,x210220_g_ScriptId,x210220_g_MissionName,1,-1);
		end
    end
end

--**********************************
--����������
--**********************************
function x210220_CheckAccept( sceneId, selfId )
	--��Ҫ7�����ܽ�
	if GetLevel( sceneId, selfId ) >= 7 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210220_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210220_g_MissionId, x210220_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#Y�������񣺲�׽����",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, SCENE_DALI, x210220_g_SignPost.x, x210220_g_SignPost.z, x210220_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x210220_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210220_g_MissionId )
end

--**********************************
--����
--**********************************
function x210220_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210220_g_MissionName)
		AddText(sceneId,x210220_g_MissionComplete)
		AddMoneyBonus( sceneId, x210220_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210220_g_ScriptId,x210220_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210220_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x210220_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210220_CheckSubmit( sceneId, selfId, selectRadioId ) then
		--���������
		AddMoney(sceneId,selfId,x210220_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,300)
		DelMission( sceneId,selfId,  x210220_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId,  x210220_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y������񣺲�׽����",MSG2PLAYER_PARA )
		CallScriptFunction( 210221, "OnDefaultEvent",sceneId, selfId, targetId)
	end
end

--**********************************
--ɱ����������
--**********************************
function x210220_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210220_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210220_OnItemChanged( sceneId, selfId, itemdataId )
end
