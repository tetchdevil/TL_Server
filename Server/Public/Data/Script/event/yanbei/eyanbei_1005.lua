--��������,ʹ�õ���,����npc,������
--Ѱ��³ƽ
--MisDescBegin
--�ű���
x211005_g_ScriptId = 211005

--ǰ������
--g_MissionIdPre =

--�����
x211005_g_MissionId = 535

--����
x211005_g_ItemID = 40002054

--�������
x211005_g_MissionKind = 30

--����ȼ�
x211005_g_MissionLevel = 29

--�Ƿ��Ǿ�Ӣ����
x211005_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x211005_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����ı�����
x211005_g_MissionName="Ѱ��³ƽ"
x211005_g_MissionInfo="³ƽ������׼���������ˣ�����ȥ�����е�С���ҵ�³ƽ"
x211005_g_MissionTarget="�ҵ�³ƽ"
x211005_g_MissionComplete="����ʲô����"

x211005_g_MoneyBonus=1005

x211005_g_Name	="³ƽ"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x211005_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x211005_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x211005_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x211005_g_Name then
			x211005_OnContinue( sceneId, selfId, targetId )
		end
	--���������������
	elseif x211005_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x211005_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x211005_g_MissionName)
				AddText(sceneId,x211005_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x211005_g_MissionTarget)
				AddMoneyBonus( sceneId, x211005_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x211005_g_ScriptId,x211005_g_MissionId)
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x211005_OnEnumerate( sceneId, selfId, targetId )
	--�����һ�δ�����һ������
	--if 	IsMissionHaveDone(sceneId,selfId,g_MissionIdPre) <= 0 then
		--return
	--end
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x211005_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x211005_g_MissionId) > 0 then
	if GetName(sceneId,targetId) == x211005_g_Name then
			AddNumText(sceneId, x211005_g_ScriptId,x211005_g_MissionName);
		end
	--���������������
	elseif x211005_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x211005_g_Name then
			AddNumText(sceneId,x211005_g_ScriptId,x211005_g_MissionName);
		end
	end
end

--**********************************
--����������
--**********************************
function x211005_CheckAccept( sceneId, selfId )
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
function x211005_OnAccept( sceneId, selfId )
	--������������б�
	--����������Ʒ
	BeginAddItem( sceneId )
	AddItem( sceneId, x211005_g_ItemID, 1 )
	ret = EndAddItem( sceneId, selfId )
	--if ret > 0 then 
		--AddItemListToHuman(sceneId,selfId)		
		ret = AddMission( sceneId,selfId, x211005_g_MissionId, x211005_g_ScriptId, 0, 0, 0 )	
		--if ret > 0 then
		AddItemListToHuman(sceneId,selfId)
		--end
	--end
end

--**********************************
--����
--**********************************
function x211005_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	DelMission( sceneId, selfId, x211005_g_MissionId )
end

--**********************************
--����
--**********************************
function x211005_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x211005_g_MissionName)
		AddText(sceneId,x211005_g_MissionComplete)
		AddMoneyBonus( sceneId, x211005_g_MoneyBonus )
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x211005_g_ScriptId,x211005_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x211005_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x211005_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x211005_CheckSubmit( sceneId, selfId, selectRadioId ) then
		AddMoney(sceneId,selfId,x211005_g_MoneyBonus );
		DelMission( sceneId,selfId,  x211005_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId,  x211005_g_MissionId )
		npcobjid = LuaFnGetCopySceneData_Param(sceneId, 2)
		if npcobjid ~= 0 then
			LuaFnDeleteMonster( sceneId, npcobjid )
			LuaFnSetCopySceneData_Param(sceneId, 2, 0)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x211005_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x211005_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x211005_OnItemChanged( sceneId, selfId, itemdataId )
end
