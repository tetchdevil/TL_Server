--�ʴ�����
--Ǯ��Ҫ���������12������
--MisDescBegin
--�ű���
x210207_g_ScriptId = 210207

--�����
x210207_g_MissionId = 447

--��һ�������ID
x210207_g_MissionIdPre = 445

--Ŀ��NPC
x210207_g_Name	="Ǯ��"

--������߱��
--g_ItemId = 20101001

--���������������
--g_ItemNeedNum = 1

--�������
x210207_g_MissionKind = 13

--����ȼ�
x210207_g_MissionLevel = 2

--�Ƿ��Ǿ�Ӣ����
x210207_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x210207_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

--������
x210207_g_MissionName="���֣������ʴ�"
x210207_g_MissionInfo="������ʦҪ�������ҵİɣ�����������������Ĳ���Ρ�## ֻҪ�������������12������������������н�ƷŶ��"
x210207_g_MissionTarget="���12������"
x210207_g_MissionComplete="������˰���������"
x210207_g_MoneyBonus=240
x210207_g_SignPost = {x = 149, z = 132, tip = "Ǯ��"}
x210207_g_ItemBonus={{id=10110000,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210207_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x210207_g_MissionId) > 0 then
	--	return
	--end
    --����ѽӴ�����
		if IsHaveMission(sceneId,selfId,x210207_g_MissionId) > 0 then
			misIndex = GetMissionIndexByID(sceneId,selfId,x210207_g_MissionId)
			num = GetMissionParam(sceneId,selfId,misIndex,1)
			if num < 1 then
				CallScriptFunction( 311100, "OnDefaultEvent",sceneId, selfId, targetId )
			else
				--���������������Ϣ
				BeginEvent(sceneId)
				AddText(sceneId,x210207_g_MissionName)
				AddText(sceneId,x210207_g_MissionComplete)
				AddMoneyBonus( sceneId, x210207_g_MoneyBonus )
				EndEvent( )
				bDone = x210207_CheckSubmit( sceneId, selfId )
				DispatchMissionDemandInfo(sceneId,selfId,targetId,x210207_g_ScriptId,x210207_g_MissionId,bDone)
			end
		--���������������
		elseif x210207_CheckAccept(sceneId,selfId) > 0 then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x210207_g_MissionName)
				AddText(sceneId,x210207_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210207_g_MissionTarget)
				for i, item in x210207_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
				AddMoneyBonus( sceneId, x210207_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210207_g_ScriptId,x210207_g_MissionId)
		end
end

--**********************************
--�о��¼�
--**********************************
function x210207_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x210207_g_MissionIdPre) <= 0 then
    	return
    end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210207_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x210207_g_MissionId) > 0 then
		AddNumText(sceneId,x210207_g_ScriptId,x210207_g_MissionName,2,-1);
	--���������������
	elseif x210207_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x210207_g_ScriptId,x210207_g_MissionName,1,-1);
	end
end

--**********************************
--����������
--**********************************
function x210207_CheckAccept( sceneId, selfId )
	--��Ҫ1�����ܽ�
	if GetLevel( sceneId, selfId ) >= 2 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210207_OnAccept( sceneId, selfId, targetId )
	--������������б�
	AddMission( sceneId,selfId, x210207_g_MissionId, x210207_g_ScriptId, 0, 0, 0 )
	CallScriptFunction( 311100, "OnDefaultEvent",sceneId, selfId, targetId )
	Msg2Player(  sceneId, selfId,"#Y�������������ʴ�",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, SCENE_DALI, x210207_g_SignPost.x, x210207_g_SignPost.z, x210207_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x210207_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210207_g_MissionId )
end

--**********************************
--����
--**********************************
function x210207_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210207_g_MissionName)
		AddText(sceneId,x210207_g_MissionComplete)
		AddMoneyBonus( sceneId, x210207_g_MoneyBonus )
		for i, item in x210207_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210207_g_ScriptId,x210207_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210207_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x210207_g_MissionId)
	num = GetMissionParam(sceneId,selfId,misIndex,1)
	if num < 1 then
		return 0
	else
		return 1
	end
end

--**********************************
--�ύ
--**********************************
function x210207_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210207_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
			for i, item in x210207_g_ItemBonus do
				AddItem( sceneId, item.id, item.num )
			end
		ret = EndAddItem(sceneId,selfId)
		if ret > 0 then
			AddMoney(sceneId,selfId,x210207_g_MoneyBonus );
			LuaFnAddExp(sceneId, selfId,150)
			ret = DelMission( sceneId, selfId, x210207_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId, selfId, x210207_g_MissionId )
				AddItemListToHuman(sceneId,selfId)
				Msg2Player(  sceneId, selfId,"#Y������������ʴ�",MSG2PLAYER_PARA )
				CallScriptFunction( 210208, "OnDefaultEvent",sceneId, selfId, targetId)
			end
		else
			BeginEvent(sceneId)
				strText = "��������,�޷��������"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x210207_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210207_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210207_OnItemChanged( sceneId, selfId, itemdataId )
end
