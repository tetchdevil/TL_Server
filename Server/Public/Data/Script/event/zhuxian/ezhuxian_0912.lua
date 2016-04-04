--��������
--����ҩ��2
--����10����������ڶ���

--�ű���
x200912_g_scriptId = 200912

--��һ�������ID
x200912_g_missionIdPre = 45	

--�����
x200912_g_missionId = 46

--Ŀ��NPC
x200912_g_name	="����"

--������
local  PlayerName=""
x200912_g_missionName="����ҩ��2"
x200912_g_missionText_0="���Ȼ���������ˣ�Ӧ����˵��\"����ҩ��\"����ˣ����¶��Ĺ����˵ã����¶����ܽⶾ������������æ��"
x200912_g_missionText_1="��������̳�ҵ�����"
x200912_g_missionText_2="�������̵��ӣ����Һ��£�"
x200912_g_MoneyBonus=166
x200912_g_ItemBonus={{id=10105001,num=1}}

--**********************************
--������ں���
--**********************************
function x200912_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x200912_g_missionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x200912_g_missionId) > 0)  then
		if GetName(sceneId,targetId) == x200912_g_name then
			x200912_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x200912_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200912_g_name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
			AddText(sceneId,x200912_g_missionName)
			AddText(sceneId,x200912_g_missionText_0)
			AddText(sceneId,"[[����Ŀ��]]")
			AddText(sceneId,x200912_g_missionText_1)
			AddMoneyBonus( sceneId, x200912_g_MoneyBonus )
			for i, item in x200912_g_ItemBonus do
						AddItemBonus( sceneId, item.id, item.num )
					end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200912_g_scriptId,x200912_g_missionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x200912_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x200912_g_missionIdPre) <= 0 then
    	return
    end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x200912_g_missionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x200912_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x200912_g_name then
			AddNumText(sceneId, x200912_g_scriptId,x200912_g_missionName);
		end
    --���������������
    elseif x200912_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200912_g_name then
			AddNumText(sceneId,x200912_g_scriptId,x200912_g_missionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x200912_CheckAccept( sceneId, selfId )
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
function x200912_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x200912_g_missionId, x200912_g_scriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x200912_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x200912_g_missionId )
end

--**********************************
--����
--**********************************
function x200912_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x200912_g_missionName)
     AddText(sceneId,x200912_g_missionText_2)
   AddMoneyBonus( sceneId, x200912_g_MoneyBonus )
    for i, item in x200912_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200912_g_scriptId,x200912_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200912_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x200912_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200912_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x200912_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			AddMoney(sceneId,selfId,x200912_g_MoneyBonus );
			DelMission( sceneId,selfId,  x200912_g_missionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x200912_g_missionId )
			CallScriptFunction( 201011, "OnDefaultEvent",sceneId, selfId, targetId)
		else
		--������û�мӳɹ�
		end
	        
	end
end

--**********************************
--ɱ����������
--**********************************
function x200912_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x200912_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200912_OnItemChanged( sceneId, selfId, itemdataId )
end
