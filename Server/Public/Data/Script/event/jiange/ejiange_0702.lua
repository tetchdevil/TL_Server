--���� �����
--MisDescBegin
--�ű���
x210702_g_ScriptId = 210702

--�����
x210702_g_MissionId = 502

--Ŀ��NPC
x210702_g_Name	="ʱ��"

--�������
x210702_g_MissionKind = 18

--����ȼ�
x210702_g_MissionLevel = 5

--�Ƿ��Ǿ�Ӣ����
x210702_g_IfMissionElite = 0

--������
x210702_g_MissionName="�����"
x210702_g_MissionInfo="�ҵ��������������"
x210702_g_MissionTarget="�ҵ��������������"
x210702_g_ContinueInfo="����������"		
x210702_g_MissionComplete="����������"

x210702_g_MoneyBonus=12000
x210702_g_Exp = 3000
x210702_g_ItemBonus={{id=30002001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210702_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x210702_g_MissionId) > 0 ) then
    	print("�ҵ�������������� done")
    	return
     elseif( IsHaveMission(sceneId,selfId,x210702_g_MissionId) > 0)  then
	if GetName(sceneId,targetId) == x210702_g_Name then
		x210702_OnContinue( sceneId, selfId, targetId )
	end
    --���������������
    elseif x210702_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210702_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x210702_g_MissionName)
				AddText(sceneId,x210702_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210702_g_MissionTarget)
				
				AddMoneyBonus( sceneId, x210702_g_MoneyBonus )
				for i, item in x210702_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
			
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210702_g_ScriptId,x210702_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x210702_OnEnumerate( sceneId, selfId, targetId )
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210702_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x210702_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210702_g_Name then
			AddNumText(sceneId, x210702_g_ScriptId,x210702_g_MissionName);
		end
    --���������������
    elseif x210702_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210702_g_Name then
			AddNumText(sceneId,x210702_g_ScriptId,x210702_g_MissionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x210702_CheckAccept( sceneId, selfId )
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
function x210702_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210702_g_MissionId, x210702_g_ScriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x210702_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210702_g_MissionId )
end

--**********************************
--����
--**********************************
function x210702_OnContinue( sceneId, selfId, targetId )
    --�ύ����ʱ��˵����Ϣ
    print("�ҵ�������������� OnContinue")
    BeginEvent(sceneId)
		AddText(sceneId,x210702_g_MissionName)
		AddText(sceneId,x210702_g_ContinueInfo)
		AddMoneyBonus( sceneId, x210702_g_MoneyBonus )		
		
		for i, item in x210702_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end	
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210702_g_ScriptId,x210702_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210702_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x210702_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210702_CheckSubmit( sceneId, selfId, selectRadioId ) then
    		BeginAddItem(sceneId)
			for i, item in x210702_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
			
		ret = EndAddItem(sceneId,selfId)
		
		print("EndAddItem:", ret)
		--���������
		if ret > 0 then		
		
			AddExp(sceneId,selfId,x210702_g_Exp)
			AddMoney(sceneId,selfId,x210702_g_MoneyBonus );
			
			ret = DelMission( sceneId, selfId, x210702_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId, selfId, x210702_g_MissionId )
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
function x210702_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210702_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210702_OnItemChanged( sceneId, selfId, itemdataId )
end
