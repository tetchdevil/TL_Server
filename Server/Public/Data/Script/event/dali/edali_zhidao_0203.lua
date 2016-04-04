--��������
--������Ѱ��¬����
--MisDescBegin
--�ű���
x210203_g_ScriptId = 210203

--�����
x210203_g_MissionId = 443

--��һ�������ID
x210203_g_MissionIdPre = 442

--Ŀ��NPC
x210203_g_Name	="¬����"

--�������
x210203_g_MissionKind = 13

--����ȼ�
x210203_g_MissionLevel = 1

--�Ƿ��Ǿ�Ӣ����
x210203_g_IfMissionElite = 0

--������
x210203_g_MissionName="���֣����ִ��"
x210203_g_MissionInfo="�����˳��ȥ��һ��ҩ���ϰ�¬���ߣ�Ҳ�����������ջ�Ŷ��"
x210203_g_MissionTarget="�ҵ�¬���ߣ�����ҩ��[103,133]�ϰ�"
x210203_g_MissionComplete="���߽�����û������Ѫ��ҩ��ô�����أ�"
x210203_g_MoneyBonus=120
x210203_g_SignPost = {x = 103, z = 133, tip = "¬����"}
x210203_g_RadioItemBonus={{id=30001001,num=5},{id=30003001,num=5},{id=30002001,num=5}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210203_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x210203_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x210203_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x210203_g_Name then
			x210203_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x210203_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210203_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x210203_g_MissionName)
				AddText(sceneId,x210203_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210203_g_MissionTarget)
				for i, item in x210203_g_RadioItemBonus do
					AddRadioItemBonus( sceneId, item.id, item.num )
				end
				AddMoneyBonus( sceneId, x210203_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210203_g_ScriptId,x210203_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x210203_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x210203_g_MissionIdPre) <= 0 then
    	return
    end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210203_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x210203_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210203_g_Name then
			AddNumText(sceneId, x210203_g_ScriptId,x210203_g_MissionName,2,-1);
		end
    --���������������
    elseif x210203_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210203_g_Name then
			AddNumText(sceneId,x210203_g_ScriptId,x210203_g_MissionName,1,-1);
		end
    end
end

--**********************************
--����������
--**********************************
function x210203_CheckAccept( sceneId, selfId )
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
function x210203_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210203_g_MissionId, x210203_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#Y�����������ִ��",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, SCENE_DALI, x210203_g_SignPost.x, x210203_g_SignPost.z, x210203_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x210203_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210203_g_MissionId )
end

--**********************************
--����
--**********************************
function x210203_OnContinue( sceneId, selfId, targetId )
    BeginEvent(sceneId)
		AddText(sceneId,x210203_g_MissionName)
		AddText(sceneId,x210203_g_MissionComplete)
		AddMoneyBonus( sceneId, x210203_g_MoneyBonus )
		for i, item in x210203_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210203_g_ScriptId,x210203_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210203_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x210203_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210203_CheckSubmit( sceneId, selfId, selectRadioId ) then
		BeginAddItem(sceneId)
			for i, item in x210203_g_RadioItemBonus do
				if item.id == selectRadioId then
					AddItem( sceneId,item.id, item.num )
				end
			end
		ret = EndAddItem(sceneId,selfId)
		if ret > 0 then
		--���������
			AddMoney(sceneId,selfId,x210203_g_MoneyBonus );
			LuaFnAddExp( sceneId, selfId,50)
			DelMission( sceneId,selfId,  x210203_g_MissionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x210203_g_MissionId )
			AddItemListToHuman(sceneId,selfId)
			Msg2Player(  sceneId, selfId,"#Y����������ִ��",MSG2PLAYER_PARA )
			CallScriptFunction( 210204, "OnDefaultEvent",sceneId, selfId, targetId)
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
function x210203_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210203_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210203_OnItemChanged( sceneId, selfId, itemdataId )
end
