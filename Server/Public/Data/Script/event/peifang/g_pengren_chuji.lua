-- ��ͨ�䷽�ű�
-- 700904
-- ��⿳���
-- �ýű������������ر����ܺ�����
-- x700904_AbilityCheck ��������ʹ�ü�麯��
-- x700904_AbilityConsume �����ϳɽ����������������
-- x700904_AbilityProduce �����ϳɳɹ���������Ʒ
-- �ű���
x700904_g_ScriptId = 700904

-- ����ܺ�
x700904_g_AbilityID = ABILITY_PENGREN

-- ��������ܵ���󼶱�
x700904_g_AbilityMaxLevel = 12

-- �䷽�ȼ�
x700904_g_RecipeLevel = 1

----------------------------------------------------------------------------------------
--	����ʹ�ü�麯��
----------------------------------------------------------------------------------------
function x700904_AbilityCheck(sceneId, selfId)
	-- �����������
	VigorValue = x700904_g_RecipeLevel * 2 + 1
	if GetHumanVigor(sceneId, selfId) < VigorValue then
		return OR_NOT_ENOUGH_VIGOR
	end

	-- ����Ƿ�����㹻
	ret = CallScriptFunction( ABILITYLOGIC_ID, "MaterialCheck", sceneId, selfId, PENGREN_CHUJICAILIAO, 3 )
	if ret == 1 then
		return OR_OK
	end

	ret = CallScriptFunction( ABILITYLOGIC_ID, "MaterialCheck", sceneId, selfId, PENGREN_ZHONGJICAILIAO, 2 )
	if ret == 1 then
		return OR_OK
	end

	ret = CallScriptFunction( ABILITYLOGIC_ID, "MaterialCheck", sceneId, selfId, PENGREN_GAOJICAILIAO, 1 )
	if ret == 1 then
		return OR_OK
	end

	return OR_STUFF_LACK
end

----------------------------------------------------------------------------------------
--	�ϳɽ����������������
----------------------------------------------------------------------------------------
function x700904_AbilityConsume(sceneId, selfId)
	-- ���Ƚ�����������
	VigorCost = x700904_g_RecipeLevel * 2 + 1
	VigorValue = GetHumanVigor(sceneId, selfId) - VigorCost
	SetHumanVigor(sceneId, selfId, VigorValue)

	-- Ȼ����в�������
	ret = CallScriptFunction( ABILITYLOGIC_ID, "MaterialCheck", sceneId, selfId, PENGREN_CHUJICAILIAO, 3 )
	if ret == 1 then
		ret = CallScriptFunction( ABILITYLOGIC_ID, "MaterialConsume", sceneId, selfId, PENGREN_CHUJICAILIAO, 3 )
		return ret
	end

	ret = CallScriptFunction( ABILITYLOGIC_ID, "MaterialCheck", sceneId, selfId, PENGREN_ZHONGJICAILIAO, 2 )
	if ret == 1 then
		ret = CallScriptFunction( ABILITYLOGIC_ID, "MaterialConsume", sceneId, selfId, PENGREN_ZHONGJICAILIAO, 2 )
		return ret
	end

	ret = CallScriptFunction( ABILITYLOGIC_ID, "MaterialCheck", sceneId, selfId, PENGREN_GAOJICAILIAO, 1 )
	if ret == 1 then
		ret = CallScriptFunction( ABILITYLOGIC_ID, "MaterialConsume", sceneId, selfId, PENGREN_GAOJICAILIAO, 1 )
		return ret
	end

	return 0
end

----------------------------------------------------------------------------------------
--	�ϳɳɹ���������Ʒ
----------------------------------------------------------------------------------------
function x700904_AbilityProduce(sceneId, selfId)
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, x700904_g_AbilityID)

	ret = CallScriptFunction( ABILITYLOGIC_ID, "ProduceComplex", sceneId, selfId, PENGREN_CHUJICAILIAO, x700904_g_RecipeLevel, AbilityLevel, x700904_g_AbilityMaxLevel )
	if ret > -1 then
		LuaFnSendAbilitySuccessMsg( sceneId, selfId, x700904_g_AbilityID, 213, ret )
		return OR_OK
	end

	return OR_ERROR
end
