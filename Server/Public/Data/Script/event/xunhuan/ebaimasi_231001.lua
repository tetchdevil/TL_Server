--��������
--�������

--************************************************************************
--MisDescBegin

--�ű���
x231001_g_ScriptId = 231001

--��������
x231001_g_CopySceneName="�������"

--�����
x231001_g_MissionId = 4013

--��һ�������ID
x231001_g_MissionIdPre = 4011

--Ŀ��NPC
x231001_g_Name = "����н"

--�Ƿ��Ǿ�Ӣ����
x231001_g_IfMissionElite = 1

--����ȼ�
x231001_g_MissionLevel = 10

--�������
x231001_g_MissionKind = 1

--********���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������******
--ѭ�����������������������������Ļ��� MD_LINGLONG_HUAN
--�����Ƿ��Ѿ����
x231001_g_IsMissionOkFail = 0		--�����ĵ�0λ

--g_MissionRound = 
--**********************************�����Ƕ�̬****************************

--�����ı�����
x231001_g_MissionName="�������"
x231001_g_MissionInfo="ɱ��ȫ�����һ��������"  --��������
x231001_g_MissionTarget="ɱ��ȫ������"	--����Ŀ��
x231001_g_ContinueInfo="��Ҫ����Ŭ������"	--δ��������npc�Ի�
x231001_g_MissionComplete="лл�����������ڸҳ�����"	--�������npc˵���Ļ�


--������
x231001_g_MoneyBonus=7777

--MisDescEnd
--************************************************************************

--��ɫMission����˵��
x231001_g_Param_huan		=0	--0�ţ��Ѿ���ɵĻ������ڽ�������ʱ��ֵ
x231001_g_Param_ok			=1	--1�ţ���ǰ�����Ƿ����(0δ��ɣ�1���)
x231001_g_Param_sceneid		=2	--2�ţ���ǰ��������ĳ�����
x231001_g_Param_teamid		=3	--3�ţ��Ӹ�������ʱ��Ķ����
x231001_g_Param_killcount	=4	--4�ţ�ɱ������ֵ�����
x231001_g_Param_time		=5	--5�ţ���ɸ�������ʱ��(��λ����)
--6�ţ�δ��
--7�ţ�δ��

x231001_g_CopySceneType=FUBEN_ZHENGLONG	--�������ͣ�������ScriptGlobal.lua����
x231001_g_LimitMembers=1			--���Խ���������С��������
x231001_g_TickTime=5				--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x231001_g_LimitTotalHoldTime=360	--�������Դ���ʱ�䣨��λ��������,�����ʱ�䵽�ˣ������񽫻�ʧ��
x231001_g_LimitTimeSuccess=500		--����ʱ�����ƣ���λ���������������ʱ�䵽�ˣ��������
x231001_g_CloseTick=6				--�����ر�ǰ����ʱ����λ��������
x231001_g_NoUserTime=300			--������û���˺���Լ��������ʱ�䣨��λ���룩
x231001_g_DeadTrans=1				--����ת��ģʽ��0�������󻹿��Լ����ڸ�����1��������ǿ���Ƴ�����
x231001_g_Fuben_X=64				--���븱����λ��X
x231001_g_Fuben_Z=64				--���븱����λ��Z
x231001_g_Back_X=268				--Դ����λ��X
x231001_g_Back_Z=87					--Դ����λ��Z
x231001_g_TotalNeedKill=10			--��Ҫɱ����������

x231001_g_StartTick=5 --��ʼ���ֵ�ʱ��
x231001_g_A_B=7000	--�ɲ��ɹ���״̬��ɿɹ���״̬��ʱ��(��λ������)
x231001_g_B_C=15000	--�ɿɹ���״̬������ι����ʱ��(��λ������)
x231001_g_MoTypeCount=9 --����������
x231001_g_Black_A={559,559,559,559,559,559,559,559,559}
x231001_g_Black_B={865,866,867,868,869,870,871,872,873}
x231001_g_Black_C={883,884,885,886,887,888,889,890,891}
x231001_g_White_A={558,558,558,558,558,558,558,558,558}
x231001_g_White_B={874,875,876,877,878,879,880,881,882}
x231001_g_White_C={892,893,894,895,896,897,898,899,900}
x231001_g_LastBoss={3010,3020,3040,3050,3070,3080,3100,3110,3140}
x231001_g_mListCount=1 --��������ѡ�����������
x231001_g_mListSize=100 --ÿ������ӵ�еĲ���
--��������
x231001_g_mList1=	{288,72,301,60,111,70,167,318,316,280,262,296,319,315,337,317,309,173,43,45,40,59,41,61,24,62,230,44,58,77,39,128,129,147,148,92,93,74,91,73,336,335,279,297,261,312,105,90,103,67,65,83,102,123,104,101,140,120,64,63,161,144,184,287,306,249,250,269,270,268,212,307,289,305,325,324,326,229,210,248,192,174,87,47,108,109,145,259,343,285,182,172,157,137,76,96,112,126,146,127}
x231001_g_mList2=	{288,72,301,60,111,70,167,318,316,280,262,296,319,315,337,317,309,173,43,45,40,59,41,61,24,62,230,44,58,77,39,128,129,147,148,92,93,74,91,73,336,335,279,297,261,312,105,90,103,67,65,83,102,123,104,101,140,120,64,63,161,144,184,287,306,249,250,269,270,268,212,307,289,305,325,324,326,229,210,248,192,174,87,47,108,109,145,259,343,285,182,172,157,137,76,96,112,126,146,127}
x231001_g_mList3=	{288,72,301,60,111,70,167,318,316,280,262,296,319,315,337,317,309,173,43,45,40,59,41,61,24,62,230,44,58,77,39,128,129,147,148,92,93,74,91,73,336,335,279,297,261,312,105,90,103,67,65,83,102,123,104,101,140,120,64,63,161,144,184,287,306,249,250,269,270,268,212,307,289,305,325,324,326,229,210,248,192,174,87,47,108,109,145,259,343,285,182,172,157,137,76,96,112,126,146,127}
x231001_g_mList4=	{288,72,301,60,111,70,167,318,316,280,262,296,319,315,337,317,309,173,43,45,40,59,41,61,24,62,230,44,58,77,39,128,129,147,148,92,93,74,91,73,336,335,279,297,261,312,105,90,103,67,65,83,102,123,104,101,140,120,64,63,161,144,184,287,306,249,250,269,270,268,212,307,289,305,325,324,326,229,210,248,192,174,87,47,108,109,145,259,343,285,182,172,157,137,76,96,112,126,146,127}
x231001_g_mList5=	{288,72,301,60,111,70,167,318,316,280,262,296,319,315,337,317,309,173,43,45,40,59,41,61,24,62,230,44,58,77,39,128,129,147,148,92,93,74,91,73,336,335,279,297,261,312,105,90,103,67,65,83,102,123,104,101,140,120,64,63,161,144,184,287,306,249,250,269,270,268,212,307,289,305,325,324,326,229,210,248,192,174,87,47,108,109,145,259,343,285,182,172,157,137,76,96,112,126,146,127}

--**********************************
--������ں���
--**********************************
function x231001_OnDefaultEvent( sceneId, selfId, targetId )
	if( IsHaveMission(sceneId,selfId,x231001_g_MissionId) > 0)  then	--�������Ѿ������������
		misIndex = GetMissionIndexByID(sceneId,selfId,x231001_g_MissionId)
		bDone = x231001_CheckSubmit( sceneId, selfId )
		if bDone==0 then						--����δ���
			BeginEvent(sceneId)
				AddText(sceneId,x231001_g_MissionName)
				AddText(sceneId,"׼��������")
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x231001_g_ScriptId,x231001_g_MissionId)
		elseif bDone==1 then					--�����Ѿ����
			BeginEvent(sceneId)
				AddText(sceneId,x231001_g_MissionName)
				AddText(sceneId,x231001_g_MissionComplete)
				AddText(sceneId,"�㽫�õ���")
				AddMoneyBonus(sceneId,x231001_g_MoneyBonus)
			EndEvent( )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x231001_g_ScriptId,x231001_g_MissionId,bDone)
		end
    elseif x231001_CheckAccept(sceneId,selfId) > 0 then		--û���������������������
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x231001_g_MissionName)
			AddText(sceneId,x231001_g_MissionInfo)
			AddText(sceneId,"����Ŀ�꣺")
			AddText(sceneId,x231001_g_MissionTarget)
			AddText(sceneId,"�㽫�õ���")
			AddMoneyBonus(sceneId,x231001_g_MoneyBonus)
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x231001_g_ScriptId,x231001_g_MissionId)
    end
end

--**********************************
--�о��¼�
--**********************************
function x231001_OnEnumerate( sceneId, selfId, targetId )
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x231001_g_MissionId) > 0 then
		AddNumText(sceneId, x231001_g_ScriptId,x231001_g_MissionName);
	--���������������
    elseif x231001_CheckAccept(sceneId,selfId) > 0 then
		if	IsHaveMission(sceneId,selfId,4011) > 0		then		
			misIndex = GetMissionIndexByID(sceneId,selfId,4011)
			if	GetMissionParam( sceneId, selfId, misIndex,7)	== 1  then
				AddNumText(sceneId,x231001_g_ScriptId,x231001_g_MissionName);
			end
		end
    end
end

--**********************************
--����������
--**********************************
function x231001_CheckTeamLeader( sceneId, selfId )
	if	GetTeamId( sceneId, selfId)<0	then	--�ж��Ƿ��ж���
		BeginEvent(sceneId)
	  		AddText(sceneId,"����Ҫ����һ֧���顣");
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return	0
	end
	--ȡ����Ҹ����Ķ��������������Լ���
	local	nearteammembercount = GetNearTeamCount( sceneId, selfId) 
	
	if	nearteammembercount<x231001_g_LimitMembers	then
		BeginEvent(sceneId)
	  		AddText(sceneId,"��Ķ����������㡣");
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return	 0
	end
	
	if	LuaFnIsTeamLeader( sceneId, selfId)==0	then	--ֻ�жӳ����ܽ�����
		BeginEvent(sceneId)
	  		AddText(sceneId,"�㲻�Ƕӳ���");
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return	 0
	end
	
	return nearteammembercount
end

--**********************************
--����������
--**********************************
function x231001_CheckAccept( sceneId, selfId )
	if	GetTeamId( sceneId, selfId)<0	then	--�ж��Ƿ��ж���
		BeginEvent(sceneId)
	  		AddText(sceneId,"����Ҫ����һ֧���顣");
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return	0
	end
	
	--ȡ����Ҹ����Ķ��������������Լ���
	local	nearteammembercount = GetNearTeamCount( sceneId, selfId) 

	if	nearteammembercount<x231001_g_LimitMembers	then
		BeginEvent(sceneId)
	  		AddText(sceneId,"��Ķ����������㡣");
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return	 0
	end
	
	if	LuaFnIsTeamLeader( sceneId, selfId)==0	then	--ֻ�жӳ����ܽ�����
		BeginEvent(sceneId)
	  		AddText(sceneId,"�㲻�Ƕӳ���");
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return	 0
	end
	
	--���С�����Ƿ����������¼����, �����Ƿ��Ѿ��ӹ�������
	local mems = {}
	for	i=0,nearteammembercount-1 do
		mems[i] = GetNearTeamMember(sceneId, selfId, i)
		if GetMissionCount( sceneId, mems[i]) >= 20 then	--�����������������Ƿ�ﵽ����20��
			BeginEvent(sceneId)
				AddText(sceneId,"���������˵������¼������");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		elseif IsHaveMission(sceneId,mems[i],x231001_g_MissionId)>0 then
			--�����Ƿ��Ѿ��ӹ��������������һ������
			BeginEvent(sceneId)
				AddText(sceneId,"�����������Ѿ����˴�����");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		end
	end
	
	return	1
end

--**********************************
--����
--**********************************
function x231001_OnAccept( sceneId, selfId )
	
	local teamid = GetTeamId( sceneId, selfId)
	
	if( IsHaveMission(sceneId,selfId,x231001_g_MissionId) > 0)  then	--�Ѿ��������
		misIndex = GetMissionIndexByID(sceneId,selfId,x231001_g_MissionId)
		copysceneid = GetMissionParam( sceneId, selfId, misIndex, x231001_g_Param_sceneid)
		saveteamid = GetMissionParam( sceneId, selfId, misIndex, x231001_g_Param_teamid)
		
		if copysceneid>=0 and teamid==saveteamid then --��������
			--���Լ����͵���������
			NewWorld( sceneId, selfId, copysceneid, x231001_g_Fuben_X, x231001_g_Fuben_Z) ;
		else
			BeginEvent(sceneId)
				AddText(sceneId,"����������");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	else
		--������������б�
		if x231001_CheckAccept(sceneId,selfId) <= 0 then	--�жϽ�������
			return 0
		end

		--ȡ����Ҹ����Ķ��������������Լ���
		local	nearteammembercount = GetNearTeamCount( sceneId, selfId) 
		local mems = {}
		for	i=0,nearteammembercount-1 do
			mems[i] = GetNearTeamMember(sceneId, selfId, i)
			--��ÿ�������Ա��������
			AddMission( sceneId, mems[i], x231001_g_MissionId, x231001_g_ScriptId, 1, 0, 0 )
			
			misIndex = GetMissionIndexByID( sceneId, mems[i], x231001_g_MissionId )
			
			local huan = GetMissionData(sceneId,selfId,g_MissionRound)
			
			--������ĵ�0����������Ϊ�Ѿ���ɵ�
			SetMissionByIndex(sceneId,mems[i],misIndex,x231001_g_Param_huan,huan)
			
			--������ĵ�1����������Ϊ0,��ʾδ��ɵ�����
			SetMissionByIndex(sceneId,mems[i],misIndex,x231001_g_Param_ok,0)
			
			--������ĵ�2����������Ϊ-1, ���ڱ��渱���ĳ�����
			SetMissionByIndex(sceneId,mems[i],misIndex,x231001_g_Param_sceneid,-1)

			--������ĵ�3�����ݶ����
			SetMissionByIndex(sceneId,mems[i],misIndex,x231001_g_Param_teamid,teamid)
		end
		
		x231001_MakeCopyScene( sceneId, selfId, nearteammembercount ) ;
	end
end

--**********************************
--����
--**********************************
function x231001_OnAbandon( sceneId, selfId )

	misIndex = GetMissionIndexByID(sceneId,selfId,x231001_g_MissionId)
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x231001_g_Param_sceneid)
	
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x231001_g_MissionId )
	
	if sceneId==copyscene then --����ڸ�����ɾ��������ֱ�Ӵ��ͻ�
		BeginEvent(sceneId)
			AddText(sceneId,"����ʧ�ܣ�");
		EndEvent(sceneId)

		DispatchMissionTips(sceneId,selfId)
		
		oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--ȡ�ø�����ڳ�����
		
		NewWorld( sceneId, selfId, oldsceneId, x231001_g_Back_X, x231001_g_Back_Z )
	end
end

--**********************************
--��������
--**********************************
function x231001_MakeCopyScene( sceneId, selfId, nearmembercount )

	local mems = {}
	mylevel = 0 
	for	i=0,nearmembercount-1 do
		mems[i] = GetNearTeamMember(sceneId, selfId, i)
		mylevel = mylevel+GetLevel(sceneId,mems[i])
	end
	mylevel = mylevel/nearmembercount
	
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "zhenlong.nav"); --��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x231001_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x231001_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x231001_g_CopySceneType);--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param(sceneId, 1, x231001_g_ScriptId);--��1����������Ϊ���������¼��ű���
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);--���ö�ʱ�����ô���
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);--���ø�����ڳ�����, ��ʼ��
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);--���ø����رձ�־, 0���ţ�1�ر�
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);--�����뿪����ʱ����
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId)); --��������
	LuaFnSetCopySceneData_Param(sceneId, 7, 0) ;--ɱ���ֵ�����
	LuaFnSetCopySceneData_Param(sceneId, 8, random(1,x231001_g_mListCount)) ;--ѡ�õ�����
	LuaFnSetCopySceneData_Param(sceneId, 9, 0) ;--�Ѿ����˵Ĳ���

	
	if	mylevel<=10	 then
		LuaFnSetCopySceneData_Param(sceneId,10, 1) ;--��¼�������Ĺ�����
	elseif	mylevel<=15	 then
		LuaFnSetCopySceneData_Param(sceneId,10, 2) ;--��¼�������Ĺ�����
	elseif	mylevel<=20	 then
		LuaFnSetCopySceneData_Param(sceneId,10, 3) ;--��¼�������Ĺ�����
	elseif	mylevel<=25	 then
		LuaFnSetCopySceneData_Param(sceneId,10, 4) ;--��¼�������Ĺ�����
	elseif	mylevel<=30	 then
		LuaFnSetCopySceneData_Param(sceneId,10, 5) ;--��¼�������Ĺ�����
	elseif	mylevel<=35	 then
		LuaFnSetCopySceneData_Param(sceneId,10, 6) ;--��¼�������Ĺ�����
	elseif	mylevel<=40	 then
		LuaFnSetCopySceneData_Param(sceneId,10, 7) ;--��¼�������Ĺ�����
	elseif	mylevel<=45	 then
		LuaFnSetCopySceneData_Param(sceneId,10, 8) ;--��¼�������Ĺ�����
	else
		LuaFnSetCopySceneData_Param(sceneId,10, 9) ;--��¼�������Ĺ�����
	end	
	

	local bRetSceneID = LuaFnCreateCopyScene(sceneId); --��ʼ����ɺ���ô�����������
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"���������ɹ���");
		else
			AddText(sceneId,"��������ʧ�ܣ�");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--����
--**********************************
function x231001_OnContinue( sceneId, selfId, targetId )

	misIndex = GetMissionIndexByID(sceneId,selfId,x231001_g_MissionId)
	if	GetMissionParam( sceneId, selfId, misIndex, x231001_g_Param_sceneid)>=1	then
		DispatchMissionContinueInfo(sceneId, selfId, targetId, x231001_g_ScriptId, x231001_g_MissionId)
	end

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x231001_CheckSubmit( sceneId, selfId )
--�ж������Ƿ��Ѿ����
	misIndex = GetMissionIndexByID(sceneId,selfId,x231001_g_MissionId)
	if	GetMissionParam( sceneId, selfId, misIndex, x231001_g_Param_ok)>=1 then 
		return	1
	else
		return	0
	end
end

--**********************************
--�ύ
--**********************************
function x231001_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x231001_CheckSubmit( sceneId, selfId, selectRadioId )>0 then		--�Ѿ����������
		local	iHuan=GetMissionData(sceneId,selfId,10)	--ȡ���ܹ������Ļ���
		--���������
		money = 100*iHuan
		AddMoney(sceneId,selfId,money );
		BeginEvent(sceneId)
			strText_M = format("��õ�%d��Ǯ",money)
	  		--strText = format("������ɣ���ǰΪ��%d��",iDayHuan)
	  		--AddText(sceneId,strText);
	  		AddText(sceneId,strText_M);
	  	EndEvent(sceneId)
	  	DispatchMissionTips(sceneId,selfId)
		--���������Ѿ�����ɹ�
		DelMission( sceneId,selfId,  x231001_g_MissionId )
		misIndex = GetMissionIndexByID(sceneId,selfId,4011)			--�õ���������к�
		SetMissionByIndex(sceneId,selfId,misIndex,0,1)						--�������кŰ���������ĵ�0λ��0 (����������)
	end
end

--**********************************
--ɱ����������
--**********************************
function x231001_OnKillObject( sceneId, selfId, objdataId ,objId )
	
	--�Ƿ��Ǹ���
	sceneType = LuaFnGetSceneType(sceneId) ;
	if sceneType~=1 then
		return
	end 
	--�Ƿ�������Ҫ�ĸ���
	fubentype = LuaFnGetCopySceneData_Param(sceneId,0)
	if fubentype~=x231001_g_CopySceneType then
		return
	end
	--�����رձ�־
	leaveFlag = LuaFnGetCopySceneData_Param(sceneId, 4) ;
	if 	leaveFlag==1 then --��������Ѿ����óɹر�״̬����ɱ����Ч
		return 
	end
	
	--ȡ�õ�ǰ�����������
	num = LuaFnGetCopyScene_HumanCount(sceneId)
	
	killednumber = LuaFnGetCopySceneData_Param(sceneId, 7) ;--ɱ���ֵ�����
	killednumber = killednumber+1
	LuaFnSetCopySceneData_Param(sceneId, 7, killednumber) ;--����ɱ���ֵ�����
	
	if killednumber<x231001_g_TotalNeedKill then

		BeginEvent(sceneId)
			strText = format("��ɱ %d/%d", killednumber, x231001_g_TotalNeedKill )
			AddText(sceneId,strText);
		EndEvent(sceneId)

		for i=0,num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId(sceneId,i)--ȡ�õ�ǰ�������˵�objId
			DispatchMissionTips(sceneId,humanObjId)

			misIndex = GetMissionIndexByID(sceneId,humanObjId,x231001_g_MissionId) --ȡ��������������ֵ
			local killedcount = GetMissionParam( sceneId, humanObjId, misIndex, x231001_g_Param_killcount) --ȡ���Ѿ�ɱ�˵Ĺ�����
			killedcount = killedcount +1 ;
			SetMissionByIndex(sceneId,humanObjId,misIndex,x231001_g_Param_killcount,killedcount) --������������
		end
	elseif killednumber>=x231001_g_TotalNeedKill then
		--����������ɱ�־
		LuaFnSetCopySceneData_Param(sceneId, 4, 1)
		
		--ȡ���Ѿ�ִ�еĶ�ʱ����
		TickCount = LuaFnGetCopySceneData_Param(sceneId, 2) ;
		
		for i=0,num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId(sceneId,i)	--ȡ�õ�ǰ�������˵�objId
			misIndex = GetMissionIndexByID(sceneId,humanObjId,x231001_g_MissionId)--ȡ��������������ֵ

			local killedcount = GetMissionParam( sceneId, humanObjId, misIndex, x231001_g_Param_killcount) --ȡ���Ѿ�ɱ�˵Ĺ�����
			killedcount = killedcount +1 ;
			SetMissionByIndex(sceneId,humanObjId,misIndex,x231001_g_Param_killcount,killedcount) --������������
			
			--������ĵ�1����������Ϊ1,��ʾ��ɵ�����
			SetMissionByIndex(sceneId,humanObjId,misIndex,x231001_g_Param_ok,1)--������������
			--��ɸ�������ʱ��
			SetMissionByIndex(sceneId,humanObjId,misIndex,x231001_g_Param_time,TickCount*x231001_g_TickTime)--������������

			BeginEvent(sceneId)
				strText = format("������ɣ�����%d����͵����λ��", x231001_g_CloseTick*x231001_g_TickTime )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,humanObjId)
		end
	end
end

--**********************************
--���������¼�
--**********************************
function x231001_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x231001_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--�����¼�
--**********************************
function x231001_OnCopySceneReady( sceneId, destsceneId )

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId);--���ø�����ڳ�����
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId) ;	
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid);

	--ȡ����Ҹ����Ķ��������������Լ���
	local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
	local mems = {}
	for	i=0,nearteammembercount-1 do
		mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
		misIndex = GetMissionIndexByID(sceneId,mems[i],x231001_g_MissionId)
		
		--������ĵ�2����������Ϊ�����ĳ�����
		SetMissionByIndex(sceneId,mems[i],misIndex,x231001_g_Param_sceneid,destsceneId)
				
		NewWorld( sceneId, mems[i], destsceneId, x231001_g_Fuben_X, x231001_g_Fuben_Z) ;
	end
end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x231001_OnPlayerEnter( sceneId, selfId )
	--���������󸴻��λ��
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x231001_g_Fuben_X, x231001_g_Fuben_Z );
end

--**********************************
--������ڸ����������¼�
--**********************************
function x231001_OnHumanDie( sceneId, selfId, killerId )
	if x231001_g_DeadTrans==1 then --��������Ҫ��ǿ���߳�����
	
		misIndex = GetMissionIndexByID(sceneId,selfId,x231001_g_MissionId)--ȡ��������������ֵ
		
		--������ĵ�1����������Ϊ1,��ʾ��ɵ�����
		SetMissionByIndex(sceneId,selfId,misIndex,x231001_g_Param_ok,1)--������������
		
		--��ɸ�������ʱ��
		SetMissionByIndex(sceneId,selfId,misIndex,x231001_g_Param_time,TickCount*x231001_g_TickTime)--������������

		oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--ȡ�ø�����ڳ�����
		NewWorld( sceneId, selfId, oldsceneId, x231001_g_Back_X, x231001_g_Back_Z )
	end
end

--**********************************
--����������ʱ���¼�
--**********************************
function x231001_OnCopySceneTimer( sceneId, nowTime )
	
	--����ʱ�Ӷ�ȡ������
	TickCount = LuaFnGetCopySceneData_Param(sceneId, 2) ;--ȡ���Ѿ�ִ�еĶ�ʱ����
	TickCount = TickCount+1 ;
	LuaFnSetCopySceneData_Param(sceneId, 2, TickCount);--�����µĶ�ʱ�����ô���
		
	--�����رձ�־
	leaveFlag = LuaFnGetCopySceneData_Param(sceneId, 4) ;
	
	if leaveFlag == 1 then --��Ҫ�뿪
		
		--�뿪����ʱ��Ķ�ȡ������
		leaveTickCount = LuaFnGetCopySceneData_Param(sceneId, 5) ;
		leaveTickCount = leaveTickCount+1 ;
		LuaFnSetCopySceneData_Param(sceneId, 5, leaveTickCount) ;
		
		if leaveTickCount == x231001_g_CloseTick then --����ʱ�䵽����Ҷ���ȥ��
		
			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--ȡ�ø�����ڳ�����
			
			--����ǰ����������������˴��ͻ�ԭ������ʱ��ĳ���
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
				NewWorld( sceneId, mems[i], oldsceneId, x231001_g_Back_X, x231001_g_Back_Z )
			end
			
		elseif leaveTickCount<x231001_g_CloseTick then
		
			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--ȡ�ø�����ڳ�����

			--֪ͨ��ǰ����������������ˣ������رյ���ʱ��
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
	  			BeginEvent(sceneId)
	  				strText = format("�㽫��%d����뿪����!", (x231001_g_CloseTick-leaveTickCount)*x231001_g_TickTime )
	  				AddText(sceneId,strText);
	  			EndEvent(sceneId)
	  			DispatchMissionTips(sceneId,mems[i])
			end
		end
	elseif TickCount == x231001_g_LimitTimeSuccess then
		--�˴�������ʱ�����Ƶ�������ɴ���
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			
  			BeginEvent(sceneId)
  				AddText(sceneId,"����ʱ�䵽�����!");
  			EndEvent(sceneId)
  			DispatchMissionTips(sceneId,mems[i])
  			
			misIndex = GetMissionIndexByID(sceneId,mems[i],x231001_g_MissionId)--ȡ��������������ֵ
			--������ĵ�1����������Ϊ1,��ʾ��ɵ�����
			SetMissionByIndex(sceneId,mems[i],misIndex,x231001_g_Param_ok,1)--������������
			--��ɸ�������ʱ��
			SetMissionByIndex(sceneId,mems[i],misIndex,x231001_g_Param_time,TickCount*x231001_g_TickTime)--������������
		end

		--���ø����رձ�־
		LuaFnSetCopySceneData_Param(sceneId, 4, 1) ;
		
	elseif TickCount == x231001_g_LimitTotalHoldTime then --������ʱ�����Ƶ���
		--�˴����ø���������ʱ�����Ƶ��������ʱ�䵽����...
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			DelMission( sceneId, mems[i], x231001_g_MissionId );--����ʧ��,ɾ��֮

  			BeginEvent(sceneId)
  				AddText(sceneId,"����ʧ�ܣ���ʱ!");
  			EndEvent(sceneId)
  			DispatchMissionTips(sceneId,mems[i])
		end

		--���ø����رձ�־
		LuaFnSetCopySceneData_Param(sceneId, 4, 1) ;
		
	else 
		--��ʱ�������Ա�Ķ���ţ���������ϣ����߳�����
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			if IsHaveMission(sceneId,mems[i],x231001_g_MissionId) > 0 then
				oldteamid = LuaFnGetCopySceneData_Param(sceneId, 6) ; --ȡ�ñ���Ķ����
				if oldteamid ~= GetTeamId(sceneId,mems[i]) then
				
					DelMission( sceneId, mems[i], x231001_g_MissionId );--����ʧ��,ɾ��֮

  					BeginEvent(sceneId)
  						AddText(sceneId,"����ʧ�ܣ��㲻����ȷ�Ķ�����!");
  					EndEvent(sceneId)
  					DispatchMissionTips(sceneId,mems[i])
  					
 					oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--ȡ�ø�����ڳ�����
					NewWorld( sceneId, mems[i], oldsceneId, x231001_g_Back_X, x231001_g_Back_Z )
  				end
  			end
		end
		
		--��������߼�
		if TickCount>=x231001_g_StartTick and membercount>0 then --ʱ�䵽����ʼ����
		
			mgroup = LuaFnGetCopySceneData_Param(sceneId,10) ;--��¼�������Ĺ�����
			if mgroup > x231001_g_MoTypeCount then
				print( "Error! " )
				mgroup = 1
			end
		
			--�仯����
			local monsterobjid = -1
			monstercount = GetMonsterCount(sceneId)
			for i=0, monstercount-1 do
				monsterobjid = GetMonsterObjID(sceneId,i)
				if LuaFnIsCharacterLiving(sceneId, monsterobjid)>0 then --��Ĺ���
					monstertype = GetMonsterDataID(sceneId, monsterobjid) --��������
					mcreatetime = GetObjCreateTime(sceneId, monsterobjid) --���ﴴ��ʱ��
					PosX,PosZ=LuaFnGetWorldPos(sceneId, monsterobjid)
					PosX=floor(PosX)
					PosZ=floor(PosZ)
					
					if monstertype==x231001_g_Black_A[mgroup] then
						if nowTime>=mcreatetime+x231001_g_A_B then --��Ҫ��������B״̬��
							LuaFnDeleteMonster(sceneId, monsterobjid)
							LuaFnCreateMonster(sceneId,x231001_g_Black_B[mgroup],PosX,PosZ,7,0,-1)
						end
					elseif monstertype==x231001_g_Black_B[mgroup] then
						if nowTime>=mcreatetime+x231001_g_A_B+x231001_g_B_C then --��Ҫ��������C״̬��
							LuaFnDeleteMonster(sceneId, monsterobjid)
							LuaFnCreateMonster(sceneId,x231001_g_Black_C[mgroup],PosX,PosZ,5,0,-1)
						end
					elseif monstertype==x231001_g_White_A[mgroup] then
						if nowTime>=mcreatetime+x231001_g_A_B then --��Ҫ��������B״̬��
							LuaFnDeleteMonster(sceneId, monsterobjid)
							LuaFnCreateMonster(sceneId,x231001_g_White_B[mgroup],PosX,PosZ,7,0,-1)
						end
					elseif monstertype==x231001_g_White_B[mgroup] then
						if nowTime>=mcreatetime+x231001_g_A_B+x231001_g_B_C then --��Ҫ��������C״̬��
							LuaFnDeleteMonster(sceneId, monsterobjid)
							LuaFnCreateMonster(sceneId,x231001_g_White_C[mgroup],PosX,PosZ,5,0,-1)
						end
					else
					end
				else
				end
			end
		
			if TickCount==x231001_g_StartTick then
				local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
				local mems = {}
				for	i=0,membercount-1 do
					mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
  					BeginEvent(sceneId)
  						AddText(sceneId,"ս����ʼ��!");
  					EndEvent(sceneId)
  					DispatchMissionTips(sceneId,mems[i])
				end
			end
			
			QiPu = LuaFnGetCopySceneData_Param(sceneId, 8) ;--ȡ������
			PressStep = LuaFnGetCopySceneData_Param(sceneId, 9) ;--ȡ���Ѿ����˵Ĳ���
			if PressStep<x231001_g_mListSize then
				PressStep = PressStep+1 ;
				local QiPuValue = 0 
				if QiPu==1 then
					QiPuValue = x231001_g_mList1[PressStep]
				elseif QiPu==2 then
					QiPuValue = x231001_g_mList2[PressStep]
				elseif QiPu==3 then
					QiPuValue = x231001_g_mList3[PressStep]
				elseif QiPu==4 then
					QiPuValue = x231001_g_mList4[PressStep]
				else
					QiPuValue = x231001_g_mList5[PressStep]
				end
				
				--�����������ɹ���
				xPos,zPos=x231001_IndexToPos(QiPuValue)
				MonsterType = mod(PressStep,2)
				mobjid = 0
				if PressStep==x231001_g_mListSize then --���һ��ˢ���������
					mobjid = LuaFnCreateMonster(sceneId,x231001_g_LastBoss[mgroup],xPos,zPos,3,0,-1)
				else
					if MonsterType==0 then
						mobjid = LuaFnCreateMonster(sceneId,x231001_g_Black_A[mgroup],xPos,zPos,3,0,-1)
					else
						mobjid = LuaFnCreateMonster(sceneId,x231001_g_White_A[mgroup],xPos,zPos,3,0,-1)
					end
				end
				--print(QiPu,PressStep,QiPuValue,MonsterType,mobjid)
				
				LuaFnSetCopySceneData_Param(sceneId, 9, PressStep);--�����µĶ�ʱ�����ô���
			end				
		end
	end
end

function x231001_GetDisplayPos( x, z )
	return x*3+36+1,z*3+36+1
end

function x231001_IndexToPos( index )
	xP = floor(index/19)
	zP = mod(index,19)
	return xP*3+36+1,zP*3+36+1
end
