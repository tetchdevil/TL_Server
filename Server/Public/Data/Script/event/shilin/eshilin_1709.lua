--ʯ�� Ѱ����Ϫ��
--MisDescBegin
--�ű���
x211709_g_ScriptId = 211709

--�����
x211709_g_MissionId = 609

x211709_g_PreMissionId = 608

--Ŀ��NPC
x211709_g_Name	=""

--�������
x211709_g_MissionKind = 29

--����ȼ�
x211709_g_MissionLevel = 25

--�Ƿ��Ǿ�Ӣ����
x211709_g_IfMissionElite = 0

--������
x211709_g_MissionName="Ѱ����Ϫ��"
x211709_g_MissionInfo="Ѱ����Ϫ��"
x211709_g_MissionTarget="Ѱ����Ϫ��"
x211709_g_ContinueInfo="����������"		
x211709_g_MissionComplete="����������"

x211709_g_MoneyBonus=10200
x211709_g_Exp = 3000
x211709_g_ItemBonus={{id=30002001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x211709_OnDefaultEvent( sceneId, selfId, targetId )
	--ǰһ������û�����
	if(IsMissionHaveDone(sceneId,selfId,x211709_g_PreMissionId) <= 0 ) then
		return
	end
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x211709_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x211709_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x211709_g_Name then
			x211709_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x211709_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x211709_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x211709_g_MissionName)
				AddText(sceneId,x211709_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x211709_g_MissionTarget)
				
				AddMoneyBonus( sceneId, x211709_g_MoneyBonus )
				for i, item in x211709_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
			
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x211709_g_ScriptId,x211709_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x211709_OnEnumerate( sceneId, selfId, targetId )
	--ǰһ������û�����
	if(IsMissionHaveDone(sceneId,selfId,x211709_g_PreMissionId) <= 0 ) then
		return
	end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x211709_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x211709_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x211709_g_Name then
			AddNumText(sceneId, x211709_g_ScriptId,x211709_g_MissionName);
		end
    --���������������
    elseif x211709_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x211709_g_Name then
			AddNumText(sceneId,x211709_g_ScriptId,x211709_g_MissionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x211709_CheckAccept( sceneId, selfId )
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
function x211709_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x211709_g_MissionId, x211709_g_ScriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x211709_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x211709_g_MissionId )
end

--**********************************
--����
--**********************************
function x211709_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x211709_g_MissionName)
		AddText(sceneId,x211709_g_ContinueInfo)
		AddMoneyBonus( sceneId, x211709_g_MoneyBonus )
		
		for i, item in x211709_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end	
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x211709_g_ScriptId,x211709_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x211709_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x211709_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x211709_CheckSubmit( sceneId, selfId, selectRadioId ) then
    		BeginAddItem(sceneId)
			for i, item in x211709_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
			
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then		
		
			AddExp(sceneId,selfId,x211709_g_Exp)
			AddMoney(sceneId,selfId,x211709_g_MoneyBonus );
			
			ret = DelMission( sceneId, selfId, x211709_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId, selfId, x211709_g_MissionId )
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
function x211709_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x211709_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x211709_OnItemChanged( sceneId, selfId, itemdataId )
end
