--ʥ������������

--�ű���
x713572_g_ScriptId = 713572

--��npc������������ߵȼ�
nMaxLevel = 5

--**********************************
--������ں���
--**********************************
function x713572_OnDefaultEvent( sceneId, selfId, targetId )
	--��Ҽ��ܵĵȼ�
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_SHENGHUOSHU)
	--���ʥ�������ܵ�������
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_SHENGHUOSHU)
	--�����ж�

	--�ж��Ƿ��������ɵ���,�������ֵ��Ӳ���ѧϰ
		if GetMenPai(sceneId,selfId) ~= OR_MINGJIAO then
			BeginEvent(sceneId)
        		AddText(sceneId,"�㲻�Ǳ��ɵ��ӣ��Ҳ��ܽ��㡣");
        	EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	--�����û��ѧ��������
	if AbilityLevel < 1	then
		BeginEvent(sceneId)
			strText = "�㻹û��ѧ��ʥ�������ܣ�"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--�������ܵȼ��Ѿ�������npc���̵ܽķ�Χ
	if AbilityLevel >= nMaxLevel then
		BeginEvent(sceneId)
			strText = "��ֻ�ܽ���1-5����ʥ��������,�뵽������ѧϰ���߼���ʥ����."
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		DispatchAbilityInfo(sceneId, selfId, targetId,x713572_g_ScriptId, ABILITY_SHENGHUOSHU, LEVELUP_ABILITY[AbilityLevel+1].Money, LEVELUP_ABILITY[AbilityLevel+1].HumanExp, LEVELUP_ABILITY[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY[AbilityLevel+1].HumanLevelLimit)
	end
end

--**********************************
--�о��¼�
--**********************************
function x713572_OnEnumerate( sceneId, selfId, targetId )
		--��������ȼ�����ʾѡ��
		if GetLevel(sceneId,selfId) >= 10 then
			AddNumText(sceneId,x713572_g_ScriptId,"����ʥ��������", -1, 1)
		end
		return
end

--**********************************
--����������
--**********************************
function x713572_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713572_OnAccept( sceneId, selfId, ABILITY_SHENGHUOSHU )
end
