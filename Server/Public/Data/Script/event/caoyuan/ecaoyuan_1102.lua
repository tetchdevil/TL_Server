--ɱ������
--����������
--MisDescBegin
--�ű���
x211102_g_ScriptId = 211102

--��һ�������ID
--g_MissionIdPre =

--�����
x211102_g_MissionId = 542

--����Ŀ��npc
x211102_g_Name	="��Ǿ" 

--�������
x211102_g_MissionKind = 31

--����ȼ�
x211102_g_MissionLevel = 52

--�Ƿ��Ǿ�Ӣ����
x211102_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������
--�����Ƿ��Ѿ����
x211102_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������Ҫɱ���Ĺ�
x211102_g_DemandKill = {{id=1825,num=5}}		--������1λ

--�����Ƕ�̬**************************************************************

--�����ı�����
x211102_g_MissionName="����������"
x211102_g_MissionInfo="ȥ����ɱ5��������ˣ���һ���ͱ������"  --��������
x211102_g_MissionTarget="ɱ��5���������"		--����Ŀ��
x211102_g_ContinueInfo="�汿�������ȥ��"		--δ��������npc�Ի�
x211102_g_MissionComplete="�ţ����������������"					--�������npc˵���Ļ�

--������
x211102_g_MoneyBonus=1032
x211102_g_ItemBonus={{id=30002001,num=1},{id=10412001,num=1}}
x211102_g_RadioItemBonus={{id=10100001,num=1},{id=10210001,num=1}}
x211102_g_DemandTrueKill = {{name="�������",num=5}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x211102_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x211102_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x211102_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,x211102_g_MissionName)
		AddText(sceneId,x211102_g_ContinueInfo)
		EndEvent( )
		bDone = x211102_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x211102_g_ScriptId,x211102_g_MissionId,bDone)
	--���������������
	elseif x211102_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,x211102_g_MissionName)
		AddText(sceneId,x211102_g_MissionInfo)
		AddText(sceneId,"#{M_MUBIAO}")
		AddText(sceneId,x211102_g_MissionTarget)
		AddMoneyBonus( sceneId, x211102_g_MoneyBonus )
		for i, item in x211102_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
			for i, item in x211102_g_RadioItemBonus do
					AddRadioItemBonus( sceneId, item.id, item.num )
				end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x211102_g_ScriptId,x211102_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x211102_OnEnumerate( sceneId, selfId, targetId )

    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x211102_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    --else
    if IsHaveMission(sceneId,selfId,x211102_g_MissionId) > 0 then
		AddNumText(sceneId,x211102_g_ScriptId,x211102_g_MissionName);
    --���������������
    elseif x211102_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x211102_g_ScriptId,x211102_g_MissionName);
    end
end

--**********************************
--����������
--**********************************
function x211102_CheckAccept( sceneId, selfId )
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
function x211102_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x211102_g_MissionId, x211102_g_ScriptId, 1, 0, 0 )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x211102_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0
end

--**********************************
--����
--**********************************
function x211102_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x211102_g_MissionId )
end

--**********************************
--����
--**********************************
function x211102_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x211102_g_MissionName)
    AddText(sceneId,x211102_g_MissionComplete)
    AddMoneyBonus( sceneId, x211102_g_MoneyBonus )
    for i, item in x211102_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    for i, item in x211102_g_RadioItemBonus do
		AddRadioItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x211102_g_ScriptId,x211102_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x211102_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x211102_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,1)
    if num == x211102_g_DemandTrueKill[1].num then
       return 1
    end
	return 0
end

--**********************************
--�ύ
--**********************************
function x211102_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x211102_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x211102_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		for i, item in x211102_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddMoney(sceneId,selfId,x211102_g_MoneyBonus );
			--�۳�������Ʒ
			ret = DelMission( sceneId, selfId, x211102_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId,selfId, x211102_g_MissionId )
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
function x211102_OnKillObject( sceneId, selfId, objdataId ,objId)
	if GetName(sceneId,objId) == x211102_g_DemandTrueKill[1].name	  then
		misIndex = GetMissionIndexByID(sceneId,selfId,x211102_g_MissionId)
		num = GetMissionParam(sceneId,selfId,misIndex,1)
			if num < x211102_g_DemandTrueKill[1].num then
			--��������ɱ�־����Ϊ1
			if num == x211102_g_DemandTrueKill[1].num - 1 then
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			end
			--���ô������+1
			SetMissionByIndex(sceneId,selfId,misIndex,1,num+1)
	  		BeginEvent(sceneId)
	  			strText = format("��ɱ��������� %d/5", GetMissionParam(sceneId,selfId,misIndex,1) )
	  			AddText(sceneId,strText);
	  		EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end

--**********************************
--���������¼�
--**********************************
function x211102_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x211102_OnItemChanged( sceneId, selfId, itemdataId )
end
