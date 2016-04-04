--��������
--��ʾ���3
--����14�����������3��

--�ű���
x201313_g_scriptId = 201313

--��һ�������ID
x201313_g_missionIdPre = 52	

--�����
x201313_g_missionId = 53

--Ŀ��NPC
x201313_g_name	="�̱�"

--������
local  PlayerName=""
x201313_g_missionName="��ʾ���3"
x201313_g_missionText_0="��̫ξ�����ѵõ��˲ţ��ߵ�һ�ź���������ô�󷽣������سɴ�����\n��ĸ�״��٣���Ҷ���ô�����������Ҳ�����������Т����Ȼ�����ﶼ�ͻ��ϼ�Т�������˼���"
x201313_g_missionText_1="���������ѱ��ͻ�ͯ���ϼҵ��¸��߲̱�"
x201313_g_missionText_2="�õ�ʲô��Ϣ�ˣ�"
x201313_g_MoneyBonus=166
x201313_g_ItemBonus={{id=10105001,num=1}}

--**********************************
--������ں���
--**********************************
function x201313_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x201313_g_missionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x201313_g_missionId) > 0)  then
		if GetName(sceneId,targetId) == x201313_g_name then
			x201313_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x201313_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x201313_g_name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
			AddText(sceneId,x201313_g_missionName)
			AddText(sceneId,x201313_g_missionText_0)
			AddText(sceneId,"[[����Ŀ��]]")
			AddText(sceneId,x201313_g_missionText_1)
			AddMoneyBonus( sceneId, x201313_g_MoneyBonus )
			for i, item in x201313_g_ItemBonus do
						AddItemBonus( sceneId, item.id, item.num )
					end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x201313_g_scriptId,x201313_g_missionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x201313_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x201313_g_missionIdPre) <= 0 then
    	return
    end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x201313_g_missionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x201313_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x201313_g_name then
			AddNumText(sceneId, x201313_g_scriptId,x201313_g_missionName);
		end
    --���������������
    elseif x201313_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x201313_g_name then
			AddNumText(sceneId,x201313_g_scriptId,x201313_g_missionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x201313_CheckAccept( sceneId, selfId )
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
function x201313_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x201313_g_missionId, x201313_g_scriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x201313_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x201313_g_missionId )
end

--**********************************
--����
--**********************************
function x201313_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x201313_g_missionName)
     AddText(sceneId,x201313_g_missionText_2)
   AddMoneyBonus( sceneId, x201313_g_MoneyBonus )
    for i, item in x201313_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x201313_g_scriptId,x201313_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x201313_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x201313_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x201313_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x201313_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			AddMoney(sceneId,selfId,x201313_g_MoneyBonus );
			DelMission( sceneId,selfId,  x201313_g_missionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x201313_g_missionId )
			CallScriptFunction( 201411, "OnDefaultEvent",sceneId, selfId, targetId)
		else
		--������û�мӳɹ�
		end
	        
	end
end

--**********************************
--ɱ����������
--**********************************
function x201313_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x201313_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x201313_OnItemChanged( sceneId, selfId, itemdataId )
end
