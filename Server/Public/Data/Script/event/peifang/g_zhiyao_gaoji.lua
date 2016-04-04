-- ��ͨ�䷽�ű�
-- 700903
-- ��ҩ�߼�
-- �ýű������������ر����ܺ�����
-- x700903_AbilityCheck ��������ʹ�ü�麯��
-- x700903_AbilityConsume �����ϳɽ����������������
-- x700903_AbilityProduce �����ϳɳɹ���������Ʒ
-- �ű���
x700903_g_ScriptId = 700903

-- ����ܺ�
x700903_g_AbilityID = ABILITY_ZHIYAO

-- ��������ܵ���󼶱�
x700903_g_AbilityMaxLevel = 12

-- �䷽�ȼ�
x700903_g_RecipeLevel = 7

----------------------------------------------------------------------------------------
--	����ʹ�ü�麯��
----------------------------------------------------------------------------------------
function x700903_AbilityCheck(sceneId, selfId)
	-- �����������
	VigorValue = x700903_g_RecipeLevel * 2 + 1
	if GetHumanVigor(sceneId, selfId) < VigorValue then
		return OR_NOT_ENOUGH_VIGOR
	end

	-- ����Ƿ�����㹻
	--ret = CallScriptFunction( ABILITYLOGIC_ID, "MaterialCheck", sceneId, selfId, ZHIYAO_CHUJICAILIAO, 3 )
	--if ret == 1 then
	--	return OR_OK
	--end

	--ret = CallScriptFunction( ABILITYLOGIC_ID, "MaterialCheck", sceneId, selfId, ZHIYAO_ZHONGJICAILIAO, 2 )
	--if ret == 1 then
	--	return OR_OK
	--end

	ret = CallScriptFunction( ABILITYLOGIC_ID, "MaterialCheck", sceneId, selfId, ZHIYAO_GAOJICAILIAO, 1 )
	if ret == 1 then
		return OR_OK
	end

	return OR_STUFF_LACK
end

----------------------------------------------------------------------------------------
--	�ϳɽ����������������
----------------------------------------------------------------------------------------
function x700903_AbilityConsume(sceneId, selfId)
	-- ���Ƚ�����������
	VigorCost = x700903_g_RecipeLevel * 2 + 1
	VigorValue = GetHumanVigor(sceneId, selfId) - VigorCost
	SetHumanVigor(sceneId, selfId, VigorValue)

	-- Ȼ����в�������
	--ret = CallScriptFunction( ABILITYLOGIC_ID, "MaterialCheck", sceneId, selfId, ZHIYAO_CHUJICAILIAO, 3 )
	--if ret == 1 then
	--	ret = CallScriptFunction( ABILITYLOGIC_ID, "MaterialConsume", sceneId, selfId, ZHIYAO_CHUJICAILIAO, 3 )
	--	return ret
	--end

	--ret = CallScriptFunction( ABILITYLOGIC_ID, "MaterialCheck", sceneId, selfId, ZHIYAO_ZHONGJICAILIAO, 2 )
	--if ret == 1 then
	--	ret = CallScriptFunction( ABILITYLOGIC_ID, "MaterialConsume", sceneId, selfId, ZHIYAO_ZHONGJICAILIAO, 2 )
	--	return ret
	--end

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
function x700903_AbilityProduce(sceneId, selfId)
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, x700903_g_AbilityID)

	ret = CallScriptFunction( ABILITYLOGIC_ID, "ProduceComplex", sceneId, selfId, ZHIYAO_GAOJICAILIAO, x700903_g_RecipeLevel, AbilityLevel, x700903_g_AbilityMaxLevel )
	if ret > -1 then
		LuaFnSendAbilitySuccessMsg( sceneId, selfId, x700903_g_AbilityID, 165, ret )
		return OR_OK
	end

	return OR_ERROR
end
