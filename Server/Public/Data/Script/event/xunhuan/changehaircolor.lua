--������ɫ
--�ű���
x801011_g_ScriptId = 801011

--������ɫUI 22

--**********************************
--�о��¼�
--**********************************
function x801011_OnEnumerate( sceneId, selfId, targetId )

	-- ΪʲôҪ NPC ���֣�
	local TransportNPCName=GetName(sceneId,targetId);

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,targetId)
		UICommand_AddString(sceneId,TransportNPCName)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 22)
	return

end


--**********************************
--�����귢��
--**********************************
function x801011_FinishAdjust( sceneId, selfId, ColorValue)

	item = 20307001

	itemCount = GetItemCount( sceneId, selfId, item )
	if itemCount < 1 then
		Msg2Player(sceneId,selfId,"û���㹻��Ⱦ������",MSG2PLAYER_PARA)

		return
	end

	DelItem( sceneId, selfId, item, 1 )

	SetHumanHairColor( sceneId, selfId, ColorValue )
	Msg2Player(sceneId,selfId,"Ⱦ���ɹ���",MSG2PLAYER_PARA)
end
