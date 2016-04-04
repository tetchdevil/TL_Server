--ʯ��  ���µ�����
--MisDescBegin
--�ű���
x211708_g_ScriptId = 211708

--�����
x211708_g_MissionId = 608

--�������
x211708_g_MissionKind = 32

--����ȼ�
x211708_g_MissionLevel = 63

--�Ƿ��Ǿ�Ӣ����
x211708_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x211708_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

--������Ҫ�õ�����Ʒ
x211708_g_DemandItem={{id=40002112,num=1}}		--������1λ

--�����ı�����
x211708_g_MissionName="���µ�����"
x211708_g_MissionInfo="�������еĳ������䶨��ʱ����Ŭ���������Լ���˼·���ڻ�����һ��ոշ���������֮�����ƺ������޷�������һ�С���ʦ������찢֧��һ����ֵ����������Ǵ�˵�е����޶�ħ����С�ĵؽ����޵�ͷ­���£�Ȼ��װ����С���Ȼ�����û��֤�ݵĻ�û���˻���������˵�ġ������������֣���峤��֪�����Ϣ��"
x211708_g_MissionTarget="�Ѱ�֧��ͷ­����Բ�´�Ĵ峤֣��"
x211708_g_ContinueInfo="����ʲô����"
x211708_g_MissionComplete="Ŷ���յ�"

--����ID
x211708_g_ItemID = 40002112

--�ջ���
x211708_g_Name = "֣��"

x211708_g_MoneyBonus=10200
x211708_g_Exp = 3000
x211708_g_ItemBonus={{id=30002001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x211708_OnDefaultEvent( sceneId, selfId, targetId )
	--����ѽӴ�����
	if IsMissionHaveDone( sceneId, selfId, x211708_g_MissionId ) > 0 then
		return 
	elseif IsHaveMission(sceneId,selfId,x211708_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x211708_g_Name then
			--���ͽ�����ǰ��������Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x211708_g_MissionName);
				AddText(sceneId,x211708_g_ContinueInfo);
				AddItemDemand( sceneId, x211708_g_ItemID, 1 );
			EndEvent(sceneId)
    		done = x211708_CheckSubmit( sceneId, selfId );
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x211708_g_ScriptId,x211708_g_MissionId,done)
		end
	--���������������
	elseif GetLevel( sceneId, selfId ) >= 60 then
		if GetName(sceneId,targetId) ~= x211708_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x211708_g_MissionName);
				AddText(sceneId,x211708_g_MissionInfo);
				AddText(sceneId,"#{M_MUBIAO}");
				AddText(sceneId,x211708_g_MissionTarget);
				AddMoneyBonus( sceneId, x211708_g_MoneyBonus )
				for i, item in x211708_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			--������������б�
			ret = AddMission( sceneId,selfId, x211708_g_MissionId, x211708_g_ScriptId, 0, 0, 0 )
			if ret > 0 then
				misIndex = GetMissionIndexByID(sceneId,selfId,x211708_g_MissionId)			--�õ���������к�
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)		--�������кŰ���������ĵ�0λ��1 (����������)
			end
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x211708_OnEnumerate( sceneId, selfId, targetId )
	if IsMissionHaveDone( sceneId, selfId, x211708_g_MissionId ) > 0 then
		return 
	elseif IsHaveMission(sceneId,selfId,x211708_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x211708_g_Name then
			AddNumText(sceneId, x211708_g_ScriptId,x211708_g_MissionName)
		end
	--���������������
	elseif x211708_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x211708_g_Name then
			AddNumText(sceneId, x211708_g_ScriptId, x211708_g_MissionName);
		end
	end
end

--**********************************
--��ⴥ������
--**********************************
function x211708_CheckAccept( sceneId, selfId )
--	--��Ҫ60�����ܽ�
--	if GetLevel( sceneId, selfId ) >= 60 then
--		return 1
--	else
--		return 0
--	end
end

--**********************************
--����
--**********************************
function x211708_OnAccept( sceneId, selfId )
--	--������������б�
--	ret = AddMission( sceneId,selfId, x211708_g_MissionId, x211708_g_ScriptId, 0, 0, 0 )
--	if ret > 0 then
--		AddItemListToHuman(sceneId,selfId)
--		misIndex = GetMissionIndexByID(sceneId,selfId,x211708_g_MissionId)			--�õ���������к�
--		SetMissionByIndex(sceneId,selfId,misIndex,0,1)		--�������кŰ���������ĵ�0λ��1 (����������)
--	end
end

--**********************************
--����
--**********************************
function x211708_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	DelMission( sceneId, selfId, x211708_g_MissionId )
end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x211708_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x211708_g_MissionComplete);
		AddMoneyBonus( sceneId, x211708_g_MoneyBonus )
		for i, item in x211708_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
	EndEvent(sceneId)
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x211708_g_ScriptId,x211708_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x211708_CheckSubmit( sceneId, selfId )
	itemNum = GetItemCount( sceneId, selfId, x211708_g_ItemID );
	if itemNum > 0 then
		return 1;
	end
	return 0
end

--**********************************
--�ύ����ɣ�
--**********************************
function x211708_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	if x211708_CheckSubmit( sceneId, selfId, selectRadioId ) then
    		BeginAddItem(sceneId)
			for i, item in x211708_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
			
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then		
			AddExp(sceneId,selfId,x211708_g_Exp)
			AddMoney(sceneId,selfId,x211708_g_MoneyBonus );
			for i, item in x211708_g_DemandItem do
				DelItem( sceneId, selfId, item.id, item.num )
			end
			ret = DelMission( sceneId, selfId, x211708_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId, selfId, x211708_g_MissionId )
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
function x211708_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x211708_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x211708_OnItemChanged( sceneId, selfId, itemdataId )
end
