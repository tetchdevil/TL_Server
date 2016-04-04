--��������
--��ֶ���2

--�ű���
x200202_g_scriptId = 200202

x200202_g_missionIdPre = 3	--��һ�������ID
--�����
x200202_g_missionId = 4

--Ŀ��NPC
x200202_g_name	="����֮" 

--������
--local  PlayerName=""
x200202_g_missionName="��ֶ���2"
x200202_g_missionText_0="��֮������һ����Ҫ��ȥ��æ���˵�"
--,�������,���ϵ����ϻ��п�ʦ�ָ㲻���ĵ���?��������ҽй���!"
x200202_g_missionText_1="����Ŀ�꣺\n�й���֮�����ް�Ȫ"
x200202_g_missionText_2="�����ڲ�æȥ�������˼�"
--,�������ܲ��ܰ���һ��æ?"
x200202_g_MoneyBonus=777
x200202_g_ItemBonus={{id=10105001,num=1}}

--**********************************
--������ں���
--**********************************
function x200202_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x200202_g_missionId) > 0 ) then
    	return
    elseif( IsHaveMission(sceneId,selfId,x200202_g_missionId) > 0)  then
		if GetName(sceneId,targetId) == x200202_g_name then
			x200202_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x200202_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200202_g_name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
			AddText(sceneId,x200202_g_missionName)
			AddText(sceneId,x200202_g_missionText_0)
			AddText(sceneId,"[[����Ŀ��]]")
			AddText(sceneId,x200202_g_missionText_1)
			AddMoneyBonus( sceneId, x200202_g_MoneyBonus )
			for i, item in x200202_g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200202_g_scriptId,x200202_g_missionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x200202_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x200202_g_missionIdPre) <= 0 then
    	return
    end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x200202_g_missionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x200202_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x200202_g_name then
			AddNumText(sceneId, x200202_g_scriptId,x200202_g_missionName);
		end
    --���������������
    elseif x200202_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200202_g_name then
			AddNumText(sceneId,x200202_g_scriptId,x200202_g_missionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x200202_CheckAccept( sceneId, selfId )
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
function x200202_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x200202_g_missionId, x200202_g_scriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x200202_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x200202_g_missionId )
end

--**********************************
--����
--**********************************
function x200202_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x200202_g_missionName)
     AddText(sceneId,x200202_g_missionText_2)
   AddMoneyBonus( sceneId, x200202_g_MoneyBonus )
    for i, item in x200202_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200202_g_scriptId,x200202_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200202_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x200202_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200202_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x200202_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			AddMoney(sceneId,selfId,x200202_g_MoneyBonus );
			DelMission( sceneId,selfId,  x200202_g_missionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x200202_g_missionId )
			CallScriptFunction( 200203, "OnDefaultEvent",sceneId, selfId, targetId)
		else
		--������û�мӳɹ�
		end
	        
	end
end

--**********************************
--ɱ����������
--**********************************
function x200202_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x200202_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200202_OnItemChanged( sceneId, selfId, itemdataId )
end
