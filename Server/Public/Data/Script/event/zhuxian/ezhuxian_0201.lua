--��������
--��ֶ���1

--�ű���
x200201_g_scriptId = 200201

x200201_g_missionIdPre = 2	--��һ�������ID
--�����
x200201_g_missionId = 3

--Ŀ��NPC
x200201_g_name	="�ް�Ȫ" 

--������
--local  PlayerName=""
x200201_g_missionName="��ֶ���1"
x200201_g_missionText_0="�����̴ް�Ȫ"
--������ѽ,��һ���ƹ�,��Ȼ���������������ﵱ�˷�����!ƭ���Һÿ�.\n��ȥ�˷��ҵ��ް�Ȫ,�ѹ���֮���õ����������."
x200201_g_missionText_1="����Ŀ�꣺\n�ѹ���֮���õ�������ߴް�Ȫ"
x200201_g_missionText_2="��ȷʵ�Ǻ��Ϸ�ţ������"
--,��ţ�����ſ°������Ҵ�ʦ��.����֮ʦֶ��һ��,�����뷹���ǳԲ���ȥ��."
x200201_g_MoneyBonus=777
x200201_g_ItemBonus={{id=10105001,num=1}}

--**********************************
--������ں���
--**********************************
function x200201_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x200201_g_missionId) > 0 ) then
    	return
    elseif( IsHaveMission(sceneId,selfId,x200201_g_missionId) > 0)  then
		if GetName(sceneId,targetId) == x200201_g_name then
			x200201_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x200201_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200201_g_name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
			AddText(sceneId,x200201_g_missionName)
			AddText(sceneId,x200201_g_missionText_0)
			AddText(sceneId,"[[����Ŀ��]]")
			AddText(sceneId,x200201_g_missionText_1)
			AddMoneyBonus( sceneId, x200201_g_MoneyBonus )
			for i, item in x200201_g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200201_g_scriptId,x200201_g_missionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x200201_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x200201_g_missionIdPre) <= 0 then
    	return
    end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x200201_g_missionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x200201_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x200201_g_name then
			AddNumText(sceneId, x200201_g_scriptId,x200201_g_missionName);
		end
    --���������������
    elseif x200201_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200201_g_name then
			AddNumText(sceneId,x200201_g_scriptId,x200201_g_missionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x200201_CheckAccept( sceneId, selfId )
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
function x200201_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x200201_g_missionId, x200201_g_scriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x200201_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x200201_g_missionId )
end

--**********************************
--����
--**********************************
function x200201_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x200201_g_missionName)
     AddText(sceneId,x200201_g_missionText_2)
   AddMoneyBonus( sceneId, x200201_g_MoneyBonus )
    for i, item in x200201_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200201_g_scriptId,x200201_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200201_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x200201_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200201_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x200201_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			AddMoney(sceneId,selfId,x200201_g_MoneyBonus );
			DelMission( sceneId,selfId,  x200201_g_missionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x200201_g_missionId )
			CallScriptFunction( 200202, "OnDefaultEvent",sceneId, selfId, targetId)
		else
		--������û�мӳɹ�
		end
	        
	end
end

--**********************************
--ɱ����������
--**********************************
function x200201_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x200201_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200201_OnItemChanged( sceneId, selfId, itemdataId )
end
