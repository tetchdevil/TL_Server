--�ͻ�����
--��Ԯ
--MisDescBegin
--�ű���
x210608_g_ScriptId = 210608

--ǰ������
--g_MissionIdPre  = 

--�����
x210608_g_MissionId = 498

--�������
x210608_g_MissionKind = 17

--����ȼ�
x210608_g_MissionLevel = 18

--�Ƿ��Ǿ�Ӣ����
x210608_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x210608_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

--������Ҫ�õ�����Ʒ
x210608_g_DemandItem={{id=40002094,num=1}}		--������1λ

--�����ı�����
x210608_g_MissionName="��Ԯ"
x210608_g_MissionInfo="���Ұ�����Ž����ƹ���"
x210608_g_MissionTarget="����Ŀ�꣺\n����˫����Ž����ƹ���"
x210608_g_ContinueInfo="������˫�����Ҹ����"
x210608_g_MissionComplete="лл"

--����ID
x210608_g_ItemID = 40002094

--����

--�ջ���
x210608_g_Name = "�ƹ���"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210608_OnDefaultEvent( sceneId, selfId, targetId )
	--����ѽӴ�����
    if IsMissionHaveDone( sceneId, selfId, x210608_g_MissionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x210608_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210608_g_Name then
			--���ͽ�����ǰ��������Ϣ
    		BeginEvent(sceneId)
				AddText(sceneId,x210608_g_ContinueInfo);
				AddItemDemand( sceneId, x210608_g_ItemID, 1 );
    		EndEvent(sceneId)
    		done = x210608_CheckSubmit( sceneId, selfId );
   			DispatchMissionDemandInfo(sceneId,selfId,targetId,x210608_g_ScriptId,x210608_g_MissionId,done)
 		end
    --���������������
    elseif x210608_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210608_g_Name then
			--�����������ʱ��ʾ����Ϣ
	    	BeginEvent(sceneId)
				AddText(sceneId,x210608_g_MissionName);
				AddText(sceneId,x210608_g_MissionInfo);
				AddText(sceneId,x210608_g_MissionTarget);
	    	EndEvent(sceneId)
	    	DispatchMissionInfo(sceneId,selfId,targetId,x210608_g_ScriptId,x210608_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x210608_OnEnumerate( sceneId, selfId, targetId )
	if IsMissionHaveDone( sceneId, selfId, x210608_g_MissionId ) > 0 then
		return 
	elseif IsHaveMission(sceneId,selfId,x210608_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210608_g_Name then
			AddNumText(sceneId, x210608_g_ScriptId,x210608_g_MissionName)
		end
	--���������������
	elseif x210608_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210608_g_Name then
			AddNumText(sceneId, x210608_g_ScriptId, x210608_g_MissionName);
		end
	end
end

--**********************************
--��ⴥ������
--**********************************
function x210608_CheckAccept( sceneId, selfId )
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
function x210608_OnAccept( sceneId, selfId )
	--������������б�
	--����������Ʒ
	BeginAddItem( sceneId )
		AddItem( sceneId, x210608_g_ItemID, 1 )
	ret = EndAddItem( sceneId, selfId )
	if ret > 0 then 
		ret = AddMission( sceneId,selfId, x210608_g_MissionId, x210608_g_ScriptId, 0, 0, 0 )	
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			--����2�����д��AddMission֮��
			misIndex = GetMissionIndexByID(sceneId,selfId,x210608_g_MissionId)			--�õ���������к�
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
function x210608_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    res = DelMission( sceneId, selfId, x210608_g_MissionId )
	if res > 0 then
		--��ȥ������Ʒ
		DelItem( sceneId, selfId, x210608_g_ItemID, 1 )
	end
end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x210608_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210608_g_MissionComplete);
    EndEvent(sceneId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210608_g_ScriptId,x210608_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210608_CheckSubmit( sceneId, selfId )
    itemNum = GetItemCount( sceneId, selfId, x210608_g_ItemID );
    if itemNum > 0 then
    	return 1;
    end
	return 0
end

--**********************************
--�ύ����ɣ�
--**********************************
function x210608_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	ret = x210608_CheckSubmit( sceneId, selfId );
	if ret > 0 then
		--ɾ����������б��ж�Ӧ������
		ret = 	DelMission( sceneId, selfId, x210608_g_MissionId )
		if ret > 0 then
    		MissionCom( sceneId, selfId, x210608_g_MissionId )
			DelItem( sceneId,selfId,x210608_g_ItemID,1)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x210608_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210608_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210608_OnItemChanged( sceneId, selfId, itemdataId )
end
