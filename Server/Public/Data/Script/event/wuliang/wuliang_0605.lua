--̽����ͼ����
--�������
--MisDescBegin
--�ű���
x210605_g_ScriptId = 210605

--ǰ������
--g_MissionIdPre  = 

--�����
x210605_g_MissionId = 495

--�������
x210605_g_MissionKind = 17

--����ȼ�
x210605_g_MissionLevel = 15

--�Ƿ��Ǿ�Ӣ����
x210605_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������*******
--�����Ƿ��Ѿ����
x210605_g_IsMissionOkFail = 0		--�����ĵ�0λ


--*******************�����Ƕ�̬��ʾ***********

--�Զ���
--g_Custom={{id="�������������",num=1}}

--�����ı�����
x210605_g_MissionName="�������\n"
x210605_g_MissionInfo="  ��������ɽ�У���һ���Ĺ���̶�������õĻ�������͸��������һ��׳�۵���ڣ��·����ӵ�ױ����\n\n  ������Լ�ܿ������˶����ľ��󣬽������Ľ������ö���������"
x210605_g_MissionTarget="\n\n����Ŀ�꣺\n������������ɽ�ȱ������������"
x210605_g_ContinueInfo="  �㿴����ô��"		--δ��������npc�Ի�
x210605_g_MissionComplete="  ���ǻ����ȥ�����ܶ���������һ������֪��������һ��ȥ�������е�������Լ������õļ�����������"

--����

--������Ŀ��npc
x210605_g_Name = "��˫��"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210605_OnDefaultEvent( sceneId, selfId, targetId )
	 --������������
    if IsMissionHaveDone( sceneId, selfId, x210605_g_MissionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x210605_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210605_g_Name then
			--���ͽ�����ǰ��������Ϣ
    		BeginEvent(sceneId)
    		AddText(sceneId,x210605_g_ContinueInfo);
    		EndEvent(sceneId)
    		
    		done = x210605_CheckSubmit( sceneId, selfId );
   			DispatchMissionDemandInfo(sceneId,selfId,targetId,x210605_g_ScriptId,x210605_g_MissionId,done)
 		end
    --���������������
    elseif x210605_CheckAccept(sceneId,selfId) > 0 then
		--if GetName(sceneId,targetId) ~= x210605_g_Name then		--���������̽����ͼ,���Է�����ͽ�������ͬһ��npc,��ǰ�ͻ�����ͬһ��npc,��˲���Ҫ����ж�
			--�����������ʱ��ʾ����Ϣ
	    	BeginEvent(sceneId)
    		AddText(sceneId,x210605_g_MissionName);
    		AddText(sceneId,x210605_g_MissionInfo);
    		AddText(sceneId,x210605_g_MissionTarget);
	    	EndEvent(sceneId)
	    	DispatchMissionInfo(sceneId,selfId,targetId,x210605_g_ScriptId,x210605_g_MissionId)
		--end
    end
end

--**********************************
--�о��¼�
--**********************************
function x210605_OnEnumerate( sceneId, selfId, targetId )
	
	if IsMissionHaveDone( sceneId, selfId, x210605_g_MissionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x210605_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210605_g_Name then
			AddNumText(sceneId, x210605_g_ScriptId,x210605_g_MissionName)
		end
    --���������������
    elseif x210605_CheckAccept(sceneId,selfId) > 0 then
		--if GetName(sceneId,targetId) ~= x210605_g_Name then      --���������̽����ͼ,���Է�����ͽ�������ͬһ��npc,��ǰ�ͻ�����ͬһ��npc,��˲���Ҫ����ж�
		AddNumText(sceneId, x210605_g_ScriptId, x210605_g_MissionName);
		--end
    end
end

--**********************************
--��ⴥ������
--**********************************
function x210605_CheckAccept( sceneId, selfId )
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
function x210605_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210605_g_MissionId, x210605_g_ScriptId, 0, 1, 0 )
	misIndex = GetMissionIndexByID(sceneId,selfId,x210605_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
end

--**********************************
--����
--**********************************
function x210605_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210605_g_MissionId )
end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x210605_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x210605_g_MissionComplete);
    EndEvent(sceneId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210605_g_ScriptId,x210605_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210605_CheckSubmit( sceneId, selfId )
    misIndex = GetMissionIndexByID(sceneId,selfId,x210605_g_MissionId)	
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
function x210605_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	ret = x210605_CheckSubmit( sceneId, selfId );
	if ret > 0 then
		--ɾ����������б��ж�Ӧ������
		ret = DelMission( sceneId, selfId, x210605_g_MissionId );
		if ret > 0 then
			MissionCom( sceneId, selfId, x210605_g_MissionId )
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x210605_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210605_OnEnterArea( sceneId, selfId, areaId )
	if areaId ==0611  then
		--��ʾ��������Ի���
		BeginEvent(sceneId)
			AddText(sceneId,"  ...��������ϡ������˫���������...\n\n  ������ɽ��ӳ��һ���Ĺȣ������ּ䣬�·�һ���ɾ���������һ�������Ĵ�ʯ�������֣�Թ�����������������ڡ�  \n\n  ��ڳɷ�ӳˮ��\n  ��ɽ��ˮ�����\n  ˭�����ӿ�ױ��\n  �����˼�����\n")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,selfId)
		--������
		misIndex=GetMissionIndexByID(sceneId,selfId,x210605_g_MissionId)		--ȡ�������������б��е�index
		num = GetMissionParam(sceneId,selfId,misIndex,0)				--����indexȡ�����������һλ��ֵ
		if num < 1 then				--���������������ɵ�����
			SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)		--���������һλ����1
			BeginEvent(sceneId)										--��ʾ��ʾ��Ϣ
				strText = format("������赣�����ɣ�", GetMissionParam(sceneId,selfId,misIndex,0) )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)						--����ʾ��Ϣ����
		end
	end
end

--**********************************
--���߸ı�
--**********************************
function x210605_OnItemChanged( sceneId, selfId, itemdataId )
end
