--��������������

--�ű���
x713587_g_ScriptId = 713587

--��npc������������ߵȼ�
nMaxLevel = 30

--**********************************
--������ں���
--**********************************
function x713587_OnDefaultEvent( sceneId, selfId, targetId )
	--��Ҽ��ܵĵȼ�
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_YANGSHENGFA)
	--��Ҽӹ����ܵ�������
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_YANGSHENGFA)
	--�����ж�

	--�����û��ѧ��������
	if AbilityLevel < 1	then
		BeginEvent(sceneId)
			strText = "�㻹û��ѧ�����������ܣ�"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--�������ܵȼ��Ѿ�������npc���̵ܽķ�Χ
	if AbilityLevel >= nMaxLevel then
		BeginEvent(sceneId)
			strText = "��ֻ�ܽ���1-"..nMaxLevel.."��������������,�뵽������ѧϰ���߼���������"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		DispatchAbilityInfo(sceneId, selfId, targetId,x713587_g_ScriptId, ABILITY_YANGSHENGFA, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].Money, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].HumanExp, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].HumanLevelLimit)
	end
end

--**********************************
--�о��¼�
--**********************************
function x713587_OnEnumerate( sceneId, selfId, targetId )
		--��������ȼ�����ʾѡ��
		if GetLevel(sceneId,selfId) >= 10 then
			AddNumText(sceneId,x713587_g_ScriptId,"��������������", -1, 1)
		end
		return
end

--**********************************
--����������
--**********************************
function x713587_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713587_OnAccept( sceneId, selfId, ABILITY_YANGSHENGFA )
end
