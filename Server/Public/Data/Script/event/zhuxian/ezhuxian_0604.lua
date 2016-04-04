--���ˣ��ع��ں�D���̱��ұ�����

--�ű���
x200604_g_scriptId = 200604

--ǰ������
x200604_g_missionIdPre = 15

--�����
x200604_g_missionId = 16

--Ŀ��NPC
x200604_g_name	="������" 

--������
local  PlayerName=""
x200604_g_missionName="�ع��ں�4"
x200604_g_missionText_0="���Ѿ���ɫ�����������ҵĳ�ŵ"
--��\n�и�����Ϣ�����㣬��Ҳ����˶���ĳ�ŵ�����˵������Ѿ����������Իش������ˡ�"
x200604_g_missionText_1="��Щ�ش����򱣶��۸����ɡ�"
x200604_g_missionText_2="��"..PlayerName.."�����˰�"
--��������̫�����ˡ�"
x200604_g_MoneyBonus=100
x200604_g_ItemBonus={{id=10105001,num=1}}

--**********************************
--������ں���
--**********************************
function x200604_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x200604_g_missionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x200604_g_missionId) > 0)  then
		if GetName(sceneId,targetId) == x200604_g_name then
			x200604_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x200604_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200604_g_name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
			AddText(sceneId,x200604_g_missionName)
			AddText(sceneId,x200604_g_missionText_0)
			AddText(sceneId,"[[����Ŀ��]]")
			AddText(sceneId,x200604_g_missionText_1)
			AddMoneyBonus( sceneId, x200604_g_MoneyBonus )
			for i, item in x200604_g_ItemBonus do
						AddItemBonus( sceneId, item.id, item.num )
					end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200604_g_scriptId,x200604_g_missionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x200604_OnEnumerate( sceneId, selfId, targetId )
    
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x200604_g_missionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x200604_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x200604_g_name then
			AddNumText(sceneId, x200604_g_scriptId,x200604_g_missionName);
		end
    --���������������
    elseif x200604_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200604_g_name then
			AddNumText(sceneId,x200604_g_scriptId,x200604_g_missionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x200604_CheckAccept( sceneId, selfId )
	bDone = IsMissionHaveDone( sceneId, selfId, x200604_g_missionIdPre );
	if bDone > 0 then
		return 1;
	else
		return 0;
	end
end

--**********************************
--����
--**********************************
function x200604_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x200604_g_missionId, x200604_g_scriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x200604_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x200604_g_missionId )
end

--**********************************
--����
--**********************************
function x200604_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x200604_g_missionName)
     AddText(sceneId,x200604_g_missionText_2)
   AddMoneyBonus( sceneId, x200604_g_MoneyBonus )
    for i, item in x200604_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200604_g_scriptId,x200604_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200604_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x200604_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200604_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x200604_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			AddMoney(sceneId,selfId,x200604_g_MoneyBonus );
			DelMission( sceneId,selfId,  x200604_g_missionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x200604_g_missionId )
			CallScriptFunction( 200701, "OnDefaultEvent",sceneId, selfId, targetId)
		else
		--������û�мӳɹ�
		end
	        
	end
end

--**********************************
--ɱ����������
--**********************************
function x200604_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x200604_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200604_OnItemChanged( sceneId, selfId, itemdataId )
end
