-- ����
--�����
--��·�ű�
x500023_g_scriptId = 500023

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500023_g_Signpost = {
		{ type=2, name="��ֲ��ʦ", x=64, y=200, tip="��ֲ��ʦ", desc="��ֲ��ʦ" },
		{ type=2, name="�ɿ��ʦ", x=259, y=132, tip="�ɿ��ʦ", desc="�ɿ��ʦ" },
		{ type=2, name="��ҩ��ʦ", x=106, y=109, tip="��ҩ��ʦ", desc="��ҩ��ʦ" },
		{ type=2, name="�����ʦ", x=238, y=77, tip="�����ʦ", desc="�����ʦ" },
		{ type=2, name="���մ�ʦ", x=109, y=130, tip="���մ�ʦ", desc="���մ�ʦ" },
		{ type=2, name="���Ҵ�ʦ", x=211, y=90, tip="���Ҵ�ʦ", desc="���Ҵ�ʦ" },
		{ type=2, name="�����ʦ", x=251, y=151, tip="�����ʦ", desc="�����ʦ" },
		{ type=2, name="��⿴�ʦ", x=189, y=173, tip="��⿴�ʦ", desc="��⿴�ʦ" },
}

--**********************************
--�о��¼�
--**********************************
function x500023_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500023_g_Signpost do
		AddNumText(sceneId, x500023_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500023_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500023_g_Signpost[GetNumText()]

	if signpost.type == 1 then
		BeginEvent(sceneId)
			AddText(sceneId, signpost.name .. "��")
			CallScriptFunction( signpost.eventId, "OnEnumerate", sceneId, selfId, targetId )
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
	elseif signpost.type == 2 then
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, SCENE_SUZHOU, signpost.x, signpost.y, signpost.tip )

		BeginEvent(sceneId)
			AddText(sceneId, signpost.desc)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, -1)
	end

end
