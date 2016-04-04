--��������
--�����޳�2

--�ű���
x201102_g_scriptId = 201102

--��һ�������ID
x201102_g_missionIdPre = 27	

--�����
x201102_g_missionId = 28

--Ŀ��NPC
x201102_g_name	="��˼��"

--������
local  PlayerName=""
x201102_g_missionName="�����޳�2"
x201102_g_missionText_0="���ȥ�Ҹ�˼����������λ��ɮ������"
x201102_g_missionText_1="�ҵ���˼��"
x201102_g_missionText_2="���ˣ��ҵĺ����Ѿ�ƽ�������ˣ�������һ�ݡ�"
x201102_g_MoneyBonus=166
x201102_g_ItemBonus={{id=10105001,num=1}}

--**********************************
--������ں���
--**********************************
function x201102_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x201102_g_missionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x201102_g_missionId) > 0)  then
		if GetName(sceneId,targetId) == x201102_g_name then
			x201102_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x201102_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x201102_g_name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
			AddText(sceneId,x201102_g_missionName)
			AddText(sceneId,x201102_g_missionText_0)
			AddText(sceneId,"[[����Ŀ��]]")
			AddText(sceneId,x201102_g_missionText_1)
			AddMoneyBonus( sceneId, x201102_g_MoneyBonus )
			for i, item in x201102_g_ItemBonus do
						AddItemBonus( sceneId, item.id, item.num )
					end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x201102_g_scriptId,x201102_g_missionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x201102_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x201102_g_missionIdPre) <= 0 then
    	return
    end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x201102_g_missionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x201102_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x201102_g_name then
			AddNumText(sceneId, x201102_g_scriptId,x201102_g_missionName);
		end
    --���������������
    elseif x201102_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x201102_g_name then
			AddNumText(sceneId,x201102_g_scriptId,x201102_g_missionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x201102_CheckAccept( sceneId, selfId )
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
function x201102_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x201102_g_missionId, x201102_g_scriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x201102_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x201102_g_missionId )
end

--**********************************
--����
--**********************************
function x201102_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x201102_g_missionName)
     AddText(sceneId,x201102_g_missionText_2)
   AddMoneyBonus( sceneId, x201102_g_MoneyBonus )
    for i, item in x201102_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x201102_g_scriptId,x201102_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x201102_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x201102_OnSubmit( sceneId, selfId,targetId,  selectRadioId )
	if x201102_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x201102_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			AddMoney(sceneId,selfId,x201102_g_MoneyBonus );
			DelMission( sceneId,selfId,  x201102_g_missionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x201102_g_missionId )
			CallScriptFunction( 201103, "OnDefaultEvent",sceneId, selfId, targetId)
		else
		--������û�мӳɹ�
		end
	        
	end
end

--**********************************
--ɱ����������
--**********************************
function x201102_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x201102_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x201102_OnItemChanged( sceneId, selfId, itemdataId )
end
