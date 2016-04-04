--̽����ͼ����
--������
--MisDescBegin
--�ű���
x210908_g_ScriptId = 210908

--��һ�������ID
--g_MissionIdPre = 

--�����
x210908_g_MissionId = 528

--�������
x210908_g_MissionKind = 29

--����ȼ�
x210908_g_MissionLevel = 25

--�Ƿ��Ǿ�Ӣ����
x210908_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������*******
--�����Ƿ��Ѿ����
x210908_g_IsMissionOkFail = 0		--�����ĵ�0λ


--*******************�����Ƕ�̬��ʾ***********

--�����ı�����
x210908_g_MissionName="������"
x210908_g_MissionInfo="�㱱���ɾ������������µĹ��ƣ���ȥ�㱱��ս�������һ�µ��˵������Ȼ��������ұ���"
x210908_g_MissionTarget="���㱱��ս����ȥ������"
x210908_g_ContinueInfo="���Ѿ����������"
x210908_g_MissionComplete="��ϲ���������"

--����
x210908_g_MoneyBonus=908

--������Ŀ��npc
x210908_g_Name	="������"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210908_OnDefaultEvent( sceneId, selfId, targetId )

    --��������ɹ��������
    --if IsMissionHaveDone(sceneId,selfId,x210908_g_MissionId) > 0 then
    --	return
    	
    --����ѽӴ�����
    --else
    if IsHaveMission(sceneId,selfId,x210908_g_MissionId) > 0 then
    	--���������������Ϣ
        BeginEvent(sceneId)
        AddText(sceneId,x210908_g_MissionName)
        AddText(sceneId,x210908_g_ContinueInfo)
        EndEvent( )
        bDone = x210908_CheckSubmit( sceneId, selfId )
        DispatchMissionDemandInfo(sceneId,selfId,targetId,x210908_g_ScriptId,x210908_g_MissionId,bDone)
    		
    --���������������
    elseif x210908_CheckAccept(sceneId,selfId) > 0 then
    	--�����������ʱ��ʾ����Ϣ
        BeginEvent(sceneId)
			AddText(sceneId,x210908_g_MissionName)
			AddText(sceneId,x210908_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x210908_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}")
			AddMoneyBonus( sceneId, x210908_g_MoneyBonus )
      	EndEvent( )
      	DispatchMissionInfo(sceneId,selfId,targetId,x210908_g_ScriptId,x210908_g_MissionId)
    end
end

--**********************************
--�о��¼�
--**********************************
function x210908_OnEnumerate( sceneId, selfId, targetId )
	
    if IsMissionHaveDone(sceneId,selfId,x210908_g_MissionId) > 0 then
    	return 
    elseif IsHaveMission(sceneId,selfId,x210908_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210908_g_Name then
			AddNumText(sceneId, x210908_g_ScriptId,x210908_g_MissionName)
		end
		--���������������
		elseif x210908_CheckAccept(sceneId,selfId) > 0 then
		--if GetName(sceneId,targetId) ~= x210908_g_Name then      --���������̽����ͼ,���Է�����ͽ�������ͬһ��npc,��ǰ�ͻ�����ͬһ��npc,��˲���Ҫ����ж�
			AddNumText(sceneId,x210908_g_ScriptId,x210908_g_MissionName);
		--end
	end
end

--**********************************
--��ⴥ������
--**********************************
function x210908_CheckAccept( sceneId, selfId )
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
function x210908_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210908_g_MissionId, x210908_g_ScriptId, 0, 1, 0 )
	misIndex = GetMissionIndexByID(sceneId,selfId,x210908_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
end

--**********************************
--����
--**********************************
function x210908_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210908_g_MissionId )
end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x210908_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x210908_g_MissionComplete);
    EndEvent(sceneId)

    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210908_g_ScriptId,x210908_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210908_CheckSubmit( sceneId, selfId )
		misIndex = GetMissionIndexByID(sceneId,selfId,x210908_g_MissionId)
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
function x210908_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	ret = x210908_CheckSubmit( sceneId, selfId );
	if ret > 0 then
		--ɾ����������б��ж�Ӧ������
		ret = DelMission( sceneId, selfId, x210908_g_MissionId );
		if ret > 0 then
			MissionCom( sceneId, selfId, x210908_g_MissionId )
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x210908_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210908_OnEnterArea( sceneId, selfId, areaId )
		if areaId ==1911  then
			misIndex=GetMissionIndexByID(sceneId,selfId,x210908_g_MissionId)
			num = GetMissionParam(sceneId,selfId,misIndex,0)
			if num < 1 then
				SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
				BeginEvent(sceneId)
					strText = format("�Ѿ�̽����ս��%d/1", GetMissionParam(sceneId,selfId,misIndex,0) )
					AddText(sceneId,strText);
				EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)						--����ʾ��Ϣ����
			end
		end
end

--**********************************
--���߸ı�
--**********************************
function x210908_OnItemChanged( sceneId, selfId, itemdataId )
end
