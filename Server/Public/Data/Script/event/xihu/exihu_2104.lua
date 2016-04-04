--�ͻ�����
--����������
--MisDescBegin
--�ű���
x212104_g_ScriptId = 212104

--ǰ������
--g_MissionIdPre  = 

--�����
x212104_g_MissionId = 644

--�������
x212104_g_MissionKind = 41

--����ȼ�
x212104_g_MissionLevel = 32

--�Ƿ��Ǿ�Ӣ����
x212104_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x212104_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

--������Ҫ�õ�����Ʒ
x212104_g_DemandItem={{id=40002082,num=1}}		--������1λ

--�����ı�����
x212104_g_MissionName="����������"
x212104_g_MissionInfo="������Ž����շ�"
x212104_g_MissionTarget="������Ž����շ�"
x212104_g_ContinueInfo="��������ҹ���Ҹ����"
x212104_g_MissionComplete="лл��"

--����ID
x212104_g_ItemId =	40002082		--20001026

--����

--�ջ���
x212104_g_Name = "�շ�"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x212104_OnDefaultEvent( sceneId, selfId, targetId )
    --����ѽӴ�����
    if IsMissionHaveDone( sceneId, selfId, x212104_g_MissionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x212104_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212104_g_Name then
			--���ͽ�����ǰ��������Ϣ
    		BeginEvent(sceneId)
    		AddText(sceneId,x212104_g_ContinueInfo);
    		AddItemDemand( sceneId, x212104_g_ItemId, 1 );
    		EndEvent(sceneId)
    		done = x212104_CheckSubmit( sceneId, selfId );
   			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212104_g_ScriptId,x212104_g_MissionId,done)
 		end
    --���������������
    elseif x212104_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212104_g_Name then
			--�����������ʱ��ʾ����Ϣ
	    	BeginEvent(sceneId)
    		AddText(sceneId,x212104_g_MissionName);
    		AddText(sceneId,x212104_g_MissionInfo);
    		AddText(sceneId,x212104_g_MissionTarget);
	    	EndEvent(sceneId)
	    	DispatchMissionInfo(sceneId,selfId,targetId,x212104_g_ScriptId,x212104_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x212104_OnEnumerate( sceneId, selfId, targetId )
	if IsMissionHaveDone( sceneId, selfId, x212104_g_MissionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x212104_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212104_g_Name then
			AddNumText(sceneId, x212104_g_ScriptId,x212104_g_MissionName)
		end
    --���������������
    elseif x212104_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212104_g_Name then
			AddNumText(sceneId, x212104_g_ScriptId, x212104_g_MissionName);
		end
    end
end

--**********************************
--��ⴥ������
--**********************************
function x212104_CheckAccept( sceneId, selfId )
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
function x212104_OnAccept( sceneId, selfId )
	--������������б�
	--����������Ʒ
	BeginAddItem( sceneId )
	AddItem( sceneId, x212104_g_ItemId, 1 )
	ret = EndAddItem( sceneId, selfId )
	if ret > 0 then 
		ret = AddMission( sceneId,selfId, x212104_g_MissionId, x212104_g_ScriptId, 0, 0, 0 )
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			--����2�����д��AddMission֮��
			misIndex = GetMissionIndexByID(sceneId,selfId,x212104_g_MissionId)			--�õ���������к�
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
function x212104_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    res = DelMission( sceneId, selfId, x212104_g_MissionId )
	if res > 0 then
		--��������м����������
		ItemCount = GetItemCount(sceneId,selfId,x212104_g_ItemId)
		--��ȥ������Ʒ
		if ItemCount > 0 then
			DelItem( sceneId, selfId, x212104_g_ItemId, 1 )
		end
	end
end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x212104_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x212104_g_MissionComplete);
    EndEvent(sceneId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x212104_g_ScriptId,x212104_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212104_CheckSubmit( sceneId, selfId )
    itemNum = GetItemCount( sceneId, selfId, x212104_g_ItemId );
    if itemNum > 0 then
    	return 1;
    end
	return 0
end

--**********************************
--�ύ����ɣ�
--**********************************
function x212104_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	ret = x212104_CheckSubmit( sceneId, selfId );
	if ret > 0 then
		--ɾ����������б��ж�Ӧ������
		ret = DelMission( sceneId, selfId, x212104_g_MissionId )
		if ret > 0 then
    		MissionCom( sceneId, selfId, x212104_g_MissionId )
			DelItem( sceneId,selfId,x212104_g_ItemId,1)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x212104_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x212104_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x212104_OnItemChanged( sceneId, selfId, itemdataId )
end
