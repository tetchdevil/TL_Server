--ҩ��������

--�ű���
x713586_g_ScriptId = 713586

--��npc������������ߵȼ�
nMaxLevel = 30

--**********************************
--������ں���
--**********************************
function x713586_OnDefaultEvent( sceneId, selfId, targetId )
	--��Ҽ��ܵĵȼ�
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_YAOLI)
	--��Ҽӹ����ܵ�������
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_YAOLI)
	--�����ж�

	--�����û��ѧ��������
	if AbilityLevel < 1	then
		BeginEvent(sceneId)
			strText = "�㻹û��ѧ��ҩ���ܣ�"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--�������ܵȼ��Ѿ�������npc���̵ܽķ�Χ
	if AbilityLevel >= nMaxLevel then
		BeginEvent(sceneId)
			strText = "��ֻ�ܽ���1-"..nMaxLevel.."����ҩ����,�뵽������ѧϰ���߼���ҩ��"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		DispatchAbilityInfo(sceneId, selfId, targetId,x713586_g_ScriptId, ABILITY_YAOLI, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].Money, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].HumanExp, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].HumanLevelLimit)
	end
end

--**********************************
--�о��¼�
--**********************************
function x713586_OnEnumerate( sceneId, selfId, targetId )
		--��������ȼ�����ʾѡ��
		if GetLevel(sceneId,selfId) >= 10 then
			AddNumText(sceneId,x713586_g_ScriptId,"����ҩ����", -1, 1)
		end
		return
end

--**********************************
--����������
--**********************************
function x713586_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713586_OnAccept( sceneId, selfId, ABILITY_YAOLI )
end
