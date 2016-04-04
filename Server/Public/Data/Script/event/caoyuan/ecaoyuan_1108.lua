--���ĺ��� ��������
--�㱱
--MisDescBegin
--�ű���
x211108_g_ScriptId = 211108

--��һ�������ID
x211108_g_MissionIdPre =547

--�����
x211108_g_MissionId = 548

--����Ŀ��npc
x211108_g_Name = "���"

--�������
x211108_g_MissionKind = 31

--����ȼ�
x211108_g_MissionLevel = 58

--�Ƿ��Ǿ�Ӣ����
x211108_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x211108_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

--�����ı�����
x211108_g_MissionName="���ĺ���"
x211108_g_MissionInfo="�ӽ��쿪ʼ���Ҳ����ǿ����ˣ��Ҿ���Ҫ�������һ�������ҹ�ȥ��"
x211108_g_MissionTarget="������Ǿȥ�ҵ����"
x211108_g_ContinueInfo="������������"
x211108_g_MissionComplete="лл�㣬���ǻᾡ���뿪����ġ�"					--�������npc˵���Ļ�

x211108_g_MoneyBonus=80000
x211108_g_ItemBonus={{id=10100021,num=1}}
--�������Ƿ�


--MisDescEnd

x211108_g_PosX=163
x211108_g_PosZ=158
--**********************************
--������ں���
--**********************************
function x211108_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x211108_g_MissionId) > 0 then
		return
	elseif( IsHaveMission(sceneId,selfId,x211108_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x211108_g_Name then
			if x211108_CheckSubmit(sceneId,selfId) == 1 then
				BeginEvent(sceneId)
					AddText(sceneId,x211108_g_MissionName)
					AddMoneyBonus( sceneId, x211108_g_MoneyBonus )
				EndEvent()
				DispatchMissionDemandInfo(sceneId,selfId,targetId,x211108_g_ScriptId,x211108_g_MissionId,1)
			else
				BeginEvent(sceneId)
					AddText(sceneId,x211108_g_MissionName)
					AddText(sceneId,"����֮��")
				EndEvent( )
				DispatchMissionDemandInfo(sceneId,selfId,targetId,x211108_g_ScriptId,x211108_g_MissionId,0)
			end
		end
	--���������������
	elseif x211108_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x211108_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x211108_g_MissionName)
				AddText(sceneId,x211108_g_MissionInfo)
				AddText(sceneId,x211108_g_MissionTarget)
				AddMoneyBonus( sceneId, x211108_g_MoneyBonus )
				for i, item in x211108_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x211108_g_ScriptId,x211108_g_MissionId)
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x211108_OnEnumerate( sceneId, selfId, targetId )
	--�ж��Ƿ������ǰ������
	if	IsMissionHaveDone( sceneId, selfId, x211108_g_MissionIdPre ) <= 0 then
		return
	end

	if IsMissionHaveDone(sceneId,selfId,x211108_g_MissionId) > 0 then
		return
	elseif IsHaveMission(sceneId,selfId,x211108_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x211108_g_Name then
			AddNumText(sceneId, x211108_g_ScriptId,x211108_g_MissionName);
		end
	--���������������
	elseif x211108_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) == "��Ǿ" then
			AddNumText(sceneId,x211108_g_ScriptId,x211108_g_MissionName)
		end
	end
end

--**********************************
--����������
--**********************************
function x211108_CheckAccept( sceneId, selfId )
	return 1	
end

--**********************************
--����
--**********************************
function x211108_OnAccept( sceneId, selfId ,targetId)
	--������������б�
	AddMission( sceneId,selfId, x211108_g_MissionId, x211108_g_ScriptId, 0, 0, 0 )
	timerIndex =SetTimer(sceneId,selfId,x211108_g_ScriptId,"OnTimer",1000)
	misIndex = GetMissionIndexByID(sceneId,selfId,x211108_g_MissionId)
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)		--�������кŰ���������ĵ�0λ��0 (����������)
	SetPatrolId(sceneId,targetId,0)
	LuaFnSetCopySceneData_Param(sceneId, 0, targetId);--������Ŀ���ObjID���浽��ʱ����������
end

function x211108_OnTimer(sceneId,selfId,timeIndex)
	TargetId = LuaFnGetCopySceneData_Param(sceneId, 0) --�ӳ�����ʱ������ȡ������Ŀ���ObjID
	if LuaFnIsObjValid(sceneId,selfId)==1 then--��Obj����
		if IsInDist(sceneId,selfId,TargetId,10)<1 --�����Զ
			or LuaFnIsCharacterLiving(sceneId,TargetId)==0 --����Ŀ������
			or LuaFnIsCharacterLiving(sceneId,selfId)==0 then --�Լ�����

			DelMission(sceneId,selfId,x211108_g_MissionId)
	  		BeginEvent(sceneId)
	  			strText = format("����ʧ��!" )
	  			AddText(sceneId,strText);
	  		EndEvent(sceneId)
	  		DispatchMissionTips(sceneId,selfId)

			SetPatrolId(sceneId,TargetId,-1) --������Ŀ���Ѳ��ȡ��
			StopTimer(sceneId,timeIndex)  --ֹͣ��ʱ��
			SetPos(sceneId,TargetId,x211108_g_PosX,x211108_g_PosZ)  --������Ŀ�����ûص�ԭ���ĵط�
		end

		x,z = GetWorldPos(sceneId,TargetId) ;
		if x>135 and x<142 and z>49 and z<55 then --����Ŀ�ģ��������
	  		BeginEvent(sceneId)
	  			strText = format("�������!" )
	  			AddText(sceneId,strText);
	  		EndEvent(sceneId)
	  		DispatchMissionTips(sceneId,selfId)

			misIndex = GetMissionIndexByID(sceneId,selfId,x211108_g_MissionId)
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)		--�������кŰ���������ĵ�0λ��1 (�������)
			StopTimer(sceneId,timeIndex)
			SetPatrolId(sceneId,TargetId,-1)
			SetPos(sceneId,TargetId,x211108_g_PosX,x211108_g_PosZ)
		end
	else--������obj�����ڣ���������ˣ�������Ҫ��������ʱ��
		StopTimer(sceneId,timeIndex)
		SetPatrolId(sceneId,TargetId,-1)
		SetPos(sceneId,TargetId,x211108_g_PosX,x211108_g_PosZ)
	end
end

--**********************************
--����
--**********************************
function x211108_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	DelMission( sceneId, selfId, x211108_g_MissionId )
end

--**********************************
--����
--**********************************
function x211108_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x211108_g_MissionName)
		AddText(sceneId,x211108_g_ContinueInfo)
		AddMoneyBonus( sceneId, x211108_g_MoneyBonus )
		for i, item in x211108_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x211108_g_ScriptId,x211108_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x211108_CheckSubmit( sceneId, 	selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x211108_g_MissionId)
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
function x211108_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x211108_CheckSubmit( sceneId, selfId ) then
	BeginAddItem(sceneId)
		for i, item in x211108_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddMoney(sceneId,selfId,x211108_g_MoneyBonus );
			--DelItem(sceneId,selfId,20001003,1)
			DelMission( sceneId,selfId,  x211108_g_MissionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x211108_g_MissionId )
			AddItemListToHuman(sceneId,selfId)
		else
		--������û�мӳɹ�
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x211108_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x211108_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x211108_OnItemChanged( sceneId, selfId, itemdataId )
end
