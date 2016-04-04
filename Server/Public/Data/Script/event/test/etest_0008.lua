--�ڳ���ʯ��
--�㱱

--�ű���
x804008_g_scriptId = 4008
--�����
x804008_g_missionId = 4008


local  PlayerName=""
--������
x804008_g_missionName="��ʯ��"
x804008_g_missionText_0="��ʯ��,��ʯ��"
x804008_g_missionText_1="�뱦ɽ�����ֹ�"

x804008_g_missionText_2="����˭�����ҹ����ʲô��"

x804008_g_MoneyBonus=80000
x804008_g_ItemBonus={{id=10105001,num=1}}

--**********************************
--������ں���
--**********************************
function x804008_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
  if (IsMissionHaveDone(sceneId,selfId,x804008_g_missionId) > 0 ) then
  	return
	elseif( IsHaveMission(sceneId,selfId,x804008_g_missionId) > 0)  then
		if x804008_CheckSubmit(sceneId,targetId) == 1 then
			BeginEvent(sceneId)
			AddText(sceneId,x804008_g_missionName)
			AddMoneyBonus( sceneId, x804008_g_MoneyBonus )
			EndEvent()
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x804008_g_scriptId,x804008_g_missionId,1)
		else
			BeginEvent(sceneId)
			AddText(sceneId,x804008_g_missionName)
			AddMoneyBonus( sceneId, x804008_g_MoneyBonus )
			EndEvent()
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x804008_g_scriptId,x804008_g_missionId,0)
		end
    --���������������
  elseif x804008_CheckAccept(sceneId,selfId) > 0 then
		name = GetName(sceneId,selfId)
		playname = format("��ҵ�������:%s\n",name)
		
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,x804008_g_missionName)
		AddText(sceneId,x804008_g_missionText_0)
		AddText(sceneId,playname)
		AddText(sceneId,x804008_g_missionText_1)
		AddMoneyBonus( sceneId, x804008_g_MoneyBonus )
		for i, item in x804008_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x804008_g_scriptId,x804008_g_missionId)
  end
end

--**********************************
--�о��¼�
--**********************************
function x804008_OnEnumerate( sceneId, selfId, targetId )
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x804008_g_missionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x804008_g_missionId) > 0 then
		if GetName(sceneId,targetId) == g_name then
			AddNumText(sceneId, x804008_g_scriptId,x804008_g_missionName);
		end
    --���������������
    elseif x804008_CheckAccept(sceneId,selfId) > 0 then
			AddNumText(sceneId,x804008_g_scriptId,x804008_g_missionName)
    end
end

--**********************************
--����������
--**********************************
function x804008_CheckAccept( sceneId, selfId )
	return 1	
end

--**********************************
--����
--**********************************
function x804008_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x804008_g_missionId, x804008_g_scriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x804008_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x804008_g_missionId )
end

--**********************************
--����
--**********************************
function x804008_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x804008_g_missionName)
     AddText(sceneId,x804008_g_missionText_2)
   AddMoneyBonus( sceneId, x804008_g_MoneyBonus )
    for i, item in x804008_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x804008_g_scriptId,x804008_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x804008_CheckSubmit( sceneId, selfId )
		if HaveItem(sceneId,selfId,20001002) >= 1 then
		return 1
	end
	return 0
end

--**********************************
--�ύ
--**********************************
function x804008_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x804008_CheckSubmit( sceneId, selfId ) then
    BeginAddItem(sceneId)
		for i, item in x804008_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			AddMoney(sceneId,selfId,x804008_g_MoneyBonus );
			DelMission( sceneId,selfId,  x804008_g_missionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x804008_g_missionId )
			CallScriptFunction( 201001, "OnDefaultEvent",sceneId, selfId, targetId)
		else
		--������û�мӳɹ�
		end
	        
	end
end

--**********************************
--ɱ����������
--**********************************
function x804008_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x804008_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x804008_OnItemChanged( sceneId, selfId, itemdataId )
end








