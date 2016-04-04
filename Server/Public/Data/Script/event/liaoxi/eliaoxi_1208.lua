--��������
--��ʿ�ļ���
--MisDescBegin
--�ű���
x211208_g_ScriptId = 211208

--ǰ������
--g_MissionIdPre  = 

--�����
x211208_g_MissionId = 558

--�������
x211208_g_MissionKind = 32

--����ȼ�
x211208_g_MissionLevel = 63

--�Ƿ��Ǿ�Ӣ����
x211208_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x211208_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

--������Ҫ�õ�����Ʒ
x211208_g_DemandItem={{id=40002071,num=1}}		--������1λ

--�����ı�����
x211208_g_MissionName="��ʿ�ļ���"
x211208_g_MissionInfo="��������Ѿ�մ����Ѫ����ֻ������ԼԼ�Ŀ��������֣�ʯ�֡������ĸ�ס���"
x211208_g_MissionTarget="��մ��Ѫ�����Ž���ʯ�ֵ�����̫̫"
x211208_g_ContinueInfo="����ʲô����"
x211208_g_MissionComplete="Ŷ���յ�"

--����ID
x211208_g_ItemID = 40002071

--����
x211208_g_MoneyBonus=1208

--�ջ���
x211208_g_Name = "����̫̫"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x211208_OnDefaultEvent( sceneId, selfId, targetId )
	--����ѽӴ�����
	if IsMissionHaveDone( sceneId, selfId, x211208_g_MissionId ) > 0 then
		return 
	elseif IsHaveMission(sceneId,selfId,x211208_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x211208_g_Name then
			--���ͽ�����ǰ��������Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x211208_g_MissionName);
				AddText(sceneId,x211208_g_ContinueInfo);
				AddItemDemand( sceneId, x211208_g_ItemID, 1 );
			EndEvent(sceneId)
    		done = x211208_CheckSubmit( sceneId, selfId );
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x211208_g_ScriptId,x211208_g_MissionId,done)
		end
	--���������������
	elseif x211208_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x211208_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x211208_g_MissionName);
				AddText(sceneId,x211208_g_MissionInfo);
				AddText(sceneId,"#{M_MUBIAO}");
				AddText(sceneId,x211208_g_MissionTarget);
			EndEvent(sceneId)
			DispatchMissionInfo(sceneId,selfId,targetId,x211208_g_ScriptId,x211208_g_MissionId)
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x211208_OnEnumerate( sceneId, selfId, targetId )
	if IsMissionHaveDone( sceneId, selfId, x211208_g_MissionId ) > 0 then
		return 
	elseif IsHaveMission(sceneId,selfId,x211208_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x211208_g_Name then
			AddNumText(sceneId, x211208_g_ScriptId,x211208_g_MissionName)
		end
	--���������������
	elseif x211208_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x211208_g_Name then
			AddNumText(sceneId, x211208_g_ScriptId, x211208_g_MissionName);
		end
	end
end

--**********************************
--��ⴥ������
--**********************************
function x211208_CheckAccept( sceneId, selfId )
	--bDone = IsMissionHaveDone( sceneId, selfId, g_MissionIdPre );
	--if bDone > 0 then
		return 1;
	--else
		--return 0;
	--end
end

--**********************************
--����
--**********************************
function x211208_OnAccept( sceneId, selfId )
	--������������б�
	--����������Ʒ
	BeginAddItem( sceneId )
		AddItem( sceneId, x211208_g_ItemID, 1 )
	ret = EndAddItem( sceneId, selfId )
	if ret > 0 then 
		ret = AddMission( sceneId,selfId, x211208_g_MissionId, x211208_g_ScriptId, 0, 0, 0 )
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x211208_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,1)		--�������кŰ���������ĵ�0λ��1 (����������)
		end
	else
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
function x211208_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	res = DelMission( sceneId, selfId, x211208_g_MissionId )
	if res > 0 then
		--��ȥ������Ʒ
		DelItem( sceneId, selfId, x211208_g_ItemID, 1 )
	end
end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x211208_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x211208_g_MissionComplete);
	EndEvent(sceneId)
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x211208_g_ScriptId,x211208_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x211208_CheckSubmit( sceneId, selfId )
	itemNum = GetItemCount( sceneId, selfId, x211208_g_ItemID );
	if itemNum > 0 then
		return 1;
	end
	return 0
end

--**********************************
--�ύ����ɣ�
--**********************************
function x211208_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	ret = x211208_CheckSubmit( sceneId, selfId );
	if ret > 0 then
		--ɾ����������б��ж�Ӧ������
		ret = DelMission( sceneId, selfId, x211208_g_MissionId )
		if ret > 0 then
			MissionCom( sceneId, selfId, x211208_g_MissionId )
			DelItem( sceneId,selfId,x211208_g_ItemID,1)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x211208_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x211208_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x211208_OnItemChanged( sceneId, selfId, itemdataId )
end
