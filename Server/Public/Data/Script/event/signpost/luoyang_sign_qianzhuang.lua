-- ����
--Ǯׯ
--��·�ű�
x500003_g_scriptId = 500003

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500003_g_Signpost = {
	{ type=2, name="����", x=95, y=152, tip="����", desc="����" },
}

--**********************************
--�о��¼�
--**********************************
function x500003_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500003_g_Signpost do
		AddNumText(sceneId, x500003_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500003_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500003_g_Signpost[GetNumText()]

	if signpost.type == 1 then
		BeginEvent(sceneId)
			AddText(sceneId, signpost.name .. "��")
			CallScriptFunction( signpost.eventId, "OnEnumerate", sceneId, selfId, targetId )
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
	elseif signpost.type == 2 then
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, SCENE_LUOYANG, signpost.x, signpost.y, signpost.tip )

		BeginEvent(sceneId)
			AddText(sceneId, signpost.desc)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, -1)
	end

end
