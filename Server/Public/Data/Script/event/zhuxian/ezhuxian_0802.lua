--�������� ��Ҷ���� ����

--�ű���
x200802_g_scriptId = 200802

--ǰ������
x200802_g_missionIdPre = 20

--�����
x200802_g_missionId = 21

--Ŀ��NPC
x200802_g_name	="�Ӱ�ʱ" 

--������
local  PlayerName=""
x200802_g_missionName="��Ҷ����1"
x200802_g_missionText_0 = "��֪������������"
--������������������ũ��ľ綾ѽ������ȥ�Ҹ���ҽ��������һ����Ҷ�������ⶾ��"
x200802_g_missionText_1 = "����Ŀ�꣺\n�ҵ�һ����Ҷ����"
x200802_g_missionText_2 = "��������ҩ�˰�"
--��ʲô��Ҫ��Ҷ���Ӱ�����������˭������ũ��Ķ��˰ɡ�����Ҷ����Ҳֻ�ܽ�һʱ��ȥ���˲�������"
x200802_g_MoneyBonus=100
x200802_g_ItemBonus={{id=10105001,num=1}}

--**********************************
--������ں���
--**********************************
function x200802_OnDefaultEvent( sceneId, selfId, targetId )

	--��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x200802_g_missionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x200802_g_missionId) > 0)  then
		if GetName(sceneId,targetId) == x200802_g_name then
			x200802_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x200802_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200802_g_name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
			AddText(sceneId,x200802_g_missionName)
			AddText(sceneId,x200802_g_missionText_0)
			AddText(sceneId,"[[����Ŀ��]]")
			AddText(sceneId,x200802_g_missionText_1)
			AddMoneyBonus( sceneId, x200802_g_MoneyBonus )
			for i, item in x200802_g_ItemBonus do
						AddItemBonus( sceneId, item.id, item.num )
					end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200802_g_scriptId,x200802_g_missionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x200802_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x200802_g_missionIdPre) <= 0 then
    	return
    end
	--��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x200802_g_missionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x200802_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x200802_g_name then
			AddNumText(sceneId, x200802_g_scriptId,x200802_g_missionName);
		end
    --���������������
    elseif x200802_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200802_g_name then
			AddNumText(sceneId,x200802_g_scriptId,x200802_g_missionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x200802_CheckAccept( sceneId, selfId )
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
function x200802_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x200802_g_missionId, x200802_g_scriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x200802_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x200802_g_missionId )
end

--**********************************
--����
--**********************************
function x200802_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x200802_g_missionName)
     AddText(sceneId,x200802_g_missionText_2)
   AddMoneyBonus( sceneId, x200802_g_MoneyBonus )
    for i, item in x200802_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200802_g_scriptId,x200802_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200802_CheckSubmit( sceneId, selfId )
	itemNum = GetItemCount( sceneId, selfId, g_ItemID );
    if itemNum > 0 then
    	return 1;
    end
	return 0
end

--**********************************
--�ύ
--**********************************
function x200802_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200802_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x200802_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			AddMoney(sceneId,selfId,x200802_g_MoneyBonus );
			DelMission( sceneId,selfId,  x200802_g_missionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x200802_g_missionId )
			CallScriptFunction( 200803, "OnDefaultEvent",sceneId, selfId, targetId)
		else
		--������û�мӳɹ�
		end
	        
	end
end

--**********************************
--ɱ����������
--**********************************
function x200802_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x200802_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200802_OnItemChanged( sceneId, selfId, itemdataId )
end
