--��������������

--�ű���
x713594_g_ScriptId = 713594

--��npc������������ߵȼ�
nMaxLevel = 30

--**********************************
--������ں���
--**********************************
function x713594_OnDefaultEvent( sceneId, selfId, targetId )
	--��Ҽ��ܵĵȼ�
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_LINGXINSHU)
	--������������ܵ�������
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_LINGXINSHU)
	--�����ж�

	--�ж��Ƿ��Ƕ����ɵ���,���Ƕ��ҵ��Ӳ���ѧϰ
		if GetMenPai(sceneId,selfId) ~= OR_EMEI then
			BeginEvent(sceneId)
        		AddText(sceneId,"�㲻�Ǳ��ɵ��ӣ��Ҳ��ܽ��㡣");
        	EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
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
		DispatchAbilityInfo(sceneId, selfId, targetId,x713594_g_ScriptId, ABILITY_LINGXINSHU, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].Money, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].HumanExp, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].HumanLevelLimit)
	end
end

--**********************************
--�о��¼�
--**********************************
function x713594_OnEnumerate( sceneId, selfId, targetId )
		--��������ȼ�����ʾѡ��
		if GetLevel(sceneId,selfId) >= 10 then
			AddNumText(sceneId,x713594_g_ScriptId,"��������������", -1, 1)
		end
		return
end

--**********************************
--����������
--**********************************
function x713594_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713594_OnAccept( sceneId, selfId, ABILITY_LINGXINSHU )
end