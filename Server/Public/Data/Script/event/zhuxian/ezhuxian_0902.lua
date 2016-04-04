--��������	�ʱ���-�������
--��ٹ�2

--�ű���
x200902_g_scriptId = 200902

--��һ�������ID
x200902_g_missionIdPre = 23	

--�����
x200902_g_missionId = 24

--Ŀ��NPC
x200902_g_name	="�����"

--������
local  PlayerName=""
x200902_g_missionName="��ٹ�2"
x200902_g_missionText_0="ԭ�����������ɵ�"
--���������Сԩ�ң����Ǹ����ǻ���Ҫ���ǿ����µ������ҲŲ�Ը������������Ҳ��ܳ��ȣ������������������ɷ������ɣ�������XXX��������ҪС�ģ�ǧ��Ҫ˵�κ��նε��˵����飬���Ҳ��Ҫ˵�����Ĺ���"
x200902_g_missionText_1="�ҵ�����ĸ��������"
x200902_g_missionText_2="����˭�����ҹ����ʲô��"
--�����㣬����Ҽұ��������⣬С����һ�������㣡����ʲô����Ҫ���ն�������һ�������㣡"
x200902_g_MoneyBonus=166
x200902_g_ItemBonus={{id=10105001,num=1}}

--**********************************
--������ں���
--**********************************
function x200902_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x200902_g_missionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x200902_g_missionId) > 0)  then
		if GetName(sceneId,targetId) == x200902_g_name then
			x200902_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x200902_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200902_g_name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
			AddText(sceneId,x200902_g_missionName)
			AddText(sceneId,x200902_g_missionText_0)
			AddText(sceneId,"[[����Ŀ��]]")
			AddText(sceneId,x200902_g_missionText_1)
			AddMoneyBonus( sceneId, x200902_g_MoneyBonus )
			for i, item in x200902_g_ItemBonus do
						AddItemBonus( sceneId, item.id, item.num )
					end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200902_g_scriptId,x200902_g_missionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x200902_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x200902_g_missionIdPre) <= 0 then
    	return
    end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x200902_g_missionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x200902_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x200902_g_name then
			AddNumText(sceneId, x200902_g_scriptId,x200902_g_missionName);
		end
    --���������������
    elseif x200902_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200902_g_name then
			AddNumText(sceneId,x200902_g_scriptId,x200902_g_missionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x200902_CheckAccept( sceneId, selfId )
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
function x200902_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x200902_g_missionId, x200902_g_scriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x200902_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x200902_g_missionId )
end

--**********************************
--����
--**********************************
function x200902_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x200902_g_missionName)
     AddText(sceneId,x200902_g_missionText_2)
   AddMoneyBonus( sceneId, x200902_g_MoneyBonus )
    for i, item in x200902_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200902_g_scriptId,x200902_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200902_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x200902_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200902_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x200902_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			AddMoney(sceneId,selfId,x200902_g_MoneyBonus );
			DelMission( sceneId,selfId,  x200902_g_missionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x200902_g_missionId )
			CallScriptFunction( 201001, "OnDefaultEvent",sceneId, selfId, targetId)
		else
		--������û�мӳɹ�
		end
	        
	end
end

--**********************************
--ɱ����������
--**********************************
function x200902_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x200902_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200902_OnItemChanged( sceneId, selfId, itemdataId )
end








