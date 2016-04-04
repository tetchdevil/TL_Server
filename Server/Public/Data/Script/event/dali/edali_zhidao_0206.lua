--Ѱ������
--Ǯ��Ҫ������ҵ�һ����ͷ
--MisDescBegin
--�ű���
x210206_g_ScriptId = 210206

--�����
x210206_g_MissionId = 446

--��һ�������ID
x210206_g_MissionIdPre = 445

--Ŀ��NPC
x210206_g_Name	="Ǯ��"

--������߱��
x210206_g_ItemId = 30101001

--���������������
x210206_g_ItemNeedNum = 2

--�������
x210206_g_MissionKind = 13

--����ȼ�
x210206_g_MissionLevel = 2

--�Ƿ��Ǿ�Ӣ����
x210206_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x210206_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

--������Ҫ�õ�����Ʒ
x210206_g_DemandItem={{id=30101001,num=1}}		--������1λ

--������
x210206_g_MissionName="���֣������ʴ�"
x210206_g_MissionInfo="������һ����ͷ�����ҿ�����ļ�������"
x210206_g_MissionTarget="����ͷ�͸�Ǯ��"
x210206_g_MissionComplete="����������"
x210206_g_MoneyBonus=240
x210206_g_SignPost = {x = 149, z = 132, tip = "Ǯ��"}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210206_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x210206_g_MissionId) > 0 then
	--	return
	--end
    --����ѽӴ�����
		if IsHaveMission(sceneId,selfId,x210206_g_MissionId) > 0 then
			--���������������Ϣ
			BeginEvent(sceneId)
			AddText(sceneId,x210206_g_MissionName)
			AddText(sceneId,x210206_g_MissionComplete)
			for i, item in x210206_g_DemandItem do
				AddItemDemand( sceneId, item.id, item.num )
			end
			AddMoneyBonus( sceneId, x210206_g_MoneyBonus )
			EndEvent( )
			bDone = x210206_CheckSubmit( sceneId, selfId )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x210206_g_ScriptId,x210206_g_MissionId,bDone)
		--���������������
		elseif x210206_CheckAccept(sceneId,selfId) > 0 then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x210206_g_MissionName)
				AddText(sceneId,x210206_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210206_g_MissionTarget)
				AddMoneyBonus( sceneId, x210206_g_MoneyBonus )
				--for i, item in g_ItemBonus do
				--	AddItemBonus( sceneId, item.id, item.num )
				--end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210206_g_ScriptId,x210206_g_MissionId)
		end
end

--**********************************
--�о��¼�
--**********************************
function x210206_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x210206_g_MissionIdPre) <= 0 then
    	return
    end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210206_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x210206_g_MissionId) > 0 then
		AddNumText(sceneId,x210206_g_ScriptId,x210206_g_MissionName,2,-1);
	--���������������
	elseif x210206_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x210206_g_ScriptId,x210206_g_MissionName,1,-1);
	end
end

--**********************************
--����������
--**********************************
function x210206_CheckAccept( sceneId, selfId )
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
function x210206_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210206_g_MissionId, x210206_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#Y�������������ʴ�",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, SCENE_DALI, x210206_g_SignPost.x, x210206_g_SignPost.z, x210206_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x210206_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210206_g_MissionId )
end

--**********************************
--����
--**********************************
function x210206_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210206_g_MissionName)
		AddText(sceneId,x210206_g_MissionComplete)
		AddMoneyBonus( sceneId, x210206_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210206_g_ScriptId,x210206_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210206_CheckSubmit( sceneId, selfId )
	for i, item in x210206_g_DemandItem do
		itemCount = GetItemCount( sceneId, selfId, item.id )
		if itemCount < item.num then
			return 0
		end
	end
	return 1
end

--**********************************
--�ύ
--**********************************
function x210206_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210206_CheckSubmit( sceneId, selfId, selectRadioId ) then
		AddMoney(sceneId,selfId,x210206_g_MoneyBonus );
		LuaFnAddExp(sceneId, selfId,90)
		ret = DelMission( sceneId, selfId, x210206_g_MissionId )
		if ret > 0 then
			MissionCom( sceneId, selfId, x210206_g_MissionId )
			--�۳�������Ʒ
			for i, item in x210206_g_DemandItem do
				DelItem( sceneId, selfId, item.id, item.num )
			end
			Msg2Player(  sceneId, selfId,"#Y������������ʴ�",MSG2PLAYER_PARA )
			CallScriptFunction( 210207, "OnDefaultEvent",sceneId, selfId, targetId)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x210206_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210206_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210206_OnItemChanged( sceneId, selfId, itemdataId )
end
