--��⿼�������

--�ű���
x713561_g_ScriptId = 713561

--��npc������������ߵȼ�
nMaxLevel = 5

--**********************************
--������ں���
--**********************************
function x713561_OnDefaultEvent( sceneId, selfId, targetId )
	--��Ҽ��ܵĵȼ�
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_PENGREN)
	--��Ҽӹ����ܵ�������
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_PENGREN)
	--�����ж�

	--�����û��ѧ��������
	if AbilityLevel < 1	then
		BeginEvent(sceneId)
			strText = "�㻹û��ѧ����⿼��ܣ�"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--�������ܵȼ��Ѿ�������npc���̵ܽķ�Χ
	if AbilityLevel >= nMaxLevel then
		BeginEvent(sceneId)
			strText = "��ֻ�ܽ���1-5������⿼���,�뵽������ѧϰ���߼������"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		DispatchAbilityInfo(sceneId, selfId, targetId,x713561_g_ScriptId, ABILITY_PENGREN, LEVELUP_ABILITY[AbilityLevel+1].Money, LEVELUP_ABILITY[AbilityLevel+1].HumanExp, LEVELUP_ABILITY[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY[AbilityLevel+1].HumanLevelLimit)
	end
end

--**********************************
--�о��¼�
--**********************************
function x713561_OnEnumerate( sceneId, selfId, targetId )
		--��������ȼ�����ʾѡ��
		if GetLevel(sceneId,selfId) >= 10 then
			AddNumText(sceneId,x713561_g_ScriptId,"������⿼���", -1, 1)
		end
		return
end

--**********************************
--����������
--**********************************
function x713561_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713561_OnAccept( sceneId, selfId, ABILITY_PENGREN )
end
