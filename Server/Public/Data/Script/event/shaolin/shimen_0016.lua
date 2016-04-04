--����������
--Ѱ��
--MisDescBegin
--�ű���
x220016_g_ScriptId = 220016

--ǰ������
--g_MissionIdPre =

--�����
x220016_g_MissionId = 1060

--����Ŀ��npc
x220016_g_Name	="�۷�"

--�������
x220016_g_MissionKind = 20

--����ȼ�
x220016_g_MissionLevel = 10

--�Ƿ��Ǿ�Ӣ����
x220016_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x220016_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������
x220016_g_MissionRound	= 11			--��¼ѭ����������ĵ�11����
--�����Ƕ�̬**************************************************************

--���������һλ�����洢����õ��Ľű���

--�����ı�����
x220016_g_MissionName="��������������"
x220016_g_MissionInfo="��һ�����������������͸������"  --��������
x220016_g_MissionTarget="�Ѵ��������͸������"		--����Ŀ��
x220016_g_ContinueInfo="��������͵�����"		--δ��������npc�Ի�
x220016_g_MissionComplete="���������ֵ���"					--�������npc˵���Ļ�

--MisDescEnd

--**********************************
--������ں���
--**********************************
function x220016_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x220016_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x220016_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x220016_g_MissionName)
			AddText(sceneId,x220016_g_ContinueInfo)
			--for i, item in g_DemandItem do
			--	AddItemDemand( sceneId, item.id, item.num )
			--end
			AddMoneyBonus( sceneId, g_MoneyBonus )
		EndEvent()
		bDone = x220016_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x220016_g_ScriptId,x220016_g_MissionId,bDone)		
    --���������������
    elseif x220016_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x220016_g_MissionName)
			AddText(sceneId,x220016_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x220016_g_MissionTarget)
			--for i, item in g_ItemBonus do
			--	AddItemBonus( sceneId, item.id, item.num )
			--end
			--for i, item in g_RadioItemBonus do
			--	AddRadioItemBonus( sceneId, item.id, item.num )
			--end
			AddMoneyBonus( sceneId, g_MoneyBonus )
			EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x220016_g_ScriptId,x220016_g_MissionId)
    end
end

--**********************************
--�о��¼�
--**********************************
function x220016_OnEnumerate( sceneId, selfId, targetId )
    --����ѽӴ�����
    if IsHaveMission(sceneId,selfId,x220016_g_MissionId) > 0 then
		AddNumText(sceneId,x220016_g_ScriptId,x220016_g_MissionName,2,-1);
		--���������������
	elseif x220016_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x220016_g_ScriptId,x220016_g_MissionName,1,-1);
	end
end

--**********************************
--����������
--**********************************
function x220016_CheckAccept( sceneId, selfId )
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
function x220016_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x220016_g_MissionId, x220016_g_ScriptId, 0, 0, 0 )
	misIndex = GetMissionIndexByID(sceneId,selfId,x220016_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0 (����������)
	SetMissionByIndex(sceneId,selfId,misIndex,1,x220016_g_ScriptId)						--�������кŰ���������ĵ�1λ��Ϊ����ű���
	SetMissionByIndex(sceneId,selfId,misIndex,3,1)						--�������кŰ���������ĵ�3λ��Ϊ����Ŀ��NPC��ţ�1Ϊ�����
	--�õ�����
	x220016_g_MissionRound = GetMissionData(sceneId,selfId,11)
	--��������1
	x220016_g_MissionRound = x220016_g_MissionRound + 1
	if	x220016_g_MissionRound >= 21 then
		SetMissionData(sceneId, selfId, 11, 1)
	else
		SetMissionData(sceneId, selfId, 11, x220016_g_MissionRound)
	end
	--���������ϵĵ����Ƿ��Ѿ������������������Ѿ����㣬����������ı�����Ϊ0
	--if x220016_CheckSubmit( sceneId, selfId ) == 1 then
	--	SetMissionByIndex(sceneId,selfId,misIndex,0,1)					--��������ɱ�־��Ϊ1
	--end
	--��ʾ���ݸ�������Ѿ�����������
	BeginEvent(sceneId)
		AddText(sceneId,x220016_g_MissionInfo)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
	Msg2Player(  sceneId, selfId,"#Y��������������ʦ������",MSG2PLAYER_PARA )
end

--**********************************
--����
--**********************************
function x220016_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x220016_g_MissionId )
	SetMissionData(sceneId,selfId,11,0)	--������0
end

--**********************************
--����
--**********************************
function x220016_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x220016_g_MissionName)
		AddText(sceneId,x220016_g_MissionComplete)
		AddMoneyBonus( sceneId, g_MoneyBonus )
		--for i, item in g_ItemBonus do
		--	AddItemBonus( sceneId, item.id, item.num )
		--end
		--for i, item in g_RadioItemBonus do
		--	AddRadioItemBonus( sceneId, item.id, item.num )
		--end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x220016_g_ScriptId,x220016_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x220016_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x220016_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,0)
    if num == 1 then
		return 1
	end
	return 0
end

--**********************************
--�ύ
--**********************************
function x220016_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	local Level = GetLevel( sceneId, selfId)	
	if x220016_CheckSubmit( sceneId, selfId, selectRadioId ) then
		DelMission( sceneId, selfId, x220016_g_MissionId )
		MissionCom( sceneId,selfId, x220016_g_MissionId )
		--�õ�����
		x220016_g_MissionRound = GetMissionData(sceneId,selfId,11)
		--���㽱�����������
		if mod(x220016_g_MissionRound,10) == 0 then
			x220016_g_Exp = Level * 10 * 10										--�ȼ�+�����������ܾ�����ڳ�����Ӱ��
		else
			x220016_g_Exp = Level * mod(x220016_g_MissionRound,10) * 10
		end
		if	floor((x220016_g_MissionRound - 1) / 10) >=1  then
			x220016_g_Exp = x220016_g_Exp +50												--11~20������ÿ����������50�㾭��
		end
		--���Ӿ���ֵ
		AddExp( sceneId,selfId,x220016_g_Exp)
		AddMoney( sceneId, selfId, x220016_g_Exp)	
		--��ʾ�Ի���
		BeginEvent(sceneId)
			AddText(sceneId,"��ϲ����������񣬸���"..x220016_g_Exp.."�㾭���"..x220016_g_Exp.."Ǯ")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--ɱ����������
--**********************************
function x220016_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x220016_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x220016_OnItemChanged( sceneId, selfId, itemdataId )
end