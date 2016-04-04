-- ������·�ű�
x500000_g_scriptId = 500000

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500000_g_Signpost = {
		{ type=1, name="���������Ʒ", eventId=500001 },
		{ type=1, name="��վ", eventId=500002 },
		{ type=1, name="Ǯׯ�����̡�Ԫ������", eventId=500003 },
		{ type=1, name="���������ȥ��ϰ����", eventId=500004 },
		{ type=1, name="ѧϰһЩ�����", eventId=500005 },
		{ type=1, name="������Щ����", eventId=500006 },
		{ type=1, name="��Ҫ���", eventId=500007 },
		{ type=1, name="����", eventId=500008 },
		{ type=1, name="�̻�", eventId=500009 },
		{ type=1, name="���", eventId=500010 },
		{ type=1, name="ս������", eventId=500011 },
		{ type=1, name="��ʯ�ϳ�", eventId=500012 },
		{ type=1, name="��ʦ����", eventId=500013 },
}
--{ type=2, name="������ջ", x=100.7, y=124.2, tip="����������ջ", desc="�������Ŀ�ջ֮һ�����̾����ۼ�֮�ء�" },

--**********************************
--�о��¼�
--**********************************
function x500000_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500000_g_Signpost do
		AddNumText(sceneId, x500000_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500000_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500000_g_Signpost[GetNumText()]

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
