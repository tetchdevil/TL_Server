--�ͻ�����
--Ѱ�Ұ��Ǵ�
--MisDescBegin
--�ű���
x211305_g_ScriptId = 211305

--ǰ������
--g_MissionIdPre  = 

--�����
x211305_g_MissionId = 565

--�������
x211305_g_MissionKind = 33

--����ȼ�
x211305_g_MissionLevel = 80

--�Ƿ��Ǿ�Ӣ����
x211305_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x211305_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

--������Ҫ�õ�����Ʒ
x211305_g_DemandItem={{id=40002102,num=1}}		--������1λ

--�����ı�����
x211305_g_MissionName="Ѱ�Ұ��Ǵ�"
x211305_g_MissionInfo="���Ұ�����Ŵ������Ǵ�"
x211305_g_MissionTarget="����Ŀ�꣺���ﲧ���Ž������հ��Ǵ�"
x211305_g_ContinueInfo="���Ǹ����"
x211305_g_MissionComplete="лл"

--����ID
x211305_g_ItemID = 40002102

--����

--�ջ���
x211305_g_Name = "���հ��Ǵ�"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x211305_OnDefaultEvent( sceneId, selfId, targetId )
	--����ѽӴ�����
    if IsMissionHaveDone( sceneId, selfId, x211305_g_MissionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x211305_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x211305_g_Name then
			--���ͽ�����ǰ��������Ϣ
    		BeginEvent(sceneId)
				AddText(sceneId,x211305_g_ContinueInfo);
				AddItemDemand( sceneId, x211305_g_ItemID, 1 );
    		EndEvent(sceneId)
    		done = x211305_CheckSubmit( sceneId, selfId );
   			DispatchMissionDemandInfo(sceneId,selfId,targetId,x211305_g_ScriptId,x211305_g_MissionId,done)
 		end
    --���������������
    elseif x211305_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x211305_g_Name then
			--�����������ʱ��ʾ����Ϣ
	    	BeginEvent(sceneId)
				AddText(sceneId,x211305_g_MissionName);
				AddText(sceneId,x211305_g_MissionInfo);
				AddText(sceneId,x211305_g_MissionTarget);
	    	EndEvent(sceneId)
	    	DispatchMissionInfo(sceneId,selfId,targetId,x211305_g_ScriptId,x211305_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x211305_OnEnumerate( sceneId, selfId, targetId )
	if IsMissionHaveDone( sceneId, selfId, x211305_g_MissionId ) > 0 then
		return 
	elseif IsHaveMission(sceneId,selfId,x211305_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x211305_g_Name then
			AddNumText(sceneId, x211305_g_ScriptId,x211305_g_MissionName)
		end
	--���������������
	elseif x211305_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x211305_g_Name then
			AddNumText(sceneId, x211305_g_ScriptId, x211305_g_MissionName);
		end
	end
end

--**********************************
--��ⴥ������
--**********************************
function x211305_CheckAccept( sceneId, selfId )
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
function x211305_OnAccept( sceneId, selfId )
	--������������б�
	--����������Ʒ
	BeginAddItem( sceneId )
		AddItem( sceneId, x211305_g_ItemID, 1 )
	ret = EndAddItem( sceneId, selfId )
	if ret > 0 then 
		ret = AddMission( sceneId,selfId, x211305_g_MissionId, x211305_g_ScriptId, 0, 0, 0 )	
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			--����2�����д��AddMission֮��
			misIndex = GetMissionIndexByID(sceneId,selfId,x211305_g_MissionId)			--�õ���������к�
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
function x211305_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    res = DelMission( sceneId, selfId, x211305_g_MissionId )
	if res > 0 then
		--��ȥ������Ʒ
		DelItem( sceneId, selfId, x211305_g_ItemID, 1 )
	end
end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x211305_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x211305_g_MissionComplete);
    EndEvent(sceneId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x211305_g_ScriptId,x211305_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x211305_CheckSubmit( sceneId, selfId )
    itemNum = GetItemCount( sceneId, selfId, x211305_g_ItemID );
    if itemNum > 0 then
    	return 1;
    end
	return 0
end

--**********************************
--�ύ����ɣ�
--**********************************
function x211305_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	ret = x211305_CheckSubmit( sceneId, selfId );
	if ret > 0 then
		--ɾ����������б��ж�Ӧ������
		ret = 	DelMission( sceneId, selfId, x211305_g_MissionId )
		if ret > 0 then
    		MissionCom( sceneId, selfId, x211305_g_MissionId )
			DelItem( sceneId,selfId,x211305_g_ItemID,1)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x211305_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x211305_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x211305_OnItemChanged( sceneId, selfId, itemdataId )
end
