--�Ի��¼� npc����ʵ

--�ű���
x713602_g_ScriptId = 713516

--�Ի�����
x713602_g_dialog = {"�л�ҽ��",
			"...",
			"�β�����",
			"��ҩ�����ɵ�ҩ������",
			"˭˵�Ҳ���˵����?֪����ũ���ٲ�ô?�ҸղŸճ���һ���µ�ҩ��,�������ͷ������,˵������,�����ǲ��������ҽ���˵����鰡!"}
x713602_g_button = {"... ... ��˵һ���ֻ�����?",
			"���ˣ���������ҽ��ʲô����",
			"��ô��?",
			"��Ȼ����ô����˵�����Ҳ�ѧ������ô����!",
			}

--**********************************
--������ں���
--**********************************
function x713602_OnDefaultEvent( sceneId, selfId, targetId, MessageNum )	--MessageNum�ǶԻ���ţ����ڵ��ò�ͬ�Ի�
		BeginEvent(sceneId)
			AddText(sceneId, x713602_g_dialog[MessageNum])
			if MessageNum ~= 5 then
				AddNumText(sceneId,MessageNum, x713602_g_button[MessageNum])
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--�о��¼�
--**********************************
function x713602_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x713602_g_ScriptId,"�����˽���ҽ")
end

--**********************************
--����������
--**********************************
function x713602_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713602_OnAccept( sceneId, selfId, AbilityId )
end
