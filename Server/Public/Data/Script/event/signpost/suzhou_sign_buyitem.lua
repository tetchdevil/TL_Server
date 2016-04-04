-- ����
--������Ʒ
--��·�ű�
x500021_g_scriptId = 500021

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500021_g_Signpost = {
	{ type=2, name="���ε�", x=217, y=88, tip="���ε�", desc="���ε�" },
	{ type=2, name="��Ʒ��", x=217, y=81, tip="��Ʒ��", desc="��Ʒ��" },
	{ type=2, name="�����", x=87, y=142, tip="�����", desc="�����" },
	{ type=2, name="ҩ��", x=106, y=118, tip="ҩ��", desc="ҩ��" },
	{ type=2, name="�Ƶ�", x=190, y=168, tip="�Ƶ�", desc="�Ƶ�" },
	{ type=2, name="�ӻ���", x=128, y=173, tip="�ӻ���", desc="�ӻ���" },
}

--**********************************
--�о��¼�
--**********************************
function x500021_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500021_g_Signpost do
		AddNumText(sceneId, x500021_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500021_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500021_g_Signpost[GetNumText()]

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
