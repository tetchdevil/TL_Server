--��������

--�ű���
x805001_g_scriptId =805001

x805001_g_copysceneName="Ѫɫ�޵�Ժ������ɱ��֣�"

--�����
x805001_g_missionId = 4001


x805001_g_missionName="����:Ѫɫ�޵�Ժ"
x805001_g_missionText0="Ѫɫ�����й֣�Ϊ���ճ���һ����"
x805001_g_missionText1="ɱ��2ֻ������"
x805001_g_missionText2="���Ѿ�ɱ��2ֻ��������"
x805001_g_missionText3="��ϲ��ɱ����"

x805001_g_MoneyBonus=900

--**********************************
--��ں���
--**********************************
function x805001_OnDefaultEvent( sceneId, selfId, targetId )

    	--��������ɹ��������
    	if IsMissionHaveDone(sceneId,selfId,x805001_g_missionId) > 0 then
    		return
    	--����ѽӴ�����
    	else
		if IsHaveMission(sceneId,selfId,x805001_g_missionId) > 0 then
			--���������������Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x805001_g_missionName)
				AddText(sceneId,x805001_g_missionText2)
			EndEvent( )
			bDone = x805001_CheckSubmit( sceneId, selfId )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x805001_g_scriptId,x805001_g_missionId,bDone)
		--���������������
		elseif x805001_CheckAccept(sceneId,selfId) > 0 then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x805001_g_missionName)
				AddText(sceneId,x805001_g_missionText0)
				AddText(sceneId,"Ŀ��")
				AddText(sceneId,x805001_g_missionText1)
				AddText(sceneId,"�ջ�")
				AddMoneyBonus( sceneId, x805001_g_MoneyBonus )
			DispatchMissionInfo(sceneId,selfId,targetId,x805001_g_scriptId,x805001_g_missionId)
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x805001_OnCopySceneReady( sceneId, destsceneId )

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId);--���ø�����ڳ�����

	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId) ;	
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid);
	NewWorld( sceneId, leaderObjId, destsceneId, 11, 11 ) ;
end

--**********************************
--����������ʱ���¼�
--**********************************
function x805001_OnCopySceneTimer( sceneId, nowTime )
	
	TickCount = LuaFnGetCopySceneData_Param(sceneId, 2) ;--ȡ���Ѿ�ִ�еĶ�ʱ����
	TickCount = TickCount+1 ;
	LuaFnSetCopySceneData_Param(sceneId, 2, TickCount);--�����µĶ�ʱ�����ô���
	
	leaveFlag = LuaFnGetCopySceneData_Param(sceneId, 4) ;
	if leaveFlag == 1 then --��Ҫ�뿪
		leaveTickCount = LuaFnGetCopySceneData_Param(sceneId, 5) ;
		leaveTickCount = leaveTickCount+1 ;
		LuaFnSetCopySceneData_Param(sceneId, 5, leaveTickCount) ;
		if leaveTickCount == 10 then
			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--ȡ�ø�����ڳ�����
			leaderguid  = LuaFnGetCopySceneData_TeamLeader(sceneId) ;	
			leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid);
			NewWorld( sceneId, leaderObjId, oldsceneId, 238, 52 ) ;
		elseif leaveTickCount<10 then
			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--ȡ�ø�����ڳ�����
			leaderguid  = LuaFnGetCopySceneData_TeamLeader(sceneId) ;	
			leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid);
	  		BeginEvent(sceneId)
	  			strText = format("�㽫��%d����뿪����!", 10-leaveTickCount )
	  			AddText(sceneId,strText);
	  		EndEvent(sceneId)
	  		DispatchMissionTips(sceneId,leaderObjId)
		end
	elseif TickCount == 300 then --������ʱ�����Ƶ���, ��300�μ�ʱ������

		--�˴����ø���������ʱ�����Ƶ��������ʱ�䵽����...
		DelMission( sceneId, selfId, x805001_g_missionId );--����ʧ��,ɾ��֮

		oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--ȡ�ø�����ڳ�����
		leaderguid  = LuaFnGetCopySceneData_TeamLeader(sceneId) ;	
		leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid);
		NewWorld( sceneId, leaderObjId, oldsceneId, 238, 52 ) ;
	end
end


--**********************************
--�о��¼�
--**********************************
function x805001_OnEnumerate( sceneId, selfId, targetId )

	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x805001_g_missionId) > 0 then
		return 
	--����ѽӴ�����
	else
		if IsHaveMission(sceneId,selfId,x805001_g_missionId) > 0 then
			AddNumText(sceneId,x805001_g_scriptId,x805001_g_missionName);
		--���������������
		elseif x805001_CheckAccept(sceneId,selfId) > 0 then
			AddNumText(sceneId,x805001_g_scriptId,x805001_g_missionName);
		end
	end
end

--**********************************
--����������
--**********************************
function x805001_CheckAccept( sceneId, selfId )
	return 1
end

--**********************************
--����
--**********************************
function x805001_OnAccept( sceneId, selfId )

	ret = AddMission( sceneId,selfId, x805001_g_missionId, x805001_g_scriptId,1, 0, 0 )
	if ret > 0 then
	end

	leaderguid=LuaFnObjId2Guid(sceneId,selfId)

	LuaFnSetSceneLoad_Map(sceneId, "taihu.nav"); --��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�

	LuaFnSetSceneLoad_Monster(sceneId, "taihu_monster.ini");
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, 15000);
	LuaFnSetCopySceneData_Timer(sceneId, 1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, 999);--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param(sceneId, 1, 805001);--��1����������Ϊ���������¼��ű���
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);--���ö�ʱ�����ô���
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);--���ø�����ڳ�����, ��ʼ��
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);--����������ɱ�־, ��ʼ��
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);--�����뿪����ʱ����
	LuaFnSetCopySceneData_Param(sceneId, 6, 0);--ɱ�����ǵ�����


	LuaFnCreateCopyScene(); --��ʼ����ɺ���ô�����������

end

--**********************************
--����
--**********************************
function x805001_OnAbandon( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x805001_OnContinue( sceneId, selfId, targetId )
    BeginEvent(sceneId)
	AddText(sceneId,x805001_g_missionText3);
    EndEvent(sceneId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x805001_g_scriptId,x805001_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x805001_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x805001_g_missionId)
	num = GetMissionParam(sceneId,selfId,misIndex,0)
	if num < 1 then
		return 0
	else
		return 1
	end
end

--**********************************
--�ύ
--**********************************
function x805001_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	ret = x805001_CheckSubmit( sceneId, selfId );
	if ret > 0 then
		ret = DelMission( sceneId, selfId, x805001_g_missionId );
		if ret > 0 then
			MissionCom( sceneId, selfId, x805001_g_missionId )
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x805001_OnKillObject( sceneId, selfId, objdataId ,objId)--������˼�������š����objId�������λ�úš�����objId

	if objdataId == 620 then

		killednumber = LuaFnGetCopySceneData_Param(sceneId, 6) ;--ɱ���ǵ�����
		if killednumber<2 then

			killednumber = killednumber+1 ;
			LuaFnSetCopySceneData_Param(sceneId, 6, killednumber);--����ɱ�����ǵ�����

			num = LuaFnGetCopyScene_HumanCount(sceneId)--ȡ�õ�ǰ�����������
			for i=0,num-1 do

				humanObjId = LuaFnGetCopyScene_HumanObjId(sceneId,i)--ȡ�õ�ǰ�������˵�objId
				
				misIndex = GetMissionIndexByID(sceneId,humanObjId,x805001_g_missionId)--ȡ��������������ֵ
				
				SetMissionByIndex(sceneId,humanObjId,misIndex,0,killednumber)--������������
		  		
				if killednumber>=2 then 
					BeginEvent(sceneId)
	  					strText = format("��ɱ��������%d/2��������ɣ�����10����͵����λ��", killednumber )
	  					AddText(sceneId,strText);
	  				EndEvent(sceneId)
				else
					BeginEvent(sceneId)
	  					strText = format("��ɱ��������%d/2", killednumber )
	  					AddText(sceneId,strText);
	  				EndEvent(sceneId)
	  			end

				DispatchMissionTips(sceneId,humanObjId)
			end

			if killednumber>=2 then 
				LuaFnSetCopySceneData_Param(sceneId, 4, 1);--����������ɱ�־
			end
		end

		--misIndex = GetMissionIndexByID(sceneId,selfId,x805001_g_missionId)
		--num = GetMissionParam(sceneId,selfId,misIndex,0)
		--if num < 1 then
			--SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
	  		--BeginEvent(sceneId)
	  			--strText = format("��ɱ��������%d/1, ������ɣ�����5����뿪����", GetMissionParam(sceneId,selfId,misIndex,0) )
	  			--AddText(sceneId,strText);
	  		--EndEvent(sceneId)
			--DispatchMissionTips(sceneId,selfId)
			--LuaFnSetCopySceneData_Param(sceneId, 4, 1);--����������ɱ�־
		--end
	end
end

--**********************************
--���������¼�
--**********************************
function x805001_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x805001_OnItemChanged( sceneId, selfId, itemdataId )
end







