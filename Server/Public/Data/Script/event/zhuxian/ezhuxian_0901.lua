--��������	����-���ʱ���
--��ٹ�1

--�ű���
x200901_g_scriptId = 200901

x200901_g_missionIdPre = 22	--��һ�������ID

--�����
x200901_g_missionId = 23

--Ŀ��NPC
x200901_g_name	="�ʱ���"

--������
local  PlayerName=""
x200901_g_missionName="��ٹ�1"
x200901_g_missionText_0="���ܲ��ܰ���ȥ��ٹ�����ĸ�������ҽⶾ���δ���Ѿ�ȥ�˺ܾû�û�л�����"
x200901_g_missionText_1="����ٹ��ҵ������ĸ�׸ʱ���"
x200901_g_missionText_2="���ʸ������������ɣ�������ٹ��кι�ɣ�"
x200901_g_MoneyBonus=166
x200901_g_ItemBonus={{id=10105001,num=1}}

--**********************************
--������ں���
--**********************************
function x200901_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x200901_g_missionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x200901_g_missionId) > 0)  then
		if GetName(sceneId,targetId) == x200901_g_name then
			x200901_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x200901_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200901_g_name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
			AddText(sceneId,x200901_g_missionName)
			AddText(sceneId,x200901_g_missionText_0)
			AddText(sceneId,"[[����Ŀ��]]")
			AddText(sceneId,x200901_g_missionText_1)
			AddMoneyBonus( sceneId, x200901_g_MoneyBonus )
			for i, item in x200901_g_ItemBonus do
						AddItemBonus( sceneId, item.id, item.num )
					end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200901_g_scriptId,x200901_g_missionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x200901_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
--    if 	IsMissionHaveDone(sceneId,selfId,x200901_g_missionIdPre) <= 0 then
--    	return
--   end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x200901_g_missionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x200901_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x200901_g_name then
			AddNumText(sceneId, x200901_g_scriptId,x200901_g_missionName);
		end
    --���������������
    elseif x200901_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200901_g_name then
			AddNumText(sceneId,x200901_g_scriptId,x200901_g_missionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x200901_CheckAccept( sceneId, selfId )
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
function x200901_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x200901_g_missionId, x200901_g_scriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x200901_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x200901_g_missionId )
end

--**********************************
--����
--**********************************
function x200901_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x200901_g_missionName)
     AddText(sceneId,x200901_g_missionText_2)
   AddMoneyBonus( sceneId, x200901_g_MoneyBonus )
    for i, item in x200901_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200901_g_scriptId,x200901_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200901_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x200901_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200901_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x200901_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			AddMoney(sceneId,selfId,x200901_g_MoneyBonus );
			DelMission( sceneId,selfId,  x200901_g_missionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x200901_g_missionId )
			CallScriptFunction( 200902, "OnDefaultEvent",sceneId, selfId, targetId)
		else
		--������û�мӳɹ�
		end
	        
	end
end

--**********************************
--ɱ����������
--**********************************
function x200901_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x200901_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200901_OnItemChanged( sceneId, selfId, itemdataId )
end



