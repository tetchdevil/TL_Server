-- ������·�ű�
x500040_g_scriptId = 500040

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500040_g_Signpost = {
		{ type=1, name="�Ŵ����ɴ�����", eventId=500041 },
		{ type=1, name="���������Ʒ", eventId=500042 },
		{ type=1, name="��վ", eventId=500043 },
		{ type=1, name="Ǯׯ�����̡�Ԫ������", eventId=500044 },
		{ type=1, name="���������ȥ��ϰ����", eventId=500045 },
		{ type=1, name="ѧϰһЩ�����", eventId=500046 },
		{ type=1, name="������Щ����", eventId=500047 },
		{ type=1, name="��̨", eventId=500048 },
}

--{ type=2, name="������ջ", x=100.7, y=124.2, tip="��������ջ", desc="�������Ŀ�ջ֮һ�����̾����ۼ�֮�ء�" },
--{ type=2, name="�ϕN", x=180.0, y=120.0, tip="�ϕN��Ȣ�ް�ʦ������ʦ�ĺ�ȥ����", desc="�ϕN����ʵ������������롫����" },


--**********************************
--�о��¼�
--**********************************
function x500040_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500040_g_Signpost do
		AddNumText(sceneId, x500040_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500040_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500040_g_Signpost[GetNumText()]

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
