--���� ��������
--MisDescBegin
--�ű���
x210707_g_ScriptId = 210707

--�����
x210707_g_MissionId = 507

x210707_g_PreMissionId1 = 503
x210707_g_PreMissionId2 = 504
x210707_g_PreMissionId3 = 505

--Ŀ��NPC
x210707_g_Name	="ʱǨ"

--�������
x210707_g_MissionKind = 18

--����ȼ�
x210707_g_MissionLevel = 7

--�Ƿ��Ǿ�Ӣ����
x210707_g_IfMissionElite = 0

--������
x210707_g_MissionName="��������"
x210707_g_MissionInfo="��¡�жԽ���ʱǨ"
x210707_g_MissionTarget="��¡�жԽ���ʱǨ"
x210707_g_ContinueInfo="����������"		
x210707_g_MissionComplete="����������"

x210707_g_MoneyBonus=10200
x210707_g_Exp = 3000
x210707_g_ItemBonus={{id=30002001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210707_OnDefaultEvent( sceneId, selfId, targetId )
   if(IsMissionHaveDone(sceneId,selfId,x210707_g_PreMissionId1) <= 0) then
   	return
   end
   
   if(IsMissionHaveDone(sceneId,selfId,x210707_g_PreMissionId2) <= 0) then
   	return
   end
   
   if(IsMissionHaveDone(sceneId,selfId,x210707_g_PreMissionId3) <= 0) then
   	return
   end
   
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x210707_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x210707_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x210707_g_Name then
			x210707_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x210707_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210707_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x210707_g_MissionName)
				AddText(sceneId,x210707_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210707_g_MissionTarget)
				
				AddMoneyBonus( sceneId, x210707_g_MoneyBonus )
				for i, item in x210707_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
			
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210707_g_ScriptId,x210707_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x210707_OnEnumerate( sceneId, selfId, targetId )
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210707_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x210707_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210707_g_Name then
			AddNumText(sceneId, x210707_g_ScriptId,x210707_g_MissionName);
		end
    --���������������
    elseif x210707_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210707_g_Name then
			AddNumText(sceneId,x210707_g_ScriptId,x210707_g_MissionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x210707_CheckAccept( sceneId, selfId )
	--��Ҫ1�����ܽ�
	if GetLevel( sceneId, selfId ) >= 1 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210707_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210707_g_MissionId, x210707_g_ScriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x210707_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210707_g_MissionId )
end

--**********************************
--����
--**********************************
function x210707_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210707_g_MissionName)
		AddText(sceneId,x210707_g_ContinueInfo)
		AddMoneyBonus( sceneId, x210707_g_MoneyBonus )
		
		for i, item in x210707_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end	
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210707_g_ScriptId,x210707_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210707_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x210707_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210707_CheckSubmit( sceneId, selfId, selectRadioId ) then
    		BeginAddItem(sceneId)
			for i, item in x210707_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
			
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then		
		
			AddExp(sceneId,selfId,x210707_g_Exp)
			AddMoney(sceneId,selfId,x210707_g_MoneyBonus );
			
			ret = DelMission( sceneId, selfId, x210707_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId, selfId, x210707_g_MissionId )
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
function x210707_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210707_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210707_OnItemChanged( sceneId, selfId, itemdataId )
end
