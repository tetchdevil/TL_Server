--ɱ������
--���ӵİ���
--MisDescBegin
--�ű���
x212000_g_ScriptId = 212000

--��һ�������ID
--g_MissionIdPre =

--�����
x212000_g_MissionId = 630

--����Ŀ��npc
x212000_g_Name = "����" 

--�������
x212000_g_MissionKind = 40

--����ȼ�
x212000_g_MissionLevel = 75

--�Ƿ��Ǿ�Ӣ����
x212000_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x212000_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������Ҫɱ���Ĺ�
x212000_g_DemandKill ={{id=1985,num=10}}		--������1λ

--�����Ƕ�̬**************************************************************

--�����ı�����
x212000_g_MissionName="���ӵİ���"
x212000_g_MissionInfo="ɱ��10ֻ��������"  --��������
x212000_g_MissionTarget="ɱ��10ֻ��������"		--����Ŀ��
x212000_g_ContinueInfo="���Ѿ�ɱ��10ֻ����������"		--δ��������npc�Ի�
x212000_g_MissionComplete="�ɵò���"					--�������npc˵���Ļ�

--������
x212000_g_MoneyBonus=100
x212000_g_ItemBonus={{id=30002001,num=1}}
x212000_g_RadioItemBonus={{id=10100001,num=1},{id=10210001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x212000_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x212000_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x212000_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,x212000_g_MissionName)
		AddText(sceneId,x212000_g_ContinueInfo)
		--for i, item in g_DemandItem do
		--			AddItemDemand( sceneId, item.id, item.num )
		--end
		EndEvent( )
		bDone = x212000_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x212000_g_ScriptId,x212000_g_MissionId,bDone)
	--���������������
	elseif x212000_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,x212000_g_MissionName)
		AddText(sceneId,x212000_g_MissionInfo)
		AddText(sceneId,"#{M_MUBIAO}")
		AddText(sceneId,x212000_g_MissionTarget)
		AddMoneyBonus( sceneId, x212000_g_MoneyBonus )
		for i, item in x212000_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
			for i, item in x212000_g_RadioItemBonus do
					AddRadioItemBonus( sceneId, item.id, item.num )
				end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x212000_g_ScriptId,x212000_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x212000_OnEnumerate( sceneId, selfId, targetId )

    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x212000_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    --else
    if IsHaveMission(sceneId,selfId,x212000_g_MissionId) > 0 then
		AddNumText(sceneId,x212000_g_ScriptId,x212000_g_MissionName);
    --���������������
    elseif x212000_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x212000_g_ScriptId,x212000_g_MissionName);
    end
end

--**********************************
--����������
--**********************************
function x212000_CheckAccept( sceneId, selfId )
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
function x212000_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x212000_g_MissionId, x212000_g_ScriptId, 1, 0, 0 )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x212000_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0
end

--**********************************
--����
--**********************************
function x212000_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x212000_g_MissionId )
end

--**********************************
--����
--**********************************
function x212000_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x212000_g_MissionName)
    AddText(sceneId,x212000_g_MissionComplete)
    AddMoneyBonus( sceneId, x212000_g_MoneyBonus )
    for i, item in x212000_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    for i, item in x212000_g_RadioItemBonus do
		AddRadioItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x212000_g_ScriptId,x212000_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212000_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x212000_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,1)
    if num == x212000_g_DemandKill[1].num then
       return 1
    end
	return 0
end

--**********************************
--�ύ
--**********************************
function x212000_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x212000_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x212000_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		for i, item in x212000_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddMoney(sceneId,selfId,x212000_g_MoneyBonus );
			--�۳�������Ʒ
			--for i, item in g_DemandItem do
			--	DelItem( sceneId, selfId, item.id, item.num )
			--end
			ret = DelMission( sceneId, selfId, x212000_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId,selfId,  x212000_g_MissionId )
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
function x212000_OnKillObject( sceneId, selfId, objdataId )

 if objdataId == x212000_g_DemandKill[1].id then
		misIndex = GetMissionIndexByID(sceneId,selfId,x212000_g_MissionId)
		num = GetMissionParam(sceneId,selfId,misIndex,1)
		if num < x212000_g_DemandKill[1].num then
		--��������ɱ�־����Ϊ1
		if num == x212000_g_DemandKill[1].num - 1 then
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
		end
		--���ô������+1
			SetMissionByIndex(sceneId,selfId,misIndex,1,num+1)
	  		BeginEvent(sceneId)
	  			strText = format("��ɱ����������%d/10", GetMissionParam(sceneId,selfId,misIndex,1) )
	  			AddText(sceneId,strText);
	  		EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
 
end

--**********************************
--���������¼�
--**********************************
function x212000_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x212000_OnItemChanged( sceneId, selfId, itemdataId )
end
