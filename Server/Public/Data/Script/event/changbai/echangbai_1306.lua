--�ͻ�����
--躹�����
--MisDescBegin
--�ű���
x211306_g_ScriptId = 211306

--ǰ������
--g_MissionIdPre  = 

--�����
x211306_g_MissionId = 566

--�������
x211306_g_MissionKind = 33

--����ȼ�
x211306_g_MissionLevel = 80

--�Ƿ��Ǿ�Ӣ����
x211306_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x211306_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

--������Ҫ�õ�����Ʒ
x211306_g_DemandItem={{id=40002100,num=1},{id=40002101,num=1}}		--������1λ

--�����ı�����
x211306_g_MissionName="躹�����"
x211306_g_MissionInfo="���Ұ�����ϵȻ�Ƥ���ϵȻ��Ǵ����Ҹ���"
x211306_g_MissionTarget="����Ŀ�꣺���ϵȻ�Ƥ���ϵȻ��Ǵ����������ﲧ"
x211306_g_ContinueInfo="��ô,��������Ǵ���?"
x211306_g_MissionComplete="�⺢���������׵��ҵ�һƬ������"

--����ID
x211306_g_ItemID1 = 40002100
x211306_g_ItemID2 = 40002101

--����

--�ջ���
x211306_g_Name = "�������ﲧ"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x211306_OnDefaultEvent( sceneId, selfId, targetId )
	--����ѽӴ�����
    if IsMissionHaveDone( sceneId, selfId, x211306_g_MissionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x211306_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x211306_g_Name then
			--���ͽ�����ǰ��������Ϣ
    		BeginEvent(sceneId)
				AddText(sceneId,x211306_g_ContinueInfo);
				AddItemDemand( sceneId, x211306_g_ItemID1, 1 )
				AddItemDemand( sceneId, x211306_g_ItemID2, 1 )
    		EndEvent(sceneId)
    		done = x211306_CheckSubmit( sceneId, selfId );
   			DispatchMissionDemandInfo(sceneId,selfId,targetId,x211306_g_ScriptId,x211306_g_MissionId,done)
 		end
    --���������������
    elseif x211306_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x211306_g_Name then
			--�����������ʱ��ʾ����Ϣ
	    	BeginEvent(sceneId)
				AddText(sceneId,x211306_g_MissionName);
				AddText(sceneId,x211306_g_MissionInfo);
				AddText(sceneId,x211306_g_MissionTarget);
	    	EndEvent(sceneId)
	    	DispatchMissionInfo(sceneId,selfId,targetId,x211306_g_ScriptId,x211306_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x211306_OnEnumerate( sceneId, selfId, targetId )
	if IsMissionHaveDone( sceneId, selfId, x211306_g_MissionId ) > 0 then
		return 
	elseif IsHaveMission(sceneId,selfId,x211306_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x211306_g_Name then
			AddNumText(sceneId, x211306_g_ScriptId,x211306_g_MissionName)
		end
	--���������������
	elseif x211306_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x211306_g_Name then
			AddNumText(sceneId, x211306_g_ScriptId, x211306_g_MissionName);
		end
	end
end

--**********************************
--��ⴥ������
--**********************************
function x211306_CheckAccept( sceneId, selfId )
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
function x211306_OnAccept( sceneId, selfId )
	--������������б�
	--����������Ʒ
	BeginAddItem( sceneId )
		AddItem( sceneId, x211306_g_ItemID1, 1 )
		AddItem( sceneId, x211306_g_ItemID2, 1 )
	ret = EndAddItem( sceneId, selfId )
	if ret > 0 then 
		ret = AddMission( sceneId,selfId, x211306_g_MissionId, x211306_g_ScriptId, 0, 0, 0 )	
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			--����2�����д��AddMission֮��
			misIndex = GetMissionIndexByID(sceneId,selfId,x211306_g_MissionId)			--�õ���������к�
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
function x211306_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    res = DelMission( sceneId, selfId, x211306_g_MissionId )
	if res > 0 then
		--��ȥ������Ʒ
		DelItem( sceneId, selfId, x211306_g_ItemID1, 1 )
		DelItem( sceneId, selfId, x211306_g_ItemID2, 1 )
	end
end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x211306_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x211306_g_MissionComplete);
    EndEvent(sceneId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x211306_g_ScriptId,x211306_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x211306_CheckSubmit( sceneId, selfId )
	itemNum1 = GetItemCount( sceneId, selfId, x211306_g_ItemID1 )
	itemNum2 = GetItemCount( sceneId, selfId, x211306_g_ItemID2 )
    if itemNum1 > 0 and itemNum2 > 0  then
    	return 1;
    end
	return 0
end

--**********************************
--�ύ����ɣ�
--**********************************
function x211306_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	ret = x211306_CheckSubmit( sceneId, selfId );
	if ret > 0 then
		--ɾ����������б��ж�Ӧ������
		ret = 	DelMission( sceneId, selfId, x211306_g_MissionId )
		if ret > 0 then
    		MissionCom( sceneId, selfId, x211306_g_MissionId )
			DelItem( sceneId, selfId, x211306_g_ItemID1, 1 )
			DelItem( sceneId, selfId, x211306_g_ItemID2, 1 )
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x211306_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x211306_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x211306_OnItemChanged( sceneId, selfId, itemdataId )
end
