--�ƶ�����ѧϰ

--�ű���
x713517_g_ScriptId = 713517

--��npc������������ߵȼ�
nMaxLevel = 5

--ѧϰ����Ҫ˵�Ļ�
x713517_g_MessageStudy = "�����ﵽ10�����ҿϻ���1�����ӾͿ���ѧ���ƶ����ܡ������ѧϰô��"


--**********************************
--������ں���
--**********************************
function x713517_OnDefaultEvent( sceneId, selfId, targetId, ButtomNum,g_Npc_ScriptId )
	--��Ҽ��ܵĵȼ�
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_ZHIDU)
	--����ƶ����ܵ�������
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_ZHIDU)
	--�����ж�

	--�ж��Ƿ��������ɵ���,�������޵��Ӳ���ѧϰ
		if GetMenPai(sceneId,selfId) ~= OR_XINGSU then
			BeginEvent(sceneId)
        		AddText(sceneId,"�㲻�Ǳ��ɵ��ӣ��Ҳ��ܽ��㡣");
        	EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	--�ж��Ƿ��Ѿ�ѧ�����ƶ�,���ѧ����,����ʾ�Ѿ�ѧ����
	if AbilityLevel >= 1 then
		BeginEvent(sceneId)
        	AddText(sceneId,"���Ѿ�ѧ���ƶ�������");
        	EndEvent(sceneId)
        DispatchMissionTips(sceneId,selfId)
		return
	end

	--���������ǡ�ѧϰ���ܡ���������=0��
	if ButtomNum == 0 then
		
		BeginEvent(sceneId)
		AddText(sceneId,x713517_g_MessageStudy)
		--ȷ��ѧϰ��ť
				AddNumText(sceneId,x713517_g_ScriptId,"��ȷ��Ҫѧϰ", -1, 2)
		--ȡ��ѧϰ��ť
				AddNumText(sceneId,x713517_g_ScriptId,"��ֻ��������", -1, 3)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif ButtomNum == 2 then			--���������ǡ���ȷ��Ҫѧϰ��
	--�������Ƿ���һ�����ҵ��ֽ�
	if GetMoney(sceneId,selfId) <= 100 then			
		BeginEvent(sceneId)
			AddText(sceneId,"��Ľ�Ǯ����");
			EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	--�����ҵȼ��Ƿ�ﵽҪ��
	if GetLevel(sceneId,selfId) < LEVELUP_ABILITY[1].HumanLevelLimit then
		BeginEvent(sceneId)
			AddText(sceneId,"��ĵȼ�����");
			EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	--ɾ����Ǯ
	CostMoney(sceneId,selfId,100)
	--����������1
	SetHumanAbilityLevel(sceneId,selfId,ABILITY_ZHIDU,1)
	--��npc���촰��֪ͨ����Ѿ�ѧ����
	BeginEvent(sceneId)
		AddText(sceneId,"��ѧ�����ƶ�����")
	EndEvent( )
	DispatchEventList(sceneId,selfId,targetId)
	else --����������ֻ����������
		CallScriptFunction( g_Npc_ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
end

--**********************************
--�о��¼�
--**********************************
function x713517_OnEnumerate( sceneId, selfId, targetId )
		--��������ȼ�����ʾѡ��
		if GetLevel(sceneId,selfId) >= 10 then
			AddNumText(sceneId,x713517_g_ScriptId,"ѧϰ�ƶ�����", -1, 0)
		end
		return
end

--**********************************
--����������
--**********************************
function x713517_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713517_OnAccept( sceneId, selfId, ABILITY_CAIKUANG )
end
