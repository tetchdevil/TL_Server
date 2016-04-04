--��������
--����ҩ��1
--����10�����������һ��

--�ű���
x200911_g_scriptId = 200911

--��һ�������ID
x200911_g_missionIdPre = 44

--�����
x200911_g_missionId = 45

--Ŀ��NPC
x200911_g_name	="�ʱ���"

--������
local  PlayerName=""
x200911_g_missionName="����ҩ��1"
x200911_g_missionText_0="���ܲ��ܰ���ȥ��ٹ�����ĸ�������ҽⶾ���δ���Ѿ�ȥ�˺ܾû�û�л�����"
x200911_g_missionText_1="����ٹ��ҵ������ĸ�׸ʱ���"
x200911_g_missionText_2="���ʸ������������ɣ�������ٹ��кι�ɣ�"
x200911_g_MoneyBonus=166
x200911_g_ItemBonus={{id=10105001,num=1}}

--**********************************
--������ں���
--**********************************
function x200911_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x200911_g_missionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x200911_g_missionId) > 0)  then
		if GetName(sceneId,targetId) == x200911_g_name then
			x200911_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x200911_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200911_g_name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
			AddText(sceneId,x200911_g_missionName)
			AddText(sceneId,x200911_g_missionText_0)
			AddText(sceneId,"[[����Ŀ��]]")
			AddText(sceneId,x200911_g_missionText_1)
			AddMoneyBonus( sceneId, x200911_g_MoneyBonus )
			for i, item in x200911_g_ItemBonus do
						AddItemBonus( sceneId, item.id, item.num )
					end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200911_g_scriptId,x200911_g_missionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x200911_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    --if 	IsMissionHaveDone(sceneId,selfId,x200911_g_missionIdPre) <= 0 then
    --	return
    --end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x200911_g_missionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x200911_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x200911_g_name then
			AddNumText(sceneId, x200911_g_scriptId,x200911_g_missionName);
		end
    --���������������
    elseif x200911_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200911_g_name then
			AddNumText(sceneId,x200911_g_scriptId,x200911_g_missionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x200911_CheckAccept( sceneId, selfId )
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
function x200911_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x200911_g_missionId, x200911_g_scriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x200911_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x200911_g_missionId )
end

--**********************************
--����
--**********************************
function x200911_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x200911_g_missionName)
     AddText(sceneId,x200911_g_missionText_2)
   AddMoneyBonus( sceneId, x200911_g_MoneyBonus )
    for i, item in x200911_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200911_g_scriptId,x200911_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200911_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x200911_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200911_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x200911_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			AddMoney(sceneId,selfId,x200911_g_MoneyBonus );
			DelMission( sceneId,selfId,  x200911_g_missionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x200911_g_missionId )
			CallScriptFunction( 200912, "OnDefaultEvent",sceneId, selfId, targetId)
		else
		--������û�мӳɹ�
		end
	        
	end
end

--**********************************
--ɱ����������
--**********************************
function x200911_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x200911_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200911_OnItemChanged( sceneId, selfId, itemdataId )
end
