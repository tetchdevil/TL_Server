--��Ƽ�������

--�ű���
x713573_g_ScriptId = 713573

--��npc������������ߵȼ�
nMaxLevel = 5

--**********************************
--������ں���
--**********************************
function x713573_OnDefaultEvent( sceneId, selfId, targetId )
	--��Ҽ��ܵĵȼ�
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_NIANGJIU)
	--�����Ƽ��ܵ�������
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_NIANGJIU)
	--�����ж�

	--�ж��Ƿ���ؤ�����,����ؤ����Ӳ���ѧϰ
		if GetMenPai(sceneId,selfId) ~= OR_GAIBANG then
			BeginEvent(sceneId)
        		AddText(sceneId,"�㲻�Ǳ��ɵ��ӣ��Ҳ��ܽ��㡣");
        	EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	--�����û��ѧ��������
	if AbilityLevel < 1	then
		BeginEvent(sceneId)
			strText = "�㻹û��ѧ����Ƽ��ܣ�"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--�������ܵȼ��Ѿ�������npc���̵ܽķ�Χ
	if AbilityLevel >= nMaxLevel then
		BeginEvent(sceneId)
			strText = "��ֻ�ܽ���1-5������Ƽ���,�뵽������ѧϰ���߼������."
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		DispatchAbilityInfo(sceneId, selfId, targetId,x713573_g_ScriptId, ABILITY_NIANGJIU, LEVELUP_ABILITY[AbilityLevel+1].Money, LEVELUP_ABILITY[AbilityLevel+1].HumanExp, LEVELUP_ABILITY[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY[AbilityLevel+1].HumanLevelLimit)
	end
end

--**********************************
--�о��¼�
--**********************************
function x713573_OnEnumerate( sceneId, selfId, targetId )
		--��������ȼ�����ʾѡ��
		if GetLevel(sceneId,selfId) >= 10 then
			AddNumText(sceneId,x713573_g_ScriptId,"������Ƽ���", -1, 1)
		end
		return
end

--**********************************
--����������
--**********************************
function x713573_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713573_OnAccept( sceneId, selfId, ABILITY_NIANGJIU )
end
