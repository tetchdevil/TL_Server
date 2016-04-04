--��������
--��ƮƮѰ������ʦ
--MisDescBegin
--�ű���
x210216_g_ScriptId = 210216

--�����
x210216_g_MissionId = 456

--��һ�������ID
x210216_g_MissionIdPre = 455

--Ŀ��NPC
x210216_g_Name	="����ʦ"

--�������
x210216_g_MissionKind = 13

--����ȼ�
x210216_g_MissionLevel = 7

--�Ƿ��Ǿ�Ӣ����
x210216_g_IfMissionElite = 0

--������
x210216_g_MissionName="���֣���������"
x210216_g_MissionInfo="��ȥ������ʦ�������µ�����������ء�"
x210216_g_MissionTarget="�ҵ�����ʦ[160,141]"
x210216_g_MissionComplete="���ĺã������ˣ����Ǹ���Ľ�����"
x210216_g_MoneyBonus=120
x210216_g_SignPost = {x = 160, z = 141, tip = "����ʦ"}
x210216_g_ItemBonus={{id=40002108,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210216_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x210216_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x210216_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x210216_g_Name then
			x210216_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x210216_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210216_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x210216_g_MissionName)
				AddText(sceneId,x210216_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210216_g_MissionTarget)
				for i, item in x210216_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
				AddMoneyBonus( sceneId, x210216_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210216_g_ScriptId,x210216_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x210216_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x210216_g_MissionIdPre) <= 0 then
    	return
    end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210216_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x210216_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210216_g_Name then
			AddNumText(sceneId, x210216_g_ScriptId,x210216_g_MissionName,2,-1);
		end
    --���������������
    elseif x210216_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210216_g_Name then
			AddNumText(sceneId,x210216_g_ScriptId,x210216_g_MissionName,1,-1);
		end
    end
end

--**********************************
--����������
--**********************************
function x210216_CheckAccept( sceneId, selfId )
	--��Ҫ5�����ܽ�
	if GetLevel( sceneId, selfId ) >= 5 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210216_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210216_g_MissionId, x210216_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#Y����������������",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, SCENE_DALI, x210216_g_SignPost.x, x210216_g_SignPost.z, x210216_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x210216_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210216_g_MissionId )
end

--**********************************
--����
--**********************************
function x210216_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210216_g_MissionName)
		AddText(sceneId,x210216_g_MissionComplete)
		AddMoneyBonus( sceneId, x210216_g_MoneyBonus )
		for i, item in x210216_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210216_g_ScriptId,x210216_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210216_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x210216_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210216_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
			for i, item in x210216_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
		ret = EndAddItem(sceneId,selfId)
		--���������
			if ret > 0 then
					AddMoney(sceneId,selfId,x210216_g_MoneyBonus );
					LuaFnAddExp( sceneId, selfId,300)
					ret = DelMission( sceneId, selfId, x210216_g_MissionId )
				if ret > 0 then
					MissionCom( sceneId, selfId, x210216_g_MissionId )
					AddItemListToHuman(sceneId,selfId)
					Msg2Player(  sceneId, selfId,"#Y���������������",MSG2PLAYER_PARA )
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
function x210216_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210216_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210216_OnItemChanged( sceneId, selfId, itemdataId )
end
