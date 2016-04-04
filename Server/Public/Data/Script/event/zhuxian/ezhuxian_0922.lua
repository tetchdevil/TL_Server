--���Ы��II	�ʱ���-->�¹���(�³���)
--��ɽ

--�ű���
x200922_g_scriptId = 200922

x200922_g_missionIdPre = 64	--��һ�������ID

--�����
x200922_g_missionId = 65

--Ŀ��NPC
x200922_g_name	="�¹���"

--������
local  PlayerName=""
x200922_g_missionName="���Ы����"
x200922_g_missionText_0="���ܲ��ܰ���ȥؤ���ҳ¹��㳤�ϣ�Ҫһ��Ы����ҩ��"
x200922_g_missionText_1="��ؤ���ҳ¹��㳤��"
x200922_g_missionText_2="���ʸ������������ɣ�����ؤ���кι�ɣ�"
x200922_g_MoneyBonus=166
x200922_g_ItemBonus={{id=10101001,num=1}}

--**********************************
--������ں���
--**********************************
function x200922_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x200922_g_missionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x200922_g_missionId) > 0)  then
		if GetName(sceneId,targetId) == x200922_g_name then
			x200922_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x200922_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200922_g_name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
			AddText(sceneId,x200922_g_missionName)
			AddText(sceneId,x200922_g_missionText_0)
			AddText(sceneId,"[[����Ŀ��]]")
			AddText(sceneId,x200922_g_missionText_1)
			AddMoneyBonus( sceneId, x200922_g_MoneyBonus )
			for i, item in x200922_g_ItemBonus do
						AddItemBonus( sceneId, item.id, item.num )
					end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200922_g_scriptId,x200922_g_missionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x200922_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
--    if 	IsMissionHaveDone(sceneId,selfId,x200922_g_missionIdPre) <= 0 then
--    	return
--   end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x200922_g_missionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x200922_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x200922_g_name then
			AddNumText(sceneId, x200922_g_scriptId,x200922_g_missionName);
		end
    --���������������
    elseif x200922_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200922_g_name then
			AddNumText(sceneId,x200922_g_scriptId,x200922_g_missionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x200922_CheckAccept( sceneId, selfId )
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
function x200922_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x200922_g_missionId, x200922_g_scriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x200922_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x200922_g_missionId )
end

--**********************************
--����
--**********************************
function x200922_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x200922_g_missionName)
     AddText(sceneId,x200922_g_missionText_2)
   AddMoneyBonus( sceneId, x200922_g_MoneyBonus )
    for i, item in x200922_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200922_g_scriptId,x200922_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200922_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x200922_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200922_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x200922_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			AddMoney(sceneId,selfId,x200922_g_MoneyBonus );
			DelMission( sceneId,selfId,  x200922_g_missionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x200922_g_missionId )
			CallScriptFunction( 200902, "OnDefaultEvent",sceneId, selfId, targetId)
		else
		--������û�мӳɹ�
		end
	        
	end
end

--**********************************
--ɱ����������
--**********************************
function x200922_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x200922_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200922_OnItemChanged( sceneId, selfId, itemdataId )
end



