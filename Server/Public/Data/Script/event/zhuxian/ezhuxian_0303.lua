--��������
--�����ͽ3

--�ű���
x200303_g_scriptId = 200303

--ǰ������
x200303_g_missionIdPre = 7;

--�����
x200303_g_missionId = 8

--Ŀ��NPC
x200303_g_name	= "������"

--������
local  PlayerName=""
x200303_g_missionName="�����ͽ3"
x200303_g_missionText_0="��ʦ�����ڱ��ɲ�����������ǧ��֮��"
--,��һ���ǹ���Ľ�����µĶ���.�ް�Ȫ��֪����Զ������,��ɱ��֮������ܲ���.��ת�����ү,���������Ĺ���,�ް�Ȫ�����ٱ���."
x200303_g_missionText_1="�ҵ���������������̸"
x200303_g_missionText_2="��֪����Ϊ��Ϊ֮"
--,�ް�ȪҲ��һ���ú���,��ԭ������С������."
x200303_g_MoneyBonus=10000
x200303_g_ItemBonus={{id=10105003,num=1}}

--**********************************
--������ں���
--**********************************
function x200303_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x200303_g_missionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x200303_g_missionId) > 0)  then
		if GetName(sceneId,targetId) == x200303_g_name then
			x200303_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x200303_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId)~= x200303_g_name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
			AddText(sceneId,x200303_g_missionName)
			AddText(sceneId,x200303_g_missionText_0)
			AddText(sceneId,"[[����Ŀ��]]")
			AddText(sceneId,x200303_g_missionText_1)
			AddMoneyBonus( sceneId, x200303_g_MoneyBonus )
			for i, item in x200303_g_ItemBonus do
						AddItemBonus( sceneId, item.id, item.num )
					end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200303_g_scriptId,x200303_g_missionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x200303_OnEnumerate( sceneId, selfId, targetId )
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x200303_g_missionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x200303_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x200303_g_name then
			AddNumText(sceneId, x200303_g_scriptId,x200303_g_missionName);
		end
    --���������������
    elseif x200303_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200303_g_name then
			AddNumText(sceneId,x200303_g_scriptId,x200303_g_missionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x200303_CheckAccept( sceneId, selfId )
	--��Ҫ1�����ܽ�
	if GetLevel( sceneId, selfId ) >= 1 then
		return 1
	else
		return 0
	end
end

function x200303_CheckAccept( sceneId, selfId )
	bDone = IsMissionHaveDone( sceneId, selfId, x200303_g_missionIdPre );
	if bDone > 0 then
		return 1;
	else
		return 0;
	end
end
--**********************************
--����
--**********************************
function x200303_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x200303_g_missionId, x200303_g_scriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x200303_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x200303_g_missionId )
end

--**********************************
--����
--**********************************
function x200303_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x200303_g_missionName)
     AddText(sceneId,x200303_g_missionText_2)
   AddMoneyBonus( sceneId, x200303_g_MoneyBonus )
    for i, item in x200303_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200303_g_scriptId,x200303_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200303_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x200303_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200303_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x200303_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			AddMoney(sceneId,selfId,x200303_g_MoneyBonus );
			DelMission( sceneId,selfId,  x200303_g_missionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x200303_g_missionId )
			CallScriptFunction( 200401, "OnDefaultEvent",sceneId, selfId, targetId)
		else
		--������û�мӳɹ�
		end
	        
	end
end

--**********************************
--ɱ����������
--**********************************
function x200303_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x200303_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200303_OnItemChanged( sceneId, selfId, itemdataId )
end
