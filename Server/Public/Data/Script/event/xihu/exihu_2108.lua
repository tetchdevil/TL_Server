--ɱ������
--�����շ�
--MisDescBegin
--�ű���
x212108_g_ScriptId = 212108

--��һ�������ID
--g_MissionIdPre = 39

--�����
x212108_g_MissionId = 555

--Ŀ��NPC
x212108_g_Name	="�շ�"

--�������
x212108_g_MissionKind = 41

--����ȼ�
x212108_g_MissionLevel = 34

--�Ƿ��Ǿ�Ӣ����
x212108_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x212108_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������Ҫɱ���Ĺ�
x212108_g_DemandKill ={{id=529,num=1}}		--������1λ

--�����Ƕ�̬**************************************************************

--�������
x212108_g_ItemId = 40002077

--�����ı�����
x212108_g_MissionName="�����շ�"
x212108_g_MissionInfo="����ɱ��С��ʦ"  --��������
x212108_g_MissionTarget="ɱ��С��ʦ"		--����Ŀ��
x212108_g_ContinueInfo="���Ѿ�ɱ��С��ʦ�ˣ�"		--δ��������npc�Ի�
x212108_g_MissionComplete="̫лл����"					--�������npc˵���Ļ�

--������
x212108_g_MoneyBonus=1032
x212108_g_ItemBonus={{id=30002001,num=1},{id=10412001,num=1}}
x212108_g_RadioItemBonus={{id=10100001,num=1},{id=10210001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x212108_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x212108_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x212108_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,x212108_g_MissionName)
		AddText(sceneId,x212108_g_ContinueInfo)
		--for i, item in g_DemandItem do
		--			AddItemDemand( sceneId, item.id, item.num )
		--end
		EndEvent( )
		bDone = x212108_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x212108_g_ScriptId,x212108_g_MissionId,bDone)
	--���������������
	elseif x212108_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,x212108_g_MissionName)
		AddText(sceneId,x212108_g_MissionInfo)
		AddText(sceneId,"#{M_MUBIAO}")
		AddText(sceneId,x212108_g_MissionTarget)
		AddMoneyBonus( sceneId, x212108_g_MoneyBonus )
		for i, item in x212108_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
			for i, item in x212108_g_RadioItemBonus do
					AddRadioItemBonus( sceneId, item.id, item.num )
				end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x212108_g_ScriptId,x212108_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x212108_OnEnumerate( sceneId, selfId, targetId )

    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x212108_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    --else
    if IsHaveMission(sceneId,selfId,x212108_g_MissionId) > 0 then
		AddNumText(sceneId,x212108_g_ScriptId,x212108_g_MissionName);
    --���������������
    elseif x212108_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x212108_g_ScriptId,x212108_g_MissionName);
    end
end

--**********************************
--����������
--**********************************
function x212108_CheckAccept( sceneId, selfId )
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
function x212108_OnAccept( sceneId, selfId )
	--������������б�
	--����������Ʒ
	BeginAddItem( sceneId )
	AddItem( sceneId, x212108_g_ItemId, 1 )
	ret = EndAddItem( sceneId, selfId )
	if ret > 0 then 
		--������������б�
		ret = AddMission( sceneId,selfId, x212108_g_MissionId, x212108_g_ScriptId, 1, 0, 0 )		--�������
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			misIndex = GetMissionIndexByID(sceneId,selfId,x212108_g_MissionId)			--�õ���������к�
			SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
			SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0
		end
	else
		BeginEvent(sceneId)
			strText = "��������,�޷���������"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end

--**********************************
--����
--**********************************
function x212108_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    ret = DelMission( sceneId, selfId, x212108_g_MissionId )
	if ret > 0 then
		--��������м����������
		ItemCount = GetItemCount(sceneId,selfId,x212108_g_ItemId)
		--ɾ���������
		if ItemCount > 0 then
			DelItem(sceneId,selfId,x212108_g_ItemId,ItemCount)
		end
	else
		BeginEvent(sceneId)
			strText = "�޷�ɾ������"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end

--**********************************
--����
--**********************************
function x212108_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x212108_g_MissionName)
    AddText(sceneId,x212108_g_MissionComplete)
    AddMoneyBonus( sceneId, x212108_g_MoneyBonus )
    for i, item in x212108_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    for i, item in x212108_g_RadioItemBonus do
		AddRadioItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x212108_g_ScriptId,x212108_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212108_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x212108_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,1)
    if num == x212108_g_DemandKill[1].num then
       return 1
    end
	return 0
end

--**********************************
--�ύ
--**********************************
function x212108_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x212108_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x212108_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		for i, item in x212108_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddMoney(sceneId,selfId,x212108_g_MoneyBonus );
			--�۳�������Ʒ
			--for i, item in g_DemandItem do
			--	DelItem( sceneId, selfId, item.id, item.num )
			--end
			ret = DelMission( sceneId, selfId, x212108_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId,selfId, x212108_g_MissionId )
				AddItemListToHuman(sceneId,selfId)
				DelItem( sceneId,selfId,x212108_g_ItemId,1)
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
function x212108_OnKillObject( sceneId, selfId, objdataId )
 if objdataId == x212108_g_DemandKill[1].id then
	  misIndex = GetMissionIndexByID(sceneId,selfId,x212108_g_MissionId)
	  num = GetMissionParam(sceneId,selfId,misIndex,1)
	  if num < x212108_g_DemandKill[1].num then
		--��������ɱ�־����Ϊ1
		if num == x212108_g_DemandKill[1].num - 1 then
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
		end
		--���ô������+1
	    SetMissionByIndex(sceneId,selfId,misIndex,1,num+1)
	  	BeginEvent(sceneId)
	  	strText = format("��ɱ��С��ʦ %d/1", GetMissionParam(sceneId,selfId,misIndex,1) )
	  	AddText(sceneId,strText);
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	  end
 end
 
end

--**********************************
--���������¼�
--**********************************
function x212108_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x212108_OnItemChanged( sceneId, selfId, itemdataId )
end
