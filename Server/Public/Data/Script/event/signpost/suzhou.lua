-- ������·�ű�
x500020_g_scriptId = 500020

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500020_g_Signpost = {
		{ type=1, name="���������Ʒ", eventId=500021 },
		{ type=1, name="���������ȥ��ϰ����", eventId=500022 },
		{ type=1, name="����ѧϰ�����", eventId=500023 },
		{ type=1, name="������Щ����", eventId=500024 },
}
--{ type=2, name="������ջ", x=100.7, y=124.2, tip="���ݶ�����ջ", desc="�������Ŀ�ջ֮һ�����̾����ۼ�֮�ء�" },

--**********************************
--�о��¼�
--**********************************
function x500020_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500020_g_Signpost do
		AddNumText(sceneId, x500020_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500020_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500020_g_Signpost[GetNumText()]

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
