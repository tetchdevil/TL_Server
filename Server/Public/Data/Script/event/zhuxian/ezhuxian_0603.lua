--��������
--�ع��ں�3

--�ű���
x200603_g_scriptId = 200603

--ǰ������
x200603_g_missionIdPre = 14;

--�����
x200603_g_missionId = 15

--Ŀ��NPC
x200603_g_name	="�̱�" 

--������
local  PlayerName=""
x200603_g_missionName="�ع��ں�3"
x200603_g_missionText_0="��ô˵���㻹�ǲ̱���������"
--��̹�ʵ�˵���Ҳ��ǶԲ̱��ж�ô��ĳɼ���ֻ��������������Ϊ̫���Ҳ����ˡ�"
x200603_g_missionText_1="����ת��̱���ˣ��������䲻����˽�˳ɼ�������Ҵ��µģ��������ĺ��ˡ�"
x200603_g_missionText_2=PlayerName.."������"
--����Ȼ������������Ѿ������ɼ����ҾͿ���չ���ֽŴ��һ���ˡ�"
x200603_g_MoneyBonus=100
x200603_g_ItemBonus={{id=10105001,num=1}}

--**********************************
--������ں���
--**********************************
function x200603_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x200603_g_missionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x200603_g_missionId) > 0)  then
		if GetName(sceneId,targetId) == x200603_g_name then
			x200603_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x200603_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200603_g_name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
			AddText(sceneId,x200603_g_missionName)
			AddText(sceneId,x200603_g_missionText_0)
			AddText(sceneId,"[[����Ŀ��]]")
			AddText(sceneId,x200603_g_missionText_1)
			AddMoneyBonus( sceneId, x200603_g_MoneyBonus )
			for i, item in x200603_g_ItemBonus do
						AddItemBonus( sceneId, item.id, item.num )
					end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200603_g_scriptId,x200603_g_missionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x200603_OnEnumerate( sceneId, selfId, targetId )
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x200603_g_missionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x200603_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x200603_g_name then
			AddNumText(sceneId, x200603_g_scriptId,x200603_g_missionName);
		end
    --���������������
    elseif x200603_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200603_g_name then
			AddNumText(sceneId,x200603_g_scriptId,x200603_g_missionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x200603_CheckAccept( sceneId, selfId )
	bDone = IsMissionHaveDone( sceneId, selfId, x200603_g_missionIdPre );
	if bDone > 0 then
		return 1;
	else
		return 0;
	end
end

--**********************************
--����
--**********************************
function x200603_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x200603_g_missionId, x200603_g_scriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x200603_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x200603_g_missionId )
end

--**********************************
--����
--**********************************
function x200603_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x200603_g_missionName)
     AddText(sceneId,x200603_g_missionText_2)
   AddMoneyBonus( sceneId, x200603_g_MoneyBonus )
    for i, item in x200603_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200603_g_scriptId,x200603_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200603_CheckSubmit( sceneId, selfId )
	itemNum = GetItemCount( sceneId, selfId, g_ItemID );
    if itemNum > 0 then
    	return 1;
    end
	return 0
end

--**********************************
--�ύ
--**********************************
function x200603_OnSubmit( sceneId, selfId,targetId,  selectRadioId )
	if x200603_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x200603_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			AddMoney(sceneId,selfId,x200603_g_MoneyBonus );
			DelMission( sceneId,selfId,  x200603_g_missionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x200603_g_missionId )
			CallScriptFunction( 200604, "OnDefaultEvent",sceneId, selfId, targetId)
		else
		--������û�мӳɹ�
		end
	        
	end
end

--**********************************
--ɱ����������
--**********************************
function x200603_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x200603_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200603_OnItemChanged( sceneId, selfId, itemdataId )
end







