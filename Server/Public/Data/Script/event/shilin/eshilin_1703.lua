--ʯ�� Ѱ���ҵ���԰������
--MisDescBegin
--�ű���
x211703_g_ScriptId = 211703

--�����
x211703_g_MissionId = 603

--��һ�������ID
x211703_g_MissionIdPre = 602

--Ŀ��NPC
x211703_g_Name	="�غ���"

--�������
x211703_g_MissionKind = 29

--����ȼ�
x211703_g_MissionLevel = 25

--�Ƿ��Ǿ�Ӣ����
x211703_g_IfMissionElite = 0

--������
x211703_g_MissionName="�����԰"
x211703_g_MissionInfo="�ҵ���԰������"
x211703_g_MissionTarget="�ҵ���԰������"
x211703_g_ContinueInfo="����������"		
x211703_g_MissionComplete="����������"

x211703_g_MoneyBonus=10200
x211703_g_Exp = 3000
x211703_g_ItemBonus={{id=30002001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x211703_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x211703_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x211703_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x211703_g_Name then
			x211703_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x211703_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x211703_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x211703_g_MissionName)
				AddText(sceneId,x211703_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x211703_g_MissionTarget)
				
				AddMoneyBonus( sceneId, x211703_g_MoneyBonus )
				for i, item in x211703_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
			
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x211703_g_ScriptId,x211703_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x211703_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x211703_g_MissionIdPre) <= 0 then
    	return
    end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x211703_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x211703_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x211703_g_Name then
			AddNumText(sceneId, x211703_g_ScriptId,x211703_g_MissionName);
		end
    --���������������
    elseif x211703_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x211703_g_Name then
			AddNumText(sceneId,x211703_g_ScriptId,x211703_g_MissionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x211703_CheckAccept( sceneId, selfId )
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
function x211703_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x211703_g_MissionId, x211703_g_ScriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x211703_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x211703_g_MissionId )
end

--**********************************
--����
--**********************************
function x211703_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x211703_g_MissionName)
		AddText(sceneId,x211703_g_ContinueInfo)
		AddMoneyBonus( sceneId, x211703_g_MoneyBonus )
		
		for i, item in x211703_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end	
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x211703_g_ScriptId,x211703_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x211703_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x211703_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x211703_CheckSubmit( sceneId, selfId, selectRadioId ) then
    		BeginAddItem(sceneId)
			for i, item in x211703_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
			
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then		
		
			AddExp(sceneId,selfId,x211703_g_Exp)
			AddMoney(sceneId,selfId,x211703_g_MoneyBonus );
			
			ret = DelMission( sceneId, selfId, x211703_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId, selfId, x211703_g_MissionId )
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
function x211703_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x211703_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x211703_OnItemChanged( sceneId, selfId, itemdataId )
end
