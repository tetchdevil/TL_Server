--���Ҽ���ѧϰ

--�ű���
x713506_g_ScriptId = 713506

--��npc������������ߵȼ�
nMaxLevel = 5

--ѧϰ����Ҫ˵�Ļ�
x713506_g_MessageStudy = "�����ﵽ10�����ҿϻ���1�����ӾͿ���ѧ����Ҽ��ܡ������ѧϰô��"


--**********************************
--������ں���
--**********************************
function x713506_OnDefaultEvent( sceneId, selfId, targetId, ButtomNum,g_Npc_ScriptId )
	--��Ҽ��ܵĵȼ�
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_FENGREN)
	--��ҷ��Ҽ��ܵ�������
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_FENGREN)
	--�����ж�

	--�ж��Ƿ��Ѿ�ѧ���˷���,���ѧ����,����ʾ�Ѿ�ѧ����
	if AbilityLevel >= 1 then
		BeginEvent(sceneId)
        	AddText(sceneId,"���Ѿ�ѧ����Ҽ�����");
        	EndEvent(sceneId)
        DispatchMissionTips(sceneId,selfId)
		return
	end

	--���������ǡ�ѧϰ���ܡ���������=0��
	if ButtomNum == 0 then
		
		BeginEvent(sceneId)
		AddText(sceneId,x713506_g_MessageStudy)
		--ȷ��ѧϰ��ť
				AddNumText(sceneId,x713506_g_ScriptId,"��ȷ��Ҫѧϰ", -1, 2)
		--ȡ��ѧϰ��ť
				AddNumText(sceneId,x713506_g_ScriptId,"��ֻ��������", -1, 3)
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
	SetHumanAbilityLevel(sceneId,selfId,ABILITY_FENGREN,1)
	--��npc���촰��֪ͨ����Ѿ�ѧ����
	BeginEvent(sceneId)
		AddText(sceneId,"��ѧ���˷��Ҽ���")
	EndEvent( )
	DispatchEventList(sceneId,selfId,targetId)
	else --����������ֻ����������
		CallScriptFunction( g_Npc_ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
end

--**********************************
--�о��¼�
--**********************************
function x713506_OnEnumerate( sceneId, selfId, targetId )
		--��������ȼ�����ʾѡ��
		if GetLevel(sceneId,selfId) >= 10 then
			AddNumText(sceneId,x713506_g_ScriptId,"ѧϰ���Ҽ���", -1, 0)
		end
		return
end

--**********************************
--����������
--**********************************
function x713506_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713506_OnAccept( sceneId, selfId, ABILITY_CAIKUANG )
end
