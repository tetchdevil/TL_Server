-- ����
--������Ʒ
--��·�ű�
x500001_g_scriptId = 500001

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500001_g_Signpost = {
	{ type=2, name="������", x=211, y=154, tip="������", desc="������" },
	{ type=2, name="���ε�", x=182, y=183, tip="���ε�", desc="���ε�" },
	{ type=2, name="��Ʒ��", x=178, y=177, tip="��Ʒ��", desc="��Ʒ��" },
	{ type=2, name="ҩ��", x=135, y=164, tip="ҩ��", desc="ҩ��" },
	{ type=2, name="�Ƶ�", x=138, y=140, tip="�Ƶ�", desc="�Ƶ�" },
	{ type=2, name="�鱦����", x=63, y=147, tip="�鱦����", desc="�鱦����" },
}

--**********************************
--�о��¼�
--**********************************
function x500001_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500001_g_Signpost do
		AddNumText(sceneId, x500001_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500001_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500001_g_Signpost[GetNumText()]

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
