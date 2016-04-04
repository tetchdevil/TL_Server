--̽����ͼ����
--Ѱ�Һ������ͼ��
--MisDescBegin
--�ű���
x211901_g_ScriptId = 211901

--ǰ������
--g_MissionIdPre  = 

--�����
x211901_g_MissionId = 621

--�������
x211901_g_MissionKind = 39

--����ȼ�
x211901_g_MissionLevel = 79

--�Ƿ��Ǿ�Ӣ����
x211901_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������*******
--�����Ƿ��Ѿ����
x211901_g_IsMissionOkFail = 0		--�����ĵ�0λ


--*******************�����Ƕ�̬��ʾ***********

--�����ı�����
x211901_g_MissionName="Ѱ�Һ������ͼ��"
x211901_g_MissionInfo="����ҵ��������̳�ҵ��������ͼ��"
x211901_g_MissionTarget="����Ŀ�꣺\nѰ�Һ������ͼ��"
x211901_g_ContinueInfo="���ҵ�������ͼ����ô��"		--δ��������npc�Ի�
x211901_g_MissionComplete="������ҵ��������̳�ˣ�л��л��"

--����

--������Ŀ��npc
x211901_g_Name = "����"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x211901_OnDefaultEvent( sceneId, selfId, targetId )
	 --������������
    if IsMissionHaveDone( sceneId, selfId, x211901_g_MissionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x211901_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x211901_g_Name then
			--���ͽ�����ǰ��������Ϣ
    		BeginEvent(sceneId)
    		AddText(sceneId,x211901_g_ContinueInfo);
    		EndEvent(sceneId)
    		
    		done = x211901_CheckSubmit( sceneId, selfId );
   			DispatchMissionDemandInfo(sceneId,selfId,targetId,x211901_g_ScriptId,x211901_g_MissionId,done)
 		end
    --���������������
    elseif x211901_CheckAccept(sceneId,selfId) > 0 then
		--if GetName(sceneId,targetId) ~= x211901_g_Name then			--���������̽����ͼ,���Է�����ͽ�������ͬһ��npc,��ǰ�ͻ�����ͬһ��npc,��˲���Ҫ����ж�
			--�����������ʱ��ʾ����Ϣ
	    	BeginEvent(sceneId)
    		AddText(sceneId,x211901_g_MissionName);
    		AddText(sceneId,x211901_g_MissionInfo);
    		AddText(sceneId,x211901_g_MissionTarget);
	    	EndEvent(sceneId)
	    	DispatchMissionInfo(sceneId,selfId,targetId,x211901_g_ScriptId,x211901_g_MissionId)
		--end
    end
end

--**********************************
--�о��¼�
--**********************************
function x211901_OnEnumerate( sceneId, selfId, targetId )
	
	if IsMissionHaveDone( sceneId, selfId, x211901_g_MissionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x211901_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x211901_g_Name then
			AddNumText(sceneId, x211901_g_ScriptId,x211901_g_MissionName)
		end
    --���������������
    elseif x211901_CheckAccept(sceneId,selfId) > 0 then
		--if GetName(sceneId,targetId) ~= x211901_g_Name then		--���������̽����ͼ,���Է�����ͽ�������ͬһ��npc,��ǰ�ͻ�����ͬһ��npc,��˲���Ҫ����ж�
		AddNumText(sceneId, x211901_g_ScriptId, x211901_g_MissionName);
		--end
    end
end

--**********************************
--��ⴥ������
--**********************************
function x211901_CheckAccept( sceneId, selfId )
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
function x211901_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x211901_g_MissionId, x211901_g_ScriptId, 0, 1, 0 )
	misIndex = GetMissionIndexByID(sceneId,selfId,x211901_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
end

--**********************************
--����
--**********************************
function x211901_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x211901_g_MissionId )
end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x211901_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x211901_g_MissionComplete);
    EndEvent(sceneId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x211901_g_ScriptId,x211901_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x211901_CheckSubmit( sceneId, selfId )
    misIndex = GetMissionIndexByID(sceneId,selfId,x211901_g_MissionId)	
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
function x211901_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	ret = x211901_CheckSubmit( sceneId, selfId );
	if ret > 0 then
		--ɾ����������б��ж�Ӧ������
		ret = DelMission( sceneId, selfId, x211901_g_MissionId );
		if ret > 0 then
			MissionCom( sceneId, selfId, x211901_g_MissionId )
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x211901_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x211901_OnEnterArea( sceneId, selfId, areaId )
	if areaId ==2811  then
		misIndex=GetMissionIndexByID(sceneId,selfId,x211901_g_MissionId)		--ȡ�������������б��е�index
		num = GetMissionParam(sceneId,selfId,misIndex,0)				--����indexȡ�����������һλ��ֵ
		if num < 1 then				--���������������ɵ�����
			SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)		--���������һλ����1
			BeginEvent(sceneId)										--��ʾ��ʾ��Ϣ
				strText = format("�ҵ��������ͼ��%d/1", GetMissionParam(sceneId,selfId,misIndex,0) )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)						--����ʾ��Ϣ����
		end
	end
end

--**********************************
--���߸ı�
--**********************************
function x211901_OnItemChanged( sceneId, selfId, itemdataId )
end
