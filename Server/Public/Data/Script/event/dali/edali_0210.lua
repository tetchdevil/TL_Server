--��������
--����ʦѰ�����ү
--MisDescBegin
--�ű���
x210210_g_ScriptId = 210210

--�����
x210210_g_MissionId = 450

--��һ�������ID
--g_MissionIdPre = 

--Ŀ��NPC
x210210_g_Name	="���ү"

--�������
x210210_g_MissionKind = 13

--����ȼ�
x210210_g_MissionLevel = 3

--�Ƿ��Ǿ�Ӣ����
x210210_g_IfMissionElite = 0

--������
x210210_g_MissionName="���֣��ټ�����"
x210210_g_MissionInfo="ȥ��һ�����ү[172,131]�����ڡ�"
x210210_g_MissionTarget="�ҵ����ү[172,131]"
x210210_g_MissionComplete="�ҵ���þ��ˣ����������˰�����ȥһ���̶��ĵط��ͷ��̻����ҵ��Ŵ����ɵ�ͬ�顣"
x210210_g_MoneyBonus=360
x210210_g_SignPost = {x = 172, z = 131, tip = "���ү"}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210210_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x210210_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x210210_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x210210_g_Name then
			x210210_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x210210_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210210_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x210210_g_MissionName)
				AddText(sceneId,x210210_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210210_g_MissionTarget)
				AddMoneyBonus( sceneId, x210210_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210210_g_ScriptId,x210210_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x210210_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    --if 	IsMissionHaveDone(sceneId,selfId,g_MissionIdPre) <= 0 then
    --	return
    --end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210210_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x210210_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210210_g_Name then
			AddNumText(sceneId, x210210_g_ScriptId,x210210_g_MissionName,2,-1);
		end
    --���������������
    elseif x210210_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210210_g_Name then
			AddNumText(sceneId,x210210_g_ScriptId,x210210_g_MissionName,1,-1);
		end
    end
end

--**********************************
--����������
--**********************************
function x210210_CheckAccept( sceneId, selfId )
	--��Ҫ3�����ܽ�
	if GetLevel( sceneId, selfId ) >= 3 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210210_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210210_g_MissionId, x210210_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#Y���������ټ�����",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, SCENE_DALI, x210210_g_SignPost.x, x210210_g_SignPost.z, x210210_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x210210_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210210_g_MissionId )
end

--**********************************
--����
--**********************************
function x210210_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210210_g_MissionName)
		AddText(sceneId,x210210_g_MissionComplete)
		AddMoneyBonus( sceneId, x210210_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210210_g_ScriptId,x210210_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210210_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x210210_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210210_CheckSubmit( sceneId, selfId, selectRadioId ) then
		--���������
		AddMoney(sceneId,selfId,x210210_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,200)
		DelMission( sceneId,selfId,  x210210_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId,  x210210_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y��������ټ�����",MSG2PLAYER_PARA )
		CallScriptFunction( 210211, "OnDefaultEvent",sceneId, selfId, targetId)
	end
end

--**********************************
--ɱ����������
--**********************************
function x210210_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210210_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210210_OnItemChanged( sceneId, selfId, itemdataId )
end
