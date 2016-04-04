--ʯ��  �������ŵĽ�����Բ�´��֣��
--MisDescBegin
--�ű���
x211705_g_ScriptId = 211705

--�����
x211705_g_MissionId = 605

--Ŀ��NPC
x211705_g_Name	="֣��"

--�������
x211705_g_MissionKind = 29

--����ȼ�
x211705_g_MissionLevel = 25

--������Ҫ�õ�����Ʒ
x211705_g_DemandItem={{id=40002111,num=1}}		--������1λ

--�Ƿ��Ǿ�Ӣ����
x211705_g_IfMissionElite = 0

--������
x211705_g_MissionName="����"
x211705_g_MissionInfo="�������ŵĽ�����Բ�´��֣��"
x211705_g_MissionTarget="�������ŵĽ�����Բ�´��֣��"
x211705_g_ContinueInfo="�����ڰ�մ����Ѫ�Ľ�������"		
x211705_g_MissionComplete="�����ڰ�մ����Ѫ�Ľ�������"

x211705_g_MoneyBonus=10200
x211705_g_Exp = 3000
x211705_g_ItemBonus={{id=30002001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x211705_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x211705_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x211705_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x211705_g_Name then
			x211705_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x211705_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x211705_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x211705_g_MissionName)
				AddText(sceneId,x211705_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x211705_g_MissionTarget)
				
				AddMoneyBonus( sceneId, x211705_g_MoneyBonus )
				for i, item in x211705_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
			
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x211705_g_ScriptId,x211705_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x211705_OnEnumerate( sceneId, selfId, targetId )
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x211705_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x211705_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x211705_g_Name then
			AddNumText(sceneId, x211705_g_ScriptId,x211705_g_MissionName);
		end
    --���������������
    elseif x211705_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x211705_g_Name then
			AddNumText(sceneId,x211705_g_ScriptId,x211705_g_MissionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x211705_CheckAccept( sceneId, selfId )
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
function x211705_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x211705_g_MissionId, x211705_g_ScriptId, 0, 0, 0 )
	BeginAddItem(sceneId)
		--����ż�����Ʒ
		for i, item in x211705_g_DemandItem do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
	if ret > 0 then
		AddItemListToHuman(sceneId,selfId)
		Msg2Player(  sceneId, selfId,"#Y������������",MSG2PLAYER_PARA )
	else
		--������û�мӳɹ�
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
function x211705_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    res = DelMission( sceneId, selfId, x211705_g_MissionId )
	if res > 0 then
		--��ȥ������Ʒ
		for i, item in x211705_g_DemandItem do
			DelItem( sceneId, selfId, item.id, item.num )
		end
	end
end

--**********************************
--����
--**********************************
function x211705_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x211705_g_MissionName)
		AddText(sceneId,x211705_g_ContinueInfo)
		AddMoneyBonus( sceneId, x211705_g_MoneyBonus )
		
		for i, item in x211705_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end	
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x211705_g_ScriptId,x211705_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x211705_CheckSubmit( sceneId, selfId )
	for i, item in x211705_g_DemandItem do
		itemCount = GetItemCount( sceneId, selfId, item.id )
		if itemCount < item.num then
			return 0
		end
	end
	return 1
end

--**********************************
--�ύ
--**********************************
function x211705_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x211705_CheckSubmit( sceneId, selfId, selectRadioId ) then
		--���������
		AddMoney(sceneId,selfId,x211705_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,30)
				--�۳�������Ʒ
		for i, item in x211705_g_DemandItem do
			DelItem( sceneId, selfId, item.id, item.num )
		end
		DelMission( sceneId,selfId,  x211705_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId,  x211705_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y�����������",MSG2PLAYER_PARA )    		
		BeginAddItem(sceneId)
			for i, item in x211705_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then		
			AddExp(sceneId,selfId,x211705_g_Exp)
			AddMoney(sceneId,selfId,x211705_g_MoneyBonus );
			ret = DelMission( sceneId, selfId, x211705_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId, selfId, x211705_g_MissionId )
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
function x211705_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x211705_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x211705_OnItemChanged( sceneId, selfId, itemdataId )
end
