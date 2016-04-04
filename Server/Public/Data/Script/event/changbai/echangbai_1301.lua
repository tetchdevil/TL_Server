--��������������3����
--׽�Բ�
--MisDescBegin
--�ű���
x211301_g_ScriptId = 211301

--�����
x211301_g_MissionId = 561

--Ŀ��NPC
x211301_g_Name	="����أ��"

--�������
x211301_g_MissionKind = 33

--����ȼ�
x211301_g_MissionLevel = 80

--�Ƿ��Ǿ�Ӣ����
x211301_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������*************
--�����Ƿ��Ѿ����
x211301_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�Զ��壬�ҵ�3����
x211301_g_Custom={{id="�ҵ��������벻",num=1},{id="�ҵ�����ճû��",num=1},{id="�ҵ������ӱ�",num=1}}
--�����Ƕ�̬����************************************
--������
x211301_g_MissionName="׽�Բ�"
x211301_g_MissionInfo="�ҵ�3����:�������벻,����ճû��,�����ӱ�"		--��������
x211301_g_MissionTarget="�ҵ�3����:�������벻,����ճû��,�����ӱ�"		--����Ŀ��
x211301_g_ContinueInfo="���ҵ�����3����ô?"		--δ��������npc�Ի�
x211301_g_MissionComplete="̫��л�ˣ�����ô����ҵ������ˣ�"		--�ύʱnpc�Ļ�
x211301_g_MoneyBonus=100
x211301_g_ItemBonus={{id=10105001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x211301_OnDefaultEvent( sceneId, selfId, targetId )

    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x211301_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x211301_g_MissionId) > 0)  then
		
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x211301_g_MissionName)
			AddText(sceneId,x211301_g_ContinueInfo)
		EndEvent( )
		bDone = x211301_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x211301_g_ScriptId,x211301_g_MissionId,bDone)
		
	--���������������
    elseif x211301_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,x211301_g_MissionName)
		AddText(sceneId,x211301_g_MissionInfo)
		AddText(sceneId,"#{M_MUBIAO}")
		AddText(sceneId,x211301_g_MissionTarget)
		AddText(sceneId,"#{M_SHOUHUO}")
		AddMoneyBonus( sceneId, x211301_g_MoneyBonus )
		for i, item in x211301_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x211301_g_ScriptId,x211301_g_MissionId)
    end
end

--**********************************
--�о��¼�
--**********************************
function x211301_OnEnumerate( sceneId, selfId, targetId )
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x211301_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x211301_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x211301_g_Name then
			AddNumText(sceneId, x211301_g_ScriptId,x211301_g_MissionName);
		end
    --���������������
    elseif x211301_CheckAccept(sceneId,selfId) > 0 then
			AddNumText(sceneId,x211301_g_ScriptId,x211301_g_MissionName);
    end
end

--**********************************
--����������
--**********************************
function x211301_CheckAccept( sceneId, selfId )
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
function x211301_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x211301_g_MissionId, x211301_g_ScriptId, 0, 0, 0 )
	misIndex = GetMissionIndexByID(sceneId,selfId,x211301_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0(���״̬��
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0���������벻��
	SetMissionByIndex(sceneId,selfId,misIndex,2,0)						--�������кŰ���������ĵ�2λ��0������ճû�ȣ�
	SetMissionByIndex(sceneId,selfId,misIndex,3,0)						--�������кŰ���������ĵ�3λ��0�������ӱ���
end

--**********************************
--����
--**********************************
function x211301_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x211301_g_MissionId )
end

--**********************************
--����
--**********************************
function x211301_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x211301_g_MissionName)
		AddText(sceneId,x211301_g_MissionComplete)
		AddMoneyBonus( sceneId, x211301_g_MoneyBonus )
		for i, item in x211301_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x211301_g_ScriptId,x211301_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x211301_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x211301_g_MissionId)			--�õ���������к�
	num2 = GetMissionParam(sceneId,selfId,misIndex,1)
	num3 = GetMissionParam(sceneId,selfId,misIndex,2)
	num4 = GetMissionParam(sceneId,selfId,misIndex,3)
	if num2 == 1 and num3 == 1 and num4 ==1 then
		return 1
	else
		return 0
	end
end

--**********************************
--�ύ
--**********************************
function x211301_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x211301_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x211301_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddMoney(sceneId,selfId,x211301_g_MoneyBonus );
			ret = DelMission( sceneId,selfId,  x211301_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId,selfId,  x211301_g_MissionId )
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
function x211301_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x211301_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x211301_OnItemChanged( sceneId, selfId, itemdataId )
end







