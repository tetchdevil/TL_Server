
--����ϵͳȫ�ֺ����Ľű��ļ�

--�ű���
x888890_g_scriptId = 888890

--����Ƿ���Խ�
function x888890_CheckAccept( sceneId, selfId, targetId, MissionId )
	local ret = MissionCheckAcceptNM( sceneId, selfId, targetId, MissionId )
	if ret > 0 then
		return 1
	end
	return ret
end

--����Ƿ�����ύ
function x888890_CheckSubmit( sceneId, selfId, targetId, MissionId )
	local ret = MissionCheckSubmitNM( sceneId, selfId, targetId, MissionId )
	if ret > 0 then
		return 1
	end
	return ret
end

function x888890_CheckAndAccept( sceneId, selfId, targetId, ScriptId, MissionId, Ident )
	if Ident == MISSION_PROMULGATOR or Ident == MISSION_PROMULGATOR_AND_SUBMITOR then
		if x888890_CheckAccept( sceneId, selfId, targetId, MissionId ) == 1 then
			AddMissionNM( sceneId, selfId, MissionId, ScriptId )
			MisMsg2PlayerNM( sceneId, selfId, targetId, ScriptId, MissionId, Ident, MSG2PLAYER_PARA )
			local SCENE, X, Z, TIP = GetMonsterWayInfoNM( sceneId, selfId, targetId, ScriptId, MissionId, Ident )
			if SCENE ~= nil then
				CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWayPos", sceneId, selfId, SCENE, X, Z, TIP )
			end
			return 1
		end
	end
	return 0
end

function x888890_CheckAndSubmit( sceneId, selfId, targetId, ScriptId, MissionId, selectId, Ident )
	if Ident == MISSION_SUBMITOR or Ident == MISSION_PROMULGATOR_AND_SUBMITOR then
		if x888890_CheckSubmit( sceneId, selfId, targetId, MissionId ) then
			ret = MissionComplateNM( sceneId, selfId, targetId, ScriptId, MissionId, selectId, Ident )
			if ret == 1 then
				return 1
			else
				BeginEvent(sceneId)
				local strText = "δ֪�����޷��������"
				if ret == -2 then
					strText = "��ѡ������Ʒ"
				elseif ret == -3 then
					strText = "��������,�޷��������"
				elseif ret == -4 then
					strText = "�۳�������Ʒʧ��"
				end
				AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
			end
		end
	end
	return 0
end

function x888890_OnContinue( sceneId, selfId, targetId, ScriptId, MissionId, Ident )
	if x888890_CheckSubmit( sceneId, selfId, targetId, MissionId ) == 1 then
		--������ɣ���ʾ�����Ϣ
		MissionComplateInfoNM( sceneId, selfId, targetId, ScriptId, MissionId, Ident )
	else
		--����δ��ɡ�����
		MissionNotComplateInfoNM( sceneId, selfId, targetId, ScriptId, MissionId, Ident )
	end
end

function x888890_OnEnumerate( sceneId, selfId, targetId, ScriptId, MissionId, Ident )
	--����������Ѿ���ɣ�ֱ���˳�
	if IsMissionHaveDoneNM( sceneId, selfId, MissionId ) > 0 then
		return
	end

	if IsHaveMissionNM( sceneId, selfId, MissionId ) > 0 then
		--������������ֱ����ʾ����
		if Ident == MISSION_SUBMITOR or Ident == MISSION_PROMULGATOR_AND_SUBMITOR then
			--��������������
			AddMissionTextNM( sceneId, selfId, targetId, ScriptId, MissionId, Ident, 1, -1 )
		end
	else
		if Ident == MISSION_PROMULGATOR or Ident == MISSION_PROMULGATOR_AND_SUBMITOR then
			--��������񷢲���
			if x888890_CheckAccept( sceneId, selfId, targetId, MissionId ) == 1 then
				--������Խ����������ʾ������
				AddMissionTextNM( sceneId, selfId, targetId, ScriptId, MissionId, Ident, 1, -1 )
			end
		end
	end
end

function x888890_OnDefaultEvent( sceneId, selfId, targetId, ScriptId, MissionId, Ident )
	--����������Ѿ���ɣ�ֱ���˳�
	if IsMissionHaveDoneNM( sceneId, selfId, MissionId ) > 0 then
		return
	end

	if IsHaveMissionNM( sceneId, selfId, MissionId ) > 0 then
		--����д����񣬼�����Ƿ�������
		if Ident == MISSION_SUBMITOR or Ident == MISSION_PROMULGATOR_AND_SUBMITOR then
			x888890_OnContinue( sceneId, selfId, targetId, ScriptId, MissionId, Ident )
		end
	else
		--���û�����񡣡�����
		if Ident == MISSION_PROMULGATOR or Ident == MISSION_PROMULGATOR_AND_SUBMITOR then
			if x888890_CheckAccept( sceneId, selfId, targetId, MissionId ) == 1 then
				AddDispatchMissionInfoNM( sceneId, selfId, targetId, ScriptId, MissionId, Ident )
			end
		end
	end
end

function x888890_OnItemChanged( sceneId, selfId, ScriptId, MissionId, itemdataId )
	local NeedNum = GetNeedItemNumNM( sceneId, selfId, ScriptId, MissionId, itemdataId )
	if NeedNum > 0 then
		local Num = GetItemCount( sceneId, selfId, itemdataId )
		if Num < NeedNum then --��û���������
			BeginEvent(sceneId)
			local strText = format("�ѵõ�@itemid_%d: %d/%d", itemdataId, Num, NeedNum )
			AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )

			local misIndex = GetMissionIndexByIDNM( sceneId, selfId, MissionId )
			local MisParm = GetMissionParam( sceneId, selfId, misIndex, 0 )
			if MisParm == 1 then --�������״̬��1,˵��������ɵ�������ְ���Ʒ���ٵ��������״̬
				SetMissionByIndex( sceneId, selfId, misIndex, 0, 0 )
			end
		elseif Num == NeedNum then
			--�Ѿ��������
			BeginEvent(sceneId)
			local strText = format( "�ѵõ�ȫ����@itemid_%d: %d/%d", itemdataId, Num, NeedNum )
			AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
			
			local MissionType = GetMissionTypeNM( sceneId, selfId, ScriptId, MissionId )
			if MissionType == 4 then
				FinishKillObjGetItem( sceneId, selfId, ScriptId, MissionId, itemdataId )
			end
		end
	end
end

function x888890_OnAbandon( sceneId, selfId, MissionId )
	local MissionName = GetMissionNameNM( sceneId, selfId, x888890_g_scriptId, MissionId )
	DelMissionNM( sceneId, selfId, MissionId )
	Msg2Player( sceneId, selfId, "#R���Ѿ�����["..MissionName.."]����", MSG2PLAYER_PARA )
end

function x888890_OnKillObject( sceneId, selfId, ScriptId, MissionId, objdataId, objId )
															--����ID, �Լ���ID, �ű�ID, ����ID, �����λ�ú�, ����objId
	local MissionType = GetMissionTypeNM( sceneId, selfId, ScriptId, MissionId )
	local NeedKilledNum, ObjIndex = GetNeedKillObjNumNM( sceneId, selfId, ScriptId, MissionId, objdataId )
	local misIndex = GetMissionIndexByIDNM( sceneId, selfId, MissionId )

	if MissionType == 4 then
		--ɱ�ֵ���Ʒ���͵�����
		if NeedKilledNum > 0 then
			local KilledNum = GetMonsterOwnerCount( sceneId, objId ) --ȡ�������������ӵ�з���Ȩ������
			for i = 0, KilledNum-1 do
				local humanObjId = GetMonsterOwnerID( sceneId, objId, i ) --ȡ��ӵ�з���Ȩ���˵�objId
				if IsHaveMissionNM( sceneId, humanObjId, MissionId ) > 0 then	--��������ӵ������
					local ItemCount, ItemID = GetMissionItemNM( sceneId, humanObjId, ScriptId, MissionId, ObjIndex )
					if ItemCount > 0 then
						if GetItemCount( sceneId, humanObjId, ItemID ) < ItemCount then
							local rand = random(100)
							if rand < 25 then -- 25%�ļ��ʵõ�����Ʒ
								AddMonsterDropItem( sceneId, objId, humanObjId, ItemID )    --��������������(���߻������ʬ�����)
							end
						end
					end
				end
			end
		end
	else
		--������ɱ������
		local strText
		if NeedKilledNum > 0 then
			local KilledNum = GetMissionParam( sceneId, selfId, misIndex, ObjIndex )
			
			if KilledNum < NeedKilledNum then
				SetMissionByIndex( sceneId, selfId, misIndex, ObjIndex, KilledNum+1 )
				if KilledNum == NeedKilledNum - 1 then
					if IfFinishdKillObjNM( sceneId, selfId, ScriptId, MissionId ) then
						--����ˡ���
						BeginEvent(sceneId)
						strText = format( "�Ѿ�ɱ��ȫ����@monsterid_%d: %d/%d", objdataId, KilledNum+1, NeedKilledNum )
						AddText( sceneId, strText )
						EndEvent( sceneId )
						DispatchMissionTips( sceneId, selfId )
						return 1
					end
				else
					BeginEvent(sceneId)
					strText = format( "�Ѿ�ɱ��@monsterid_%d: %d/%d", objdataId, KilledNum+1, NeedKilledNum )
					AddText( sceneId, strText )
					EndEvent( sceneId )
					DispatchMissionTips( sceneId, selfId )
				end
			else
			end
		end
	end
	return 0
end













