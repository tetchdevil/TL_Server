--ɱ������
--��·�ȷ�

--�ű���
x201701_g_scriptId = 201701

--��һ�������ID
--g_missionIdPre = 39

--�����
x201701_g_missionId = 40

--Ŀ��NPC
x201701_g_name	="������"

--�����ı�����
x201701_g_missionName="��·�ȷ�1"
x201701_g_missionText0="��������ȥ���ü��ʦ��æ����������֮ǰ��Ҫȷ���������������ȥɱ��10�������é���ˣ�Ȼ���������"
x201701_g_missionText1="ɱ��10�������é����"
x201701_g_missionText2="���Ѿ�ɱ��10��������"
x201701_g_missionText3="�����"

x201701_g_MoneyBonus=1032
x201701_g_ItemBonus={{id=30002001,num=5},{id=10412001,num=5}}
x201701_g_RadioItemBonus={{id=10100001,num=1},{id=10210001,num=1},{id=10220001,num=1}}
x201701_g_DemandItem={{id=20004008,num=1}}

--**********************************
--������ں���
--**********************************
function x201701_OnDefaultEvent( sceneId, selfId, targetId )

    --��������ɹ��������
    --if IsMissionHaveDone(sceneId,selfId,x201701_g_missionId) > 0 then
    --	return
    	
    --����ѽӴ�����
    --else
    if IsHaveMission(sceneId,selfId,x201701_g_missionId) > 0 then
    	--���������������Ϣ
        BeginEvent(sceneId)
        AddText(sceneId,x201701_g_missionName)
        AddText(sceneId,x201701_g_missionText2)
        EndEvent( )
        bDone = x201701_CheckSubmit( sceneId, selfId )
        DispatchMissionDemandInfo(sceneId,selfId,targetId,x201701_g_scriptId,x201701_g_missionId,bDone)
    		
    --���������������
    elseif x201701_CheckAccept(sceneId,selfId) > 0 then
    	--�����������ʱ��ʾ����Ϣ
        BeginEvent(sceneId)
        AddText(sceneId,x201701_g_missionName)
        AddText(sceneId,x201701_g_missionText0)
        AddText(sceneId,"{ID=M_MUBIAO}")
        AddText(sceneId,x201701_g_missionText1)
        AddText(sceneId,"{ID=M_SHOUHUO}")
        AddMoneyBonus( sceneId, x201701_g_MoneyBonus )
        AddText(sceneId,"{ID=M_XUANZE}")
        for i, item in x201701_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
    		for i, item in x201701_g_RadioItemBonus do
					AddRadioItemBonus( sceneId, item.id, item.num )
				end
      	EndEvent( )
      	DispatchMissionInfo(sceneId,selfId,targetId,x201701_g_scriptId,x201701_g_missionId)
    end
end

--**********************************
--�о��¼�
--**********************************
function x201701_OnEnumerate( sceneId, selfId, targetId )
	--�����һ�δ�����һ������
--	if 	IsMissionHaveDone(sceneId,selfId,g_missionIdPre) <= 0 then
--    	return
--    end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x201701_g_missionId) > 0 then
    	return 

    --����ѽӴ�����
    else
		if IsHaveMission(sceneId,selfId,x201701_g_missionId) > 0 then
			AddNumText(sceneId,x201701_g_scriptId,x201701_g_missionName);

		--���������������
		elseif x201701_CheckAccept(sceneId,selfId) > 0 then
			AddNumText(sceneId,x201701_g_scriptId,x201701_g_missionName);
		end
	end
end

--**********************************
--��ⴥ������
--**********************************
function x201701_CheckAccept( sceneId, selfId )
	--bDone = IsMissionHaveDone( sceneId, selfId, g_missionIdPre );
	--if bDone > 0 then
		return 1;
	--else
	--	return 0;
	--end
end

--**********************************
--����
--**********************************
function x201701_OnAccept( sceneId, selfId )

	--������������б�
	--����������Ʒ
	BeginAddItem( sceneId )
	AddItem( sceneId, g_ItemID, 1 )
	ret = EndAddItem( sceneId, selfId )
	
	if ret > 0 then 
		AddItemListToHuman(sceneId,selfId)
		ret = AddMission( sceneId,selfId, x201701_g_missionId, x201701_g_scriptId,1, 0, 0 )
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
				misIndex = GetMissionIndexByID(sceneId,selfId,x201701_g_missionId)
				SetMissionParam(sceneId,selfId,misIndex,0,0)
		end
	end
end

--**********************************
--����
--**********************************
function x201701_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    res = DelMission( sceneId, selfId, x201701_g_missionId )
	if res > 0 then
		--��ȥ������Ʒ
		DelItem( sceneId, selfId, g_ItemID, 1 )
	end
end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x201701_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,g_missionRenSubmitInfo);
    EndEvent(sceneId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x201701_g_scriptId,x201701_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x201701_CheckSubmit( sceneId, selfId )
    --	itemNum = GetItemCount( sceneId, selfId, g_ItemID );
		misIndex = GetMissionIndexByID(sceneId,selfId,x201701_g_missionId)
		num = GetMissionParam(sceneId,selfId,misIndex,0)
		if num < 10 then
			return 0
		else
			return 1
		end
end

--**********************************
--�ύ����ɣ�
--**********************************
function x201701_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	ret = x201701_CheckSubmit( sceneId, selfId );
	if ret > 0 then
		--ɾ����������б��ж�Ӧ������
		ret = DelMission( sceneId, selfId, x201701_g_missionId );
		if ret > 0 then
			MissionCom( sceneId, selfId, x201701_g_missionId )
			CallScriptFunction( 201801, "OnDefaultEvent",sceneId, selfId, targetId)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x201701_OnKillObject( sceneId, selfId, objdataId )
 if objdataId == 301 then
		misIndex = GetMissionIndexByID(sceneId,selfId,x201701_g_missionId)
		num = GetMissionParam(sceneId,selfId,misIndex,0)
		if num < 10 then
	    SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
	  	BeginEvent(sceneId)
	  	strText = format("��ɱ�������é����%d/10", GetMissionParam(sceneId,selfId,misIndex,0) )
	  	AddText(sceneId,strText);
	  	EndEvent(sceneId)
	  	DispatchMissionTips(sceneId,selfId)
	  end
	end
end

--**********************************
--���������¼�
--**********************************
function x201701_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x201701_OnItemChanged( sceneId, selfId, itemdataId )
end
