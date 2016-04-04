--ɱ������
--�������
--���ִ�ɱ�����Գ����
--MisDescBegin
--�ű���
x210213_g_ScriptId = 210213

--��һ�������ID
--g_MissionIdPre = 

--�����
x210213_g_MissionId = 453

--Ŀ��NPC
x210213_g_Name	="����ʦ"

--�������
x210213_g_MissionKind = 13

--����ȼ�
x210213_g_MissionLevel = 4

--�Ƿ��Ǿ�Ӣ����
x210213_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x210213_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������Ҫɱ���Ĺ�
x210213_g_DemandKill ={{id=1510,num=8}}		--������1λ

--�����Ƕ�̬**************************************************************

--�����ı�����
x210213_g_MissionName="���֣��������"
x210213_g_MissionInfo="����������Գ����Ϯ��·�ˣ���ȥ����ĺ�Գ̲ɱ��8ֻ����ѵһ�����ǡ�"
x210213_g_MissionTarget="ɱ��8ֻ�����Գ������[7,46,156]"
x210213_g_ContinueInfo="������������"
x210213_g_MissionComplete="���ĺã������ˣ����Ǹ���Ľ�����"
x210213_g_SignPost = {x = 160, z = 141, tip = "����ʦ"}
--������
x210213_g_MoneyBonus=1000
x210213_g_ItemBonus={{id=40002108,num=1},{id=10112000,num=1}}

x210213_g_DemandTrueKill ={{name="�����Գ",num=8}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210213_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x210213_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x210213_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x210213_g_MissionName)
			AddText(sceneId,x210213_g_ContinueInfo)
			--for i, item in g_DemandItem do
			--	AddItemDemand( sceneId, item.id, item.num )
			--end
			AddMoneyBonus( sceneId, x210213_g_MoneyBonus )
		EndEvent( )
		bDone = x210213_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x210213_g_ScriptId,x210213_g_MissionId,bDone)		
    --���������������
    elseif x210213_CheckAccept(sceneId,selfId) > 0 then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x210213_g_MissionName)
				AddText(sceneId,x210213_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210213_g_MissionTarget)
				for i, item in x210213_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
				AddMoneyBonus( sceneId, x210213_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210213_g_ScriptId,x210213_g_MissionId)
    end
end

--**********************************
--�о��¼�
--**********************************
function x210213_OnEnumerate( sceneId, selfId, targetId )
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210213_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    if IsHaveMission(sceneId,selfId,x210213_g_MissionId) > 0 then
		AddNumText(sceneId,x210213_g_ScriptId,x210213_g_MissionName,2,-1);
		--���������������
	elseif x210213_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x210213_g_ScriptId,x210213_g_MissionName,1,-1);
	end
end

--**********************************
--����������
--**********************************
function x210213_CheckAccept( sceneId, selfId )
	--��Ҫ4�����ܽ�
	if GetLevel( sceneId, selfId ) >= 4 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210213_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210213_g_MissionId, x210213_g_ScriptId, 1, 0, 0 )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x210213_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0
	Msg2Player(  sceneId, selfId,"#Y�������񣺿������",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, SCENE_DALI, x210213_g_SignPost.x, x210213_g_SignPost.z, x210213_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x210213_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210213_g_MissionId )
end

--**********************************
--����
--**********************************
function x210213_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210213_g_MissionName)
		AddText(sceneId,x210213_g_MissionComplete)
		AddMoneyBonus( sceneId, x210213_g_MoneyBonus )
		for i, item in x210213_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210213_g_ScriptId,x210213_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210213_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x210213_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,1)
    if num == x210213_g_DemandTrueKill[1].num then
			return 1
		end
	return 0
end

--**********************************
--�ύ
--**********************************
function x210213_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x210213_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
			for i, item in x210213_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
		ret = EndAddItem(sceneId,selfId)
		--���������
	if ret > 0 then
			AddMoney(sceneId,selfId,x210213_g_MoneyBonus );
			LuaFnAddExp( sceneId, selfId,700)
			--�۳�������Ʒ
			--for i, item in g_DemandItem do
			--	DelItem( sceneId, selfId, item.id, item.num )
			--end
		ret = DelMission( sceneId, selfId, x210213_g_MissionId )
		if ret > 0 then
			MissionCom( sceneId, selfId, x210213_g_MissionId )
				AddItemListToHuman(sceneId,selfId)
				Msg2Player(  sceneId, selfId,"#Y������񣺿������",MSG2PLAYER_PARA )
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
function x210213_OnKillObject( sceneId, selfId, objdataId ,objId)
 if GetName(sceneId,objId) == x210213_g_DemandTrueKill[1].name	  then
		misIndex = GetMissionIndexByID(sceneId,selfId,x210213_g_MissionId)
		num = GetMissionParam(sceneId,selfId,misIndex,1)
	  if num < x210213_g_DemandTrueKill[1].num then
		--��������ɱ�־����Ϊ1
		if num == x210213_g_DemandTrueKill[1].num - 1 then
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
		end
		--���ô������+1
	    SetMissionByIndex(sceneId,selfId,misIndex,1,num+1)
	  	BeginEvent(sceneId)
			strText = format("��ɱ�������Գ%d/8", GetMissionParam(sceneId,selfId,misIndex,1) )
			AddText(sceneId,strText);
	  	EndEvent(sceneId)
	  	DispatchMissionTips(sceneId,selfId)
	  end
	end
end

--**********************************
--���������¼�
--**********************************
function x210213_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210213_OnItemChanged( sceneId, selfId, itemdataId )
end
