--��������
--��ֵĻ�е
--MisDescBegin
--�ű���
x212100_g_ScriptId = 212100

--�����
x212100_g_MissionId = 640

--Ŀ��NPC
x212100_g_Name	="����ҹ"

--�������
x212100_g_MissionKind = 41

--����ȼ�
x212100_g_MissionLevel = 30

--�Ƿ��Ǿ�Ӣ����
x212100_g_IfMissionElite = 0

--������
x212100_g_MissionName="��ֵĻ�е"
x212100_g_MissionInfo="�ҵ�����ҹ"		--��������
x212100_g_MissionTarget="�ҵ�����ҹ"		--����Ŀ��
x212100_g_MissionComplete="лл�������"		--�ύʱnpc�Ļ�
x212100_g_MoneyBonus=100
x212100_g_ItemBonus={{id=10105001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x212100_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x212100_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x212100_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x212100_g_Name then
			x212100_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x212100_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212100_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
			AddText(sceneId,x212100_g_MissionName)
			AddText(sceneId,x212100_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x212100_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}")
			AddMoneyBonus( sceneId, x212100_g_MoneyBonus )
			for i, item in x212100_g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x212100_g_ScriptId,x212100_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x212100_OnEnumerate( sceneId, selfId, targetId )
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x212100_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x212100_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212100_g_Name then
			AddNumText(sceneId, x212100_g_ScriptId,x212100_g_MissionName);
		end
    --���������������
    elseif x212100_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212100_g_Name then
			AddNumText(sceneId,x212100_g_ScriptId,x212100_g_MissionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x212100_CheckAccept( sceneId, selfId )
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
function x212100_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x212100_g_MissionId, x212100_g_ScriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x212100_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x212100_g_MissionId )
end

--**********************************
--����
--**********************************
function x212100_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x212100_g_MissionName)
     AddText(sceneId,x212100_g_MissionComplete)
   AddMoneyBonus( sceneId, x212100_g_MoneyBonus )
    for i, item in x212100_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x212100_g_ScriptId,x212100_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212100_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x212100_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212100_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x212100_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddMoney(sceneId,selfId,x212100_g_MoneyBonus );
			DelMission( sceneId,selfId,  x212100_g_MissionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x212100_g_MissionId )
			AddItemListToHuman(sceneId,selfId)
		else
		--������û�мӳɹ�
		end
	        
	end
end

--**********************************
--ɱ����������
--**********************************
function x212100_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x212100_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x212100_OnItemChanged( sceneId, selfId, itemdataId )
end







