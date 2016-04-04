--ҹ�������
--�㱱

--�ű���
x805005_g_scriptId = 805005
--�����
x805005_g_missionId = 4013


local  PlayerName="aaa"
--������
x805005_g_missionName="ҹ�������"
x805005_g_missionText_0="ҹ�������,��������"
x805005_g_missionText_1="���Ͷ�����"

x805005_g_missionText_2="����˭�����ҹ����ʲô��"

x805005_g_MoneyBonus=80000
x805005_g_ItemBonus={{id=10101007,num=1}}

--**********************************
--������ں���
--**********************************
function x805005_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
	if( IsHaveMission(sceneId,selfId,x805005_g_missionId) > 0)  then
		if x805005_CheckSubmit(sceneId,selfId) == 1 then
			BeginEvent(sceneId)
				AddText(sceneId,x805005_g_missionName)
				AddMoneyBonus( sceneId, x805005_g_MoneyBonus )
			EndEvent()
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x805005_g_scriptId,x805005_g_missionId,1)
		else
			BeginEvent(sceneId)
				AddText(sceneId,x805005_g_missionName)
				AddText(sceneId,"����֮��")
			EndEvent( )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x805005_g_scriptId,x805005_g_missionId,0)
		end

	--���������������
	elseif x805005_CheckAccept(sceneId,selfId) > 0 then
		name = GetName(sceneId,selfId)
		playname = format("��ҵ�������:%s\n",name)
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x805005_g_missionName)
			AddText(sceneId,x805005_g_missionText_0)
			AddText(sceneId,playname)
			AddText(sceneId,x805005_g_missionText_1)
			AddMoneyBonus( sceneId, x805005_g_MoneyBonus )
			for i, item in x805005_g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x805005_g_scriptId,x805005_g_missionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x805005_OnEnumerate( sceneId, selfId, targetId )
	if IsHaveMission(sceneId,selfId,x805005_g_missionId) > 0 then
		if GetName(sceneId,targetId) == g_name then
			AddNumText(sceneId, x805005_g_scriptId,x805005_g_missionName);
		end
	--���������������
	elseif x805005_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x805005_g_scriptId,x805005_g_missionName)
	end
end

--**********************************
--����������
--**********************************
function x805005_CheckAccept( sceneId, selfId )
	return 1	
end

--**********************************
--����
--**********************************
function x805005_OnAccept( sceneId, selfId ,targetId)
	--������������б�
	AddMission( sceneId,selfId, x805005_g_missionId, x805005_g_scriptId, 0, 0, 0 )
	timerIndex =SetTimer(sceneId,selfId,x805005_g_scriptId,"OnTimer",1000)
	misIndex = GetMissionIndexByID(sceneId,selfId,x805005_g_missionId)
	SetPatrolId(sceneId,targetId,0)

	LuaFnSetCopySceneData_Param(sceneId, 0, targetId);--������Ŀ���ObjID���浽��ʱ����������

	--����һ��npc
	npcobjid = LuaFnCreateMonster( sceneId, 16, 238,54, 3,2, -1 ) ;
	LuaFnSetCopySceneData_Param(sceneId, 1, npcobjid);

end

function x805005_OnTimer(sceneId,selfId,timeIndex)
	x805005_g_sdhyTargetId = LuaFnGetCopySceneData_Param(sceneId, 0) --�ӳ�����ʱ������ȡ������Ŀ���ObjID
	if LuaFnIsObjValid(sceneId,selfId)==1 then--��Obj����
		if IsInDist(sceneId,selfId,x805005_g_sdhyTargetId,10)<0 --�����Զ
			or LuaFnIsCharacterLiving(sceneId,x805005_g_sdhyTargetId)==0 --����Ŀ������
			or LuaFnIsCharacterLiving(sceneId,selfId)==0 then --�Լ�����

			DelMission(sceneId,selfId,x805005_g_missionId)
	  		BeginEvent(sceneId)
	  			strText = format("���ź�������ʧ��!" )
	  			AddText(sceneId,strText);
	  		EndEvent(sceneId)
	  		DispatchMissionTips(sceneId,selfId)

			SetPatrolId(sceneId,x805005_g_sdhyTargetId,-1) --������Ŀ���Ѳ��ȡ��
			StopTimer(sceneId,timeIndex)  --ֹͣ��ʱ��
			SetPos(sceneId,x805005_g_sdhyTargetId,239,55)  --������Ŀ�����ûص�ԭ���ĵط�

			--ɾ������������npc
			npcobjid = LuaFnGetCopySceneData_Param(sceneId, 1)
			LuaFnDeleteMonster( sceneId, npcobjid ) ;
		end

		x,z = GetWorldPos(sceneId,x805005_g_sdhyTargetId) ;
		if x>200 and x<210 and z>55 and z<65 then --����Ŀ�ģ��������
	  		BeginEvent(sceneId)
	  			strText = format("��ϲ���������!" )
	  			AddText(sceneId,strText);
	  		EndEvent(sceneId)
	  		DispatchMissionTips(sceneId,selfId)

			StopTimer(sceneId,timeIndex)
			SetPatrolId(sceneId,x805005_g_sdhyTargetId,-1)
			SetPos(sceneId,x805005_g_sdhyTargetId,239,55)

			--ɾ������������npc
			npcobjid = LuaFnGetCopySceneData_Param(sceneId, 1)
			LuaFnDeleteMonster( sceneId, npcobjid ) ;
		end
	else--������obj�����ڣ���������ˣ�������Ҫ��������ʱ��
		StopTimer(sceneId,timeIndex)
		SetPatrolId(sceneId,x805005_g_sdhyTargetId,-1)
		SetPos(sceneId,x805005_g_sdhyTargetId,239,55)

		--ɾ������������npc
		npcobjid = LuaFnGetCopySceneData_Param(sceneId, 1)
		LuaFnDeleteMonster( sceneId, npcobjid ) ;
	end
end

--**********************************
--����
--**********************************
function x805005_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	DelMission( sceneId, selfId, x805005_g_missionId )
end

--**********************************
--����
--**********************************
function x805005_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x805005_g_missionName)
		AddText(sceneId,x805005_g_missionText_2)
		AddMoneyBonus( sceneId, x805005_g_MoneyBonus )
		for i, item in x805005_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x805005_g_scriptId,x805005_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x805005_CheckSubmit( sceneId, 	selfId )
	if GetTitle(sceneId,selfId,3) == 0 then
		return 1
	end
	return 0
end

--**********************************
--�ύ
--**********************************
function x805005_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x805005_CheckSubmit( sceneId, selfId ) then
	BeginAddItem(sceneId)
		for i, item in x805005_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			AddMoney(sceneId,selfId,x805005_g_MoneyBonus );
			DelItem(sceneId,selfId,20001003,1)
			DelMission( sceneId,selfId,  x805005_g_missionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x805005_g_missionId )
			CallScriptFunction( 201001, "OnDefaultEvent",sceneId, selfId, targetId)
		else
		--������û�мӳɹ�
		end
	        
	end
end

--**********************************
--ɱ����������
--**********************************
function x805005_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x805005_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x805005_OnItemChanged( sceneId, selfId, itemdataId )
end








