--ɱ������
--ç��������
--MisDescBegin
--�ű���
x211209_g_ScriptId = 211209

--��һ�������ID
--g_MissionIdPre =

--�����
x211209_g_MissionId = 559

--Ŀ��NPC
x211209_g_Name	="Ү�ɽ�"

--�������
x211209_g_MissionKind = 32

--����ȼ�
x211209_g_MissionLevel = 64

--�Ƿ��Ǿ�Ӣ����
x211209_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x211209_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������Ҫ�õ�����Ʒ
x211209_g_DemandKill={{id=518,num=1},{id=519,num=1},{id=520,num=1}}	--������1λ

--�����Ƕ�̬**************************************************************

--�����ı�����
x211209_g_MissionName="ç��������"
x211209_g_MissionInfo="����ɱ��ç��������"  --��������
x211209_g_MissionTarget="ɱ��ç��������"		--����Ŀ��
x211209_g_ContinueInfo="���Ѿ�ɱ��ç���������ˣ�"		--δ��������npc�Ի�
x211209_g_MissionComplete="̫лл����"					--�������npc˵�Ļ�

--������
x211209_g_MoneyBonus=1032
x211209_g_ItemBonus={{id=30002001,num=1},{id=10412001,num=1}}
x211209_g_RadioItemBonus={{id=10100001,num=1},{id=10210001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x211209_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x211209_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x211209_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,x211209_g_MissionName)
		AddText(sceneId,x211209_g_ContinueInfo)
		--for i, item in g_DemandItem do
		--			AddItemDemand( sceneId, item.id, item.num )
		--end
		EndEvent( )
		bDone = x211209_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x211209_g_ScriptId,x211209_g_MissionId,bDone)
	--���������������
	elseif x211209_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,x211209_g_MissionName)
		AddText(sceneId,x211209_g_MissionInfo)
		AddText(sceneId,"#{M_MUBIAO}")
		AddText(sceneId,x211209_g_MissionTarget)
		AddMoneyBonus( sceneId, x211209_g_MoneyBonus )
		for i, item in x211209_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
			for i, item in x211209_g_RadioItemBonus do
					AddRadioItemBonus( sceneId, item.id, item.num )
				end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x211209_g_ScriptId,x211209_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x211209_OnEnumerate( sceneId, selfId, targetId )

    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x211209_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    --else
    if IsHaveMission(sceneId,selfId,x211209_g_MissionId) > 0 then
		AddNumText(sceneId,x211209_g_ScriptId,x211209_g_MissionName);
    --���������������
    elseif x211209_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x211209_g_ScriptId,x211209_g_MissionName);
    end
end

--**********************************
--����������
--**********************************
function x211209_CheckAccept( sceneId, selfId )
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
function x211209_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x211209_g_MissionId, x211209_g_ScriptId, 1, 0, 0 )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x211209_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,2,0)						--�������кŰ���������ĵ�2λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,3,0)						--�������кŰ���������ĵ�3λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,4,0)						--�������кŰ���������ĵ�4λ��0
end

--**********************************
--����
--**********************************
function x211209_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x211209_g_MissionId )
end

--**********************************
--����
--**********************************
function x211209_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x211209_g_MissionName)
    AddText(sceneId,x211209_g_MissionComplete)
    AddMoneyBonus( sceneId, x211209_g_MoneyBonus )
    for i, item in x211209_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    for i, item in x211209_g_RadioItemBonus do
		AddRadioItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x211209_g_ScriptId,x211209_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x211209_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x211209_g_MissionId)
    num1 = GetMissionParam(sceneId,selfId,misIndex,1)
	num2 = GetMissionParam(sceneId,selfId,misIndex,2)
    num3 = GetMissionParam(sceneId,selfId,misIndex,3)
    if (num1 == 1) and (num2 == 1) and (num3 == 1) then
       return 1
    end
	return 0
end

--**********************************
--�ύ
--**********************************
function x211209_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x211209_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x211209_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		for i, item in x211209_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddMoney(sceneId,selfId,x211209_g_MoneyBonus );
			--�۳�������Ʒ
			--for i, item in g_DemandItem do
			--	DelItem( sceneId, selfId, item.id, item.num )
			--end
			ret = DelMission( sceneId, selfId, x211209_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId,selfId, x211209_g_MissionId )
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
function x211209_OnKillObject( sceneId, selfId, objdataId )
	if objdataId == 518 then
		misIndex = GetMissionIndexByID(sceneId,selfId,x211209_g_MissionId)
		num1 = GetMissionParam(sceneId,selfId,misIndex,1)
		num4 = GetMissionParam(sceneId,selfId,misIndex,4)
		if num1 < 1 then
			SetMissionByIndex(sceneId,selfId,misIndex,1,num1+1)
			SetMissionByIndex(sceneId,selfId,misIndex,4,num4+1)
	  		BeginEvent(sceneId)
	  			strText = format("��ɱ�����ç��һ %d/1", GetMissionParam(sceneId,selfId,misIndex,1) )
	  			AddText(sceneId,strText);
	  		EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
	if objdataId == 519 then
		misIndex = GetMissionIndexByID(sceneId,selfId,x211209_g_MissionId)
		num2 = GetMissionParam(sceneId,selfId,misIndex,2)
		num4 = GetMissionParam(sceneId,selfId,misIndex,4)
		if num2 < 1 then
			SetMissionByIndex(sceneId,selfId,misIndex,2,num2+1)
			SetMissionByIndex(sceneId,selfId,misIndex,4,num4+1)
	  		BeginEvent(sceneId)
	  			strText = format("��ɱ�����ç�Ƕ�%d/1", GetMissionParam(sceneId,selfId,misIndex,2) )
	  			AddText(sceneId,strText);
	  		EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
	if objdataId == 520 then
		misIndex = GetMissionIndexByID(sceneId,selfId,x211209_g_MissionId)
		num3 = GetMissionParam(sceneId,selfId,misIndex,3)
		num4 = GetMissionParam(sceneId,selfId,misIndex,4)
		if num3 < 1 then
			SetMissionByIndex(sceneId,selfId,misIndex,3,num3+1)
			SetMissionByIndex(sceneId,selfId,misIndex,4,num4+1)
	  		BeginEvent(sceneId)
	  			strText = format("��ɱ�����ç���� %d/1", GetMissionParam(sceneId,selfId,misIndex,3) )
	  			AddText(sceneId,strText);
	  		EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
	misIndex = GetMissionIndexByID(sceneId,selfId,x211209_g_MissionId)
	num4 = GetMissionParam(sceneId,selfId,misIndex,4)
	if	num4 >= 3 then
		SetMissionByIndex(sceneId,selfId,misIndex,0,1)
	end
end

--**********************************
--���������¼�
--**********************************
function x211209_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x211209_OnItemChanged( sceneId, selfId, itemdataId )
end
