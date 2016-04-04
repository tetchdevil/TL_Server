--����������
--Ѱ��
--MisDescBegin
--�ű���
x230008_g_ScriptId = 230008

--ǰ������
--g_MissionIdPre =

--�����
x230008_g_MissionId = 4011

--����Ŀ��npc
x230008_g_Name	="�����ʦ"

--�������
x230008_g_MissionKind = 1

--����ȼ�
x230008_g_MissionLevel = 10

--�Ƿ��Ǿ�Ӣ����
x230008_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x230008_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������
x230008_g_MissionRound	= 10			--��¼ѭ����������ĵ�10����

--������Ҫ�õ�����Ʒ
x230008_g_DemandItem={{id=30001002,num=1}}		--�ӱ����м���
--�����Ƕ�̬**************************************************************

--���������һλ�����洢����õ��Ľű���

--�����ı�����
x230008_g_MissionName="����������"
x230008_g_MissionInfo="  �����ӷ�...#r  ������Ҫ��Ѫɢ����������ƶɮ��һ������"  --��������
x230008_g_MissionTarget="�������ʦ������Ѫɢ��#r"		--����Ŀ��
x230008_g_ContinueInfo="  �����ӷ�...#r  �����ɷ�ѻ�Ѫɢ�����ˣ�"		--δ��������npc�Ի�
x230008_g_MissionComplete="�������գ�����Ϊ�˺�ˬ���ذ����գ�����Ǯ�ƣ��պ����һ����Ϊ��"					--�������npc˵���Ļ�

--������


--MisDescEnd
--**********************************
--������ں���
--**********************************
function x230008_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x230008_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x230008_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x230008_g_MissionName)
			AddText(sceneId,x230008_g_ContinueInfo)
			for i, item in x230008_g_DemandItem do
				AddItemDemand( sceneId, item.id, item.num )
			end
		EndEvent( )
		bDone = x230008_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x230008_g_ScriptId,x230008_g_MissionId,bDone)
	--���������������
	elseif x230008_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x230008_g_MissionName)
			AddText(sceneId,x230008_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x230008_g_MissionTarget)
			--AddMoneyBonus( sceneId, g_MoneyBonus )
			--for i, item in g_ItemBonus do
			--	AddItemBonus( sceneId, item.id, item.num )
			--end
			--for i, item in g_RadioItemBonus do
			--	AddRadioItemBonus( sceneId, item.id, item.num )
			--end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x230008_g_ScriptId,x230008_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x230008_OnEnumerate( sceneId, selfId, targetId )
    --����ѽӴ�����
    if IsHaveMission(sceneId,selfId,x230008_g_MissionId) > 0 then
		AddNumText(sceneId,x230008_g_ScriptId,x230008_g_MissionName);
    --���������������
    elseif x230008_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x230008_g_ScriptId,x230008_g_MissionName);
    end
end

--**********************************
--����������
--**********************************
function x230008_CheckAccept( sceneId, selfId )
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
function x230008_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x230008_g_MissionId, x230008_g_ScriptId, 0, 0, 1 )
	misIndex = GetMissionIndexByID(sceneId,selfId,x230008_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0 (����������)
	SetMissionByIndex(sceneId,selfId,misIndex,1,x230008_g_ScriptId)						--�������кŰ���������ĵ�1λ��Ϊ����ű���
	--�õ�����
	x230008_g_MissionRound = GetMissionData(sceneId,selfId,10)
	--��������1
	x230008_g_MissionRound = x230008_g_MissionRound + 1
	if	x230008_g_MissionRound >= 11 then
		SetMissionData(sceneId, selfId, 10, 1)
	else
		SetMissionData(sceneId, selfId, 10, x230008_g_MissionRound)
	end
	--���������ϵĵ����Ƿ��Ѿ������������������Ѿ����㣬����������ı�����Ϊ0
	if x230008_CheckSubmit( sceneId, selfId ) == 1 then
		SetMissionByIndex(sceneId,selfId,misIndex,0,1)					--��������ɱ�־��Ϊ1
	end
	--��ʾ���ݸ�������Ѿ�����������
	BeginEvent(sceneId)
		AddText(sceneId,x230008_g_MissionInfo)
		AddText(sceneId,"#r        ����������񣺰���������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--����
--**********************************
function x230008_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x230008_g_MissionId )
	SetMissionData(sceneId,selfId,10,0)	--������0
end

--**********************************
--����
--**********************************
function x230008_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x230008_g_MissionName)
    AddText(sceneId,x230008_g_MissionComplete)
    --AddMoneyBonus( sceneId, g_MoneyBonus )
    --for i, item in g_ItemBonus do
	--	AddItemBonus( sceneId, item.id, item.num )
	--end
    --for i, item in g_RadioItemBonus do
	--	AddRadioItemBonus( sceneId, item.id, item.num )
	--end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x230008_g_ScriptId,x230008_g_MissionId)
	
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x230008_CheckSubmit( sceneId, selfId )
	for i, item in x230008_g_DemandItem do
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
function x230008_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x230008_CheckSubmit( sceneId, selfId, selectRadioId ) then
		--�۳�������Ʒ
		for i, item in x230008_g_DemandItem do
			ret = DelItem( sceneId, selfId, item.id, item.num )
		end
		if	ret > 0 then
			DelMission( sceneId, selfId, x230008_g_MissionId )
			MissionCom( sceneId,selfId, x230008_g_MissionId )
			--�õ�����
			x230008_g_MissionRound = GetMissionData(sceneId,selfId,10)
			--���㽱�����������
			if mod(x230008_g_MissionRound,10) == 0 then
				x230008_g_Exp = Level * 10 * 10										--�ȼ�+�����������ܾ�����ڳ�����Ӱ��
			else
				x230008_g_Exp = Level * mod(x230008_g_MissionRound,10) * 10
			end
			if	floor((x230008_g_MissionRound - 1) / 10) >=1  then
				x230008_g_Exp = x230008_g_Exp +50												--11~20������ÿ����������50�㾭��
			end
			--���Ӿ���ֵ
			AddExp( sceneId,selfId,x230008_g_Exp)
			AddMoney( sceneId, selfId, x230008_g_Exp)	
			--��ʾ�Ի���
			BeginEvent(sceneId)
				AddText(sceneId,"��ϲ����������񣬸���"..x230008_g_Exp.."�㾭���"..x230008_g_Exp.."Ǯ")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else
			BeginEvent(sceneId)
				AddText(sceneId,"�����������ɣ���Ļ�Ѫɢ��ôͻȻ�����ˣ�")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x230008_OnKillObject( sceneId, selfId, objdataId ,objId)--������˼�������š����objId�������λ�úš�����objId
end

--**********************************
--���������¼�
--**********************************
function x230008_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x230008_OnItemChanged( sceneId, selfId, itemdataId )
	if itemdataId == x230008_g_DemandItem[1].id then
		x230008_g_ItemNum = GetItemCount(sceneId,selfId,x230008_g_DemandItem[1].id)		--��⵱ǰ���������Ʒ1ӵ�е�����
		if x230008_g_ItemNum < x230008_g_DemandItem[1].num then
			BeginEvent(sceneId)
				strText = format("�ѵõ���Ѫɢ%d/1", x230008_g_ItemNum )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			--ȡ�����������ֵ
			misIndex = GetMissionIndexByID(sceneId,selfId,x230008_g_MissionId)
			num = GetMissionParam(sceneId,selfId,misIndex,0)
			if num == 1 then	--�������״̬��1,˵��������ɵ�������ְ���Ʒ���ٵ��������״̬
				SetMissionByIndex(sceneId,selfId,misIndex,0,0)
			end
		elseif x230008_g_ItemNum == x230008_g_DemandItem[1].num then
			misIndex = GetMissionIndexByID(sceneId,selfId,x230008_g_MissionId)
			num = GetMissionParam(sceneId,selfId,misIndex,0)
			--����Ʒ�����ﵽҪ�����ʱ������ɱ�־��Ȼ��0,��������־���ó�1
			if num == 0 then
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			end
			--��ʾ�õ���Ʒ����
			BeginEvent(sceneId)
				strText = format("�ѵõ���Ѫɢ%d/1", x230008_g_ItemNum )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end
