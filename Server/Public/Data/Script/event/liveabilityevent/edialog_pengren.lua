--�Ի��¼� npc����ʵ

--�ű���
x713601_g_ScriptId = 713515

--�Ի�����
x713601_g_dialog = {"���Ǵ��ε���ʳ�����������£�ѧϰ����⿣��Ϳ����������Ƴ��ظ�������������ʳ��",
			"��ƽʱս���еõ���һЩ�������ֲ�õ�����ʳ������������⿣�����ÿ�����Ҫ����һ���Ļ���",
			"ֻҪ����ѧϰ��⿼��ܾͿ����ˣ���Ȼ����ĵȼ�Խ�ߣ�����������ʳ������Խ��",
			"ֻҪѧϰ����⿼��ܣ�����������Ӧ���ϣ��ڼ��ܽ���ѡ��Ҫ������ʳ���������Ϳ����ˣ���Ȼ���㻹Ҫ���㹻�Ļ���",
			"��������е�ʳ��Ϳ���ʳ���ˣ�������һ��ʱ�������������������������ս����Ҳ����ʹ��Ŷ"}
x713601_g_button = {"�����Ҫʲô���ϣ�",
			"���������������?",
			"Ȼ����?",
			"ʳ����ʲôЧ����",
			}

--**********************************
--������ں���
--**********************************
function x713601_OnDefaultEvent( sceneId, selfId, targetId, MessageNum )	--MessageNum�ǶԻ���ţ����ڵ��ò�ͬ�Ի�
		BeginEvent(sceneId)
			AddText(sceneId, x713601_g_dialog[MessageNum])
			if MessageNum ~= 5 then
				AddNumText(sceneId,MessageNum, x713601_g_button[MessageNum])
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--�о��¼�
--**********************************
function x713601_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x713601_g_ScriptId,"�����˽����")
end

--**********************************
--����������
--**********************************
function x713601_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713601_OnAccept( sceneId, selfId, AbilityId )
end
