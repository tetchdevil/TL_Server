--��Ƕ��������

--�ű���
x713563_g_ScriptId = 713563

--��npc������������ߵȼ�
nMaxLevel = 5

--**********************************
--������ں���
--**********************************
function x713563_OnDefaultEvent( sceneId, selfId, targetId)
	--��Ҽ��ܵĵȼ�
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_XIANGQIAN)
	--��Ҽӹ����ܵ�������
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_XIANGQIAN)
	--�����ж�

	--�����û��ѧ��������
	if AbilityLevel < 1	then
		BeginEvent(sceneId)
			strText = "�㻹û��ѧ����Ƕ���ܣ�"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--�������ܵȼ��Ѿ�������npc���̵ܽķ�Χ
	if AbilityLevel >= nMaxLevel then
		BeginEvent(sceneId)
			strText = "��ֻ�ܽ���1-5������Ƕ����,�뵽������ѧϰ���߼�����Ƕ"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		DispatchAbilityInfo(sceneId, selfId, targetId,x713563_g_ScriptId, ABILITY_XIANGQIAN, LEVELUP_ABILITY_XIANGQIAN[AbilityLevel+1].Money, LEVELUP_ABILITY_XIANGQIAN[AbilityLevel+1].HumanExp, LEVELUP_ABILITY_XIANGQIAN[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY_XIANGQIAN[AbilityLevel+1].HumanLevelLimit)
	end
end

--**********************************
--�о��¼�
--**********************************
function x713563_OnEnumerate( sceneId, selfId, targetId )
		--��������ȼ�����ʾѡ��
		if GetLevel(sceneId,selfId) >= 10 then
			AddNumText(sceneId,x713563_g_ScriptId,"������Ƕ����", -1, 1)
		end
		return
end

--**********************************
--����������
--**********************************
function x713563_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713563_OnAccept( sceneId, selfId, ABILITY_XIANGQIAN )
end
