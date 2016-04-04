--����һָ  �¹���(�³���)-->�¹���(�³���)
--������ x201021_OnKillObject �������Ĳ��� objdataId ֵ���ԣ����� GetName������������ʹ�ã���������޸�

--�ű���
x201021_g_scriptId = 201021

--��һ�������ID
x201021_g_missionIdPre = 22	

--�����
x201021_g_missionId = 66

--Ŀ��NPC
x201021_g_name	="�¹���"

--��ɱĿ��
x201021_g_kill_name ="Ү�ɲ�³"

--������
local  PlayerName=""
x201021_g_missionName="����һָ"
x201021_g_missionText_0="�����ڳﻮ��ɱ�ɹ���·Ԫ˧Ү�ɲ�³���鷳С�ֵ��㵽�ػͷ������������ϵ���Ԫ˧ӡ���������ҡ�"
x201021_g_missionText_1="���ػʹ�ɱҮ�ɲ�³"
x201021_g_missionText_2="���ʸ������������ɣ�����ؤ���кι�ɣ�"
x201021_g_missionText_3="��������Ҫɱ��Ү�ɲ�³��ȡ��������Ԫ˧ӡ"
x201021_g_MoneyBonus=166
--������Ʒ��Ԫ˧ӡ����ƷID��
x201021_g_itemdataId=50101001
x201021_g_ItemBonus={{id=10105001,num=1}}


--**********************************
--������ں���
--**********************************
function x201021_OnDefaultEvent( sceneId, selfId, targetId )



    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x201021_g_missionId) > 0 then
    	return
    	
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x201021_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x201021_g_name then
    			x201021_OnContinue( sceneId, selfId, targetId )
		end
		
    --���������������
    elseif x201021_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) == x201021_g_name then
    		--�����������ʱ��ʾ����Ϣ
        	BeginEvent(sceneId)
			AddText(sceneId,x201021_g_missionName)
			AddText(sceneId,x201021_g_missionText_0)
			AddText(sceneId,"[[����Ŀ��]]")
			AddText(sceneId,x201021_g_missionText_1)
			AddMoneyBonus( sceneId, x201021_g_MoneyBonus )
			for i, item in x201021_g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
		EndEvent(sceneId)
        	DispatchMissionInfo(sceneId,selfId,targetId,x201021_g_scriptId,x201021_g_missionId)
    	end
    end
end

--**********************************
--�о��¼�
--**********************************
function x201021_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
--    if 	IsMissionHaveDone(sceneId,selfId,x201021_g_missionIdPre) <= 0 then
--    	return
--   end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x201021_g_missionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x201021_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x201021_g_name then
			AddNumText(sceneId, x201021_g_scriptId,x201021_g_missionName);
		end
    --���������������
    elseif x201021_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) == x201021_g_name then
			AddNumText(sceneId,x201021_g_scriptId,x201021_g_missionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x201021_CheckAccept( sceneId, selfId )
	
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
function x201021_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x201021_g_missionId, x201021_g_scriptId, 1, 0, 0 )
	
end

--**********************************
--����
--**********************************
function x201021_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    RemoveTask( sceneId, selfId, x201021_g_missionId )
end

--**********************************
--����
--**********************************
function x201021_OnContinue( sceneId, selfId, targetId )

	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    	AddText(sceneId,x201021_g_missionName)
    	AddText(sceneId,x201021_g_missionText_2)
	--��ʾ�����������
	AddItemDemand(sceneId, x201021_g_itemdataId, 1)
	--��ʾ�����Ǯ����
   	AddMoneyBonus( sceneId, x201021_g_MoneyBonus )
    	for i, item in x201021_g_ItemBonus do
		--��ʾ������Ʒ����
		AddItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x201021_g_scriptId,x201021_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x201021_CheckSubmit( sceneId, selfId )
	--�ж���������Ƿ�����Ԫ˧ӡ����������ύ����û�������ύ����
	if HaveItem(sceneId,selfId, x201021_g_itemdataId) ==1 then 
		return 1
	else 
		return 0
	end
end

--**********************************
--�ύ
--**********************************
function x201021_OnSubmit( sceneId, selfId )

	if x201021_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
    		BeginAddItem(sceneId)
		for i, item in x201021_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			AddMoney(sceneId,selfId,x201021_g_MoneyBonus );
			DelMission( sceneId,selfId,  x201021_g_missionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x201021_g_missionId )
			--ɾ����Ԫ˧ӡ
			DelItem(sceneId,selfId,x201021_g_itemdataId,1)
		else
		--������û�мӳɹ�
		end
	else
		BeginEvent(sceneId)
			AddText(sceneId,x201021_g_missionText_3)
		EndEvent(sceneId)  
	end
    
end

--**********************************
--ɱ��ָ�����͹���
--**********************************
function x201021_OnKillObject( sceneId, selfId, objdataId )

--���������

	--���ɱ������Ү�ɲ�³,ϵͳ����������Ԫ˧ӡ
	if GetName(sceneId,objdataId) == x201021_g_kill_name then 
		AddItem(sceneId,selfId,x201021_g_itemdataId,1)
	end
end

--**********************************
--���������¼�
--**********************************
function x201021_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x201021_OnItemChanged( sceneId, selfId, itemdataId )

end
