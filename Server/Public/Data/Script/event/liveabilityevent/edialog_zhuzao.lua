--�Ի��¼� npc����ʵ

--�ű���
x713604_g_ScriptId = 713516

--�Ի�����
x713604_g_dialog = {"�л�ҽ��",
			"...",
			"�β�����",
			"��ҩ�����ɵ�ҩ������",
			"˭˵�Ҳ���˵����?֪����ũ���ٲ�ô?�ҸղŸճ���һ���µ�ҩ��,�������ͷ������,˵������,�����ǲ��������ҽ���˵����鰡!"}
x713604_g_button = {"... ... ��˵һ���ֻ�����?",
			"���ˣ���������ҽ��ʲô����",
			"��ô��?",
			"��Ȼ����ô����˵�����Ҳ�ѧ������ô����!",
			}

--**********************************
--������ں���
--**********************************
function x713604_OnDefaultEvent( sceneId, selfId, targetId, MessageNum )	--MessageNum�ǶԻ���ţ����ڵ��ò�ͬ�Ի�
		BeginEvent(sceneId)
			AddText(sceneId, x713604_g_dialog[MessageNum])
			if MessageNum ~= 5 then
				AddNumText(sceneId,MessageNum, x713604_g_button[MessageNum])
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--�о��¼�
--**********************************
function x713604_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x713604_g_ScriptId,"�����˽���ҽ")
end

--**********************************
--����������
--**********************************
function x713604_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713604_OnAccept( sceneId, selfId, AbilityId )
end
