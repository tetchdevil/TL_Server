--��������
--��ڤ��1

--�ű���
x201901_g_scriptId = 201901

--��һ�������ID
x201901_g_missionIdPre = 41

--�����
x201901_g_missionId = 43

--Ŀ��NPC
x201901_g_name	="������"

--������
local  PlayerName=""
x201901_g_missionName="��ڤ��1"
x201901_g_missionText_0="��ȥ���߶������������ѻ�λ�ԹԽ�����"
x201901_g_missionText_1="����Ŀ�꣺\n�����̸̸"
x201901_g_missionText_2="�ҵ�����̫����ô��"
x201901_g_MoneyBonus=166
x201901_g_ItemBonus={{id=10105001,num=1}}

--**********************************
--������ں���
--**********************************
function x201901_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x201901_g_missionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x201901_g_missionId) > 0)  then
		if GetName(sceneId,targetId) == x201901_g_name then
			x201901_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x201901_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x201901_g_name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
			AddText(sceneId,x201901_g_missionName)
			AddText(sceneId,x201901_g_missionText_0)
			AddText(sceneId,"[[����Ŀ��]]")
			AddText(sceneId,x201901_g_missionText_1)
			AddMoneyBonus( sceneId, x201901_g_MoneyBonus )
			for i, item in x201901_g_ItemBonus do
						AddItemBonus( sceneId, item.id, item.num )
					end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x201901_g_scriptId,x201901_g_missionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x201901_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x201901_g_missionIdPre) <= 0 then
    	return
    end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x201901_g_missionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x201901_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x201901_g_name then
			AddNumText(sceneId, x201901_g_scriptId,x201901_g_missionName);
		end
    --���������������
    elseif x201901_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x201901_g_name then
			AddNumText(sceneId,x201901_g_scriptId,x201901_g_missionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x201901_CheckAccept( sceneId, selfId )
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
function x201901_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x201901_g_missionId, x201901_g_scriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x201901_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x201901_g_missionId )
end

--**********************************
--����
--**********************************
function x201901_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x201901_g_missionName)
     AddText(sceneId,x201901_g_missionText_2)
   AddMoneyBonus( sceneId, x201901_g_MoneyBonus )
    for i, item in x201901_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x201901_g_scriptId,x201901_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x201901_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x201901_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x201901_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x201901_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			AddMoney(sceneId,selfId,x201901_g_MoneyBonus );
			DelMission( sceneId,selfId,  x201901_g_missionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x201901_g_missionId )
			CallScriptFunction( 201902, "OnDefaultEvent",sceneId, selfId, targetId)
		else
		--������û�мӳɹ�
		end
	        
	end
end

--**********************************
--ɱ����������
--**********************************
function x201901_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x201901_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x201901_OnItemChanged( sceneId, selfId, itemdataId )
end
