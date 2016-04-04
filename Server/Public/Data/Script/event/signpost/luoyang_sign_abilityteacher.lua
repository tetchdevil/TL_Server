-- ����
--����ܵ�ʦ
--��·�ű�
x500005_g_scriptId = 500005

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500005_g_Signpost = {
	{ type=2, name="��ֲ��ʦ", x=90, y=210, tip="��ֲ��ʦ", desc="��ֲ��ʦ" },
	{ type=2, name="�ɿ��ʦ", x=212, y=151, tip="�ɿ��ʦ", desc="�ɿ��ʦ" },
	{ type=2, name="��ҩ��ʦ", x=120, y=169, tip="��ҩ��ʦ", desc="��ҩ��ʦ" },
	{ type=2, name="���", x=207, y=184, tip="���", desc="���" },
	{ type=2, name="���մ�ʦ", x=60, y=146, tip="���մ�ʦ", desc="���մ�ʦ" },
	{ type=2, name="���Ҵ�ʦ", x=193, y=172, tip="���Ҵ�ʦ", desc="���Ҵ�ʦ" },
	{ type=2, name="�����ʦ", x=213, y=160, tip="�����ʦ", desc="�����ʦ" },
	{ type=2, name="��⿴�ʦ", x=134, y=152, tip="��⿴�ʦ", desc="��⿴�ʦ" },
	{ type=2, name="��ҩ��ʦ", x=138, y=164, tip="��ҩ��ʦ", desc="��ҩ��ʦ" },
	{ type=2, name="��Ƕ��ʦ", x=174, y=33, tip="��Ƕ��ʦ", desc="��Ƕ��ʦ" },
	{ type=2, name="��������ʦ", x=132, y=156, tip="��������ʦ", desc="��������ʦ" },
	{ type=2, name="ҩ��ѧ��ʦ", x=136, y=168, tip="ҩ��ѧ��ʦ", desc="ҩ��ѧ��ʦ" },
}

--**********************************
--�о��¼�
--**********************************
function x500005_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500005_g_Signpost do
		AddNumText(sceneId, x500005_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500005_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500005_g_Signpost[GetNumText()]

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
