--������������

--�ű���
x713595_g_ScriptId = 713595

--��npc������������ߵȼ�
nMaxLevel = 30

--**********************************
--������ں���
--**********************************
function x713595_OnDefaultEvent( sceneId, selfId, targetId )
	--��Ҽ��ܵĵȼ�
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_DAOFA)
	--��ҵ������ܵ�������
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_DAOFA)
	--�����ж�

	--�ж��Ƿ����䵱�ɵ���,�����䵱���Ӳ���ѧϰ
		if GetMenPai(sceneId,selfId) ~= OR_WUDANG then
			BeginEvent(sceneId)
        		AddText(sceneId,"�㲻�Ǳ��ɵ��ӣ��Ҳ��ܽ��㡣");
        	EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	--�����û��ѧ��������
	if AbilityLevel < 1	then
		BeginEvent(sceneId)
			strText = "�㻹û��ѧ��������ܣ�"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--�������ܵȼ��Ѿ�������npc���̵ܽķ�Χ
	if AbilityLevel >= nMaxLevel then
		BeginEvent(sceneId)
			strText = "��ֻ�ܽ���1-"..nMaxLevel.."���ĵ�������,�뵽������ѧϰ���߼��ĵ���"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		DispatchAbilityInfo(sceneId, selfId, targetId,x713595_g_ScriptId, ABILITY_DAOFA, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].Money, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].HumanExp, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].HumanLevelLimit)
	end
end

--**********************************
--�о��¼�
--**********************************
function x713595_OnEnumerate( sceneId, selfId, targetId )
		--��������ȼ�����ʾѡ��
		if GetLevel(sceneId,selfId) >= 10 then
			AddNumText(sceneId,x713595_g_ScriptId,"������������", -1, 1)
		end
		return
end

--**********************************
--����������
--**********************************
function x713595_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713595_OnAccept( sceneId, selfId, ABILITY_DAOFA )
end
