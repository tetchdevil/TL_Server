--ɱ��,����
--ս����ԭ��
--MisDescBegin
--�ű���
x212008_g_ScriptId = 212008

--��һ�������ID
--g_MissionIdPre =

--�����
x212008_g_MissionId = 638

--����Ŀ��npc
x212008_g_Name	="����" 

--�������
x212008_g_MissionKind = 40

--����ȼ�
x212008_g_MissionLevel = 79

--�Ƿ��Ǿ�Ӣ����
x212008_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������
--�����Ƿ��Ѿ����
x212008_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������Ҫɱ���Ĺ�
x212008_g_DemandKill ={{id=533,num=1}}		--������1λ

--�����Ƕ�̬**************************************************************

--�����ı�����
x212008_g_MissionName="ս����ԭ��"
x212008_g_MissionInfo="ɱ���ź�"  --��������
x212008_g_MissionTarget="ɱ���ź�"		--����Ŀ��
x212008_g_ContinueInfo="���Ѿ�ɱ�˹ź���"		--δ��������npc�Ի�
x212008_g_MissionComplete="�ɵò���"					--�������npc˵���Ļ�

x212008_g_MoneyBonus=100
x212008_g_ItemBonus={{id=30002001,num=1}}
x212008_g_RadioItemBonus={{id=10100001,num=1},{id=10210001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x212008_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    if IsMissionHaveDone(sceneId,selfId,x212008_g_MissionId) > 0 then
		return
	end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x212008_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212008_g_Name then
			--���������������Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x212008_g_MissionName)
				AddText(sceneId,x212008_g_ContinueInfo)
				--for i, item in g_DemandItem do
				--			AddItemDemand( sceneId, item.id, item.num )
				--end
			EndEvent( )
			bDone = x212008_CheckSubmit( sceneId, selfId )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212008_g_ScriptId,x212008_g_MissionId,bDone)
		end
	--���������������
	elseif x212008_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212008_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x212008_g_MissionName)
				AddText(sceneId,x212008_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x212008_g_MissionTarget)
				AddMoneyBonus( sceneId, x212008_g_MoneyBonus )
				for i, item in x212008_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
				for i, item in x212008_g_RadioItemBonus do
					AddRadioItemBonus( sceneId, item.id, item.num )
				end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x212008_g_ScriptId,x212008_g_MissionId)
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x212008_OnEnumerate( sceneId, selfId, targetId )

    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x212008_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    --else
    if IsHaveMission(sceneId,selfId,x212008_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212008_g_Name then
			AddNumText(sceneId,x212008_g_ScriptId,x212008_g_MissionName);
		end
    --���������������
    elseif x212008_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212008_g_Name then
			AddNumText(sceneId,x212008_g_ScriptId,x212008_g_MissionName);
		end
    end

end
--**********************************
--����������
--**********************************
function x212008_CheckAccept( sceneId, selfId )
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
function x212008_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x212008_g_MissionId, x212008_g_ScriptId, 1, 0, 0 )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x212008_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0
end

--**********************************
--����
--**********************************
function x212008_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x212008_g_MissionId )
end

--**********************************
--����
--**********************************
function x212008_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x212008_g_MissionName)
    AddText(sceneId,x212008_g_MissionComplete)
    AddMoneyBonus( sceneId, x212008_g_MoneyBonus )
    for i, item in x212008_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    for i, item in x212008_g_RadioItemBonus do
		AddRadioItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x212008_g_ScriptId,x212008_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212008_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x212008_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,1)
    if num == x212008_g_DemandKill[1].num then
       return 1
    end
	return 0
end

--**********************************
--�ύ
--**********************************
function x212008_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x212008_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x212008_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		for i, item in x212008_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddMoney(sceneId,selfId,x212008_g_MoneyBonus )
			ret = DelMission( sceneId, selfId, x212008_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId,selfId,  x212008_g_MissionId )
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
function x212008_OnKillObject( sceneId, selfId, objdataId )

 if objdataId == x212008_g_DemandKill[1].id then
		misIndex = GetMissionIndexByID(sceneId,selfId,x212008_g_MissionId)
		num = GetMissionParam(sceneId,selfId,misIndex,1)
		if num < x212008_g_DemandKill[1].num then
		--��������ɱ�־����Ϊ1
		if num == x212008_g_DemandKill[1].num - 1 then
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
		end
		--���ô������+1
			SetMissionByIndex(sceneId,selfId,misIndex,1,num+1)
	  		BeginEvent(sceneId)
	  			strText = format("��ɱ���ź�%d/1", GetMissionParam(sceneId,selfId,misIndex,1) )
	  			AddText(sceneId,strText);
	  		EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
 
end

--**********************************
--���������¼�
--**********************************
function x212008_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x212008_OnItemChanged( sceneId, selfId, itemdataId )
end
