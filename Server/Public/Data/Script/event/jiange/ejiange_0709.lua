--���� ��Ԯ
--MisDescBegin
--�ű���
x210709_g_ScriptId = 210709

--�����
x210709_g_MissionId = 509

--ǰһ�������
x210709_g_PreMissionId = 508

--Ŀ��NPC
x210709_g_Name	="���Ĺ�"

--�������
x210709_g_MissionKind = 18

--����ȼ�
x210709_g_MissionLevel = 7

--�Ƿ��Ǿ�Ӣ����
x210709_g_IfMissionElite = 0

--������
x210709_g_MissionName="��Ԯ"
x210709_g_MissionInfo="�ѽ��Ҽ�����Ԯ���͸��ػ�����˾�����Ĺ�"
x210709_g_MissionTarget="�ѽ��Ҽ�����Ԯ���͸��ػ�����˾�����Ĺ�"
x210709_g_ContinueInfo="����������"		
x210709_g_MissionComplete="����������"

x210709_g_MoneyBonus=10200
x210709_g_Exp = 3000
x210709_g_ItemBonus={{id=30002001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210709_OnDefaultEvent( sceneId, selfId, targetId )


    	
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x210709_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x210709_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x210709_g_Name then
			x210709_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x210709_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210709_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x210709_g_MissionName)
				AddText(sceneId,x210709_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210709_g_MissionTarget)
				
				AddMoneyBonus( sceneId, x210709_g_MoneyBonus )
				for i, item in x210709_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
			
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210709_g_ScriptId,x210709_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x210709_OnEnumerate( sceneId, selfId, targetId )
	--û�����ǰһ�����񣬷���
	if (IsMissionHaveDone(sceneId,selfId,x210709_g_PreMissionId) <= 0 ) then
	--  	return
	end
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x210709_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x210709_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210709_g_Name then
			AddNumText(sceneId, x210709_g_ScriptId,x210709_g_MissionName);
		end
    --���������������
    elseif x210709_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210709_g_Name then
			AddNumText(sceneId,x210709_g_ScriptId,x210709_g_MissionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x210709_CheckAccept( sceneId, selfId )
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
function x210709_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210709_g_MissionId, x210709_g_ScriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x210709_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210709_g_MissionId )
end

--**********************************
--����
--**********************************
function x210709_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210709_g_MissionName)
		AddText(sceneId,x210709_g_ContinueInfo)
		AddMoneyBonus( sceneId, x210709_g_MoneyBonus )
		
		for i, item in x210709_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end	
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210709_g_ScriptId,x210709_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210709_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x210709_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210709_CheckSubmit( sceneId, selfId, selectRadioId ) then
    		BeginAddItem(sceneId)
			for i, item in x210709_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
			
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then		
		
			AddExp(sceneId,selfId,x210709_g_Exp)
			AddMoney(sceneId,selfId,x210709_g_MoneyBonus );
			
			ret = DelMission( sceneId, selfId, x210709_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId, selfId, x210709_g_MissionId )
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
function x210709_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210709_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210709_OnItemChanged( sceneId, selfId, itemdataId )
end
