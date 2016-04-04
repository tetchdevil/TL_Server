-- ��ͨ�䷽�ű�
-- 700901
-- �ýű������������ر����ܺ�����
-- x700901_AbilityCheck ��������ʹ�ü�麯��
-- x700901_AbilityConsume �����ϳɽ����������������
-- x700901_AbilityProduce �����ϳɳɹ���������Ʒ
-- �ű���
x700901_g_ScriptId = 700901

-- ����ܺ�
x700901_g_AbilityID = ABILITY_ZHIYAO

-- ��������ܵ���󼶱�
x700901_g_AbilityMaxLevel = 12

-- �䷽�ȼ�
x700901_g_RecipeLevel = 1

----------------------------------------------------------------------------------------
--	����ʹ�ü�麯��
----------------------------------------------------------------------------------------
function x700901_AbilityCheck(sceneId, selfId)
	-- �����������
	VigorValue = x700901_g_RecipeLevel * 2 + 1
	if GetHumanVigor(sceneId, selfId) < VigorValue then
		return OR_NOT_ENOUGH_VIGOR
	end

	-- ����Ƿ�����㹻
	ret = CallScriptFunction( ABILITYLOGIC_ID, "MaterialCheck", sceneId, selfId, ZHIYAO_CHUJICAILIAO, 3 )
	if ret == 1 then
		return OR_OK
	end

	ret = CallScriptFunction( ABILITYLOGIC_ID, "MaterialCheck", sceneId, selfId, ZHIYAO_ZHONGJICAILIAO, 2 )
	if ret == 1 then
		return OR_OK
	end

	ret = CallScriptFunction( ABILITYLOGIC_ID, "MaterialCheck", sceneId, selfId, ZHIYAO_GAOJICAILIAO, 1 )
	if ret == 1 then
		return OR_OK
	end

	return OR_STUFF_LACK
end

----------------------------------------------------------------------------------------
--	�ϳɽ����������������
----------------------------------------------------------------------------------------
function x700901_AbilityConsume(sceneId, selfId)
	-- ���Ƚ�����������
	VigorCost = x700901_g_RecipeLevel * 2 + 1
	VigorValue = GetHumanVigor(sceneId, selfId) - VigorCost
	SetHumanVigor(sceneId, selfId, VigorValue)

	-- Ȼ����в�������
	ret = CallScriptFunction( ABILITYLOGIC_ID, "MaterialCheck", sceneId, selfId, ZHIYAO_CHUJICAILIAO, 3 )
	if ret == 1 then
		ret = CallScriptFunction( ABILITYLOGIC_ID, "MaterialConsume", sceneId, selfId, ZHIYAO_CHUJICAILIAO, 3 )
		return ret
	end

	ret = CallScriptFunction( ABILITYLOGIC_ID, "MaterialCheck", sceneId, selfId, ZHIYAO_ZHONGJICAILIAO, 2 )
	if ret == 1 then
		ret = CallScriptFunction( ABILITYLOGIC_ID, "MaterialConsume", sceneId, selfId, ZHIYAO_ZHONGJICAILIAO, 2 )
		return ret
	end

	ret = CallScriptFunction( ABILITYLOGIC_ID, "MaterialCheck", sceneId, selfId, ZHIYAO_GAOJICAILIAO, 1 )
	if ret == 1 then
		ret = CallScriptFunction( ABILITYLOGIC_ID, "MaterialConsume", sceneId, selfId, ZHIYAO_GAOJICAILIAO, 1 )
		return ret
	end

	return 0
end

----------------------------------------------------------------------------------------
--	�ϳɳɹ���������Ʒ
----------------------------------------------------------------------------------------
function x700901_AbilityProduce(sceneId, selfId)
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, x700901_g_AbilityID)

	ret = CallScriptFunction( ABILITYLOGIC_ID, "ProduceComplex", sceneId, selfId, ZHIYAO_CHUJICAILIAO, x700901_g_RecipeLevel, AbilityLevel, x700901_g_AbilityMaxLevel )
	if ret > -1 then
		LuaFnSendAbilitySuccessMsg( sceneId, selfId, x700901_g_AbilityID, 163, ret )
		return OR_OK
	end

	return OR_ERROR
end
