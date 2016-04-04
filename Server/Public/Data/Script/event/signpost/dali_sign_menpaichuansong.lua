-- ����
--���ɴ�����
--��·�ű�
x500041_g_scriptId = 500041

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500041_g_Signpost = {
	{ type=2, name="����", x=187, y=122, tip="�����ɴ�����", desc="�����ɻ�ӭ��" },
	{ type=2, name="����", x=189, y=124, tip="�����ɴ�����", desc="�����ɻ�ӭ��" },
	{ type=2, name="��ң", x=188, y=133, tip="��ң�ɴ�����", desc="��ң�ɻ�ӭ��" },
	{ type=2, name="����", x=192, y=129, tip="�����ɴ�����", desc="�����ɻ�ӭ��" },
	{ type=2, name="��ɽ", x=131, y=124, tip="��ɽ�ɴ�����", desc="��ɽ�ɻ�ӭ��" },
	{ type=2, name="����", x=134, y=120, tip="�����ɴ�����", desc="�����ɻ�ӭ��" },
	{ type=2, name="����", x=130, y=121, tip="���̴�����", desc="���̻�ӭ��" },
	{ type=2, name="�䵱", x=127, y=131, tip="�䵱�ɴ�����", desc="�䵱��ӭ��" },
	{ type=2, name="ؤ��", x=126, y=135, tip="ؤ�ﴫ����", desc="ؤ�ﻶӭ��" },
}

--**********************************
--�о��¼�
--**********************************
function x500041_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500041_g_Signpost do
		AddNumText(sceneId, x500041_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500041_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500041_g_Signpost[GetNumText()]

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
