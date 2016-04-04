--ѭ������
--�ټ�ͬ��
--************************************************************************
--MisDescBegin
--�ű���
x210211_g_ScriptId = 210211

--��һ�������ID
x210211_g_MissionIdPre =450

--�����
x210211_g_MissionId = 451

--����Ŀ��npc
x210211_g_Name	="���ү" 

x210211_g_ItemId	=40002107

--�������
x210211_g_MissionKind = 13

--����ȼ�
x210211_g_MissionLevel = 3

--�Ƿ��Ǿ�Ӣ����
x210211_g_IfMissionElite = 0

--********���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������******
x210211_g_IsMissionOkFail = 0					--�����ĵ�0λ
--**********************************�����Ƕ�̬****************************


--�����ı�����
x210211_g_MissionName="���֣��ټ�����"
x210211_g_MissionInfo="�Ŵ����ɵĸ���������һЩʦ�ֵ��������������ִ����������������˵�ͨѶ�����������ģ���ֻҪȥ����̨�ϣ���һ�����ʵĵط�����ȼ�����Ѷ���Ϳ����ˡ�"  --��������
x210211_g_MissionTarget="������̨���ͷŴ�Ѷ���"		--����Ŀ��
x210211_g_ContinueInfo="������"		--δ��������npc�Ի�
x210211_g_MissionComplete="�ɵĲ���"					--�������npc˵���Ļ�
x210211_g_ItemBonus={{id=10111000,num=1}}
x210211_g_SignPost = {x = 172, z = 131, tip = "���ү"}
x210211_g_MoneyBonus=360

--MisDescEnd
--************************************************************************

--��ɫMission����˵��
--0�ţ�����״̬
--1�ţ�
--2�ţ����ڳ������
--3�ţ�ָ��x����
--4�ţ�ָ��z����
--5�ţ�δ��
--6�ţ�δ��
--7�ţ�δ��

--����λ��
x210211_g_TreasureAddress = {	{scene=2,x=104,z=221},
						{scene=2,x=104,z=201},
--						{scene=2,x=242,z=55},
--						{scene=2,x=202,z=237},
--						{scene=2,x=255,z=232},
--						{scene=2,x=82,z=220},
--						{scene=2,x=46,z=255},
--						{scene=2,x=44,z=151},
						{scene=2,x=79,z=222}}

--**********************************
--������ں���
--**********************************
function x210211_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	if IsHaveMission(sceneId,selfId,x210211_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x210211_g_MissionName)
			AddText(sceneId,x210211_g_ContinueInfo)
			AddMoneyBonus( sceneId, x210211_g_MoneyBonus )
		EndEvent( )
		bDone = x210211_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x210211_g_ScriptId,x210211_g_MissionId,bDone)
	--���������������
	elseif x210211_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x210211_g_MissionName)
			AddText(sceneId,x210211_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x210211_g_MissionTarget)
			for i, item in x210211_g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
			AddMoneyBonus( sceneId, x210211_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x210211_g_ScriptId,x210211_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x210211_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x210211_g_MissionIdPre) <= 0 then
    	return
    end
	if IsMissionHaveDone(sceneId,selfId,x210211_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x210211_g_MissionId) > 0 then
		AddNumText(sceneId,x210211_g_ScriptId,x210211_g_MissionName,2,-1);
    --���������������
    elseif x210211_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x210211_g_ScriptId,x210211_g_MissionName,1,-1);
    end
end

--**********************************
--����������
--**********************************
function x210211_CheckAccept( sceneId, selfId )
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
function x210211_OnAccept( sceneId, selfId )

	if x210211_CheckAccept(sceneId, selfId )<=0 then
		return
	end
	
	x210211_g_sequence = random(3)					--���ݱ���ص��������һ�������
	SceneNum = x210211_g_TreasureAddress[x210211_g_sequence].scene
	X		 = x210211_g_TreasureAddress[x210211_g_sequence].x
	Z		 = x210211_g_TreasureAddress[x210211_g_sequence].z
	--����̻�
	BeginAddItem(sceneId)
		ret = AddItem( sceneId,x210211_g_ItemId, 1 )
	EndAddItem(sceneId,selfId)
	--������������б�
	ret = AddMission( sceneId,selfId, x210211_g_MissionId, x210211_g_ScriptId, 0, 0, 1 )

	--���������������ĳ�����ź�����λ��
	misIndex = GetMissionIndexByID(sceneId,selfId,x210211_g_MissionId)		--�õ�������20�������е����к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)					--�������кŰ���������ĵ�һλ��0	��һλ�����/ʧ�����
	SetMissionByIndex(sceneId,selfId,misIndex,2,SceneNum)			--�ѵ���λ��Ϊ����ĳ������
	SetMissionByIndex(sceneId,selfId,misIndex,3,X)					--�ѵ���λ��Ϊ�����X����
	SetMissionByIndex(sceneId,selfId,misIndex,4,Z)					--�ѵ���λ��Ϊ�����Z����
	
	AddItemListToHuman(sceneId,selfId)
	Msg2Player(  sceneId, selfId,"#Y���������ټ�����",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, SCENE_DALI, x210211_g_SignPost.x, x210211_g_SignPost.z, x210211_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x210211_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    res = DelMission( sceneId, selfId, x210211_g_MissionId )
	if res > 0 then
		--��ȥ������Ʒ
		DelItem( sceneId, selfId, x210211_g_ItemId, 1 )
	end
end

--**********************************
--����
--**********************************
function x210211_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210211_g_MissionName)
		AddText(sceneId,x210211_g_MissionComplete)
		AddMoneyBonus( sceneId, x210211_g_MoneyBonus )
		for i, item in x210211_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210211_g_ScriptId,x210211_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210211_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x210211_g_MissionId)
	x210211_g_MissionCondition = GetMissionParam(sceneId,selfId,misIndex,0)		--�������״̬
	if	x210211_g_MissionCondition>=1	then
		return	1
	else
		return	0
	end
end

--**********************************
--�ύ
--**********************************
function x210211_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x210211_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
			for i, item in x210211_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
		ret = EndAddItem(sceneId,selfId)
		--���������
			if ret > 0 then
					AddMoney(sceneId,selfId,x210211_g_MoneyBonus );
					LuaFnAddExp( sceneId, selfId,200)
					ret = DelMission( sceneId, selfId, x210211_g_MissionId )
				if ret > 0 then
					MissionCom( sceneId, selfId, x210211_g_MissionId )
					AddItemListToHuman(sceneId,selfId)
					Msg2Player(  sceneId, selfId,"#Y��������ټ�����",MSG2PLAYER_PARA )
					CallScriptFunction( 210212, "OnDefaultEvent",sceneId, selfId, targetId)
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
function x210211_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210211_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210211_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--����ʹ��
--**********************************
function x210211_OnUseItem( sceneId, selfId, targetId, eventId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x210211_g_MissionId)
	x210211_g_MissionCondition = GetMissionParam(sceneId,selfId,misIndex,0)		--�������״̬
	scene = GetMissionParam(sceneId,selfId,misIndex,2)					--��ñ��ﳡ����
	treasureX = GetMissionParam(sceneId,selfId,misIndex,3)				--��ñ���X����
	treasureZ = GetMissionParam(sceneId,selfId,misIndex,4)				--��ñ���Z����	
	--��������Ѿ����
	if x210211_g_MissionCondition == 1 then
		BeginEvent(sceneId)
			AddText(sceneId,"ʩ�Ŵ�Ѷ���ɹ�")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	--ȡ����ҵ�ǰ����
	PlayerX = GetHumanWorldX(sceneId,selfId)
	PlayerZ = GetHumanWorldZ(sceneId,selfId)
	--��������뱦�صľ���
	Distance = floor(sqrt((treasureX-PlayerX)*(treasureX-PlayerX)+(treasureZ-PlayerZ)*(treasureZ-PlayerZ)))
	if sceneId ~= scene then
		BeginEvent(sceneId)
			AddText(sceneId,"�ƺ��������������ʩ�Ŵ�Ѷ���")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	if Distance > 2 then
		BeginEvent(sceneId)
			AddText(sceneId,"����ʩ�Ŵ�Ѷ���ĵط�����"..Distance.."��")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	elseif Distance <= 2 then
		SetMissionByIndex(sceneId,selfId,misIndex,0,1)		--������״̬��������Ϊ1,��ʾ�Ѿ����
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, SCENE_DALI, x210211_g_SignPost.x, x210211_g_SignPost.z, x210211_g_SignPost.tip )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 4820, 0);
		BeginEvent(sceneId)
			AddText(sceneId,"�������ɵ�������Ѷ�׷׸���")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		DelItem( sceneId, selfId, x210211_g_ItemId, 1 )
	end
end
