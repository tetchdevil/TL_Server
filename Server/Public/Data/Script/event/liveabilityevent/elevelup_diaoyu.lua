--���㼼������

--�ű���
x713569_g_ScriptId = 713569

--��npc������������ߵȼ�
nMaxLevel = 5

--**********************************
--������ں���
--**********************************
function x713569_OnDefaultEvent( sceneId, selfId, targetId )
	--��Ҽ��ܵĵȼ�
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_DIAOYU)
	--��Ҽӹ����ܵ�������
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_DIAOYU)
	--�����ж�

	--�����û��ѧ��������
	if AbilityLevel < 1	then
		BeginEvent(sceneId)
			strText = "�㻹û��ѧ����㼼�ܣ�"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--�������ܵȼ��Ѿ�������npc���̵ܽķ�Χ
	if AbilityLevel >= nMaxLevel then
		BeginEvent(sceneId)
			strText = "��ֻ�ܽ���1-5���ĵ��㼼��,�뵽������ѧϰ���߼��ĵ���"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		DispatchAbilityInfo(sceneId, selfId, targetId,x713569_g_ScriptId, ABILITY_DIAOYU, LEVELUP_ABILITY[AbilityLevel+1].Money, LEVELUP_ABILITY[AbilityLevel+1].HumanExp, LEVELUP_ABILITY[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY[AbilityLevel+1].HumanLevelLimit)
	end
end

--**********************************
--�о��¼�
--**********************************
function x713569_OnEnumerate( sceneId, selfId, targetId )
		--��������ȼ�����ʾѡ��
		if GetLevel(sceneId,selfId) >= 10 then
			AddNumText(sceneId,x713569_g_ScriptId,"�������㼼��", -1, 1)
		end
		return
end

--**********************************
--����������
--**********************************
function x713569_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713569_OnAccept( sceneId, selfId, ABILITY_DIAOYU )
end
