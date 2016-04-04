--����������
--Ѱ��
--MisDescBegin
--�ű���
x220027_g_ScriptId = 220027

--ǰ������
--g_MissionIdPre =

--�����
x220027_g_MissionId = 1060

--����Ŀ��npc
x220027_g_Name	="�۷�"

--�������
x220027_g_MissionKind = 20

--����ȼ�
x220027_g_MissionLevel = 10

--�Ƿ��Ǿ�Ӣ����
x220027_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x220027_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������Ҫ�õ�����Ʒ
x220027_g_DemandItem={{id=40002127,num=5}}		--�ӱ����м���

--������
x220027_g_MissionRound	= 11			--��¼ѭ����������ĵ�10����
--�����Ƕ�̬**************************************************************

--���������һλ�����洢����õ��Ľű���

--�����ı�����
x220027_g_MissionName="��������������"
x220027_g_MissionInfo="ȥ����תת��ʰ���ɹ�������5������"  --��������
x220027_g_MissionTarget="��۷�ʰ��5���ɹ���"		--����Ŀ��
x220027_g_ContinueInfo="����ɹ���������"		--δ��������npc�Ի�
x220027_g_MissionComplete="���������ֵ���"					--�������npc˵���Ļ�

--������


--MisDescEnd
--**********************************
--������ں���
--**********************************
function x220027_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x220027_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x220027_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x220027_g_MissionName)
			AddText(sceneId,x220027_g_ContinueInfo)
			for i, item in x220027_g_DemandItem do
				AddItemDemand( sceneId, item.id, item.num )
			end
		EndEvent( )
		bDone = x220027_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x220027_g_ScriptId,x220027_g_MissionId,bDone)
	--���������������
	elseif x220027_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x220027_g_MissionName)
			AddText(sceneId,x220027_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x220027_g_MissionTarget)
			--AddMoneyBonus( sceneId, g_MoneyBonus )
			--for i, item in g_ItemBonus do
			--	AddItemBonus( sceneId, item.id, item.num )
			--end
			--for i, item in g_RadioItemBonus do
			--	AddRadioItemBonus( sceneId, item.id, item.num )
			--end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x220027_g_ScriptId,x220027_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x220027_OnEnumerate( sceneId, selfId, targetId )
    --����ѽӴ�����
    if IsHaveMission(sceneId,selfId,x220027_g_MissionId) > 0 then
		AddNumText(sceneId,x220027_g_ScriptId,x220027_g_MissionName);
    --���������������
    elseif x220027_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x220027_g_ScriptId,x220027_g_MissionName);
    end
end

--**********************************
--����������
--**********************************
function x220027_CheckAccept( sceneId, selfId )
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
function x220027_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x220027_g_MissionId, x220027_g_ScriptId, 0, 0, 1 )
	misIndex = GetMissionIndexByID(sceneId,selfId,x220027_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0 (����������)
	SetMissionByIndex(sceneId,selfId,misIndex,1,x220027_g_ScriptId)						--�������кŰ���������ĵ�1λ��Ϊ����ű���
	SetMissionByIndex(sceneId,selfId,misIndex,5,3)						--�������кŰ���������ĵ�5λ��Ϊ����Ŀ���������ţ�3Ϊ�ɹ�
	--�õ�����
	x220027_g_MissionRound = GetMissionData(sceneId,selfId,11)
	--��������1
	x220027_g_MissionRound = x220027_g_MissionRound + 1
	if	x220027_g_MissionRound >= 21 then
		SetMissionData(sceneId, selfId, 11, 1)
	else
		SetMissionData(sceneId, selfId, 11, x220027_g_MissionRound)
	end
	--���������ϵĵ����Ƿ��Ѿ������������������Ѿ����㣬����������ı�����Ϊ0
	if x220027_CheckSubmit( sceneId, selfId ) == 1 then
		SetMissionByIndex(sceneId,selfId,misIndex,0,1)					--��������ɱ�־��Ϊ1
	end
	--��ʾ���ݸ�������Ѿ�����������
	BeginEvent(sceneId)
		AddText(sceneId,x220027_g_MissionInfo)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
	Msg2Player(  sceneId, selfId,"#Y��������������ʦ������",MSG2PLAYER_PARA )
end

--**********************************
--����
--**********************************
function x220027_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x220027_g_MissionId )
	for i, item in x220027_g_DemandItem do
		DelItem( sceneId, selfId, item.id, item.num )
	end
	SetMissionData(sceneId,selfId,11,0)	--������0
end

--**********************************
--����
--**********************************
function x220027_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x220027_g_MissionName)
    AddText(sceneId,x220027_g_MissionComplete)
    --AddMoneyBonus( sceneId, g_MoneyBonus )
    --for i, item in g_ItemBonus do
	--	AddItemBonus( sceneId, item.id, item.num )
	--end
    --for i, item in g_RadioItemBonus do
	--	AddRadioItemBonus( sceneId, item.id, item.num )
	--end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x220027_g_ScriptId,x220027_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x220027_CheckSubmit( sceneId, selfId )
	for i, item in x220027_g_DemandItem do
		itemCount = GetItemCount( sceneId, selfId, item.id)
		if itemCount < item.num then
			return 0
		end
	end
	return 1
end

--**********************************
--�ύ
--**********************************
function x220027_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	local Level = GetLevel( sceneId, selfId)	
	if x220027_CheckSubmit( sceneId, selfId, selectRadioId ) then
		--�۳�������Ʒ
		for i, item in x220027_g_DemandItem do
			DelItem( sceneId, selfId, item.id, item.num )
		end
		DelMission( sceneId, selfId, x220027_g_MissionId )
		MissionCom( sceneId,selfId, x220027_g_MissionId )
		--�õ�����
		x220027_g_MissionRound = GetMissionData(sceneId,selfId,11)
		--���㽱�����������
		if mod(x220027_g_MissionRound,10) == 0 then
			x220027_g_Exp = Level * 10 * 10										--�ȼ�+�����������ܾ�����ڳ�����Ӱ��
		else
			x220027_g_Exp = Level * mod(x220027_g_MissionRound,10) * 10
		end
		if	floor((x220027_g_MissionRound - 1) / 10) >=1  then
			x220027_g_Exp = x220027_g_Exp +50												--11~20������ÿ����������50�㾭��
		end
		--���Ӿ���ֵ
		AddExp( sceneId,selfId,x220027_g_Exp)
		AddMoney( sceneId, selfId, x220027_g_Exp)	
		--��ʾ�Ի���
		BeginEvent(sceneId)
			AddText(sceneId,"��ϲ����������񣬸���"..x220027_g_Exp.."�㾭���"..x220027_g_Exp.."Ǯ")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--ɱ����������
--**********************************
function x220027_OnKillObject( sceneId, selfId, objdataId ,objId)--������˼�������š����objId�������λ�úš�����objId
end

--**********************************
--���������¼�
--**********************************
function x220027_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x220027_OnItemChanged( sceneId, selfId, itemdataId )
	if itemdataId == x220027_g_DemandItem[1].id then
		x220027_g_ItemNum = GetItemCount(sceneId,selfId,x220027_g_DemandItem[1].id)		--��⵱ǰ���������Ʒ1ӵ�е�����
		if x220027_g_ItemNum < x220027_g_DemandItem[1].num then
			BeginEvent(sceneId)
				strText = format("�ѵõ�ɢ����ɹ�%d/5", x220027_g_ItemNum )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			--ȡ�����������ֵ
			misIndex = GetMissionIndexByID(sceneId,selfId,x220027_g_MissionId)
			num = GetMissionParam(sceneId,selfId,misIndex,0)
			if num == 1 then	--�������״̬��1,˵��������ɵ�������ְ���Ʒ���ٵ��������״̬
				SetMissionByIndex(sceneId,selfId,misIndex,0,0)
			end
		elseif x220027_g_ItemNum == x220027_g_DemandItem[1].num then
			misIndex = GetMissionIndexByID(sceneId,selfId,x220027_g_MissionId)
			num = GetMissionParam(sceneId,selfId,misIndex,0)
			--����Ʒ�����ﵽҪ�����ʱ������ɱ�־��Ȼ��0,��������־���ó�1
			if num == 0 then
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			end
			--��ʾ�õ���Ʒ����
			BeginEvent(sceneId)
				strText = format("�ѵõ�ɢ����ɹ�%d/5", x220027_g_ItemNum )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end
