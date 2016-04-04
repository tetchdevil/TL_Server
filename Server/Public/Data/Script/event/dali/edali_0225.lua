--��������
--����ʦѰ�Ҷ�����
--MisDescBegin
--�ű���
x210225_g_ScriptId = 210225

--�����
x210225_g_MissionId = 705

--��һ�������ID
x210225_g_MissionIdPre = 704

--Ŀ��NPC
x210225_g_Name	="������"

--�������
x210225_g_MissionKind = 13

--����ȼ�
x210225_g_MissionLevel = 9

--�Ƿ��Ǿ�Ӣ����
x210225_g_IfMissionElite = 0

--������
x210225_g_MissionName="���֣���֮��"
x210225_g_MissionInfo="�������϶����Ĵ����֮�׵Ķ�������Ϊ����ȥ�����ҳ�����"
x210225_g_MissionTarget="�ҵ�������[215,284]"
x210225_g_MissionComplete="��֪����Ķ��������ҵ������ӵ�ǰ�档## ����Ϊ�˴���������ĸ�ʾ���ģ�����Ϊ�������֣���ʵ�Ǽ����鰡����"
x210225_g_MoneyBonus=360
x210225_g_SignPost = {x = 215, z = 284, tip = "������"}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210225_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x210225_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x210225_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x210225_g_Name then
			x210225_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x210225_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210225_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x210225_g_MissionName)
				AddText(sceneId,x210225_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210225_g_MissionTarget)
				AddMoneyBonus( sceneId, x210225_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210225_g_ScriptId,x210225_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x210225_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x210225_g_MissionIdPre) <= 0 then
    	return
    end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210225_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x210225_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210225_g_Name then
			AddNumText(sceneId, x210225_g_ScriptId,x210225_g_MissionName,2,-1);
		end
    --���������������
    elseif x210225_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210225_g_Name then
			AddNumText(sceneId,x210225_g_ScriptId,x210225_g_MissionName,1,-1);
		end
    end
end

--**********************************
--����������
--**********************************
function x210225_CheckAccept( sceneId, selfId )
	--��Ҫ8�����ܽ�
	if GetLevel( sceneId, selfId ) >= 8 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210225_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210225_g_MissionId, x210225_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#Y����������֮��",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, SCENE_DALI, x210225_g_SignPost.x, x210225_g_SignPost.z, x210225_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x210225_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210225_g_MissionId )
end

--**********************************
--����
--**********************************
function x210225_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210225_g_MissionName)
		AddText(sceneId,x210225_g_MissionComplete)
		AddMoneyBonus( sceneId, x210225_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210225_g_ScriptId,x210225_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210225_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x210225_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210225_CheckSubmit( sceneId, selfId, selectRadioId ) then
		--���������
		AddMoney(sceneId,selfId,x210225_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,200)
		DelMission( sceneId,selfId,  x210225_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId,  x210225_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y���������֮��",MSG2PLAYER_PARA )
		CallScriptFunction( 210226, "OnDefaultEvent",sceneId, selfId, targetId)
	end
end

--**********************************
--ɱ����������
--**********************************
function x210225_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210225_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210225_OnItemChanged( sceneId, selfId, itemdataId )
end
