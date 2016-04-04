--̫�� �����л�
--MisDescBegin
--�ű���
x210403_g_ScriptId = 210403

--�����
x210403_g_MissionId = 473

--��һ�������ID
x210403_g_MissionIdPre = 472


--����Ŀ��npc
x210403_g_Name	="�ܴ�"

--�������
x210403_g_MissionKind = 15

--����ȼ�
x210403_g_MissionLevel = 10

--�Ƿ��Ǿ�Ӣ����
x210403_g_IfMissionElite = 0


--�����Ƿ��Ѿ����
x210403_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����ı�����
x210403_g_MissionName="�����л�"
x210403_g_MissionInfo="�ҵ��ܴ�"
x210403_g_MissionTarget="�ҵ��ܴ�"
x210403_g_ContinueInfo="�ҵ��ܴ�"
x210403_g_MissionComplete="����������"

--������
x210403_g_MoneyBonus=10200
x210403_g_Exp = 3000

x210403_g_ItemBonus={{id=30002001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210403_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x210403_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x210403_g_MissionId) > 0)  then
		x210403_OnContinue( sceneId, selfId, targetId )
    --���������������
    elseif x210403_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x210403_g_MissionName)
			AddText(sceneId,x210403_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x210403_g_MissionTarget)
			for i, item in x210403_g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
			AddMoneyBonus( sceneId, x210403_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x210403_g_ScriptId,x210403_g_MissionId)
    end
end

--**********************************
--�о��¼�
--**********************************
function x210403_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x210403_g_MissionIdPre) <= 0 then
    	return
    end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210403_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x210403_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210403_g_Name then
			AddNumText(sceneId, x210403_g_ScriptId,x210403_g_MissionName,2,-1);
		end
	--���������������
    elseif x210403_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210403_g_Name then
			AddNumText(sceneId,x210403_g_ScriptId,x210403_g_MissionName,1,-1);
		end
    end
end

--**********************************
--����������
--**********************************
function x210403_CheckAccept( sceneId, selfId )
	--��Ҫ3�����ܽ�
	if GetLevel( sceneId, selfId ) >= 3 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210403_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210403_g_MissionId, x210403_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#Y�������񣺿����л�",MSG2PLAYER_PARA )
end

--**********************************
--����
--**********************************
function x210403_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210403_g_MissionId )
end

--**********************************
--����
--**********************************
function x210403_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210403_g_MissionName)
		AddText(sceneId,x210403_g_MissionComplete)
		AddMoneyBonus( sceneId, x210403_g_MoneyBonus )
		for i, item in x210403_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210403_g_ScriptId,x210403_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210403_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x210403_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210403_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
			for i, item in x210403_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
		ret = EndAddItem(sceneId,selfId)
		--���������
			if ret > 0 then
					AddMoney(sceneId,selfId,x210403_g_MoneyBonus );
					LuaFnAddExp( sceneId, selfId,250)
					ret = DelMission( sceneId, selfId, x210403_g_MissionId )
				if ret > 0 then
					MissionCom( sceneId, selfId, x210403_g_MissionId )
					AddItemListToHuman(sceneId,selfId)
					Msg2Player(  sceneId, selfId,"#Y������񣺿����л�",MSG2PLAYER_PARA )
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
function x210403_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210403_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210403_OnItemChanged( sceneId, selfId, itemdataId )
end
