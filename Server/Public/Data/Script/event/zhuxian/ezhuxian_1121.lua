--�߼�����	�¹���-��������
--ĿǰDelItem�����д��󣬷��سɹ������ǵ���δɾ��������������
--ؤ��

--�ű���
x201121_g_scriptId = 201121

x201121_g_missionIdPre = 66	--��һ�������ID

--�����
x201121_g_missionId = 67

--Ŀ��NPC
x201121_g_name	="������"

--Ы����ҩID, ��ʱ����ҩ����
x201121_g_XieDuJieYao = 20001001

--������
local  PlayerName=""
x201121_g_missionName="�߼�����"
x201121_g_missionText_0="�Ҹ������ݽ�ҩ���������һ�ݸ�������������"
x201121_g_missionText_1="��һ�ݽ�ҩ��������"
x201121_g_missionText_2="���ʸ������������ɣ�����ؤ���кι�ɣ�"
x201121_g_MoneyBonus=166
x201121_g_ItemBonus={{id=10100000,num=1}}

--**********************************
--������ں���
--**********************************
function x201121_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x201121_g_missionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x201121_g_missionId) > 0)  then
		if GetName(sceneId,targetId) == x201121_g_name then
			x201121_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x201121_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x201121_g_name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
			AddText(sceneId,x201121_g_missionName)
			AddText(sceneId,x201121_g_missionText_0)
			AddText(sceneId,"����Ŀ��")
			AddText(sceneId,x201121_g_missionText_1)
			AddMoneyBonus( sceneId, x201121_g_MoneyBonus )
			--for i, item in x201121_g_ItemBonus do
			--	AddItemBonus( sceneId, item.id, item.num )
			--end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x201121_g_scriptId,x201121_g_missionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x201121_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
--    if 	IsMissionHaveDone(sceneId,selfId,x201121_g_missionIdPre) <= 0 then
--    	return
--   end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x201121_g_missionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x201121_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x201121_g_name then
			AddNumText(sceneId, x201121_g_scriptId,x201121_g_missionName);
		end
    --���������������
    elseif x201121_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x201121_g_name then
			AddNumText(sceneId,x201121_g_scriptId,x201121_g_missionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x201121_CheckAccept( sceneId, selfId )
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
function x201121_OnAccept( sceneId, selfId )
	--������ݽ�ҩ�����
	BeginAddItem(sceneId)
		AddItem( sceneId,x201121_g_XieDuJieYao, 2 )
	if EndAddItem(sceneId,selfId) > 0 then
		AddItemListToHuman(sceneId,selfId)
	else
		Msg2Player(sceneId, selfId, "���鱳���Ƿ�����",MSG2PLAYER_PARA)
		return
	end
	--������������б�
	AddMission( sceneId,selfId, x201121_g_missionId, x201121_g_scriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x201121_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x201121_g_missionId )
end

--**********************************
--����
--**********************************
function x201121_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x201121_g_missionName)
     AddText(sceneId,x201121_g_missionText_2)
   AddMoneyBonus( sceneId, x201121_g_MoneyBonus )
    --for i, item in x201121_g_ItemBonus do
	--	AddItemBonus( sceneId, item.id, item.num )
	--end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x201121_g_scriptId,x201121_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x201121_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x201121_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x201121_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x201121_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
	ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			AddMoney(sceneId,selfId,x201121_g_MoneyBonus );
			DelMission( sceneId,selfId,  x201121_g_missionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x201121_g_missionId )
			--ɾ��һ��Ы����ҩ
			DelItem(sceneId, selfId, x201121_g_XieDuJieYao, 1)
		else
		--������û�мӳɹ�
		end
	        
	end
end

--**********************************
--ɱ����������
--**********************************
function x201121_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x201121_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x201121_OnItemChanged( sceneId, selfId, itemdataId )
end



