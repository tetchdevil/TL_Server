--�ͻ�����
--���齣
--MisDescBegin
--�ű���
x211106_g_ScriptId = 211106

--ǰ������
x211106_g_MissionIdPre  = 545

--�����
x211106_g_MissionId = 546

--�������
x211106_g_MissionKind = 31

--����ȼ�
x211106_g_MissionLevel = 56

--�Ƿ��Ǿ�Ӣ����
x211106_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x211106_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

--������Ҫ�õ�����Ʒ
x211106_g_DemandItem={{id=40002065,num=1}}		--������1λ

--�����ı�����
x211106_g_MissionName="���齣"
x211106_g_MissionInfo="����������ϲ����Ѿͷ�����˼��ǿ���������Ҫ�Ǻ��˼Һã����ǰ�Ϲ���˼�������𣿰Ѱ��Ľ��͸������ɣ���˵��û�⸣����"
x211106_g_MissionTarget="����ϵĽ���������"
x211106_g_ContinueInfo="����������Ҹ����"
x211106_g_MissionComplete="ԭ����ֻϲ���Ǹ�ɵɵ��Ѿͷ��ȴ��ϲ�������֦��Ҷ�Ŀ�����"

--����ID
x211106_g_ItemID = 40002065

--����

--�ջ���
x211106_g_Name = "��Ǿ"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x211106_OnDefaultEvent( sceneId, selfId, targetId )
    --����ѽӴ�����
    if IsMissionHaveDone( sceneId, selfId, x211106_g_MissionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x211106_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x211106_g_Name then
			--���ͽ�����ǰ��������Ϣ
    		BeginEvent(sceneId)
    		AddText(sceneId,x211106_g_ContinueInfo);
    		AddItemDemand( sceneId, x211106_g_ItemID, 1 );
    		EndEvent(sceneId)
      		done = x211106_CheckSubmit( sceneId, selfId );
   			DispatchMissionDemandInfo(sceneId,selfId,targetId,x211106_g_ScriptId,x211106_g_MissionId,done)
 		end
    --���������������
    elseif x211106_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x211106_g_Name then
			--�����������ʱ��ʾ����Ϣ
	    	BeginEvent(sceneId)
    		AddText(sceneId,x211106_g_MissionName);
    		AddText(sceneId,x211106_g_MissionInfo);
    		AddText(sceneId,x211106_g_MissionTarget);
	    	EndEvent(sceneId)
	    	DispatchMissionInfo(sceneId,selfId,targetId,x211106_g_ScriptId,x211106_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x211106_OnEnumerate( sceneId, selfId, targetId )
	--�ж��Ƿ������ǰ������
	if	IsMissionHaveDone( sceneId, selfId, x211106_g_MissionIdPre ) <= 0 then
		return
	end
	
	if IsMissionHaveDone( sceneId, selfId, x211106_g_MissionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x211106_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x211106_g_Name then
			AddNumText(sceneId, x211106_g_ScriptId,x211106_g_MissionName)
		end
    --���������������
    elseif x211106_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x211106_g_Name then
			AddNumText(sceneId, x211106_g_ScriptId, x211106_g_MissionName);
		end
    end
end

--**********************************
--��ⴥ������
--**********************************
function x211106_CheckAccept( sceneId, selfId )
	--bDone = IsMissionHaveDone( sceneId, selfId, x211106_g_MissionIdPre );
	--if bDone > 0 then
		return 1;
	--else
	--	return 0;
	--end
end

--**********************************
--����
--**********************************
function x211106_OnAccept( sceneId, selfId )
	--������������б�
	--����������Ʒ
	BeginAddItem( sceneId )
	AddItem( sceneId, x211106_g_ItemID, 1 )
	ret = EndAddItem( sceneId, selfId )
	if ret > 0 then 
		ret = AddMission( sceneId,selfId, x211106_g_MissionId, x211106_g_ScriptId, 0, 0, 0 )
		misIndex = GetMissionIndexByID(sceneId,selfId,x211106_g_MissionId)			--�õ���������к�
		SetMissionByIndex(sceneId,selfId,misIndex,0,1)		--�������кŰ���������ĵ�0λ��1 (����������)
		SetMissionByIndex(sceneId,selfId,misIndex,1,1)		--�������кŰ���������ĵ�0λ��1 (�ѵõ�����)
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
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
function x211106_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    res = DelMission( sceneId, selfId, x211106_g_MissionId )
	if res > 0 then
		--��ȥ������Ʒ
		DelItem( sceneId, selfId, x211106_g_ItemID, 1 )
	end
end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x211106_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x211106_g_MissionComplete);
    EndEvent(sceneId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x211106_g_ScriptId,x211106_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x211106_CheckSubmit( sceneId, selfId )
    itemNum = GetItemCount( sceneId, selfId, x211106_g_ItemID );
    if itemNum > 0 then
    	return 1;
    end
	return 0
end

--**********************************
--�ύ����ɣ�
--**********************************
function x211106_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	ret = x211106_CheckSubmit( sceneId, selfId );
	if ret > 0 then
		--ɾ����������б��ж�Ӧ������
		ret = DelMission( sceneId, selfId, x211106_g_MissionId )
		if ret > 0 then
    		MissionCom( sceneId, selfId, x211106_g_MissionId )
			DelItem( sceneId,selfId,x211106_g_ItemID,1)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x211106_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x211106_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x211106_OnItemChanged( sceneId, selfId, itemdataId )
end
