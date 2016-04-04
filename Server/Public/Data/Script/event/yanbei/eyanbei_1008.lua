--��������
--�ظ�����
--MisDescBegin
--�ű���
x211008_g_ScriptId = 211008

--ǰ������
--g_MissionIdPre  = 

--�����
x211008_g_MissionId = 538

--�������
x211008_g_MissionKind = 30

--����ȼ�
x211008_g_MissionLevel = 29

--�Ƿ��Ǿ�Ӣ����
x211008_g_IfMissionElite = 0

--�����ı�����
x211008_g_MissionName="�ظ�����"
x211008_g_MissionInfo="��ȥ�������ˣ��Ҵ�Ӧ������Ҫ��"
x211008_g_MissionTarget="�ظ�����"
x211008_g_ContinueInfo="����ʲô����"
x211008_g_MissionComplete="Ŷ���յ�"

x211008_g_MoneyBonus=1008

x211008_g_Name	="����"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x211008_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x211008_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x211008_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x211008_g_Name then
			x211008_OnContinue( sceneId, selfId, targetId )
		end
	--���������������
	elseif x211008_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x211008_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
			AddText(sceneId,x211008_g_MissionName)
			AddText(sceneId,x211008_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x211008_g_MissionTarget)
			AddMoneyBonus( sceneId, x211008_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x211008_g_ScriptId,x211008_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x211008_OnEnumerate( sceneId, selfId, targetId )
	--�����һ�δ�����һ������
	--if 	IsMissionHaveDone(sceneId,selfId,g_MissionIdPre) <= 0 then
		--return
	--end
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x211008_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x211008_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x211008_g_Name then
			AddNumText(sceneId, x211008_g_ScriptId,x211008_g_MissionName);
		end
	--���������������
	elseif x211008_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x211008_g_Name then
			AddNumText(sceneId,x211008_g_ScriptId,x211008_g_MissionName);
		end
	end
end

--**********************************
--����������
--**********************************
function x211008_CheckAccept( sceneId, selfId )
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
function x211008_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x211008_g_MissionId, x211008_g_ScriptId, 0, 0, 0 )
	npcobjid = LuaFnGetCopySceneData_Param(sceneId, 2)
	if npcobjid ~= 0 then
		LuaFnDeleteMonster( sceneId, npcobjid )
		LuaFnSetCopySceneData_Param(sceneId, 2, 0)
		if HaveItem (sceneId,selfId,40002054) >0 then
			DelItem ( sceneId,selfId,40002054,1)
		end
	end
end

--**********************************
--����
--**********************************
function x211008_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	DelMission( sceneId, selfId, x211008_g_MissionId )
end

--**********************************
--����
--**********************************
function x211008_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x211008_g_MissionName)
		AddText(sceneId,x211008_g_ContinueInfo)
		AddMoneyBonus( sceneId, x211008_g_MoneyBonus )
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x211008_g_ScriptId,x211008_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x211008_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x211008_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x211008_CheckSubmit( sceneId, selfId, selectRadioId ) then
		AddItemListToHuman(sceneId,selfId)
		AddMoney(sceneId,selfId,x211008_g_MoneyBonus );
		DelMission( sceneId,selfId,  x211008_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId,  x211008_g_MissionId )
	end
end

--**********************************
--ɱ����������
--**********************************
function x211008_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x211008_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x211008_OnItemChanged( sceneId, selfId, itemdataId )
end
