--�Ʒ���������

--�ű���
x713577_g_ScriptId = 713575

--��npc������������ߵȼ�
nMaxLevel = 5

--**********************************
--������ں���
--**********************************
function x713577_OnDefaultEvent( sceneId, selfId, targetId )
	--��Ҽ��ܵĵȼ�
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_ZHIFU)
	--����Ʒ����ܵ�������
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_ZHIFU)
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
			strText = "�㻹û��ѧ���Ʒ����ܣ�"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--�������ܵȼ��Ѿ�������npc���̵ܽķ�Χ
	if AbilityLevel >= nMaxLevel then
		BeginEvent(sceneId)
			strText = "��ֻ�ܽ���1-5�����Ʒ�����,�뵽������ѧϰ���߼����Ʒ�."
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		DispatchAbilityInfo(sceneId, selfId, targetId,x713577_g_ScriptId, ABILITY_ZHIFU, LEVELUP_ABILITY[AbilityLevel+1].Money, LEVELUP_ABILITY[AbilityLevel+1].HumanExp, LEVELUP_ABILITY[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY[AbilityLevel+1].HumanLevelLimit)
	end
end

--**********************************
--�о��¼�
--**********************************
function x713577_OnEnumerate( sceneId, selfId, targetId )
		--��������ȼ�����ʾѡ��
		if GetLevel(sceneId,selfId) >= 10 then
			AddNumText(sceneId,x713577_g_ScriptId,"�����Ʒ�����", -1, 1)
		end
		return
end

--**********************************
--����������
--**********************************
function x713577_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713577_OnAccept( sceneId, selfId, ABILITY_ZHIFU )
end
