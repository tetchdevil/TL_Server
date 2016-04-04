--����������
--����
--MisDescBegin
--�ű���
x230012_g_ScriptId = 230012

--ǰ������
--g_MissionIdPre =

--�����
x230012_g_MissionId = 4011

--����Ŀ��npc
x230012_g_Name	="�����ʦ"

--�������
x230012_g_MissionKind = 1

--����ȼ�
x230012_g_MissionLevel = 10

--�Ƿ��Ǿ�Ӣ����
x230012_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x230012_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������
x230012_g_MissionRound	= 10			--��¼ѭ����������ĵ�10����

--�����Ƕ�̬**************************************************************

--���������һλ�����洢����õ��Ľű���

--�����ı�����
x230012_g_MissionName="����������"
x230012_g_MissionInfo="  �����ӷ�...#r  ������Ҫ����ȥ������н����ս�������[269,88]��"  --��������
x230012_g_MissionTarget="�������ʦ��ͨ��֡�#r"		--����Ŀ��
x230012_g_ContinueInfo="�����ӷ�...#r�����ɷ��ͨ����֣�"		--δ��������npc�Ի�
x230012_g_MissionComplete="�������գ�����Ϊ�˺�ˬ���ذ����գ�����Ǯ�ƣ��պ����һ����Ϊ��"					--�������npc˵���Ļ�

--������


--MisDescEnd
--**********************************
--������ں���
--**********************************
function x230012_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x230012_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x230012_g_MissionId) > 0 then
			--���������������Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x230012_g_MissionName)
				AddText(sceneId,x230012_g_ContinueInfo)
				--for i, item in g_DemandItem do
				--	AddItemDemand( sceneId, item.id, item.num )
				--end
			EndEvent( )
			bDone = x230012_CheckSubmit( sceneId, selfId )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x230012_g_ScriptId,x230012_g_MissionId,bDone)
	--���������������
	elseif x230012_CheckAccept(sceneId,selfId) > 0 then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x230012_g_MissionName)
				AddText(sceneId,x230012_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x230012_g_MissionTarget)
				--AddMoneyBonus( sceneId, g_MoneyBonus )
				--for i, item in g_ItemBonus do
				--	AddItemBonus( sceneId, item.id, item.num )
				--end
				--for i, item in g_RadioItemBonus do
				--	AddRadioItemBonus( sceneId, item.id, item.num )
				--end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x230012_g_ScriptId,x230012_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x230012_OnEnumerate( sceneId, selfId, targetId )
    --����ѽӴ�����
    if IsHaveMission(sceneId,selfId,x230012_g_MissionId) > 0 then
		AddNumText(sceneId,x230012_g_ScriptId,x230012_g_MissionName);
    --���������������
    elseif x230012_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x230012_g_ScriptId,x230012_g_MissionName);
    end
end

--**********************************
--����������
--**********************************
function x230012_CheckAccept( sceneId, selfId )
	--��Ҫ10�����ܽ�
	if GetLevel( sceneId, selfId ) >= 10 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x230012_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x230012_g_MissionId, x230012_g_ScriptId, 0, 0, 1 )
	misIndex = GetMissionIndexByID(sceneId,selfId,x230012_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0 (����������)
	SetMissionByIndex(sceneId,selfId,misIndex,7,1)						--�������кŰ���������ĵ�7λ��1 (����������)
	SetMissionByIndex(sceneId,selfId,misIndex,1,x230012_g_ScriptId)						--�������кŰ���������ĵ�1λ��Ϊ����ű���
	--�õ�����
	x230012_g_MissionRound = GetMissionData(sceneId,selfId,10)
	--��������1
	x230012_g_MissionRound = x230012_g_MissionRound + 1
	if	x230012_g_MissionRound >= 11 then
		SetMissionData(sceneId, selfId, 10, 1)
	else
		SetMissionData(sceneId, selfId, 10, x230012_g_MissionRound)
	end
	--���������ϵĵ����Ƿ��Ѿ������������������Ѿ����㣬����������ı�����Ϊ0
	if x230012_CheckSubmit( sceneId, selfId ) == 1 then
		SetMissionByIndex(sceneId,selfId,misIndex,0,1)					--��������ɱ�־��Ϊ1
	end
	--��ʾ���ݸ�������Ѿ�����������
	BeginEvent(sceneId)
		AddText(sceneId,x230012_g_MissionInfo)
		AddText(sceneId,"#r        ����������񣺰���������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--����
--**********************************
function x230012_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x230012_g_MissionId )
	SetMissionData(sceneId,selfId,10,0)	--������0
end

--**********************************
--����
--**********************************
function x230012_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x230012_g_MissionName)
    AddText(sceneId,x230012_g_MissionComplete)
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x230012_g_ScriptId,x230012_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x230012_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x230012_g_MissionId)			--�õ���������к�
	if	GetMissionParam( sceneId, selfId, misIndex, 0)	== 1  then
		return 1
	end
	return  0
end

--**********************************
--�ύ
--**********************************
function x230012_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x230012_CheckSubmit( sceneId, selfId, selectRadioId ) then
		ret = DelMission( sceneId, selfId, x230012_g_MissionId )
		if ret > 0 then
			MissionCom( sceneId,selfId, x230012_g_MissionId )
			--�۳�������Ʒ
			--for i, item in g_DemandItem do
			--	DelItem( sceneId, selfId, item.id, item.num )
			--end
			--�õ�����
			x230012_g_MissionRound = GetMissionData(sceneId,selfId,10)
			--���㽱�����������
			if mod(x230012_g_MissionRound,10) == 0 then
				x230012_g_Exp = Level * 10 * 10										--�ȼ�+�����������ܾ�����ڳ�����Ӱ��
			else
				x230012_g_Exp = Level * mod(x230012_g_MissionRound,10) * 10
			end
			if	floor((x230012_g_MissionRound - 1) / 10) >=1  then
				x230012_g_Exp = x230012_g_Exp +50												--11~20������ÿ����������50�㾭��
			end
			--���Ӿ���ֵ
			AddExp( sceneId,selfId,x230012_g_Exp)
			AddMoney( sceneId, selfId, x230012_g_Exp)	
			--��ʾ�Ի���
			BeginEvent(sceneId)
				AddText(sceneId,"��ϲ����������񣬸���"..x230012_g_Exp.."�㾭���"..x230012_g_Exp.."Ǯ")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x230012_OnKillObject( sceneId, selfId, objdataId ,objId)--������˼�������š����objId�������λ�úš�����objId
end

--**********************************
--���������¼�
--**********************************
function x230012_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x230012_OnItemChanged( sceneId, selfId, itemdataId )
end
