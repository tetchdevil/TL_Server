--��������
--��گ Ӣ�۳�ĺ
--MisDescBegin
--�ű���
x211909_g_ScriptId = 211909

--��һ�������ID
--g_MissionIdPre =

--�����
x211909_g_MissionId = 629

--����Ŀ��npc
x211909_g_Name = "����"

--�������
x211909_g_MissionKind = 39

--����ȼ�
x211909_g_MissionLevel = 81

--�Ƿ��Ǿ�Ӣ����
x211909_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x211909_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

--�����ı�����
x211909_g_MissionName="Ӣ�۳�ĺ"
x211909_g_MissionInfo="���Ѿ����ˣ�����ȥս�������߰�"
x211909_g_MissionTarget="���Ͱ׾���ȥ��ս��"
x211909_g_ContinueInfo="������������"
x211909_g_MissionComplete="�������"

x211909_g_MoneyBonus=80000
x211909_g_ItemBonus={{id=10101001,num=1}}



--MisDescEnd
--**********************************
--������ں���
--**********************************
function x211909_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x211909_g_MissionId) > 0 then
		return
	elseif ( IsHaveMission(sceneId,selfId,x211909_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x211909_g_Name then
			if x211909_CheckSubmit(sceneId,selfId) == 1 then
				BeginEvent(sceneId)
					AddText(sceneId,x211909_g_MissionName)
					AddMoneyBonus( sceneId, x211909_g_MoneyBonus )
				EndEvent()
				DispatchMissionDemandInfo(sceneId,selfId,targetId,x211909_g_ScriptId,x211909_g_MissionId,1)
			else
				BeginEvent(sceneId)
					AddText(sceneId,x211909_g_MissionName)
					AddText(sceneId,"����֮��")
				EndEvent( )
				DispatchMissionDemandInfo(sceneId,selfId,targetId,x211909_g_ScriptId,x211909_g_MissionId,0)
			end
		end
	--���������������
	elseif x211909_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x211909_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x211909_g_MissionName)
				AddText(sceneId,x211909_g_MissionInfo)
				AddText(sceneId,x211909_g_MissionTarget)
				AddMoneyBonus( sceneId, x211909_g_MoneyBonus )
				for i, item in x211909_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x211909_g_ScriptId,x211909_g_MissionId)
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x211909_OnEnumerate( sceneId, selfId, targetId )
	if IsMissionHaveDone(sceneId,selfId,x211909_g_MissionId) > 0 then
		return
	elseif IsHaveMission(sceneId,selfId,x211909_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x211909_g_Name then
			misIndex = GetMissionIndexByID(sceneId,selfId,x211909_g_MissionId)			--�õ���������к�
			num = GetMissionParam(sceneId,selfId,misIndex,0)
			if num == 1 then
				AddNumText(sceneId, x211909_g_ScriptId,x211909_g_MissionName);
			end
		end
	--���������������
	elseif x211909_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x211909_g_Name then
			AddNumText(sceneId,x211909_g_ScriptId,x211909_g_MissionName)
		end
	end
end

--**********************************
--����������
--**********************************
function x211909_CheckAccept( sceneId, selfId )
	return 1	
end

--**********************************
--����
--**********************************
function x211909_OnAccept( sceneId, selfId ,targetId)
	--������������б�
	AddMission( sceneId,selfId, x211909_g_MissionId, x211909_g_ScriptId, 0, 0, 0 )
	timerIndex =SetTimer(sceneId,selfId,x211909_g_ScriptId,"OnTimer",1000)
	misIndex = GetMissionIndexByID(sceneId,selfId,x211909_g_MissionId)
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)		--�������кŰ���������ĵ�0λ��0 (����������)
	SetPatrolId(sceneId,targetId,0)
	LuaFnSetCopySceneData_Param(sceneId, 0, targetId);--������Ŀ���ObjID���浽��ʱ����������
end

function x211909_OnTimer(sceneId,selfId,timeIndex)
	x211909_g_sdhyTargetId = LuaFnGetCopySceneData_Param(sceneId, 0) --�ӳ�����ʱ������ȡ������Ŀ���ObjID
	if LuaFnIsObjValid(sceneId,selfId)==1 then--��Obj����
		if IsInDist(sceneId,selfId,x211909_g_sdhyTargetId,10)<0 --�����Զ
			or LuaFnIsCharacterLiving(sceneId,x211909_g_sdhyTargetId)==0 --����Ŀ������
			or LuaFnIsCharacterLiving(sceneId,selfId)==0 then --�Լ�����
			DelMission(sceneId,selfId,x211909_g_MissionId)
	  		BeginEvent(sceneId)
	  			strText = format("���ź�������ʧ��!" )
	  			AddText(sceneId,strText);
	  		EndEvent(sceneId)
	  		DispatchMissionTips(sceneId,selfId)
			SetMissionByIndex(sceneId,selfId,misIndex,0,2)		--�������кŰ���������ĵ�0λ��2 (����ʧ��)

			SetPatrolId(sceneId,x211909_g_sdhyTargetId,-1) --������Ŀ���Ѳ��ȡ��
			StopTimer(sceneId,timeIndex)  --ֹͣ��ʱ��
			SetPos(sceneId,x211909_g_sdhyTargetId,96,18)  --������Ŀ�����ûص�ԭ���ĵط�

			--ɾ������������npc
			npcobjid = LuaFnGetCopySceneData_Param(sceneId, 1)
			LuaFnDeleteMonster( sceneId, npcobjid ) ;
		end

		x,z = GetWorldPos(sceneId,x211909_g_sdhyTargetId) ;
		if x>100 and x<110 and z>185 and z<195 then --����Ŀ�ģ��������
	  		BeginEvent(sceneId)
	  			strText = format("��ϲ���������!" )
	  			AddText(sceneId,strText);
	  		EndEvent(sceneId)
	  		DispatchMissionTips(sceneId,selfId)
			misIndex = GetMissionIndexByID(sceneId,selfId,x211909_g_MissionId)
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)		--�������кŰ���������ĵ�0λ��1 (�������)
			StopTimer(sceneId,timeIndex)
			SetPatrolId(sceneId,x211909_g_sdhyTargetId,-1)
			SetPos(sceneId,x211909_g_sdhyTargetId,96,19)

			--ɾ������������npc
			npcobjid = LuaFnGetCopySceneData_Param(sceneId, 1)
			LuaFnDeleteMonster( sceneId, npcobjid ) ;
		end
	else--������obj�����ڣ���������ˣ�������Ҫ��������ʱ��
		StopTimer(sceneId,timeIndex)
		SetPatrolId(sceneId,x211909_g_sdhyTargetId,-1)
		SetPos(sceneId,x211909_g_sdhyTargetId,96,18)
		SetMissionByIndex(sceneId,selfId,misIndex,0,2)		--�������кŰ���������ĵ�0λ��2 (����ʧ��)

		--ɾ������������npc
		npcobjid = LuaFnGetCopySceneData_Param(sceneId, 1)
		LuaFnDeleteMonster( sceneId, npcobjid ) ;
	end
end

--**********************************
--����
--**********************************
function x211909_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	DelMission( sceneId, selfId, x211909_g_MissionId )
end

--**********************************
--����
--**********************************
function x211909_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x211909_g_MissionName)
		AddText(sceneId,x211909_g_ContinueInfo)
		AddMoneyBonus( sceneId, x211909_g_MoneyBonus )
		for i, item in x211909_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x211909_g_ScriptId,x211909_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x211909_CheckSubmit( sceneId, 	selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x211909_g_MissionId)
	num = GetMissionParam(sceneId,selfId,misIndex,0)
	if num == 1 then
		return 1
	else
		return 0
	end	
	--if GetTitle(sceneId,selfId,3) == 0 then
	--	return 1
	--end
	--return 0
end

--**********************************
--�ύ
--**********************************
function x211909_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x211909_CheckSubmit( sceneId, selfId ) then
	BeginAddItem(sceneId)
		for i, item in x211909_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddMoney(sceneId,selfId,x211909_g_MoneyBonus );
			--DelItem(sceneId,selfId,20001003,1)
			DelMission( sceneId,selfId,  x211909_g_MissionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x211909_g_MissionId )
			AddItemListToHuman(sceneId,selfId)
		else
		--������û�мӳɹ�
		end
	        
	end
end

--**********************************
--ɱ����������
--**********************************
function x211909_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x211909_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x211909_OnItemChanged( sceneId, selfId, itemdataId )
end
