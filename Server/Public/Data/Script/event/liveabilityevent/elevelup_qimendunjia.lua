--���Ŷݼ׼�������

--�ű���
x713579_g_ScriptId = 713579

--��npc������������ߵȼ�
nMaxLevel = 5

--**********************************
--������ں���
--**********************************
function x713579_OnDefaultEvent( sceneId, selfId, targetId )
	--��Ҽ��ܵĵȼ�
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_QIMENDUNJIA)
	--������Ŷݼ׼��ܵ�������
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_QIMENDUNJIA)
	--�����ж�

	--�ж��Ƿ�����ң�ɵ���,������ң���Ӳ���ѧϰ
		if GetMenPai(sceneId,selfId) ~= OR_XIAOYAO then
			BeginEvent(sceneId)
        		AddText(sceneId,"�㲻�Ǳ��ɵ��ӣ��Ҳ��ܽ��㡣");
        	EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	--�����û��ѧ��������
	if AbilityLevel < 1	then
		BeginEvent(sceneId)
			strText = "�㻹û��ѧ�����Ŷݼ׼��ܣ�"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--�������ܵȼ��Ѿ�������npc���̵ܽķ�Χ
	if AbilityLevel >= nMaxLevel then
		BeginEvent(sceneId)
			strText = "��ֻ�ܽ���1-5�������Ŷݼ׼���,�뵽������ѧϰ���߼������Ŷݼ�."
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		DispatchAbilityInfo(sceneId, selfId, targetId,x713579_g_ScriptId, ABILITY_QIMENDUNJIA, LEVELUP_ABILITY[AbilityLevel+1].Money, LEVELUP_ABILITY[AbilityLevel+1].HumanExp, LEVELUP_ABILITY[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY[AbilityLevel+1].HumanLevelLimit)
	end
end

--**********************************
--�о��¼�
--**********************************
function x713579_OnEnumerate( sceneId, selfId, targetId )
		--��������ȼ�����ʾѡ��
		if GetLevel(sceneId,selfId) >= 10 then
			AddNumText(sceneId,x713579_g_ScriptId,"�������Ŷݼ׼���", -1, 1)
		end
		return
end

--**********************************
--����������
--**********************************
function x713579_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713579_OnAccept( sceneId, selfId, ABILITY_QIMENDUNJIA )
end
