--�ͻ�����
--ս������
--MisDescBegin
--�ű���
x211905_g_ScriptId = 211905

--ǰ������
x211905_g_MissionIdPre  = 624

--�����
x211905_g_MissionId = 625

--�������
x211905_g_MissionKind = 39

--����ȼ�
x211905_g_MissionLevel = 80

--�Ƿ��Ǿ�Ӣ����
x211905_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x211905_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

--������Ҫ��Ʒ
x211905_g_DemandItem={{id=40002079,num=1}}	--������1λ

--�����ı�����
x211905_g_MissionName="ս������"
x211905_g_MissionInfo="��ս�����������������������Ƭ������"
x211905_g_MissionTarget="��ս�����������������������Ƭ������"
x211905_g_ContinueInfo="���������������Ҹ����"
x211905_g_MissionComplete="лл��"

--����ID
x211905_g_ItemID = 40002079

--����

--�ջ���
x211905_g_Name = "����"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x211905_OnDefaultEvent( sceneId, selfId, targetId )
	--����ѽӴ�����
    if IsMissionHaveDone( sceneId, selfId, x211905_g_MissionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x211905_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x211905_g_Name then
			--���ͽ�����ǰ��������Ϣ
    		BeginEvent(sceneId)
    		AddText(sceneId,x211905_g_ContinueInfo);
    		AddItemDemand( sceneId, x211905_g_ItemID, 1 );
    		EndEvent(sceneId)
    		done = x211905_CheckSubmit( sceneId, selfId );
   			DispatchMissionDemandInfo(sceneId,selfId,targetId,x211905_g_ScriptId,x211905_g_MissionId,done)
 		end
    --���������������
    elseif x211905_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x211905_g_Name then
			--�����������ʱ��ʾ����Ϣ
	    	BeginEvent(sceneId)
    		AddText(sceneId,x211905_g_MissionName);
    		AddText(sceneId,x211905_g_MissionInfo);
    		AddText(sceneId,x211905_g_MissionTarget);
	    	EndEvent(sceneId)
	    	DispatchMissionInfo(sceneId,selfId,targetId,x211905_g_ScriptId,x211905_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x211905_OnEnumerate( sceneId, selfId, targetId )
	--���û�����ǰ������
	if IsMissionHaveDone( sceneId, selfId, x211905_g_MissionIdPre ) <= 0 then
		return 
	end
	if IsMissionHaveDone( sceneId, selfId, x211905_g_MissionId ) > 0 then
		return 
	elseif IsHaveMission(sceneId,selfId,x211905_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x211905_g_Name then
			AddNumText(sceneId, x211905_g_ScriptId,x211905_g_MissionName)
		end
	--���������������
	elseif x211905_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x211905_g_Name then
			AddNumText(sceneId, x211905_g_ScriptId, x211905_g_MissionName);
		end
	end
end

--**********************************
--��ⴥ������
--**********************************
function x211905_CheckAccept( sceneId, selfId )
	--bDone = IsMissionHaveDone( sceneId, selfId, x211905_g_MissionIdPre );
	--if bDone > 0 then
		return 1;
	--else
	--	return 0;
	--end
end

--**********************************
--����
--**********************************
function x211905_OnAccept( sceneId, selfId )
	--������������б�
	--����������Ʒ
	BeginAddItem( sceneId )
	AddItem( sceneId, x211905_g_ItemID, 1 )
	ret = EndAddItem( sceneId, selfId )
	if ret > 0 then 
		ret = AddMission( sceneId,selfId, x211905_g_MissionId, x211905_g_ScriptId, 0, 0, 0 )	
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			--����2�����д��AddMission֮��
			misIndex = GetMissionIndexByID(sceneId,selfId,x211905_g_MissionId)			--�õ���������к�
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)		--�������кŰ���������ĵ�0λ��1 (����������)
		else
			BeginEvent(sceneId)
				strText = "�������ʧ��"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	else
		BeginEvent(sceneId)
			strText = "��������,�޷���������"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end

--**********************************
--����
--**********************************
function x211905_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    res = DelMission( sceneId, selfId, x211905_g_MissionId )
	if res > 0 then
		--��ȥ������Ʒ
		DelItem( sceneId, selfId, x211905_g_ItemID, 1 )
	end
end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x211905_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x211905_g_MissionComplete);
    EndEvent(sceneId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x211905_g_ScriptId,x211905_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x211905_CheckSubmit( sceneId, selfId )
    itemNum = GetItemCount( sceneId, selfId, x211905_g_ItemID );
    if itemNum > 0 then
    	return 1;
    end
	return 0
end

--**********************************
--�ύ����ɣ�
--**********************************
function x211905_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	ret = x211905_CheckSubmit( sceneId, selfId );
	if ret > 0 then
		--ɾ����������б��ж�Ӧ������
		ret = 	DelMission( sceneId, selfId, x211905_g_MissionId )
		if ret > 0 then
    		MissionCom( sceneId, selfId, x211905_g_MissionId )
			DelItem( sceneId,selfId,x211905_g_ItemID,1)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x211905_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x211905_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x211905_OnItemChanged( sceneId, selfId, itemdataId )
end
