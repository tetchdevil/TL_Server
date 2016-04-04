--�ͻ�����
--�ж�
--MisDescBegin
--�ű���
x212002_g_ScriptId = 212002

--ǰ������
--g_MissionIdPre  = 

--�����
x212002_g_MissionId = 632

--�������
x212002_g_MissionKind = 40

--����ȼ�
x212002_g_MissionLevel = 76

--�Ƿ��Ǿ�Ӣ����
x212002_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x212002_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

--������Ҫ����Ʒ
x212002_g_DemandItem={{id=40002086,num=1}}		--������1λ

--�����ı�����
x212002_g_MissionName="�ж�"
x212002_g_MissionInfo="���Ұ��ҵĻ����������������"
x212002_g_MissionTarget="������Ļ����������������"
x212002_g_ContinueInfo="���ǰ������Ҹ����"
x212002_g_MissionComplete="лл"

--����ID
x212002_g_ItemID = 40002086

--����

--�ջ���
x212002_g_Name = "����"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x212002_OnDefaultEvent( sceneId, selfId, targetId )
	--����ѽӴ�����
    if IsMissionHaveDone( sceneId, selfId, x212002_g_MissionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x212002_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212002_g_Name then
			--���ͽ�����ǰ��������Ϣ
    		BeginEvent(sceneId)
				AddText(sceneId,x212002_g_ContinueInfo);
				AddItemDemand( sceneId, x212002_g_ItemID, 1 );
    		EndEvent(sceneId)
    		done = x212002_CheckSubmit( sceneId, selfId );
   			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212002_g_ScriptId,x212002_g_MissionId,done)
 		end
    --���������������
    elseif x212002_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212002_g_Name then
			--�����������ʱ��ʾ����Ϣ
	    	BeginEvent(sceneId)
				AddText(sceneId,x212002_g_MissionName);
				AddText(sceneId,x212002_g_MissionInfo);
				AddText(sceneId,x212002_g_MissionTarget);
	    	EndEvent(sceneId)
	    	DispatchMissionInfo(sceneId,selfId,targetId,x212002_g_ScriptId,x212002_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x212002_OnEnumerate( sceneId, selfId, targetId )
	if IsMissionHaveDone( sceneId, selfId, x212002_g_MissionId ) > 0 then
		return 
	elseif IsHaveMission(sceneId,selfId,x212002_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212002_g_Name then
			AddNumText(sceneId, x212002_g_ScriptId,x212002_g_MissionName)
		end
	--���������������
	elseif x212002_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212002_g_Name then
			AddNumText(sceneId, x212002_g_ScriptId, x212002_g_MissionName);
		end
	end
end

--**********************************
--��ⴥ������
--**********************************
function x212002_CheckAccept( sceneId, selfId )
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
function x212002_OnAccept( sceneId, selfId )
	--������������б�
	--����������Ʒ
	BeginAddItem( sceneId )
		AddItem( sceneId, x212002_g_ItemID, 1 )
	ret = EndAddItem( sceneId, selfId )
	if ret > 0 then 
		ret = AddMission( sceneId,selfId, x212002_g_MissionId, x212002_g_ScriptId, 0, 0, 0 )	
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			--����2�����д��AddMission֮��
			misIndex = GetMissionIndexByID(sceneId,selfId,x212002_g_MissionId)			--�õ���������к�
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
function x212002_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    res = DelMission( sceneId, selfId, x212002_g_MissionId )
	if res > 0 then
		--��ȥ������Ʒ
		DelItem( sceneId, selfId, x212002_g_ItemID, 1 )
	end
end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x212002_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x212002_g_MissionComplete);
    EndEvent(sceneId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x212002_g_ScriptId,x212002_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212002_CheckSubmit( sceneId, selfId )
    itemNum = GetItemCount( sceneId, selfId, x212002_g_ItemID );
    if itemNum > 0 then
    	return 1;
    end
	return 0
end

--**********************************
--�ύ����ɣ�
--**********************************
function x212002_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	ret = x212002_CheckSubmit( sceneId, selfId );
	if ret > 0 then
		--ɾ����������б��ж�Ӧ������
		ret = 	DelMission( sceneId, selfId, x212002_g_MissionId )
		if ret > 0 then
    		MissionCom( sceneId, selfId, x212002_g_MissionId )
			DelItem( sceneId,selfId,x212002_g_ItemID,1)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x212002_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x212002_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x212002_OnItemChanged( sceneId, selfId, itemdataId )
end
