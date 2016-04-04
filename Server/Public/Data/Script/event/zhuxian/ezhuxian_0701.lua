--���������� ��ҳ��� ����

--�ű���
x200701_g_scriptId = 200701

--ǰ������
x200701_g_missionIdPre = 16

--�����
x200701_g_missionId = 17

--Ŀ��NPC
x200701_g_name	="������" 

--������
local  PlayerName=""
x200701_g_missionName="��ҳ���1"
x200701_g_missionText_0 = "����ĺ������������"
--������������Ӷ�����Ϊ�����ѣ��պ����ǽ����Ҵ���Ķ�����"
x200701_g_missionText_1 = "��ȥ��������������������������һ�����Ӷ�����"
x200701_g_missionText_2 = "�����������"
--����������˵�����������ء�"
x200701_g_MoneyBonus=100
x200701_g_ItemBonus={{id=10105001,num=1}}

--**********************************
--������ں���
--**********************************
function x200701_OnDefaultEvent( sceneId, selfId, targetId )

	--��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x200701_g_missionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x200701_g_missionId) > 0)  then
		if GetName(sceneId,targetId) == x200701_g_name then
			x200701_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x200701_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200701_g_name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
			AddText(sceneId,x200701_g_missionName)
			AddText(sceneId,x200701_g_missionText_0)
			AddText(sceneId,"[[����Ŀ��]]")
			AddText(sceneId,x200701_g_missionText_1)
			AddMoneyBonus( sceneId, x200701_g_MoneyBonus )
			for i, item in x200701_g_ItemBonus do
						AddItemBonus( sceneId, item.id, item.num )
					end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200701_g_scriptId,x200701_g_missionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x200701_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x200701_g_missionIdPre) <= 0 then
    	return
    end
	--��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x200701_g_missionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x200701_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x200701_g_name then
			AddNumText(sceneId, x200701_g_scriptId,x200701_g_missionName);
		end
    --���������������
    elseif x200701_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200701_g_name then
			AddNumText(sceneId,x200701_g_scriptId,x200701_g_missionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x200701_CheckAccept( sceneId, selfId )
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
function x200701_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x200701_g_missionId, x200701_g_scriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x200701_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x200701_g_missionId )
end

--**********************************
--����
--**********************************
function x200701_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x200701_g_missionName)
     AddText(sceneId,x200701_g_missionText_2)
   AddMoneyBonus( sceneId, x200701_g_MoneyBonus )
    for i, item in x200701_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200701_g_scriptId,x200701_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200701_CheckSubmit( sceneId, selfId )
	itemNum = GetItemCount( sceneId, selfId, g_ItemID );
    if itemNum > 0 then
    	return 1;
    end
	return 0
end

--**********************************
--�ύ
--**********************************
function x200701_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200701_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x200701_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			AddMoney(sceneId,selfId,x200701_g_MoneyBonus );
			DelMission( sceneId,selfId,  x200701_g_missionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x200701_g_missionId )
			CallScriptFunction( 200702, "OnDefaultEvent",sceneId, selfId, targetId)
		else
		--������û�мӳɹ�
		end
	        
	end
end

--**********************************
--ɱ����������
--**********************************
function x200701_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x200701_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200701_OnItemChanged( sceneId, selfId, itemdataId )
end
