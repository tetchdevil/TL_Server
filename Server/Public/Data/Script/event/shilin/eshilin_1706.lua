--ʯ�� �㵽Ϊֹ
--MisDescBegin
--�ű���
x211706_g_ScriptId = 211706

--�����
x211706_g_MissionId = 606

--��һ�������ID
x211706_g_MissionIdPre = 603

--����Ŀ��npc
x211706_g_Name	="�غ���"

--�������
x211706_g_MissionKind = 29

--����ȼ�
x211706_g_MissionLevel = 21

--�Ƿ��Ǿ�Ӣ����
x211706_g_IfMissionElite = 0

--******���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������******
--�����Ƿ��Ѿ����
x211706_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������Ҫɱ���Ĺ�
x211706_g_DemandKill ={{id=1870,num=10},{id=1875,num=10},{id=1880,num=10}}		--������1λ

--******�����Ƕ�̬******

--�����ı�����
x211706_g_MissionName="�㵽Ϊֹ"
x211706_g_MissionInfo="ɱ��10ֻ����ʯʨɱ��10ֻ����ʯ��ɱ��10ֻ����ʯ��"
x211706_g_MissionTarget="ɱ��10ֻ����ʯʨɱ��10ֻ����ʯ��ɱ��10ֻ����ʯ��"
x211706_g_ContinueInfo="���Ѿ�ɱ��ɱ��10ֻ����ʯʨɱ��10ֻ����ʯ��ɱ��10ֻ����ʯ�ˣ�û�оͼ�����"
x211706_g_MissionComplete="��ϲ��ɱ����"

--������
x211706_g_MoneyBonus=10200
x211706_g_Exp = 3000
x211706_g_ItemBonus={{id=30002001,num=1}}


--MisDescEnd
--**********************************
--������ں���
--**********************************
function x211706_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
	if IsMissionHaveDone(sceneId,selfId, x211706_g_MissionIdPre) <= 0 then
		BeginEvent(sceneId)
			print("������������������԰")
			
			AddText(sceneId, "������������������԰")		
		EndEvent( )
		
		return
	end
	    
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x211706_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x211706_g_MissionName)
			AddText(sceneId,x211706_g_ContinueInfo)
		--for i, item in g_DemandItem do
		--	AddItemDemand( sceneId, item.id, item.num )
		--end
		EndEvent( )
		bDone = x211706_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x211706_g_ScriptId,x211706_g_MissionId,bDone)
	--���������������
	elseif x211706_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x211706_g_MissionName)
			AddText(sceneId,x211706_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x211706_g_MissionTarget)
			AddMoneyBonus( sceneId, x211706_g_MoneyBonus )
		for i, item in x211706_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
		
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x211706_g_ScriptId,x211706_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x211706_OnEnumerate( sceneId, selfId, targetId )
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x211706_g_MissionId) > 0 then
		return 
	end
		--����ѽӴ�����
    --else
		if IsHaveMission(sceneId,selfId,x211706_g_MissionId) > 0 then
			AddNumText(sceneId,x211706_g_ScriptId,x211706_g_MissionName);
			--���������������
		elseif x211706_CheckAccept(sceneId,selfId) > 0 then
			AddNumText(sceneId,x211706_g_ScriptId,x211706_g_MissionName);
		end
	end

--**********************************
--����������
--**********************************
function x211706_CheckAccept( sceneId, selfId )
	--��Ҫ60�����ܽ�
	if GetLevel( sceneId, selfId ) >= 60 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x211706_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x211706_g_MissionId, x211706_g_ScriptId, 1, 0, 0 )	--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x211706_g_MissionId)	--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)	--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)	--�������кŰ���������ĵ�1λ��0
end

--**********************************
--����
--**********************************
function x211706_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x211706_g_MissionId )
end

--**********************************
--����
--**********************************
function x211706_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x211706_g_MissionName)
		AddText(sceneId,x211706_g_MissionComplete)
		AddMoneyBonus( sceneId, x211706_g_MoneyBonus )
		for i, item in x211706_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end		
    EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x211706_g_ScriptId,x211706_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x211706_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x211706_g_MissionId)
    	num1 = GetMissionParam(sceneId,selfId,misIndex,1)
    	num2 = GetMissionParam(sceneId,selfId,misIndex,2)
    	num3 = GetMissionParam(sceneId,selfId,misIndex,3)
    	if((num1 == x211706_g_DemandKill[1].num) and  
    		(num2 == x211706_g_DemandKill[2].num) and (num3 == x211706_g_DemandKill[3].num))then
		return 1
	end
	
	return 0
end

--**********************************
--�ύ
--**********************************
function x211706_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x211706_CheckSubmit( sceneId, selfId, selectRadioId ) then
    		BeginAddItem(sceneId)
			for i, item in x211706_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
			
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
		
			AddMoney(sceneId,selfId,x211706_g_MoneyBonus )
			AddExp(sceneId,selfId,x211706_g_Exp)
			--�۳�������Ʒ
			--for i, item in g_DemandItem do
			--	DelItem( sceneId, selfId, item.id, item.num )
			--end
			ret = DelMission( sceneId, selfId, x211706_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId, selfId, x211706_g_MissionId )
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
function x211706_OnKillObject( sceneId, selfId, objdataId )

	if objdataId == x211706_g_DemandKill[1].id then
		misIndex = GetMissionIndexByID(sceneId,selfId,x211706_g_MissionId)
		num = GetMissionParam(sceneId,selfId,misIndex,1)
		if num < x211706_g_DemandKill[1].num then
			--��������ɱ�־����Ϊ1
			if num == x211706_g_DemandKill[1].num - 1 then
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			end
			--���ô������+1
			SetMissionByIndex(sceneId,selfId,misIndex,1,num+1)
			BeginEvent(sceneId)
			strText = format("��ɱ������ʯʨ%d/10", GetMissionParam(sceneId,selfId,misIndex,1) )
			AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	elseif(objdataId == x211706_g_DemandKill[2].id) then
		misIndex = GetMissionIndexByID(sceneId,selfId,x211706_g_MissionId)
		num = GetMissionParam(sceneId,selfId,misIndex,2)
		if num < x211706_g_DemandKill[2].num then
			--��������ɱ�־����Ϊ1
			if num == x211706_g_DemandKill[2].num - 1 then
				SetMissionByIndex(sceneId,selfId,misIndex,0,2)
			end
			--���ô������+1
			SetMissionByIndex(sceneId,selfId,misIndex,2,num+1)
			BeginEvent(sceneId)
			strText = format("��ɱ������ʯ��%d/10", GetMissionParam(sceneId,selfId,misIndex,2) )
			AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	elseif(objdataId == x211706_g_DemandKill[3].id) then
		misIndex = GetMissionIndexByID(sceneId,selfId,x211706_g_MissionId)
		num = GetMissionParam(sceneId,selfId,misIndex,3)
		if num < x211706_g_DemandKill[3].num then
			--��������ɱ�־����Ϊ1
			if num == x211706_g_DemandKill[3].num - 1 then
				SetMissionByIndex(sceneId,selfId,misIndex,0,3)
			end
			--���ô������+1
			SetMissionByIndex(sceneId,selfId,misIndex,3,num+1)
			BeginEvent(sceneId)
			strText = format("��ɱ��ҳ��ʯ��%d/10", GetMissionParam(sceneId,selfId,misIndex,3) )
			AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
 
end

--**********************************
--���������¼�
--**********************************
function x211706_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x211706_OnItemChanged( sceneId, selfId, itemdataId )
end
