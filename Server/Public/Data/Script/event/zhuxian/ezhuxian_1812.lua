--��������
--��ˮһ��2

--�ű���
x201812_g_scriptId = 201812

--��һ�������ID
x201812_g_missionIdPre = 61	

--�����
x201812_g_missionId = 62

--Ŀ��NPC
x201812_g_name	="ľ����"

--������
local  PlayerName=""
x201812_g_missionName="��ˮһ��2"
x201812_g_missionText_0="����"
x201812_g_missionText_1="�ҵ�ľ����"
x201812_g_missionText_2="����"
x201812_g_MoneyBonus=166
x201812_g_ItemBonus={{id=10105001,num=1}}

--**********************************
--������ں���
--**********************************
function x201812_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x201812_g_missionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x201812_g_missionId) > 0)  then
		if GetName(sceneId,targetId) == x201812_g_name then
			x201812_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x201812_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x201812_g_name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
			AddText(sceneId,x201812_g_missionName)
			AddText(sceneId,x201812_g_missionText_0)
			AddText(sceneId,"[[����Ŀ��]]")
			AddText(sceneId,x201812_g_missionText_1)
			AddMoneyBonus( sceneId, x201812_g_MoneyBonus )
			for i, item in x201812_g_ItemBonus do
						AddItemBonus( sceneId, item.id, item.num )
					end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x201812_g_scriptId,x201812_g_missionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x201812_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x201812_g_missionIdPre) <= 0 then
    	return
    end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x201812_g_missionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x201812_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x201812_g_name then
			AddNumText(sceneId, x201812_g_scriptId,x201812_g_missionName);
		end
    --���������������
    elseif x201812_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x201812_g_name then
			AddNumText(sceneId,x201812_g_scriptId,x201812_g_missionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x201812_CheckAccept( sceneId, selfId )
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
function x201812_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x201812_g_missionId, x201812_g_scriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x201812_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x201812_g_missionId )
end

--**********************************
--����
--**********************************
function x201812_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x201812_g_missionName)
     AddText(sceneId,x201812_g_missionText_2)
   AddMoneyBonus( sceneId, x201812_g_MoneyBonus )
    for i, item in x201812_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x201812_g_scriptId,x201812_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x201812_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x201812_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x201812_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x201812_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			AddMoney(sceneId,selfId,x201812_g_MoneyBonus );
			DelMission( sceneId,selfId,  x201812_g_missionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x201812_g_missionId )
			CallScriptFunction( 201911, "OnDefaultEvent",sceneId, selfId, targetId)
		else
		--������û�мӳɹ�
		end
	        
	end
end

--**********************************
--ɱ����������
--**********************************
function x201812_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x201812_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x201812_OnItemChanged( sceneId, selfId, itemdataId )
end







