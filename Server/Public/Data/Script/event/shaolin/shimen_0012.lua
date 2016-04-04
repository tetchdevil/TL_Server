--����������
--Ѱ��
--MisDescBegin
--�ű���
x220012_g_ScriptId = 220012

--ǰ������
--g_MissionIdPre =

--�����
x220012_g_MissionId = 1060

--����Ŀ��npc
x220012_g_Name	="�۷�"

--�������
x220012_g_MissionKind = 20

--����ȼ�
x220012_g_MissionLevel = 10

--�Ƿ��Ǿ�Ӣ����
x220012_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x220012_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������Ҫ�õ�����Ʒ
x220012_g_DemandItem={{id=20104001,num=1}}		--�ӱ����м���

--������
x220012_g_MissionRound	= 11			--��¼ѭ����������ĵ�10����
--�����Ƕ�̬**************************************************************

--���������һλ�����洢����õ��Ľű���

--�����ı�����
x220012_g_MissionName="��������������"
x220012_g_MissionInfo="�ҵ�С����ô�����ˣ�����������"  --��������
x220012_g_MissionTarget="��۷��ҵ�һ��С��"		--����Ŀ��
x220012_g_ContinueInfo="���С���������"		--δ��������npc�Ի�
x220012_g_MissionComplete="���������ֵ���"					--�������npc˵���Ļ�

--������


--MisDescEnd
--**********************************
--������ں���
--**********************************
function x220012_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x220012_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x220012_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x220012_g_MissionName)
			AddText(sceneId,x220012_g_ContinueInfo)
			for i, item in x220012_g_DemandItem do
				AddItemDemand( sceneId, item.id, item.num )
			end
		EndEvent( )
		bDone = x220012_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x220012_g_ScriptId,x220012_g_MissionId,bDone)
	--���������������
	elseif x220012_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x220012_g_MissionName)
			AddText(sceneId,x220012_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x220012_g_MissionTarget)
			--AddMoneyBonus( sceneId, g_MoneyBonus )
			--for i, item in g_ItemBonus do
			--	AddItemBonus( sceneId, item.id, item.num )
			--end
			--for i, item in g_RadioItemBonus do
			--	AddRadioItemBonus( sceneId, item.id, item.num )
			--end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x220012_g_ScriptId,x220012_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x220012_OnEnumerate( sceneId, selfId, targetId )
    --����ѽӴ�����
    if IsHaveMission(sceneId,selfId,x220012_g_MissionId) > 0 then
		AddNumText(sceneId,x220012_g_ScriptId,x220012_g_MissionName);
    --���������������
    elseif x220012_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x220012_g_ScriptId,x220012_g_MissionName);
    end
end

--**********************************
--����������
--**********************************
function x220012_CheckAccept( sceneId, selfId )
	--��Ҫ1�����ܽ�
	if GetLevel( sceneId, selfId ) >= 1 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x220012_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x220012_g_MissionId, x220012_g_ScriptId, 0, 0, 1 )
	misIndex = GetMissionIndexByID(sceneId,selfId,x220012_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0 (����������)
	SetMissionByIndex(sceneId,selfId,misIndex,1,x220012_g_ScriptId)						--�������кŰ���������ĵ�1λ��Ϊ����ű���
	--�õ�����
	x220012_g_MissionRound = GetMissionData(sceneId,selfId,11)
	--��������1
	x220012_g_MissionRound = x220012_g_MissionRound + 1
	if	x220012_g_MissionRound >= 21 then
		SetMissionData(sceneId, selfId, 11, 1)
	else
		SetMissionData(sceneId, selfId, 11, x220012_g_MissionRound)
	end
	--���������ϵĵ����Ƿ��Ѿ������������������Ѿ����㣬����������ı�����Ϊ0
	if x220012_CheckSubmit( sceneId, selfId ) == 1 then
		SetMissionByIndex(sceneId,selfId,misIndex,0,1)					--��������ɱ�־��Ϊ1
	end
	--��ʾ���ݸ�������Ѿ�����������
	BeginEvent(sceneId)
		AddText(sceneId,x220012_g_MissionInfo)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
	Msg2Player(  sceneId, selfId,"#Y��������������ʦ������",MSG2PLAYER_PARA )
end

--**********************************
--����
--**********************************
function x220012_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x220012_g_MissionId )
	SetMissionData(sceneId,selfId,11,0)	--������0
end

--**********************************
--����
--**********************************
function x220012_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x220012_g_MissionName)
    AddText(sceneId,x220012_g_MissionComplete)
    --AddMoneyBonus( sceneId, g_MoneyBonus )
    --for i, item in g_ItemBonus do
	--	AddItemBonus( sceneId, item.id, item.num )
	--end
    --for i, item in g_RadioItemBonus do
	--	AddRadioItemBonus( sceneId, item.id, item.num )
	--end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x220012_g_ScriptId,x220012_g_MissionId)
	
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x220012_CheckSubmit( sceneId, selfId )
	for i, item in x220012_g_DemandItem do
		itemCount = HaveItemInBag (  sceneId, selfId, item.id )
		if itemCount < item.num then
			return 0
		end
	end
	return 1
end

--**********************************
--�ύ
--**********************************
function x220012_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	local Level = GetLevel( sceneId, selfId)	
	if x220012_CheckSubmit( sceneId, selfId, selectRadioId ) then
		--�۳�������Ʒ
		for i, item in x220012_g_DemandItem do
			ret = DelItem( sceneId, selfId, item.id, item.num )
		end
		if	ret > 0 then
			DelMission( sceneId, selfId, x220012_g_MissionId )
			MissionCom( sceneId,selfId, x220012_g_MissionId )
			--�õ�����
			x220012_g_MissionRound = GetMissionData(sceneId,selfId,11)
			--���㽱�����������
			if mod(x220012_g_MissionRound,10) == 0 then
				x220012_g_Exp = Level * 10 * 10										--�ȼ�+�����������ܾ�����ڳ�����Ӱ��
			else
				x220012_g_Exp = Level * mod(x220012_g_MissionRound,10) * 10
			end
			if	floor((x220012_g_MissionRound - 1) / 10) >=1  then
				x220012_g_Exp = x220012_g_Exp +50												--11~20������ÿ����������50�㾭��
			end
			--���Ӿ���ֵ
			AddExp( sceneId,selfId,x220012_g_Exp)
			AddMoney( sceneId, selfId, x220012_g_Exp)	
			--��ʾ�Ի���
			BeginEvent(sceneId)
				AddText(sceneId,"��ϲ����������񣬸���"..x220012_g_Exp.."�㾭���"..x220012_g_Exp.."Ǯ")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else
			BeginEvent(sceneId)
				AddText(sceneId,"�����������ɣ����С�������")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x220012_OnKillObject( sceneId, selfId, objdataId ,objId)--������˼�������š����objId�������λ�úš�����objId
end

--**********************************
--���������¼�
--**********************************
function x220012_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x220012_OnItemChanged( sceneId, selfId, itemdataId )
	if itemdataId == x220012_g_DemandItem[1].id then
		x220012_g_ItemNum = GetItemCount(sceneId,selfId,x220012_g_DemandItem[1].id)		--��⵱ǰ���������Ʒ1ӵ�е�����
		if x220012_g_ItemNum < x220012_g_DemandItem[1].num then
			BeginEvent(sceneId)
				strText = format("�ѵõ�С��%d/1", x220012_g_ItemNum )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			--ȡ�����������ֵ
			misIndex = GetMissionIndexByID(sceneId,selfId,x220012_g_MissionId)
			num = GetMissionParam(sceneId,selfId,misIndex,0)
			if num == 1 then	--�������״̬��1,˵��������ɵ�������ְ���Ʒ���ٵ��������״̬
				SetMissionByIndex(sceneId,selfId,misIndex,0,0)
			end
		elseif x220012_g_ItemNum == x220012_g_DemandItem[1].num then
			misIndex = GetMissionIndexByID(sceneId,selfId,x220012_g_MissionId)
			num = GetMissionParam(sceneId,selfId,misIndex,0)
			--����Ʒ�����ﵽҪ�����ʱ������ɱ�־��Ȼ��0,��������־���ó�1
			if num == 0 then
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			end
			--��ʾ�õ���Ʒ����
			BeginEvent(sceneId)
				strText = format("�ѵõ�С��%d/1", x220012_g_ItemNum )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end
