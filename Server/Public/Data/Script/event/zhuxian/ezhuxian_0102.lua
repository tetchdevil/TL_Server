--��������
--����֮��2

--�ű���
x200102_g_scriptId = 200102

x200102_g_missionIdPre = 1	--��һ�������ID
--�����
x200102_g_missionId = 2

--Ŀ��NPC
x200102_g_name="������"

--������
local  PlayerName=""
x200102_g_missionName="����֮��2"
x200102_g_missionText_0="���Ƿ�ţ�ɵĹ���֮"
--,���м�������ʦ��ް�Ȫ,���������ү�칫,����ү������."
x200102_g_missionText_1="����Ŀ�꣺\n�ѹ���֮������ת��������������"
x200102_g_MoneyBonus=166
x200102_g_ItemBonus={{id=10105001,num=1}}
x200102_g_missionText_2="���ò���"
--��������"   --..x200102_g_MoneyBonus.."������"


--**********************************
--������ں���
--**********************************
function x200102_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x200102_g_missionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x200102_g_missionId) > 0)  then
		if GetName(sceneId,targetId) == x200102_g_name then
			x200102_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x200102_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200102_g_name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
			AddText(sceneId,x200102_g_missionName)
			AddText(sceneId,x200102_g_missionText_0)
			AddText(sceneId,"[[����Ŀ��]]")
			AddText(sceneId,x200102_g_missionText_1)
			AddMoneyBonus( sceneId, x200102_g_MoneyBonus )
			for i, item in x200102_g_ItemBonus do
						AddItemBonus( sceneId, item.id, item.num )
					end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200102_g_scriptId,x200102_g_missionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x200102_OnEnumerate( sceneId, selfId, targetId )
--AddNumText(sceneId,x200102_g_scriptId,x200102_g_missionName);
	
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x200102_g_missionIdPre) <= 0 then
    	return
    end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x200102_g_missionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x200102_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x200102_g_name then
			AddNumText(sceneId, x200102_g_scriptId,x200102_g_missionName);
		end
    --���������������
    elseif x200102_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200102_g_name then
			AddNumText(sceneId,x200102_g_scriptId,x200102_g_missionName);
		end
    end
    
end

--**********************************
--����������
--**********************************
function x200102_CheckAccept( sceneId, selfId )
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
function x200102_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x200102_g_missionId, x200102_g_scriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x200102_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x200102_g_missionId )
end

--**********************************
--����
--**********************************
function x200102_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x200102_g_missionName)
     AddText(sceneId,x200102_g_missionText_2)
   AddMoneyBonus( sceneId, x200102_g_MoneyBonus )
    for i, item in x200102_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200102_g_scriptId,x200102_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200102_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x200102_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200102_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x200102_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			AddMoney(sceneId,selfId,x200102_g_MoneyBonus );
			DelMission( sceneId,selfId,  x200102_g_missionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x200102_g_missionId )
			CallScriptFunction( 200201, "OnDefaultEvent",sceneId, selfId, targetId)
		else
		--������û�мӳɹ�
		end
	        
	end
end

--**********************************
--ɱ����������
--**********************************
function x200102_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x200102_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200102_OnItemChanged( sceneId, selfId, itemdataId )
end
