--̽����ͼ����
--̽������
--MisDescBegin
--�ű���
x211109_g_ScriptId = 211109

--ǰ������
--g_MissionIdPre  = 

--�����
x211109_g_MissionId = 549

--�������
x211109_g_MissionKind = 31

--����ȼ�
x211109_g_MissionLevel = 59

--�Ƿ��Ǿ�Ӣ����
x211109_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������*******
--�����Ƿ��Ѿ����
x211109_g_IsMissionOkFail = 0		--�����ĵ�0λ


--*******************�����Ƕ�̬��ʾ***********

--�����ı�����
x211109_g_MissionName="̽������"
x211109_g_MissionInfo="#r���ܵ�����һ����������û�б�������°�������˾�ס������������������ȡ����ϵ���������㡣"
x211109_g_MissionTarget="#r����Ŀ��#r��������һ������û�����˾�ס�ļ���#r"
x211109_g_ContinueInfo="������ȥ��ô��"		--δ��������npc�Ի�
x211109_g_MissionComplete="ʲô���ɹ��ˣ��������Ǿ������Ĵ���������"

--����

--������Ŀ��npc
x211109_g_Name = "��ʵ"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x211109_OnDefaultEvent( sceneId, selfId, targetId )
	 --������������
    if IsMissionHaveDone( sceneId, selfId, x211109_g_MissionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x211109_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x211109_g_Name then
			--���ͽ�����ǰ��������Ϣ
    		BeginEvent(sceneId)
    		AddText(sceneId,x211109_g_ContinueInfo);
    		EndEvent(sceneId)
    		
    		done = x211109_CheckSubmit( sceneId, selfId );
   			DispatchMissionDemandInfo(sceneId,selfId,targetId,x211109_g_ScriptId,x211109_g_MissionId,done)
 		end
    --���������������
    elseif x211109_CheckAccept(sceneId,selfId) > 0 then
		--if GetName(sceneId,targetId) ~= x211109_g_Name then		--���������̽����ͼ,���Է�����ͽ�������ͬһ��npc,��ǰ�ͻ�����ͬһ��npc,��˲���Ҫ����ж�
			--�����������ʱ��ʾ����Ϣ
	    	BeginEvent(sceneId)
    		AddText(sceneId,x211109_g_MissionName);
    		AddText(sceneId,x211109_g_MissionInfo);
    		AddText(sceneId,x211109_g_MissionTarget);
	    	EndEvent(sceneId)
	    	DispatchMissionInfo(sceneId,selfId,targetId,x211109_g_ScriptId,x211109_g_MissionId)
		--end
    end
end

--**********************************
--�о��¼�
--**********************************
function x211109_OnEnumerate( sceneId, selfId, targetId )
	
	if IsMissionHaveDone( sceneId, selfId, x211109_g_MissionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x211109_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x211109_g_Name then
			AddNumText(sceneId, x211109_g_ScriptId,x211109_g_MissionName)
		end
    --���������������
    elseif x211109_CheckAccept(sceneId,selfId) > 0 then
		--if GetName(sceneId,targetId) ~= x211109_g_Name then      --���������̽����ͼ,���Է�����ͽ�������ͬһ��npc,��ǰ�ͻ�����ͬһ��npc,��˲���Ҫ����ж�
		AddNumText(sceneId, x211109_g_ScriptId, x211109_g_MissionName);
		--end
    end
end

--**********************************
--��ⴥ������
--**********************************
function x211109_CheckAccept( sceneId, selfId )
	--bDone = IsMissionHaveDone( sceneId, selfId, g_MissionIdPre );
	--if bDone > 0 then
		return 1;
	--else
	--	return 0;
	--end
end

--**********************************
--����
--**********************************
function x211109_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x211109_g_MissionId, x211109_g_ScriptId, 0, 1, 0 )
	misIndex = GetMissionIndexByID(sceneId,selfId,x211109_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
end

--**********************************
--����
--**********************************
function x211109_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x211109_g_MissionId )
end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x211109_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x211109_g_MissionComplete);
    EndEvent(sceneId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x211109_g_ScriptId,x211109_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x211109_CheckSubmit( sceneId, selfId )
    misIndex = GetMissionIndexByID(sceneId,selfId,x211109_g_MissionId)	
	num = GetMissionParam(sceneId,selfId,misIndex,0)
	if num < 1 then
		return 0
	else
		return 1
	end
end

--**********************************
--�ύ����ɣ�
--**********************************
function x211109_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	ret = x211109_CheckSubmit( sceneId, selfId );
	if ret > 0 then
		--ɾ����������б��ж�Ӧ������
		ret = DelMission( sceneId, selfId, x211109_g_MissionId );
		if ret > 0 then
			MissionCom( sceneId, selfId, x211109_g_MissionId )
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x211109_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x211109_OnEnterArea( sceneId, selfId, areaId )
	if areaId ==2111  then
		misIndex=GetMissionIndexByID(sceneId,selfId,x211109_g_MissionId)		--ȡ�������������б��е�index
		num = GetMissionParam(sceneId,selfId,misIndex,0)				--����indexȡ�����������һλ��ֵ
		if num < 1 then				--���������������ɵ�����
			SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)		--���������һλ����1
			BeginEvent(sceneId)										--��ʾ��ʾ��Ϣ
				strText = format("�Ѿ�̽������%d/1", GetMissionParam(sceneId,selfId,misIndex,0) )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)						--����ʾ��Ϣ����
		end
	end
end

--**********************************
--���߸ı�
--**********************************
function x211109_OnItemChanged( sceneId, selfId, itemdataId )
end
