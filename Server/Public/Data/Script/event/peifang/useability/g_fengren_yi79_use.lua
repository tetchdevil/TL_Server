-- �����䷽�ű� ����ʹ�ü���������Ʒ
-- *******
-- ���� 9 ��
-- �ýű������������ر����ܺ�����
-- x700940_AbilityCheck ��������ʹ�ü�麯��
-- x700940_AbilityConsume �����ϳɽ����������������
-- x700940_AbilityProduce �����ϳɳɹ���������Ʒ

--------------------------------------------------------------------------------
-- ���²�����Ҫ��д
--------------------------------------------------------------------------------
--�ű�������
--2��ñ�䷽ ������Ʒ

-- �ű���
x700940_g_ScriptId = 700940

-- ����ܺ�
x700940_g_AbilityID = ABILITY_FENGREN

-- ��������ܵ���󼶱�
x700940_g_AbilityMaxLevel = 12

-- �䷽��
x700940_g_RecipeID = 114

-- �䷽�ȼ�(�����ܵĵȼ�)
x700940_g_RecipeLevel = 1

-- ���ϱ�
x700940_g_CaiLiao = {
	{ID = 20105009, Count = 3},
	{ID = 20107009, Count = 2},
	{ID = 20306009, Count = 1},
	{ID = 20308078, Count = 1},
}

-- ��Ʒ��
x700940_g_ChanPin = {
	{ID = 10213030, Odds = 1666},
	{ID = 10213031, Odds = 3332},
	{ID = 10213032, Odds = 4998},
	{ID = 10213033, Odds = 6664},
	{ID = 10213034, Odds = 8330},
	{ID = 10213035, Odds = 10000},
}
--------------------------------------------------------------------------------
-- ���ϲ�����Ҫ��д
--------------------------------------------------------------------------------

----------------------------------------------------------------------------------------
--	����ʹ�ü�麯��
----------------------------------------------------------------------------------------
function x700940_AbilityCheck(sceneId, selfId)
	-- �����������
	VigorValue = x700940_g_RecipeLevel * 2 + 1
	if GetHumanVigor(sceneId, selfId) < VigorValue then
		return OR_NOT_ENOUGH_VIGOR
	end

	-- ����Ƿ�����㹻
	StartPos = LuaFnGetMaterialStartBagPos(sceneId, selfId)
	EndPos = LuaFnGetMaterialEndBagPos(sceneId, selfId)

	for idx, Mat in x700940_g_CaiLiao do
		nCount = Mat.Count

		ret = GetItemCount(sceneId, selfId, Mat.ID)
		if ret < nCount then
			return OR_STUFF_LACK
		end
	end

	return OR_OK
end

----------------------------------------------------------------------------------------
--	�ϳɽ����������������
----------------------------------------------------------------------------------------
function x700940_AbilityConsume(sceneId, selfId)
	-- ���Ƚ�����������
	VigorCost = x700940_g_RecipeLevel * 2 + 1
	VigorValue = GetHumanVigor(sceneId, selfId) - VigorCost
	SetHumanVigor(sceneId, selfId, VigorValue)

	-- Ȼ����в�������
	StartPos = LuaFnGetMaterialStartBagPos(sceneId, selfId)
	EndPos = LuaFnGetMaterialEndBagPos(sceneId, selfId)

	for idx, Mat in x700940_g_CaiLiao do
		nCount = Mat.Count

		ret = DelItem(sceneId, selfId, Mat.ID, nCount)
		if ret ~= 1 then
			return 0
		end
	end

	return 1
end

----------------------------------------------------------------------------------------
--	�ϳɳɹ���������Ʒ
----------------------------------------------------------------------------------------
function x700940_AbilityProduce(sceneId, selfId)
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, x700940_g_AbilityID)

	-- �����һ���� [1, 10000]
	rand = random(10000)

	for i, item in x700940_g_ChanPin do
		if item.Odds >= rand then
			Quality = CallScriptFunction( ABILITYLOGIC_ID, "CalcQuality", x700940_g_RecipeLevel, AbilityLevel, x700940_g_AbilityMaxLevel )

			if LuaFnTryRecieveItem(sceneId, selfId, item.ID, Quality) < 0 then
				return OR_ERROR
			end

			LuaFnSendAbilitySuccessMsg( sceneId, selfId, x700940_g_AbilityID, x700940_g_RecipeID, item.ID )
			return OR_OK
		end
	end

	return OR_ERROR
end
