--����������
--׽��
--MisDescBegin
--�ű���
x220019_g_ScriptId = 220019

--ǰ������
--g_MissionIdPre =

--�����
x220019_g_MissionId = 1060

--����Ŀ��npc
x220019_g_Name	="�۷�"

--�������
x220019_g_MissionKind = 20

--����ȼ�
x220019_g_MissionLevel = 10

--�Ƿ��Ǿ�Ӣ����
x220019_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x220019_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������Ҫ�õ�����Ʒ
--g_DemandItem={{id=10100001,num=1}}		--�ӱ����м���

--������
x220019_g_MissionRound	= 11			--��¼ѭ����������ĵ�10����
--�����Ƕ�̬**************************************************************

--���������һλ�����洢����õ��Ľű���

--�����ı�����
x220019_g_MissionName="��������������"
x220019_g_MissionInfo="��Ҫһֻ��è������׽��"  --��������
x220019_g_MissionTarget="��۷�׽��һֻ��è��"		--����Ŀ��
x220019_g_ContinueInfo="��Ѳ�è��������"		--δ��������npc�Ի�
x220019_g_MissionComplete="���������ֵ���"					--�������npc˵���Ļ�

x220019_g_PetDataID=3000	--�������ı��

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x220019_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	if IsHaveMission(sceneId,selfId,x220019_g_MissionId) > 0 then	--����ѽӴ�����
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x220019_g_MissionName)
			AddText(sceneId,x220019_g_ContinueInfo)
		EndEvent( )
		bDone = x220019_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x220019_g_ScriptId,x220019_g_MissionId,bDone)
	elseif x220019_CheckAccept(sceneId,selfId) > 0 then		--���������������
		--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x220019_g_MissionName)
				AddText(sceneId,x220019_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x220019_g_MissionTarget)
				EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x220019_g_ScriptId,x220019_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x220019_OnEnumerate( sceneId, selfId, targetId )
    --����ѽӴ�����
    if IsHaveMission(sceneId,selfId,x220019_g_MissionId) > 0 then
		AddNumText(sceneId,x220019_g_ScriptId,x220019_g_MissionName);
    --���������������
    elseif x220019_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x220019_g_ScriptId,x220019_g_MissionName);
    end
end

--**********************************
--����������
--**********************************
function x220019_CheckAccept( sceneId, selfId )
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
function x220019_OnAccept( sceneId, selfId )
	--������������б�
	AddMissionEx( sceneId,selfId, x220019_g_MissionId, x220019_g_ScriptId )		--�������
	SetMissionEvent(sceneId,selfId, x220019_g_MissionId,3)	--���������¼���3��ʾ����仯�¼�
	--������������б�
	misIndex = GetMissionIndexByID(sceneId,selfId,x220019_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0 (����������)
	SetMissionByIndex(sceneId,selfId,misIndex,1,x220019_g_ScriptId)						--�������кŰ���������ĵ�1λ��Ϊ����ű���
	--�õ�����
	x220019_g_MissionRound = GetMissionData(sceneId,selfId,11)
	--��������1
	x220019_g_MissionRound = x220019_g_MissionRound + 1
	if	x220019_g_MissionRound >= 21 then
		SetMissionData(sceneId, selfId, 11, 1)
	else
		SetMissionData(sceneId, selfId, 11, x220019_g_MissionRound)
	end
	--���������ϵĵ����Ƿ��Ѿ������������������Ѿ����㣬����������ı�����Ϊ0
	if x220019_CheckSubmit( sceneId, selfId ) == 1 then
		SetMissionByIndex(sceneId,selfId,misIndex,0,1)					--��������ɱ�־��Ϊ1
	end
	--��ʾ���ݸ�������Ѿ�����������
	BeginEvent(sceneId)
		AddText(sceneId,x220019_g_MissionInfo)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
	Msg2Player(  sceneId, selfId,"#Y��������������ʦ������",MSG2PLAYER_PARA )
end

--**********************************
--����
--**********************************
function x220019_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x220019_g_MissionId )
	SetMissionData(sceneId,selfId,11,0)	--������0
end

--**********************************
--����
--**********************************
function x220019_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x220019_g_MissionName)
    AddText(sceneId,x220019_g_MissionComplete)
    --AddMoneyBonus( sceneId, g_MoneyBonus )
    --for i, item in g_ItemBonus do
	--	AddItemBonus( sceneId, item.id, item.num )
	--end
    --for i, item in g_RadioItemBonus do
	--	AddRadioItemBonus( sceneId, item.id, item.num )
	--end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x220019_g_ScriptId,x220019_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x220019_CheckSubmit( sceneId, selfId )
	petcount = LuaFnGetPetCount(sceneId, selfId) --ȡ�ó�������
	for	i=0,petcount-1 do
		petdataid = LuaFnGetPet_DataID(sceneId, selfId, i) --ȡ�ó�����
		if petdataid==x220019_g_PetDataID then
			misIndex = GetMissionIndexByID(sceneId,selfId,x220019_g_MissionId)	--�õ���������к�
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)	--�������кŰ���������ĵ�0λ��1
			bDone = GetMissionParam(sceneId,selfId,misIndex,0)	--�������кŰ���������ĵ�0λ��1
			return bDone
		end
	end
end

--**********************************
--�ύ
--**********************************
function x220019_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	local Level = GetLevel( sceneId, selfId)	
	if x220019_CheckSubmit( sceneId, selfId )>0 then
		petcount = LuaFnGetPetCount(sceneId, selfId) --ȡ�ó�������
		for	i=0,petcount-1 do
			petdataid = LuaFnGetPet_DataID(sceneId, selfId, i) --ȡ�ó�����
			if petdataid==x220019_g_PetDataID then
				ret0 = LuaFnDeletePet(sceneId, selfId, i)
				ret1 = DelMission( sceneId, selfId, x220019_g_MissionId )
				if ret0>0 and ret1>0 then
					DelMission( sceneId, selfId, x220019_g_MissionId )
					MissionCom( sceneId,selfId, x220019_g_MissionId )
					--�õ�����
					x220019_g_MissionRound = GetMissionData(sceneId,selfId,11)
					--���㽱�����������
					if mod(x220019_g_MissionRound,10) == 0 then
						x220019_g_Exp = Level * 10 * 10										--�ȼ�+�����������ܾ�����ڳ�����Ӱ��
					else
						x220019_g_Exp = Level * mod(x220019_g_MissionRound,10) * 10
					end
					if	floor((x220019_g_MissionRound - 1) / 10) >=1  then
						x220019_g_Exp = x220019_g_Exp +50												--11~20������ÿ����������50�㾭��
					end
					--���Ӿ���ֵ
					AddExp( sceneId,selfId,x220019_g_Exp)
					AddMoney( sceneId, selfId, x220019_g_Exp)	
					--��ʾ�Ի���
					BeginEvent(sceneId)
						AddText(sceneId,"��ϲ����������񣬸���"..x220019_g_Exp.."�㾭���"..x220019_g_Exp.."Ǯ")
					EndEvent(sceneId)
					DispatchEventList(sceneId,selfId,targetId)
				end
			end
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x220019_OnKillObject( sceneId, selfId, objdataId, objId )
end

--**********************************
--���������¼�
--**********************************
function x220019_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x220019_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--����ı�
--**********************************
function x220019_OnPetChanged( sceneId, selfId, petdataId )
	if petdataId==x220019_g_PetDataID then --���������
		misIndex = GetMissionIndexByID(sceneId,selfId,x220019_g_MissionId)	--�õ���������к�
		SetMissionByIndex(sceneId,selfId,misIndex,0,1)	--�������кŰ���������ĵ�0λ��1
		BeginEvent(sceneId)
			strText = "׽�����������������!"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end

--**********************************
--����ύ����Ʒ������
--**********************************
function x220019_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
end

