-- ����
--Ǯׯ
--��·�ű�
x500044_g_scriptId = 500044

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500044_g_Signpost = {
	{ type=2, name="Ǯׯ", x=187, y=122, tip="Ǯׯ", desc="Ǯׯ" },
	{ type=2, name="Ԫ������", x=189, y=124, tip="Ԫ������", desc="Ԫ������" },
	{ type=2, name="����", x=188, y=133, tip="����", desc="����" },
}

--**********************************
--�о��¼�
--**********************************
function x500044_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500044_g_Signpost do
		AddNumText(sceneId, x500044_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500044_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500044_g_Signpost[GetNumText()]

	if signpost.type == 1 then
		BeginEvent(sceneId)
			AddText(sceneId, signpost.name .. "��")
			CallScriptFunction( signpost.eventId, "OnEnumerate", sceneId, selfId, targetId )
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
	elseif signpost.type == 2 then
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, SCENE_DALI, signpost.x, signpost.y, signpost.tip )

		BeginEvent(sceneId)
			AddText(sceneId, signpost.desc)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, -1)
	end

end
