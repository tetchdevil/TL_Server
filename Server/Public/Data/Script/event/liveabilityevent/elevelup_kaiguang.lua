--���⼼������

--�ű���
x713571_g_ScriptId = 713571

--��npc������������ߵȼ�
nMaxLevel = 5

--**********************************
--������ں���
--**********************************
function x713571_OnDefaultEvent( sceneId, selfId, targetId )
	--��Ҽ��ܵĵȼ�
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_KAIGUANG)
	--��ҿ��⼼�ܵ�������
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_KAIGUANG)
	--�����ж�

	--�ж��Ƿ��������ɵ���,�������ֵ��Ӳ���ѧϰ
		if GetMenPai(sceneId,selfId) ~= OR_SHAOLIN then
			BeginEvent(sceneId)
        		AddText(sceneId,"�㲻�Ǳ��ɵ��ӣ��Ҳ��ܽ��㡣");
        	EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	--�����û��ѧ��������
	if AbilityLevel < 1	then
		BeginEvent(sceneId)
			strText = "�㻹û��ѧ�Ὺ�⼼�ܣ�"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--�������ܵȼ��Ѿ�������npc���̵ܽķ�Χ
	if AbilityLevel >= nMaxLevel then
		BeginEvent(sceneId)
			strText = "��ֻ�ܽ���1-5���Ŀ��⼼��,�뵽������ѧϰ���߼��Ŀ���."
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		DispatchAbilityInfo(sceneId, selfId, targetId,x713571_g_ScriptId, ABILITY_KAIGUANG, LEVELUP_ABILITY[AbilityLevel+1].Money, LEVELUP_ABILITY[AbilityLevel+1].HumanExp, LEVELUP_ABILITY[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY[AbilityLevel+1].HumanLevelLimit)
	end
end

--**********************************
--�о��¼�
--**********************************
function x713571_OnEnumerate( sceneId, selfId, targetId )
		--��������ȼ�����ʾѡ��
		if GetLevel(sceneId,selfId) >= 10 then
			AddNumText(sceneId,x713571_g_ScriptId,"�������⼼��", -1, 1)
		end
		return
end

--**********************************
--����������
--**********************************
function x713571_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713571_OnAccept( sceneId, selfId, ABILITY_KAIGUANG )
end
