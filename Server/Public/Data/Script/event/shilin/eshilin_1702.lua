--ʯ�� ����֮��   --��ʱ���ļ�����û�����
--MisDescBegin
--�ű���
x211702_g_ScriptId = 211702

--�����
x211702_g_MissionId = 602

--Ŀ��NPC
x211702_g_Name	="֣��"

--�������
x211702_g_MissionKind = 29

--����ȼ�
x211702_g_MissionLevel = 25

--�Ƿ��Ǿ�Ӣ����
x211702_g_IfMissionElite = 0

--������
x211702_g_MissionName="����֮��"
x211702_g_MissionInfo="��֣�������Ĺ���"
x211702_g_MissionTarget="��֣�������Ĺ���"
x211702_g_ContinueInfo="��֣�������Ĺ���"		
x211702_g_MissionComplete="��֣�������Ĺ���"

x211702_g_MoneyBonus=10200
x211702_g_Exp = 3000
x211702_g_ItemBonus={{id=30002001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x211702_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x211702_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x211702_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x211702_g_Name then
			BeginEvent(sceneId)
				AddText(sceneId,x211702_g_MissionName)
				AddText(sceneId,x211702_g_ContinueInfo)
				AddMoneyBonus( sceneId, x211702_g_MoneyBonus )
			EndEvent()
			bDone = x211702_CheckSubmit( sceneId, selfId )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x211702_g_ScriptId,x211702_g_MissionId,bDone)	
		end
    --���������������
    elseif x211702_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x211702_g_MissionName)
			AddText(sceneId,x211702_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x211702_g_MissionTarget)
			
			AddMoneyBonus( sceneId, x211702_g_MoneyBonus )
			for i, item in x211702_g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
		
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x211702_g_ScriptId,x211702_g_MissionId)
		
    end
end

--**********************************
--�о��¼�
--**********************************
function x211702_OnEnumerate( sceneId, selfId, targetId )
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x211702_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x211702_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x211702_g_Name then
			AddNumText(sceneId, x211702_g_ScriptId,x211702_g_MissionName);
		end
    --���������������
    elseif x211702_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) == x211702_g_Name then
			AddNumText(sceneId,x211702_g_ScriptId,x211702_g_MissionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x211702_CheckAccept( sceneId, selfId )
	--��Ҫ60�����ܽ�
	if GetLevel( sceneId, selfId ) >= 60 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x211702_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x211702_g_MissionId, x211702_g_ScriptId, 0, 0, 0 )
	misIndex = GetMissionIndexByID(sceneId,selfId,x211702_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0
end

--**********************************
--����
--**********************************
function x211702_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x211702_g_MissionId )
end

--**********************************
--����
--**********************************
function x211702_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x211702_g_MissionName)
		AddText(sceneId,x211702_g_ContinueInfo)
		AddMoneyBonus( sceneId, x211702_g_MoneyBonus )
		
		for i, item in x211702_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end	
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x211702_g_ScriptId,x211702_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x211702_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x211702_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,0)
    if num == 1 then
		return 1
	end
	return 0
end

--**********************************
--�ύ
--**********************************
function x211702_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x211702_CheckSubmit( sceneId, selfId, selectRadioId ) then
    		BeginAddItem(sceneId)
			for i, item in x211702_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
			
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then		
		
			AddExp(sceneId,selfId,x211702_g_Exp)
			AddMoney(sceneId,selfId,x211702_g_MoneyBonus );
			
			ret = DelMission( sceneId, selfId, x211702_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId, selfId, x211702_g_MissionId )
					AddItemListToHuman(sceneId,selfId)
			end
		else
		--������û�мӳɹ�
			BeginEvent(sceneId)
				strText = "��������,�޷��������"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x211702_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x211702_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x211702_OnItemChanged( sceneId, selfId, itemdataId )
end
