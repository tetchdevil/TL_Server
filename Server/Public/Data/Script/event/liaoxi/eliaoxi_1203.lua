--��������
--�ɾ�Ԫ˧
--MisDescBegin
--�ű���
x211203_g_ScriptId = 211203

--�����
x211203_g_MissionId = 553

--Ŀ��NPC
x211203_g_Name	="Ү�ɽ�"

--�������
x211203_g_MissionKind = 32

--����ȼ�
x211203_g_MissionLevel = 58

--�Ƿ��Ǿ�Ӣ����
x211203_g_IfMissionElite = 0


--������
x211203_g_MissionName="�ɾ�Ԫ˧"
x211203_g_MissionInfo="�ڷ���Ű�������޷��ֿ��������æ�ҵ�Ԫ˧Ү�ɽ������ɱ�֧Ԯ����"		--��������
x211203_g_MissionTarget="�ҵ��ɾ�Ԫ˧Ү�ɽ�"		--����Ŀ��
x211203_g_MissionComplete="�õģ�����������ȥ֧Ԯ��"		--�ύʱnpc�Ļ�
x211203_g_MoneyBonus=100
x211203_g_ItemBonus={{id=10105001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x211203_OnDefaultEvent( sceneId, selfId, targetId )

    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x211203_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x211203_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x211203_g_Name then
			x211203_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x211203_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x211203_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
			AddText(sceneId,x211203_g_MissionName)
			AddText(sceneId,x211203_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x211203_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}")
			AddMoneyBonus( sceneId, x211203_g_MoneyBonus )
			for i, item in x211203_g_ItemBonus do
						AddItemBonus( sceneId, item.id, item.num )
					end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x211203_g_ScriptId,x211203_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x211203_OnEnumerate( sceneId, selfId, targetId )
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x211203_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x211203_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x211203_g_Name then
			AddNumText(sceneId, x211203_g_ScriptId,x211203_g_MissionName);
		end
    --���������������
    elseif x211203_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x211203_g_Name then
			AddNumText(sceneId,x211203_g_ScriptId,x211203_g_MissionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x211203_CheckAccept( sceneId, selfId )
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
function x211203_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x211203_g_MissionId, x211203_g_ScriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x211203_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x211203_g_MissionId )
end

--**********************************
--����
--**********************************
function x211203_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x211203_g_MissionName)
     AddText(sceneId,x211203_g_MissionComplete)
   AddMoneyBonus( sceneId, x211203_g_MoneyBonus )
    for i, item in x211203_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x211203_g_ScriptId,x211203_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x211203_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x211203_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x211203_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x211203_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddMoney(sceneId,selfId,x211203_g_MoneyBonus );
			DelMission( sceneId,selfId,  x211203_g_MissionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x211203_g_MissionId )
			AddItemListToHuman(sceneId,selfId)
		else
		--������û�мӳɹ�
		end
	        
	end
end

--**********************************
--ɱ����������
--**********************************
function x211203_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x211203_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x211203_OnItemChanged( sceneId, selfId, itemdataId )
end







