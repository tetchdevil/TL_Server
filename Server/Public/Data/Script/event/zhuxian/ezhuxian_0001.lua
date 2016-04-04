--��������
--����é®

--�ű���
x200001_g_scriptId = 200001

--�����
x200001_g_missionId = 0

--Ŀ��NPC
x200001_g_name	="������"

--������
x200001_g_missionName="����é®"
x200001_g_missionText_0="{ID=zhuxian_0101}"
x200001_g_missionText_1="{ID=zhuxian_0102}"
x200001_g_missionText_2="{ID=zhuxian_0103}"
x200001_g_MoneyBonus=100
x200001_g_ItemBonus={{id=10105001,num=1}}

--**********************************
--������ں���
--**********************************
function x200001_OnDefaultEvent( sceneId, selfId, targetId )

    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x200001_g_missionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x200001_g_missionId) > 0)  then
		if GetName(sceneId,targetId) == x200001_g_name then
			x200001_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x200001_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200001_g_name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
			AddText(sceneId,x200001_g_missionName)
			AddText(sceneId,x200001_g_missionText_0)
			AddText(sceneId,"{ID=M_MUBIAO}")
			AddText(sceneId,x200001_g_missionText_1)
			AddText(sceneId,"{ID=M_SHOUHUO}")
			AddMoneyBonus( sceneId, x200001_g_MoneyBonus )
			for i, item in x200001_g_ItemBonus do
						AddItemBonus( sceneId, item.id, item.num )
					end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200001_g_scriptId,x200001_g_missionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x200001_OnEnumerate( sceneId, selfId, targetId )
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x200001_g_missionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x200001_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x200001_g_name then
			AddNumText(sceneId, x200001_g_scriptId,x200001_g_missionName);
		end
    --���������������
    elseif x200001_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200001_g_name then
			AddNumText(sceneId,x200001_g_scriptId,x200001_g_missionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x200001_CheckAccept( sceneId, selfId )
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
function x200001_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x200001_g_missionId, x200001_g_scriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x200001_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x200001_g_missionId )
end

--**********************************
--����
--**********************************
function x200001_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x200001_g_missionName)
     AddText(sceneId,x200001_g_missionText_2)
   AddMoneyBonus( sceneId, x200001_g_MoneyBonus )
    for i, item in x200001_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200001_g_scriptId,x200001_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200001_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x200001_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200001_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x200001_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			AddMoney(sceneId,selfId,x200001_g_MoneyBonus );
			DelMission( sceneId,selfId,  x200001_g_missionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x200001_g_missionId )

			CallScriptFunction( 200101, "OnDefaultEvent",sceneId, selfId, targetId)
		else
		--������û�мӳɹ�
		end
	        
	end
end

--**********************************
--ɱ����������
--**********************************
function x200001_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x200001_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200001_OnItemChanged( sceneId, selfId, itemdataId )
end







