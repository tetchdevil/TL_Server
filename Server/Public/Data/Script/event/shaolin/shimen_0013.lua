--����������
--Ѱ��
--MisDescBegin
--�ű���
x220013_g_ScriptId = 220013

--ǰ������
--g_MissionIdPre =

--�����
x220013_g_MissionId = 1060

--����Ŀ��npc
x220013_g_Name	="�۷�"

--������߱��
x220013_g_ItemId = 40002115

--���������������
x220013_g_ItemNeedNum = 1

--�������
x220013_g_MissionKind = 20

--����ȼ�
x220013_g_MissionLevel = 10

--�Ƿ��Ǿ�Ӣ����
x220013_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x220013_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������Ҫ�õ�����Ʒ
x220013_g_DemandItem={{id=40002115,num=1}}		--�ӱ����м���

--������
x220013_g_MissionRound	= 11			--��¼ѭ����������ĵ�10����
--�����Ƕ�̬**************************************************************

--���������һλ�����洢����õ��Ľű���

--�����ı�����
x220013_g_MissionName="��������������"
x220013_g_MissionInfo="���Ұ�������͸���̰"  --��������
x220013_g_MissionTarget="��۷����Ÿ���̰"		--����Ŀ��
x220013_g_ContinueInfo="������͵�����"		--δ��������npc�Ի�
x220013_g_MissionComplete="���������ֵ���"					--�������npc˵���Ļ�

--MisDescEnd

--**********************************
--������ں���
--**********************************
function x220013_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x220013_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x220013_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x220013_g_MissionName)
			AddText(sceneId,x220013_g_ContinueInfo)
			--for i, item in x220013_g_DemandItem do
			--	AddItemDemand( sceneId, item.id, item.num )
			--end
			AddMoneyBonus( sceneId, g_MoneyBonus )
		EndEvent()
		bDone = x220013_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x220013_g_ScriptId,x220013_g_MissionId,bDone)		
    --���������������
    elseif x220013_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x220013_g_MissionName)
			AddText(sceneId,x220013_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x220013_g_MissionTarget)
			--for i, item in g_ItemBonus do
			--	AddItemBonus( sceneId, item.id, item.num )
			--end
			--for i, item in g_RadioItemBonus do
			--	AddRadioItemBonus( sceneId, item.id, item.num )
			--end
			AddMoneyBonus( sceneId, g_MoneyBonus )
			EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x220013_g_ScriptId,x220013_g_MissionId)
    end
end

--**********************************
--�о��¼�
--**********************************
function x220013_OnEnumerate( sceneId, selfId, targetId )
    --����ѽӴ�����
    if IsHaveMission(sceneId,selfId,x220013_g_MissionId) > 0 then
		AddNumText(sceneId,x220013_g_ScriptId,x220013_g_MissionName,2,-1);
		--���������������
	elseif x220013_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x220013_g_ScriptId,x220013_g_MissionName,1,-1);
	end
end

--**********************************
--����������
--**********************************
function x220013_CheckAccept( sceneId, selfId )
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
function x220013_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x220013_g_MissionId, x220013_g_ScriptId, 0, 0, 0 )
	BeginAddItem(sceneId)
		--����ż�����Ʒ
		AddItem( sceneId,x220013_g_ItemId, x220013_g_ItemNeedNum )
	ret = EndAddItem(sceneId,selfId)
		--���������
	if ret > 0 then
		misIndex = GetMissionIndexByID(sceneId,selfId,x220013_g_MissionId)			--�õ���������к�
		SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0 (����������)
		SetMissionByIndex(sceneId,selfId,misIndex,1,x220013_g_ScriptId)						--�������кŰ���������ĵ�1λ��Ϊ����ű���
		SetMissionByIndex(sceneId,selfId,misIndex,2,1)						--�������кŰ���������ĵ�2λ��Ϊ����Ŀ��NPC��ţ�1Ϊ��̰
		AddItemListToHuman(sceneId,selfId)
		--�õ�����
		x220013_g_MissionRound = GetMissionData(sceneId,selfId,11)
		--��������1
		x220013_g_MissionRound = x220013_g_MissionRound + 1
		if	x220013_g_MissionRound >= 21 then
			SetMissionData(sceneId, selfId, 11, 1)
		else
			SetMissionData(sceneId, selfId, 11, x220013_g_MissionRound)
		end
		--���������ϵĵ����Ƿ��Ѿ������������������Ѿ����㣬����������ı�����Ϊ0
		--if x220013_CheckSubmit( sceneId, selfId ) == 1 then
		--	SetMissionByIndex(sceneId,selfId,misIndex,0,1)					--��������ɱ�־��Ϊ1
		--end
		--��ʾ���ݸ�������Ѿ�����������
		BeginEvent(sceneId)
			AddText(sceneId,x220013_g_MissionInfo)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		Msg2Player(  sceneId, selfId,"#Y��������������ʦ������",MSG2PLAYER_PARA )
	else
		--������û�мӳɹ�
		BeginEvent(sceneId)
			strText = "��������,�޷���������"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end

--**********************************
--����
--**********************************
function x220013_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x220013_g_MissionId )
	for i, item in x220013_g_DemandItem do
		ret = DelItem( sceneId, selfId, item.id, item.num )
	end
	SetMissionData(sceneId,selfId,11,0)	--������0
end

--**********************************
--����
--**********************************
function x220013_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x220013_g_MissionName)
		AddText(sceneId,x220013_g_MissionComplete)
		AddMoneyBonus( sceneId, g_MoneyBonus )
		--for i, item in g_ItemBonus do
		--	AddItemBonus( sceneId, item.id, item.num )
		--end
		--for i, item in g_RadioItemBonus do
		--	AddRadioItemBonus( sceneId, item.id, item.num )
		--end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x220013_g_ScriptId,x220013_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x220013_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x220013_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,0)
    if num == 1 then
		return 1
	end
	return 0
end

--**********************************
--�ύ
--**********************************
function x220013_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	local Level = GetLevel( sceneId, selfId)	
	if x220013_CheckSubmit( sceneId, selfId, selectRadioId ) then
		DelMission( sceneId, selfId, x220013_g_MissionId )
		MissionCom( sceneId,selfId, x220013_g_MissionId )
		--�õ�����
		x220013_g_MissionRound = GetMissionData(sceneId,selfId,11)
		--���㽱�����������
		if mod(x220013_g_MissionRound,10) == 0 then
			x220013_g_Exp = Level * 10 * 10										--�ȼ�+�����������ܾ�����ڳ�����Ӱ��
		else
			x220013_g_Exp = Level * mod(x220013_g_MissionRound,10) * 10
		end
		if	floor((x220013_g_MissionRound - 1) / 10) >=1  then
			x220013_g_Exp = x220013_g_Exp +50												--11~20������ÿ����������50�㾭��
		end
		--���Ӿ���ֵ
		AddExp( sceneId,selfId,x220013_g_Exp)
		AddMoney( sceneId, selfId, x220013_g_Exp)	
		--��ʾ�Ի���
		BeginEvent(sceneId)
			AddText(sceneId,"��ϲ����������񣬸���"..x220013_g_Exp.."�㾭���"..x220013_g_Exp.."Ǯ")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--ɱ����������
--**********************************
function x220013_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x220013_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x220013_OnItemChanged( sceneId, selfId, itemdataId )
end
