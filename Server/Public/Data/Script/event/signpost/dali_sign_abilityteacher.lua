-- ����
--����ܴ�ʦ
--��·�ű�
x500046_g_scriptId = 500046

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500046_g_Signpost = {
	{ type=2, name="��ֲ��ʦ", x=277, y=167, tip="��ֲ��ʦ", desc="��ֲ��ʦ" },
	{ type=2, name="�ɿ��ʦ", x=214, y=117, tip="�ɿ��ʦ", desc="�ɿ��ʦ" },
	{ type=2, name="��ҩ��ʦ", x=99, y=133, tip="��ҩ��ʦ", desc="��ҩ��ʦ" },
	{ type=2, name="���", x=107, y=169, tip="���", desc="���" },
	{ type=2, name="���մ�ʦ", x=207, y=195, tip="���մ�ʦ", desc="���մ�ʦ" },
	{ type=2, name="���Ҵ�ʦ", x=240, y=173, tip="���Ҵ�ʦ", desc="���Ҵ�ʦ" },
	{ type=2, name="�����ʦ", x=216, y=109, tip="�����ʦ", desc="�����ʦ" },
	{ type=2, name="��⿴�ʦ", x=112, y=169, tip="��⿴�ʦ", desc="��⿴�ʦ" },
	{ type=2, name="��ҩ��ʦ", x=99, y=128, tip="��ҩ��ʦ", desc="��ҩ��ʦ" },
}

--**********************************
--�о��¼�
--**********************************
function x500046_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500046_g_Signpost do
		AddNumText(sceneId, x500046_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500046_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500046_g_Signpost[GetNumText()]

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
