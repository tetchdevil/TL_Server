--ɱ������
--ƽϢɧ��
--MisDescBegin
--�ű���
x210606_g_ScriptId = 210606

--��һ�������ID
--g_MissionIdPre =

--�����
x210606_g_MissionId = 496

--����Ŀ��npc
x210606_g_Name	="�����" 

--�������
x210606_g_MissionKind = 17

--����ȼ�
x210606_g_MissionLevel = 16

--�Ƿ��Ǿ�Ӣ����
x210606_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x210606_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������Ҫɱ���Ĺ�
x210606_g_DemandKill ={{id=1535,num=3}}		--������1λ

--�����Ƕ�̬**************************************************************

--�����ı�����
x210606_g_MissionName="ƽϢɧ��"
x210606_g_MissionInfo="ɱ��3ֻɽ��"  --��������
x210606_g_MissionTarget="ɱ��3ֻɽ��"		--����Ŀ��
x210606_g_ContinueInfo="���Ѿ�ɱ��3ֻɽ����"		--δ��������npc�Ի�
x210606_g_MissionComplete="�ɵò���"					--�������npc˵���Ļ�

--������
x210606_g_MoneyBonus=100
x210606_g_ItemBonus={{id=30002001,num=1}}
x210606_g_RadioItemBonus={{id=10100001,num=1},{id=10210001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210606_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x210606_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x210606_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x210606_g_MissionName)
			AddText(sceneId,x210606_g_ContinueInfo)
			--for i, item in g_DemandItem do
			--	AddItemDemand( sceneId, item.id, item.num )
			--end
		EndEvent( )
		bDone = x210606_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x210606_g_ScriptId,x210606_g_MissionId,bDone)
	--���������������
	elseif x210606_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x210606_g_MissionName)
			AddText(sceneId,x210606_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x210606_g_MissionTarget)
			AddMoneyBonus( sceneId, x210606_g_MoneyBonus )
			for i, item in x210606_g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
			for i, item in x210606_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x210606_g_ScriptId,x210606_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x210606_OnEnumerate( sceneId, selfId, targetId )

    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210606_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    --else
    if IsHaveMission(sceneId,selfId,x210606_g_MissionId) > 0 then
		AddNumText(sceneId,x210606_g_ScriptId,x210606_g_MissionName);
    --���������������
    elseif x210606_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x210606_g_ScriptId,x210606_g_MissionName);
    end
end

--**********************************
--����������
--**********************************
function x210606_CheckAccept( sceneId, selfId )
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
function x210606_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210606_g_MissionId, x210606_g_ScriptId, 1, 0, 0 )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x210606_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0
end

--**********************************
--����
--**********************************
function x210606_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210606_g_MissionId )
end

--**********************************
--����
--**********************************
function x210606_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210606_g_MissionName)
		AddText(sceneId,x210606_g_MissionComplete)
		AddMoneyBonus( sceneId, x210606_g_MoneyBonus )
		for i, item in x210606_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
		for i, item in x210606_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210606_g_ScriptId,x210606_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210606_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x210606_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,1)
    if num == x210606_g_DemandKill[1].num then
       return 1
    end
	return 0
end

--**********************************
--�ύ
--**********************************
function x210606_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x210606_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
			for i, item in x210606_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
			for i, item in x210606_g_RadioItemBonus do
				if item.id == selectRadioId then
					AddItem( sceneId,item.id, item.num )
				end
			end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddMoney(sceneId,selfId,x210606_g_MoneyBonus );
			--�۳�������Ʒ
			--for i, item in g_DemandItem do
			--	DelItem( sceneId, selfId, item.id, item.num )
			--end
			ret = DelMission( sceneId, selfId, x210606_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId,selfId, x210606_g_MissionId )
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
function x210606_OnKillObject( sceneId, selfId, objdataId )

 if objdataId == x210606_g_DemandKill[1].id then
	  misIndex = GetMissionIndexByID(sceneId,selfId,x210606_g_MissionId)
	  num = GetMissionParam(sceneId,selfId,misIndex,1)
	  if num < x210606_g_DemandKill[1].num then
		--��������ɱ�־����Ϊ1
		if num == x210606_g_DemandKill[1].num - 1 then
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
		end
		--���ô������+1
	    SetMissionByIndex(sceneId,selfId,misIndex,1,num+1)
	  	BeginEvent(sceneId)
	  	strText = format("��ɱ��ɽ��%d/3", GetMissionParam(sceneId,selfId,misIndex,1) )
	  	AddText(sceneId,strText);
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	  end
 end
 
end

--**********************************
--���������¼�
--**********************************
function x210606_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210606_OnItemChanged( sceneId, selfId, itemdataId )
end
