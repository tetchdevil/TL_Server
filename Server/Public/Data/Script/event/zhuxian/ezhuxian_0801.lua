--���������� ��Ҷ���� ����

--�ű���
x200801_g_scriptId = 200801

--ǰ������
x200801_g_missionIdPre = 19

--�����
x200801_g_missionId = 20

--Ŀ��NPC
x200801_g_name	="����" 

--������
local  PlayerName=""
x200801_g_missionName="��Ҷ����1"
x200801_g_missionText_0 = "��˼����ȥ"
--������Ҫ�鷳��ȥ����ɽѰ��һ������������ϲ�������֣�����ɽ�Ľ�����������ǻ�ȥ�ġ�"
x200801_g_missionText_1 = "����Ŀ��:\n������ɽ�������ҵ���������Ϣ"
x200801_g_missionText_2 = "����˵������"
--���а��а������м������ġ�"
x200801_g_MoneyBonus=100
x200801_g_ItemBonus={{id=10105001,num=1}}

--**********************************
--������ں���
--**********************************
function x200801_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x200801_g_missionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x200801_g_missionId) > 0)  then
		if GetName(sceneId,targetId) == x200801_g_name then
			x200801_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x200801_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200801_g_name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
			AddText(sceneId,x200801_g_missionName)
			AddText(sceneId,x200801_g_missionText_0)
			AddText(sceneId,"[[����Ŀ��]]")
			AddText(sceneId,x200801_g_missionText_1)
			AddMoneyBonus( sceneId, x200801_g_MoneyBonus )
			for i, item in x200801_g_ItemBonus do
						AddItemBonus( sceneId, item.id, item.num )
					end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200801_g_scriptId,x200801_g_missionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x200801_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x200801_g_missionIdPre) <= 0 then
    	return
    end
	--��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x200801_g_missionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x200801_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x200801_g_name then
			AddNumText(sceneId, x200801_g_scriptId,x200801_g_missionName);
		end
    --���������������
    elseif x200801_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200801_g_name then
			AddNumText(sceneId,x200801_g_scriptId,x200801_g_missionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x200801_CheckAccept( sceneId, selfId )
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
function x200801_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x200801_g_missionId, x200801_g_scriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x200801_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x200801_g_missionId )
end

--**********************************
--����
--**********************************
function x200801_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x200801_g_missionName)
     AddText(sceneId,x200801_g_missionText_2)
   AddMoneyBonus( sceneId, x200801_g_MoneyBonus )
    for i, item in x200801_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200801_g_scriptId,x200801_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200801_CheckSubmit( sceneId, selfId )
	itemNum = GetItemCount( sceneId, selfId, g_ItemID );
    if itemNum > 0 then
    	return 1;
    end
	return 0
end

--**********************************
--�ύ
--**********************************
function x200801_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200801_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x200801_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			AddMoney(sceneId,selfId,x200801_g_MoneyBonus );
			DelMission( sceneId,selfId,  x200801_g_missionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x200801_g_missionId )
			CallScriptFunction( 200802, "OnDefaultEvent",sceneId, selfId, targetId)
		else
		--������û�мӳɹ�
		end
	        
	end
end

--**********************************
--ɱ����������
--**********************************
function x200801_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x200801_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200801_OnItemChanged( sceneId, selfId, itemdataId )
end
