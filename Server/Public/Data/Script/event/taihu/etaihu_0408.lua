--̫�� �����Ž�
--MisDescBegin
--�ű���
x210408_g_ScriptId = 210408

--�����
x210408_g_MissionId = 478

--Ŀ��NPC
x210408_g_Name	="������"

--�������
x210408_g_MissionKind = 15

--����ȼ�
x210408_g_MissionLevel = 10

--�Ƿ��Ǿ�Ӣ����
x210408_g_IfMissionElite = 0

--������
x210408_g_MissionName="�����Ž�"
x210408_g_MissionInfo="�Ѻ���������͸�������"
x210408_g_MissionTarget="�Ѻ���������͸�������"
x210408_g_ContinueInfo="����������"		
x210408_g_MissionComplete="����������"

x210408_g_MoneyBonus=10200
x210408_g_Exp = 3000
x210408_g_ItemBonus={{id=30002001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210408_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x210408_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x210408_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x210408_g_Name then
			x210408_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x210408_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210408_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x210408_g_MissionName)
				AddText(sceneId,x210408_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210408_g_MissionTarget)
				
				AddMoneyBonus( sceneId, x210408_g_MoneyBonus )
				for i, item in x210408_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
			
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210408_g_ScriptId,x210408_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x210408_OnEnumerate( sceneId, selfId, targetId )
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210408_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x210408_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210408_g_Name then
			AddNumText(sceneId, x210408_g_ScriptId,x210408_g_MissionName);
		end
    --���������������
    elseif x210408_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210408_g_Name then
			AddNumText(sceneId,x210408_g_ScriptId,x210408_g_MissionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x210408_CheckAccept( sceneId, selfId )
	--��Ҫ10�����ܽ�
	if GetLevel( sceneId, selfId ) >= 10 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210408_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210408_g_MissionId, x210408_g_ScriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x210408_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210408_g_MissionId )
end

--**********************************
--����
--**********************************
function x210408_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210408_g_MissionName)
		AddText(sceneId,x210408_g_ContinueInfo)
		AddMoneyBonus( sceneId, x210408_g_MoneyBonus )
		
		for i, item in x210408_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end	
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210408_g_ScriptId,x210408_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210408_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x210408_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210408_CheckSubmit( sceneId, selfId, selectRadioId ) then
    		BeginAddItem(sceneId)
			for i, item in x210408_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
			
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then		
		
			AddExp(sceneId,selfId,x210408_g_Exp)
			AddMoney(sceneId,selfId,x210408_g_MoneyBonus );
			
			ret = DelMission( sceneId, selfId, x210408_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId, selfId, x210408_g_MissionId )
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
function x210408_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210408_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210408_OnItemChanged( sceneId, selfId, itemdataId )
end
