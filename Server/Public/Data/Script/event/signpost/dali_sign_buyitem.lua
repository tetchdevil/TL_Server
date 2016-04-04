-- ����
--������Ʒ
--��·�ű�
x500042_g_scriptId = 500042

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500042_g_Signpost = {
	{ type=2, name="������", x=216, y=133, tip="������", desc="������" },
	{ type=2, name="���ε�", x=238, y=171, tip="���ε�", desc="���ε�" },
	{ type=2, name="��Ʒ��", x=248, y=171, tip="��Ʒ��", desc="��Ʒ��" },
	{ type=2, name="�����", x=265, y=128, tip="�����", desc="�����" },
	{ type=2, name="ҩ��", x=102, y=131, tip="ҩ��", desc="ҩ��" },
	{ type=2, name="�Ƶ�", x=109, y=170, tip="�Ƶ�", desc="�Ƶ�" },
	{ type=2, name="�ӻ���", x=57, y=131, tip="�ӻ���", desc="�ӻ���" },
}

--**********************************
--�о��¼�
--**********************************
function x500042_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500042_g_Signpost do
		AddNumText(sceneId, x500042_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500042_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500042_g_Signpost[GetNumText()]

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
