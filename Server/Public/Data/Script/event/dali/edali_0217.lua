--ɱ������
--Ϊ��Ϊ��
--���ִ�ɱ���籪��ɽ������
--MisDescBegin
--�ű���
x210217_g_ScriptId = 210217

--��һ�������ID
--g_MissionIdPre = 

--�����
x210217_g_MissionId = 457

--Ŀ��NPC
x210217_g_Name	="����ʦ"

--�������
x210217_g_MissionKind = 13

--����ȼ�
x210217_g_MissionLevel = 6

--�Ƿ��Ǿ�Ӣ����
x210217_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x210217_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������Ҫɱ���Ĺ�
x210217_g_DemandKill ={{id=1520,num=8},{id=1535,num=8}}		--������1λ

--�����Ƕ�̬**************************************************************

--�����ı�����
x210217_g_MissionName="���֣�������·"
x210217_g_MissionInfo="�����������������˵���˵�·�ϲ���ô̫ƽ���ر���������ɽ���������籪��ɽ��Ϯ�����˵��ˣ���ȥ������ɱ8ֻ���籪��ɽ�������ҽ��"
x210217_g_MissionTarget="ȥ����ɽɱ��8�����籪[6,186,133]��8��ɽ��[6,166,181]"
x210217_g_ContinueInfo="������������"
x210217_g_MissionComplete="���ĺã������ˣ����Ǹ���Ľ�����"
x210217_g_SignPost = {x = 160, z = 141, tip = "����ʦ"}
--������
x210217_g_MoneyBonus=100
x210217_g_ItemBonus={{id=40002108,num=1},{id=10113000,num=1}}

--MisDescEnd

x210217_g_DemandTrueKill ={{name="���籪",num=8},{name="ɽ��",num=8}}	

--**********************************
--������ں���
--**********************************
function x210217_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x210217_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x210217_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x210217_g_MissionName)
			AddText(sceneId,x210217_g_ContinueInfo)
			--for i, item in g_DemandItem do
			--	AddItemDemand( sceneId, item.id, item.num )
			--end
			AddMoneyBonus( sceneId, x210217_g_MoneyBonus )
		EndEvent( )
		bDone = x210217_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x210217_g_ScriptId,x210217_g_MissionId,bDone)		
    --���������������
    elseif x210217_CheckAccept(sceneId,selfId) > 0 then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x210217_g_MissionName)
				AddText(sceneId,x210217_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210217_g_MissionTarget)
				for i, item in x210217_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
				AddMoneyBonus( sceneId, x210217_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210217_g_ScriptId,x210217_g_MissionId)
    end
end

--**********************************
--�о��¼�
--**********************************
function x210217_OnEnumerate( sceneId, selfId, targetId )
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210217_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    if IsHaveMission(sceneId,selfId,x210217_g_MissionId) > 0 then
			AddNumText(sceneId,x210217_g_ScriptId,x210217_g_MissionName,2,-1);
		--���������������
	elseif x210217_CheckAccept(sceneId,selfId) > 0 then
			AddNumText(sceneId,x210217_g_ScriptId,x210217_g_MissionName,1,-1);
	end
end

--**********************************
--����������
--**********************************
function x210217_CheckAccept( sceneId, selfId )
	--��Ҫ6�����ܽ�
	if GetLevel( sceneId, selfId ) >= 6 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210217_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210217_g_MissionId, x210217_g_ScriptId, 1, 0, 0 )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x210217_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,2,0)						--�������кŰ���������ĵ�2λ��0
	Msg2Player(  sceneId, selfId,"#Y�������񣺱�����·",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, SCENE_DALI, x210217_g_SignPost.x, x210217_g_SignPost.z, x210217_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x210217_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210217_g_MissionId )
end

--**********************************
--����
--**********************************
function x210217_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210217_g_MissionName)
		AddText(sceneId,x210217_g_MissionComplete)
		AddMoneyBonus( sceneId, x210217_g_MoneyBonus )
		for i, item in x210217_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210217_g_ScriptId,x210217_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210217_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x210217_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,0)
    if num == 1 then
		return 1
	end
	return 0
end

--**********************************
--�ύ
--**********************************
function x210217_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x210217_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
			for i, item in x210217_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
		ret = EndAddItem(sceneId,selfId)
		--���������
	if ret > 0 then
			AddMoney(sceneId,selfId,x210217_g_MoneyBonus );
			LuaFnAddExp( sceneId, selfId,1000)
			--�۳�������Ʒ
			--for i, item in g_DemandItem do
			--	DelItem( sceneId, selfId, item.id, item.num )
			--end
		ret = DelMission( sceneId, selfId, x210217_g_MissionId )
		if ret > 0 then
			MissionCom( sceneId, selfId, x210217_g_MissionId )
				AddItemListToHuman(sceneId,selfId)
				Msg2Player(  sceneId, selfId,"#Y������񣺱�����·",MSG2PLAYER_PARA )
			end
		else
		--������û�мӳɹ�
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
function x210217_OnKillObject( sceneId, selfId, objdataId ,objId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x210217_g_MissionId)
	num_1 = GetMissionParam(sceneId,selfId,misIndex,1)
	num_2 = GetMissionParam(sceneId,selfId,misIndex,2)
	if GetName(sceneId,objId) == x210217_g_DemandTrueKill[1].name	  then
		if num_1 < x210217_g_DemandTrueKill[1].num then
			--���ô������+1
			SetMissionByIndex(sceneId,selfId,misIndex,1,num_1+1)
	  		BeginEvent(sceneId)
				strText = format("��ɱ�����籪%d/8", GetMissionParam(sceneId,selfId,misIndex,1) )
				AddText(sceneId,strText);
	  		EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			num_1 = GetMissionParam(sceneId,selfId,misIndex,1)
			num_2 = GetMissionParam(sceneId,selfId,misIndex,2)
			if	num_1 == x210217_g_DemandTrueKill[1].num	and	num_2 == x210217_g_DemandTrueKill[2].num	then
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			end
		end
	elseif	GetName(sceneId,objId) == x210217_g_DemandTrueKill[2].name	  then
		if num_2 < x210217_g_DemandTrueKill[2].num then
			--���ô������+1
			SetMissionByIndex(sceneId,selfId,misIndex,2,num_2+1)
	  		BeginEvent(sceneId)
				strText = format("��ɱ��ɽ��%d/8", GetMissionParam(sceneId,selfId,misIndex,2) )
				AddText(sceneId,strText);
	  		EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			num_1 = GetMissionParam(sceneId,selfId,misIndex,1)
			num_2 = GetMissionParam(sceneId,selfId,misIndex,2)
			if	num_1 == x210217_g_DemandTrueKill[1].num	and	num_2 == x210217_g_DemandTrueKill[2].num	then
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			end
		end
	end
end

--**********************************
--���������¼�
--**********************************
function x210217_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210217_OnItemChanged( sceneId, selfId, itemdataId )
end
