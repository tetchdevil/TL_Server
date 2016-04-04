--��������
--ǧ���Ͷ�ë

--�ű���
x200401_g_scriptId = 200401

--ǰ������
x200401_g_missionIdPre = 8;

--�����
x200401_g_missionId = 9

--Ŀ��NPC
x200401_g_name	="������" 

--������
local  PlayerName=""
x200401_g_missionName="ǧ���Ͷ�ë1"
x200401_g_missionText_0="��İ��������ܲ���"
--�����Ѿ��������������˻��֣����������һ����ȥ�ʹ������ʵ۰ɡ�"
x200401_g_missionText_1="ȥ�ʹ�����������"
x200401_g_missionText_2="������"
--����İ��������������Ǵ�������ɶ�õ��˲š�"
x200401_g_MoneyBonus=10000
x200401_g_ItemBonus={{id=10105004,num=1}}


--**********************************
--������ں���
--**********************************
function x200401_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x200401_g_missionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x200401_g_missionId) > 0)  then
		if GetName(sceneId,targetId) == x200401_g_name then
			x200401_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x200401_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200401_g_name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
			AddText(sceneId,x200401_g_missionName)
			AddText(sceneId,x200401_g_missionText_0)
			AddText(sceneId,"[[����Ŀ��]]")
			AddText(sceneId,x200401_g_missionText_1)
			AddMoneyBonus( sceneId, x200401_g_MoneyBonus )
			for i, item in x200401_g_ItemBonus do
						AddItemBonus( sceneId, item.id, item.num )
					end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200401_g_scriptId,x200401_g_missionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x200401_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x200401_g_missionIdPre) <= 0 then
    	return
    end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x200401_g_missionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x200401_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x200401_g_name then
			AddNumText(sceneId, x200401_g_scriptId,x200401_g_missionName);
		end
    --���������������
    elseif x200401_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200401_g_name then
			AddNumText(sceneId,x200401_g_scriptId,x200401_g_missionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x200401_CheckAccept( sceneId, selfId )
	--��Ҫ1�����ܽ�
	if GetLevel( sceneId, selfId ) >= 1 then
		return 1
	else
		return 0
	end
end

function x200401_CheckAccept( sceneId, selfId )
	bDone = IsMissionHaveDone( sceneId, selfId, x200401_g_missionIdPre );
	if bDone > 0 then
		return 1;
	else
		return 0;
	end
end
--**********************************
--����
--**********************************
function x200401_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x200401_g_missionId, x200401_g_scriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x200401_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x200401_g_missionId )
end

--**********************************
--����
--**********************************
function x200401_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x200401_g_missionName)
     AddText(sceneId,x200401_g_missionText_2)
   AddMoneyBonus( sceneId, x200401_g_MoneyBonus )
    for i, item in x200401_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200401_g_scriptId,x200401_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200401_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x200401_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200401_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x200401_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			AddMoney(sceneId,selfId,x200401_g_MoneyBonus );
			DelMission( sceneId,selfId,  x200401_g_missionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x200401_g_missionId )
			CallScriptFunction( 200402, "OnDefaultEvent",sceneId, selfId, targetId)
		else
		--������û�мӳɹ�
		end
	        
	end
end

--**********************************
--ɱ����������
--**********************************
function x200401_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x200401_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200401_OnItemChanged( sceneId, selfId, itemdataId )
end
