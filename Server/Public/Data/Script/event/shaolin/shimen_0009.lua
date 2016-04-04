--����������
--Ѱ��
--MisDescBegin
--�ű���
x220009_g_ScriptId = 220009

--ǰ������
--g_MissionIdPre =

--�����
x220009_g_MissionId = 1060

--����Ŀ��npc
x220009_g_Name	="�۷�"

--�������
x220009_g_MissionKind = 20

--����ȼ�
x220009_g_MissionLevel = 10

--�Ƿ��Ǿ�Ӣ����
x220009_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x220009_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������Ҫ�õ�����Ʒ
x220009_g_DemandItem={{id=30101013,num=1}}		--�ӱ����м���

--������
x220009_g_MissionRound	= 11			--��¼ѭ����������ĵ�10����
--�����Ƕ�̬**************************************************************

--���������һλ�����洢����õ��Ľű���

--�����ı�����
x220009_g_MissionName="��������������"
x220009_g_MissionInfo="�ҵİ�����ô�����ˣ�����������"  --��������
x220009_g_MissionTarget="��۷��ҵ�һ�����ӡ�"		--����Ŀ��
x220009_g_ContinueInfo="��Ѱ��Ӵ�������"		--δ��������npc�Ի�
x220009_g_MissionComplete="���������ֵ���"					--�������npc˵���Ļ�

--������


--MisDescEnd
--**********************************
--������ں���
--**********************************
function x220009_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x220009_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x220009_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x220009_g_MissionName)
			AddText(sceneId,x220009_g_ContinueInfo)
			for i, item in x220009_g_DemandItem do
				AddItemDemand( sceneId, item.id, item.num )
			end
		EndEvent( )
		bDone = x220009_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x220009_g_ScriptId,x220009_g_MissionId,bDone)
	--���������������
	elseif x220009_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x220009_g_MissionName)
			AddText(sceneId,x220009_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x220009_g_MissionTarget)
			--AddMoneyBonus( sceneId, g_MoneyBonus )
			--for i, item in g_ItemBonus do
			--	AddItemBonus( sceneId, item.id, item.num )
			--end
			--for i, item in g_RadioItemBonus do
			--	AddRadioItemBonus( sceneId, item.id, item.num )
			--end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x220009_g_ScriptId,x220009_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x220009_OnEnumerate( sceneId, selfId, targetId )
    --����ѽӴ�����
    if IsHaveMission(sceneId,selfId,x220009_g_MissionId) > 0 then
		AddNumText(sceneId,x220009_g_ScriptId,x220009_g_MissionName);
    --���������������
    elseif x220009_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x220009_g_ScriptId,x220009_g_MissionName);
    end
end

--**********************************
--����������
--**********************************
function x220009_CheckAccept( sceneId, selfId )
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
function x220009_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x220009_g_MissionId, x220009_g_ScriptId, 0, 0, 1 )
	misIndex = GetMissionIndexByID(sceneId,selfId,x220009_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0 (����������)
	SetMissionByIndex(sceneId,selfId,misIndex,1,x220009_g_ScriptId)						--�������кŰ���������ĵ�1λ��Ϊ����ű���
	--�õ�����
	x220009_g_MissionRound = GetMissionData(sceneId,selfId,11)
	--��������1
	x220009_g_MissionRound = x220009_g_MissionRound + 1
	if	x220009_g_MissionRound >= 21 then
		SetMissionData(sceneId, selfId, 11, 1)
	else
		SetMissionData(sceneId, selfId, 11, x220009_g_MissionRound)
	end
	--���������ϵĵ����Ƿ��Ѿ������������������Ѿ����㣬����������ı�����Ϊ0
	if x220009_CheckSubmit( sceneId, selfId ) == 1 then
		SetMissionByIndex(sceneId,selfId,misIndex,0,1)					--��������ɱ�־��Ϊ1
	end
	--��ʾ���ݸ�������Ѿ�����������
	BeginEvent(sceneId)
		AddText(sceneId,x220009_g_MissionInfo)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
	Msg2Player(  sceneId, selfId,"#Y��������������ʦ������",MSG2PLAYER_PARA )
end

--**********************************
--����
--**********************************
function x220009_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x220009_g_MissionId )
	SetMissionData(sceneId,selfId,11,0)	--������0
end

--**********************************
--����
--**********************************
function x220009_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x220009_g_MissionName)
    AddText(sceneId,x220009_g_MissionComplete)
    --AddMoneyBonus( sceneId, g_MoneyBonus )
    --for i, item in g_ItemBonus do
	--	AddItemBonus( sceneId, item.id, item.num )
	--end
    --for i, item in g_RadioItemBonus do
	--	AddRadioItemBonus( sceneId, item.id, item.num )
	--end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x220009_g_ScriptId,x220009_g_MissionId)
	
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x220009_CheckSubmit( sceneId, selfId )
	for i, item in x220009_g_DemandItem do
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
function x220009_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	local Level = GetLevel( sceneId, selfId)	
	if x220009_CheckSubmit( sceneId, selfId, selectRadioId ) then
		--�۳�������Ʒ
		for i, item in x220009_g_DemandItem do
			ret = DelItem( sceneId, selfId, item.id, item.num )
		end
		if	ret > 0 then
			DelMission( sceneId, selfId, x220009_g_MissionId )
			MissionCom( sceneId,selfId, x220009_g_MissionId )
			--�õ�����
			x220009_g_MissionRound = GetMissionData(sceneId,selfId,11)
			--���㽱�����������
			if mod(x220009_g_MissionRound,10) == 0 then
				x220009_g_Exp = Level * 10 * 10										--�ȼ�+�����������ܾ�����ڳ�����Ӱ��
			else
				x220009_g_Exp = Level * mod(x220009_g_MissionRound,10) * 10
			end
			if	floor((x220009_g_MissionRound - 1) / 10) >=1  then
				x220009_g_Exp = x220009_g_Exp +50												--11~20������ÿ����������50�㾭��
			end
			--���Ӿ���ֵ
			AddExp( sceneId,selfId,x220009_g_Exp)
			AddMoney( sceneId, selfId, x220009_g_Exp)	
			--��ʾ�Ի���
			BeginEvent(sceneId)
				AddText(sceneId,"��ϲ����������񣬸���"..x220009_g_Exp.."�㾭���"..x220009_g_Exp.."Ǯ")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else
			BeginEvent(sceneId)
				AddText(sceneId,"�����������ɣ���İ��������")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x220009_OnKillObject( sceneId, selfId, objdataId ,objId)--������˼�������š����objId�������λ�úš�����objId
end

--**********************************
--���������¼�
--**********************************
function x220009_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x220009_OnItemChanged( sceneId, selfId, itemdataId )
	if itemdataId == x220009_g_DemandItem[1].id then
		x220009_g_ItemNum = GetItemCount(sceneId,selfId,x220009_g_DemandItem[1].id)		--��⵱ǰ���������Ʒ1ӵ�е�����
		if x220009_g_ItemNum < x220009_g_DemandItem[1].num then
			BeginEvent(sceneId)
				strText = format("�ѵõ�����%d/1", x220009_g_ItemNum )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			--ȡ�����������ֵ
			misIndex = GetMissionIndexByID(sceneId,selfId,x220009_g_MissionId)
			num = GetMissionParam(sceneId,selfId,misIndex,0)
			if num == 1 then	--�������״̬��1,˵��������ɵ�������ְ���Ʒ���ٵ��������״̬
				SetMissionByIndex(sceneId,selfId,misIndex,0,0)
			end
		elseif x220009_g_ItemNum == x220009_g_DemandItem[1].num then
			misIndex = GetMissionIndexByID(sceneId,selfId,x220009_g_MissionId)
			num = GetMissionParam(sceneId,selfId,misIndex,0)
			--����Ʒ�����ﵽҪ�����ʱ������ɱ�־��Ȼ��0,��������־���ó�1
			if num == 0 then
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			end
			--��ʾ�õ���Ʒ����
			BeginEvent(sceneId)
				strText = format("�ѵõ�����%d/1", x220009_g_ItemNum )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end
