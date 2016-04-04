--ʹ�õ�������
--��������ָʾ
--MisDescBegin
--�ű���
x212007_g_ScriptId = 212007

--��һ�������Id
x212007_g_MissionIdPre1 = 634
x212007_g_MissionIdPre2 = 635
x212007_g_MissionIdPre3 = 636

--�����
x212007_g_MissionId = 637

--�������
x212007_g_MissionKind = 40

--����ȼ�
x212007_g_MissionLevel = 78

--�Ƿ��Ǿ�Ӣ����
x212007_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������
--�����Ƿ��Ѿ����
x212007_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������Ҫ��Ʒ
x212007_g_DemandItem={{id=40002090,num=1}}		--������1λ

--�����ı�����
x212007_g_MissionName="��������ָʾ"
x212007_g_MissionInfo="�õ���������ָʾ"
x212007_g_MissionTarget="�õ���������ָʾ"
x212007_g_missionRenContinueInfo="��������ָʾ�������ô?"
x212007_g_MissionComplete="�ɵò���"


--��Ʒ���
x212007_g_ItemId1 = 40002087		--�����޻����
x212007_g_ItemId2 =	40002088		--��ҹ���޻����
x212007_g_ItemId3 =	40002089		--������޻����
x212007_g_ItemId4 = 40002090		--��������ָʾ

--���������������
x212007_g_ItemNeedNum1 = 1
x212007_g_ItemNeedNum2 = 1
x212007_g_ItemNeedNum3 = 1
x212007_g_ItemNeedNum4 = 1



--����

--�ջ���
x212007_g_Name = "����"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x212007_OnDefaultEvent( sceneId, selfId, targetId )
	--����ѽӴ�����
    --if IsMissionHaveDone( sceneId, selfId, x212007_g_MissionId ) > 0 then
	--	return 
    --else
	if IsHaveMission(sceneId,selfId,x212007_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212007_g_Name then
			--���ͽ�����ǰ��������Ϣ
    		BeginEvent(sceneId)
				AddText(sceneId,x212007_g_missionRenContinueInfo);
				AddItemDemand( sceneId, g_ItemId, 1 );
    		EndEvent(sceneId)
    		done = x212007_CheckSubmit( sceneId, selfId );
   			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212007_g_ScriptId,x212007_g_MissionId,done)
 		end
    --���������������
    elseif x212007_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212007_g_Name then
			--�����������ʱ��ʾ����Ϣ
	    	BeginEvent(sceneId)
				AddText(sceneId,x212007_g_MissionName);
				AddText(sceneId,x212007_g_MissionInfo);
				AddText(sceneId,x212007_g_MissionTarget);
	    	EndEvent(sceneId)
	    	DispatchMissionInfo(sceneId,selfId,targetId,x212007_g_ScriptId,x212007_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x212007_OnEnumerate( sceneId, selfId, targetId )
	if IsMissionHaveDone( sceneId, selfId, x212007_g_MissionId ) > 0 then
		return 
	elseif IsMissionHaveDone( sceneId, selfId, x212007_g_MissionIdPre1 ) == 0 then
		return
	elseif	IsMissionHaveDone( sceneId, selfId, x212007_g_MissionIdPre2 ) == 0 then
		return
	elseif	IsMissionHaveDone( sceneId, selfId, x212007_g_MissionIdPre3 ) == 0 then
		return
	elseif IsHaveMission(sceneId,selfId,x212007_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212007_g_Name then
			AddNumText(sceneId, x212007_g_ScriptId,x212007_g_MissionName)
		end
	--���������������
	elseif x212007_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212007_g_Name then
			AddNumText(sceneId, x212007_g_ScriptId, x212007_g_MissionName);
		end
	end
end

--**********************************
--��ⴥ������
--**********************************
function x212007_CheckAccept( sceneId, selfId )
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
function x212007_OnAccept( sceneId, selfId )
	--������������б�
	--����������Ʒ
	BeginAddItem( sceneId )
		AddItem( sceneId, x212007_g_ItemId1, 1 )
		AddItem( sceneId, x212007_g_ItemId2, 1 )
		AddItem( sceneId, x212007_g_ItemId3, 1 )
	ret = EndAddItem( sceneId, selfId )
	if ret > 0 then 
		ret = AddMission( sceneId,selfId, x212007_g_MissionId, x212007_g_ScriptId, 0, 0, 0 )	
		--if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
		--end
	else
		BeginEvent(sceneId)
			AddText(sceneId,"��������")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end

--**********************************
--����
--**********************************
function x212007_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    res = DelMission( sceneId, selfId, x212007_g_MissionId )
	if res > 0 then
		--��ȥ������Ʒ
		DelItem( sceneId, selfId, x212007_g_ItemId1, 1 )
		DelItem( sceneId, selfId, x212007_g_ItemId2, 1 )
		DelItem( sceneId, selfId, x212007_g_ItemId3, 1 )
	end
end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x212007_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x212007_g_MissionComplete);
    EndEvent(sceneId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x212007_g_ScriptId,x212007_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212007_CheckSubmit( sceneId, selfId )
    itemNum = GetItemCount( sceneId, selfId, x212007_g_ItemId4 );
    if itemNum > 0 then
    	return 1;
    end
	return 0
end

--**********************************
--�ύ����ɣ�
--**********************************
function x212007_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	ret = x212007_CheckSubmit( sceneId, selfId );
	if ret > 0 then
		--ɾ����������б��ж�Ӧ������
		ret = 	DelMission( sceneId, selfId, x212007_g_MissionId )
		if ret > 0 then
    		MissionCom( sceneId, selfId, x212007_g_MissionId )
			DelItem( sceneId,selfId,x212007_g_ItemId4,1)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x212007_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x212007_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x212007_OnItemChanged( sceneId, selfId, itemdataId )
end
