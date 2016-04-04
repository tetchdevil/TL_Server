--��������
--����ʦѰ����ƮƮ
--MisDescBegin
--�ű���
x210214_g_ScriptId = 210214

--�����
x210214_g_MissionId = 454

--��һ�������ID
--g_MissionIdPre = 

--Ŀ��NPC
x210214_g_Name	="��ƮƮ"

--�������
x210214_g_MissionKind = 13

--����ȼ�
x210214_g_MissionLevel = 5

--�Ƿ��Ǿ�Ӣ����
x210214_g_IfMissionElite = 0

--������
x210214_g_MissionName="���֣���������"
x210214_g_MissionInfo="����һ����Ҳ����Ȥ�ģ����Ҹ����������ĵط��ɣ�ȥ�ҳ��񷻷�����ƮƮ������̸���һЩ�ر�Ķ����ġ�"
x210214_g_MissionTarget="ȥ��һ����ƮƮ[265,128]������"
x210214_g_MissionComplete="�ҵ����豾�¿ɲ�����㴫��һ����ˣ���Ȼ��������ʦ�Ƽ����ģ��ǿ϶����츳����֮�ˣ��ҾͰ�������ļ��ܴ��ڸ���"
x210214_g_MoneyBonus=360
x210214_g_SignPost = {x = 263, z = 129, tip = "��ƮƮ"}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210214_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x210214_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x210214_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x210214_g_Name then
			x210214_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x210214_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210214_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x210214_g_MissionName)
				AddText(sceneId,x210214_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210214_g_MissionTarget)
				AddMoneyBonus( sceneId, x210214_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210214_g_ScriptId,x210214_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x210214_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    --if 	IsMissionHaveDone(sceneId,selfId,g_MissionIdPre) <= 0 then
    --	return
    --end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210214_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x210214_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210214_g_Name then
			AddNumText(sceneId, x210214_g_ScriptId,x210214_g_MissionName,2,-1);
		end
    --���������������
    elseif x210214_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210214_g_Name then
			AddNumText(sceneId,x210214_g_ScriptId,x210214_g_MissionName,1,-1);
		end
    end
end

--**********************************
--����������
--**********************************
function x210214_CheckAccept( sceneId, selfId )
	--��Ҫ5�����ܽ�
	if GetLevel( sceneId, selfId ) >= 5 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210214_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210214_g_MissionId, x210214_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#Y����������������",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, SCENE_DALI, x210214_g_SignPost.x, x210214_g_SignPost.z, x210214_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x210214_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210214_g_MissionId )
end

--**********************************
--����
--**********************************
function x210214_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210214_g_MissionName)
		AddText(sceneId,x210214_g_MissionComplete)
		AddMoneyBonus( sceneId, x210214_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210214_g_ScriptId,x210214_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210214_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x210214_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210214_CheckSubmit( sceneId, selfId, selectRadioId ) then
		--���������
		AddMoney(sceneId,selfId,x210214_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,300)
		DelMission( sceneId,selfId,  x210214_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId,  x210214_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y���������������",MSG2PLAYER_PARA )
		CallScriptFunction( 210215, "OnDefaultEvent",sceneId, selfId, targetId)
	end
end

--**********************************
--ɱ����������
--**********************************
function x210214_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210214_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210214_OnItemChanged( sceneId, selfId, itemdataId )
end
