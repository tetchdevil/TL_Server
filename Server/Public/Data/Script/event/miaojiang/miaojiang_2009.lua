--�´�������
--�置
--MisDescBegin
--�ű���
x212009_g_ScriptId = 212009

--��һ�������ID
--g_MissionIdPre =

--�����
x212009_g_MissionId = 639

--����Ŀ��npc
x212009_g_Name = "����"

--�������
x212009_g_MissionKind = 40

--����ȼ�
x212009_g_MissionLevel = 79

--�Ƿ��Ǿ�Ӣ����
x212009_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x212009_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

--������
x212009_g_MissionName="�´�������"
x212009_g_MissionInfo="����ȥ������"
x212009_g_MissionTarget="���Ͱ���ȥ������"
x212009_g_MissionComplete="̫��л����"

x212009_g_MoneyBonus=80000
x212009_g_ItemBonus={{id=10101001,num=1}}

x212009_g_PosX=184
x212009_g_PosZ=269

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x212009_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x212009_g_MissionId) > 0 then
		return
	elseif( IsHaveMission(sceneId,selfId,x212009_g_MissionId) > 0)  then	--�������Ѿ���ȡ������
		if GetName(sceneId,targetId) ~= x212009_g_Name then					--�����npc����Ŀ��npc
			if x212009_CheckSubmit(sceneId,selfId) == 1 then				--��������������
				BeginEvent(sceneId)
					AddText(sceneId,x212009_g_MissionName)
					AddMoneyBonus( sceneId, x212009_g_MoneyBonus )
				EndEvent()
				DispatchMissionDemandInfo(sceneId,selfId,targetId,x212009_g_ScriptId,x212009_g_MissionId,1)
			else
				BeginEvent(sceneId)
					AddText(sceneId,x212009_g_MissionName)
					AddText(sceneId,"����֮��")
				EndEvent( )
				DispatchMissionDemandInfo(sceneId,selfId,targetId,x212009_g_ScriptId,x212009_g_MissionId,0)
			end
		end
	--���������������
	elseif x212009_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) == x212009_g_Name then
			name = GetName(sceneId,selfId)
			--playname = format("��ҵ�������:%s",name)
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x212009_g_MissionName)
				AddText(sceneId,x212009_g_MissionInfo)
				--AddText(sceneId,playname)
				AddText(sceneId,x212009_g_MissionTarget)
				AddMoneyBonus( sceneId, x212009_g_MoneyBonus )
				for i, item in x212009_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x212009_g_ScriptId,x212009_g_MissionId)
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x212009_OnEnumerate( sceneId, selfId, targetId )
	if IsMissionHaveDone(sceneId,selfId,x212009_g_MissionId) > 0 then		
		return
	elseif IsHaveMission(sceneId,selfId,x212009_g_MissionId) > 0 then		
		if GetName(sceneId,targetId) ~= x212009_g_Name then
			AddNumText(sceneId, x212009_g_ScriptId,x212009_g_MissionName);
		end
	--���������������
	elseif x212009_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) == x212009_g_Name then
			AddNumText(sceneId,x212009_g_ScriptId,x212009_g_MissionName)
		end
	end
end

--**********************************
--����������
--**********************************
function x212009_CheckAccept( sceneId, selfId )
	return 1	
end

--**********************************
--����
--**********************************
function x212009_OnAccept( sceneId, selfId ,targetId)
	--������������б�	
	AddMission( sceneId,selfId, x212009_g_MissionId, x212009_g_ScriptId, 0, 0, 0 )
	timerIndex =SetTimer(sceneId,selfId,x212009_g_ScriptId,"OnTimer",1000)
	misIndex = GetMissionIndexByID(sceneId,selfId,x212009_g_MissionId)
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)		--�������кŰ���������ĵ�0λ��0 (����������)
	SetPatrolId(sceneId,targetId,0)
	LuaFnSetCopySceneData_Param(sceneId, 0, targetId);--������Ŀ���ObjID���浽��ʱ����������
end

--**********************************
--��ʱ���¼�
--**********************************
function x212009_OnTimer(sceneId,selfId,timeIndex)
	TargetId = LuaFnGetCopySceneData_Param(sceneId, 0) --�ӳ�����ʱ������ȡ������Ŀ���ObjID
	if LuaFnIsObjValid(sceneId,selfId)==1 then--��Obj����
		if IsInDist(sceneId,selfId,TargetId,10)<1 --�����Զ
			or LuaFnIsCharacterLiving(sceneId,TargetId)==0 --����Ŀ������
			or LuaFnIsCharacterLiving(sceneId,selfId)==0 then --�Լ�����

			DelMission(sceneId,selfId,x212009_g_MissionId)
	  		BeginEvent(sceneId)
	  			strText = format("����ʧ��!!!!!!!" )
	  			AddText(sceneId,strText);
	  		EndEvent(sceneId)
	  		DispatchMissionTips(sceneId,selfId)

			SetPatrolId(sceneId,TargetId,-1) --������Ŀ���Ѳ��ȡ��
			StopTimer(sceneId,timeIndex)  --ֹͣ��ʱ��
			SetPos(sceneId,TargetId,x212009_g_PosX,x212009_g_PosZ)  --������Ŀ�����ûص�ԭ���ĵط�
		end

		x,z = GetWorldPos(sceneId,TargetId) ;
		if x>88 and x<93 and z>259 and z<262 then --����Ŀ�ģ��������
	  		BeginEvent(sceneId)
	  			strText = format("�������!" )
	  			AddText(sceneId,strText);
	  		EndEvent(sceneId)
	  		DispatchMissionTips(sceneId,selfId)

			misIndex = GetMissionIndexByID(sceneId,selfId,x212009_g_MissionId)
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)		--�������кŰ���������ĵ�0λ��1 (�������)
			StopTimer(sceneId,timeIndex)
			SetPatrolId(sceneId,TargetId,-1)
			SetPos(sceneId,TargetId,x212009_g_PosX,x212009_g_PosZ)
		end
	else--������obj�����ڣ���������ˣ�������Ҫ��������ʱ��
		StopTimer(sceneId,timeIndex)
		SetPatrolId(sceneId,TargetId,-1)
		SetPos(sceneId,TargetId,x212009_g_PosX,x212009_g_PosZ)  --������Ŀ�����ûص�ԭ���ĵط�
		SetMissionByIndex(sceneId,selfId,misIndex,0,2)		--�������кŰ���������ĵ�0λ��2 (����ʧ��)
	end
end

--**********************************
--����
--**********************************
function x212009_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	DelMission( sceneId, selfId, x212009_g_MissionId )
end

--**********************************
--����
--**********************************
function x212009_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x212009_g_MissionName)
		AddText(sceneId,x212009_g_MissionComplete)
		AddMoneyBonus( sceneId, x212009_g_MoneyBonus )
		for i, item in x212009_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x212009_g_ScriptId,x212009_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212009_CheckSubmit( sceneId, 	selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x212009_g_MissionId)
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
function x212009_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212009_CheckSubmit( sceneId, selfId ) then
	BeginAddItem(sceneId)
		for i, item in x212009_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddMoney(sceneId,selfId,x212009_g_MoneyBonus );
			--DelItem(sceneId,selfId,20001003,1)
			DelMission( sceneId,selfId,  x212009_g_MissionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x212009_g_MissionId )
			AddItemListToHuman(sceneId,selfId)
		else
		--������û�мӳɹ�
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x212009_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x212009_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x212009_OnItemChanged( sceneId, selfId, itemdataId )
end
