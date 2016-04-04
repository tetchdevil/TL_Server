--��������
--��üɮѰ������ʦ
--MisDescBegin
--�ű���
x210232_g_ScriptId = 210232

--�����
x210232_g_MissionId = 712

--��һ�������ID
x210232_g_MissionIdPre = 711

--Ŀ��NPC
x210232_g_Name	="����ʦ"

--�������
x210232_g_MissionKind = 13

--����ȼ�
x210232_g_MissionLevel = 9

--�Ƿ��Ǿ�Ӣ����
x210232_g_IfMissionElite = 0

--������
x210232_g_MissionName="���֣�ľ�˶���"
x210232_g_MissionInfo="ʩ����ȥ������ʦ�ɡ�"
x210232_g_MissionTarget="�ҵ�����ʦ[160,141]"
x210232_g_MissionComplete="��ô�����о������ɣ�����������Ĵ�תת�ˣ�����㵽��ʮ���Ϳ���ѡ��һ���Լ�ϲ�������ɼ��룬�Ժ��������·��Ҫ���Լ�����ȥ�ˡ�"
x210232_g_MoneyBonus=360
x210232_g_SignPost = {x = 160, z = 141, tip = "����ʦ"}
x210232_g_ItemBonus={{id=40002108,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210232_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x210232_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x210232_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x210232_g_Name then
			x210232_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x210232_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210232_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x210232_g_MissionName)
				AddText(sceneId,x210232_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210232_g_MissionTarget)
				AddMoneyBonus( sceneId, x210232_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210232_g_ScriptId,x210232_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x210232_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x210232_g_MissionIdPre) <= 0 then
    	return
    end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210232_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x210232_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210232_g_Name then
			AddNumText(sceneId, x210232_g_ScriptId,x210232_g_MissionName,2,-1);
		end
    --���������������
    elseif x210232_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210232_g_Name then
			AddNumText(sceneId,x210232_g_ScriptId,x210232_g_MissionName,1,-1);
		end
    end
end

--**********************************
--����������
--**********************************
function x210232_CheckAccept( sceneId, selfId )
	--��Ҫ9�����ܽ�
	if GetLevel( sceneId, selfId ) >= 9 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210232_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210232_g_MissionId, x210232_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#Y��������ľ�˶���",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, SCENE_DALI, x210232_g_SignPost.x, x210232_g_SignPost.z, x210232_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x210232_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210232_g_MissionId )
end

--**********************************
--����
--**********************************
function x210232_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210232_g_MissionName)
		AddText(sceneId,x210232_g_MissionComplete)
		AddMoneyBonus( sceneId, x210232_g_MoneyBonus )
		for i, item in x210232_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210232_g_ScriptId,x210232_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210232_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x210232_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210232_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
			for i, item in x210232_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
		ret = EndAddItem(sceneId,selfId)
		--����������
			if ret > 0 then
					AddMoney(sceneId,selfId,x210232_g_MoneyBonus );
					LuaFnAddExp( sceneId, selfId,250)
					ret = DelMission( sceneId, selfId, x210232_g_MissionId )
				if ret > 0 then
					MissionCom( sceneId, selfId, x210232_g_MissionId )
					AddItemListToHuman(sceneId,selfId)
					Msg2Player(  sceneId, selfId,"#Y�������ľ�˶���",MSG2PLAYER_PARA )
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
function x210232_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210232_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210232_OnItemChanged( sceneId, selfId, itemdataId )
end