--��������
--Ǯ��Ѱ������ʦ
--MisDescBegin
--�ű���
x210208_g_ScriptId = 210208

--�����
x210208_g_MissionId = 448

--��һ�������ID
x210208_g_MissionIdPre = 447

--Ŀ��NPC
x210208_g_Name	="����ʦ"

--�������
x210208_g_MissionKind = 13

--����ȼ�
x210208_g_MissionLevel = 2

--�Ƿ��Ǿ�Ӣ����
x210208_g_IfMissionElite = 0

--������
x210208_g_MissionName="���֣������ʴ�"
x210208_g_MissionInfo="��Ҫ�ʵ��Ѿ������ˣ�����Ի�ȥ������ʦ�ˡ�"
x210208_g_MissionTarget="�ҵ�����ʦ[160,141]"
x210208_g_MissionComplete="ѧ���ܶණ���ɣ�Ҫ�úü�ס��Щ���⣬�Ժ�����õġ�"
x210208_g_MoneyBonus=240
x210208_g_SignPost = {x = 160, z = 141, tip = "����ʦ"}
x210208_g_ItemBonus={{id=40002108,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210208_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x210208_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x210208_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x210208_g_Name then
			x210208_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x210208_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210208_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x210208_g_MissionName)
				AddText(sceneId,x210208_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210208_g_MissionTarget)
				for i, item in x210208_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
				AddMoneyBonus( sceneId, x210208_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210208_g_ScriptId,x210208_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x210208_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x210208_g_MissionIdPre) <= 0 then
    	return
    end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210208_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x210208_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210208_g_Name then
			AddNumText(sceneId, x210208_g_ScriptId,x210208_g_MissionName,2,-1);
		end
    --���������������
    elseif x210208_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210208_g_Name then
			AddNumText(sceneId,x210208_g_ScriptId,x210208_g_MissionName,1,-1);
		end
    end
end

--**********************************
--����������
--**********************************
function x210208_CheckAccept( sceneId, selfId )
	--��Ҫ1�����ܽ�
	if GetLevel( sceneId, selfId ) >= 2 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210208_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210208_g_MissionId, x210208_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#Y�������������ʴ�",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, SCENE_DALI, x210208_g_SignPost.x, x210208_g_SignPost.z, x210208_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x210208_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210208_g_MissionId )
end

--**********************************
--����
--**********************************
function x210208_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210208_g_MissionName)
		AddText(sceneId,x210208_g_MissionComplete)
		AddMoneyBonus( sceneId, x210208_g_MoneyBonus )
		for i, item in x210208_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210208_g_ScriptId,x210208_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210208_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x210208_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210208_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
			for i, item in x210208_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
		ret = EndAddItem(sceneId,selfId)
		--���������
			if ret > 0 then
					AddMoney(sceneId,selfId,x210208_g_MoneyBonus );
					LuaFnAddExp( sceneId, selfId,130)
					ret = DelMission( sceneId, selfId, x210208_g_MissionId )
				if ret > 0 then
					MissionCom( sceneId, selfId, x210208_g_MissionId )
					AddItemListToHuman(sceneId,selfId)
					Msg2Player(  sceneId, selfId,"#Y������������ʴ�",MSG2PLAYER_PARA )
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
function x210208_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210208_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210208_OnItemChanged( sceneId, selfId, itemdataId )
end
