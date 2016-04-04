--��������
--��������2

--�ű���
x201302_g_scriptId = 201302

--��һ�������ID
x201302_g_missionIdPre = 32

--�����
x201302_g_missionId = 33

--Ŀ��NPC
x201302_g_name	="�ʱ���"

--������
local  PlayerName=""
x201302_g_missionName="��������2"
x201302_g_missionText_0="�һ���û��ʱ��ȥ����ѾͷƬ�ӣ��ҿ�����նε�ûʲô��ϵ����ȥ���������"
x201302_g_missionText_1="��ʱ���̸̸"
x201302_g_missionText_2="�ҵ����ɷ��������ô������û��ȥ����Ů����"
x201302_g_MoneyBonus=166
x201302_g_ItemBonus={{id=10105001,num=1}}

--**********************************
--������ں���
--**********************************
function x201302_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x201302_g_missionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x201302_g_missionId) > 0)  then
		if GetName(sceneId,targetId) == x201302_g_name then
			x201302_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x201302_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x201302_g_name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
			AddText(sceneId,x201302_g_missionName)
			AddText(sceneId,x201302_g_missionText_0)
			AddText(sceneId,"[[����Ŀ��]]")
			AddText(sceneId,x201302_g_missionText_1)
			AddMoneyBonus( sceneId, x201302_g_MoneyBonus )
			for i, item in x201302_g_ItemBonus do
						AddItemBonus( sceneId, item.id, item.num )
					end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x201302_g_scriptId,x201302_g_missionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x201302_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x201302_g_missionIdPre) <= 0 then
    	return
    end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x201302_g_missionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x201302_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x201302_g_name then
			AddNumText(sceneId, x201302_g_scriptId,x201302_g_missionName);
		end
    --���������������
    elseif x201302_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x201302_g_name then
			AddNumText(sceneId,x201302_g_scriptId,x201302_g_missionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x201302_CheckAccept( sceneId, selfId )
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
function x201302_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x201302_g_missionId, x201302_g_scriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x201302_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x201302_g_missionId )
end

--**********************************
--����
--**********************************
function x201302_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x201302_g_missionName)
     AddText(sceneId,x201302_g_missionText_2)
   AddMoneyBonus( sceneId, x201302_g_MoneyBonus )
    for i, item in x201302_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x201302_g_scriptId,x201302_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x201302_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x201302_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x201302_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x201302_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			AddMoney(sceneId,selfId,x201302_g_MoneyBonus );
			DelMission( sceneId,selfId,  x201302_g_missionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x201302_g_missionId )
			CallScriptFunction( 201401, "OnDefaultEvent",sceneId, selfId, targetId)
		else
		--������û�мӳɹ�
		end
	        
	end
end

--**********************************
--ɱ����������
--**********************************
function x201302_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x201302_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x201302_OnItemChanged( sceneId, selfId, itemdataId )
end
