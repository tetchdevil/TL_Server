--��������
--�ű���
x801010_g_ScriptId = 801010

--��������UI 21

--**********************************
--�о��¼�
--**********************************
function x801010_OnEnumerate( sceneId, selfId, targetId )

	-- ΪʲôҪ NPC ���֣�
	local TransportNPCName=GetName(sceneId,targetId);

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,targetId)
		UICommand_AddString(sceneId,TransportNPCName)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 21)
	return

end


--**********************************
--�����귢��
--**********************************
function x801010_FinishAdjust( sceneId, selfId, styleId)
	-- �Ƿ���Ҫʲô������Ϣ��
	-- ��ͷ����Ҫ�ж� Race ��
	LuaFnChangeHumanHairModel( sceneId, selfId, styleId )
--	Msg2Player(sceneId,selfId,"�ı䷢�ͳɹ���",MSG2PLAYER_PARA)
	BeginEvent(sceneId)
		AddText(sceneId,"�ı䷢�ͳɹ���");
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end
