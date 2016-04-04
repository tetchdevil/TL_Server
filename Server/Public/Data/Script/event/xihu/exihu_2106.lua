--ɱ������
--������
--MisDescBegin
--�ű���
x212106_g_ScriptId = 212106

--��һ�������ID
--g_MissionIdPre = 39

--�����
x212106_g_MissionId = 646

--Ŀ��NPC
x212106_g_Name	="�շ�"

--�������
x212106_g_MissionKind = 41

--����ȼ�
x212106_g_MissionLevel = 33

--�Ƿ��Ǿ�Ӣ����
x212106_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x212106_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������Ҫɱ���Ĺ�
x212106_g_DemandKill ={{id=1640,num=10}}		--������1λ

--�����Ƕ�̬**************************************************************

--�����ı�����
x212106_g_MissionName="������"
x212106_g_MissionInfo="ɱ��10ֻ������"  --��������
x212106_g_MissionTarget="ɱ��10ֻ������"		--����Ŀ��
x212106_g_ContinueInfo="���Ѿ�ɱ��10ֻ��������ô��"		--δ��������npc�Ի�
x212106_g_MissionComplete="�ɵĲ���"					--�������npc˵���Ļ�

--������
x212106_g_MoneyBonus=1032
x212106_g_ItemBonus={{id=30002001,num=1},{id=10412001,num=1}}
x212106_g_RadioItemBonus={{id=10100001,num=1},{id=10210001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x212106_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x212106_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x212106_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,x212106_g_MissionName)
		AddText(sceneId,x212106_g_ContinueInfo)
		--for i, item in g_DemandItem do
		--			AddItemDemand( sceneId, item.id, item.num )
		--end
		EndEvent( )
		bDone = x212106_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x212106_g_ScriptId,x212106_g_MissionId,bDone)
	--���������������
	elseif x212106_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,x212106_g_MissionName)
		AddText(sceneId,x212106_g_MissionInfo)
		AddText(sceneId,"#{M_MUBIAO}")
		AddText(sceneId,x212106_g_MissionTarget)
		AddMoneyBonus( sceneId, x212106_g_MoneyBonus )
		for i, item in x212106_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
			for i, item in x212106_g_RadioItemBonus do
					AddRadioItemBonus( sceneId, item.id, item.num )
				end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x212106_g_ScriptId,x212106_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x212106_OnEnumerate( sceneId, selfId, targetId )

    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x212106_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    --else
    if IsHaveMission(sceneId,selfId,x212106_g_MissionId) > 0 then
		AddNumText(sceneId,x212106_g_ScriptId,x212106_g_MissionName);
    --���������������
    elseif x212106_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x212106_g_ScriptId,x212106_g_MissionName);
    end
end

--**********************************
--����������
--**********************************
function x212106_CheckAccept( sceneId, selfId )
	--��Ҫ2�����ܽ�
	if GetLevel( sceneId, selfId ) >= 1 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x212106_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x212106_g_MissionId, x212106_g_ScriptId, 1, 0, 0 )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x212106_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0
end

--**********************************
--����
--**********************************
function x212106_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x212106_g_MissionId )
end

--**********************************
--����
--**********************************
function x212106_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x212106_g_MissionName)
    AddText(sceneId,x212106_g_MissionComplete)
    AddMoneyBonus( sceneId, x212106_g_MoneyBonus )
    for i, item in x212106_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    for i, item in x212106_g_RadioItemBonus do
		AddRadioItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x212106_g_ScriptId,x212106_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212106_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x212106_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,1)
    if num == x212106_g_DemandKill[1].num then
       return 1
    end
	return 0
end

--**********************************
--�ύ
--**********************************
function x212106_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x212106_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x212106_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end

		for i, item in x212106_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddMoney(sceneId,selfId,x212106_g_MoneyBonus );
			--�۳�������Ʒ
			--for i, item in g_DemandItem do
			--	DelItem( sceneId, selfId, item.id, item.num )
			--end
			ret = DelMission( sceneId, selfId, x212106_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId,selfId, x212106_g_MissionId )
				AddItemListToHuman(sceneId,selfId)
			end
		else
		--������û�мӳɹ�
			BeginEvent(sceneId)
				strText = "��������,�޷��������"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end      
	end
end

--**********************************
--ɱ����������
--**********************************
function x212106_OnKillObject( sceneId, selfId, objdataId )

 if objdataId == x212106_g_DemandKill[1].id then
	  misIndex = GetMissionIndexByID(sceneId,selfId,x212106_g_MissionId)
	  num = GetMissionParam(sceneId,selfId,misIndex,1)
	  if num < x212106_g_DemandKill[1].num then
		--��������ɱ�־����Ϊ1
		if num == x212106_g_DemandKill[1].num - 1 then
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
		end
		--���ô������+1
	    SetMissionByIndex(sceneId,selfId,misIndex,1,num+1)
	  	BeginEvent(sceneId)
	  	strText = format("��ɱ�������� %d/10", GetMissionParam(sceneId,selfId,misIndex,1) )
	  	AddText(sceneId,strText);
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	  end
 end
 
end

--**********************************
--���������¼�
--**********************************
function x212106_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x212106_OnItemChanged( sceneId, selfId, itemdataId )
end
