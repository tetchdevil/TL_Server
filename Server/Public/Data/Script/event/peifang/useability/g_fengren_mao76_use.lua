-- �����䷽�ű� ����ʹ�ü���������Ʒ
-- *******
-- ���� 9 ��
-- �ýű������������ر����ܺ�����
-- x700939_AbilityCheck ��������ʹ�ü�麯��
-- x700939_AbilityConsume �����ϳɽ����������������
-- x700939_AbilityProduce �����ϳɳɹ���������Ʒ

--------------------------------------------------------------------------------
-- ���²�����Ҫ��д
--------------------------------------------------------------------------------
--�ű�������
--2��ñ�䷽ ������Ʒ

-- �ű���
x700939_g_ScriptId = 700939

-- ����ܺ�
x700939_g_AbilityID = ABILITY_FENGREN

-- ��������ܵ���󼶱�
x700939_g_AbilityMaxLevel = 12

-- �䷽��
x700939_g_RecipeID = 113

-- �䷽�ȼ�(�����ܵĵȼ�)
x700939_g_RecipeLevel = 1

-- ���ϱ�
x700939_g_CaiLiao = {
	{ID = 20105009, Count = 2},
	{ID = 20107009, Count = 2},
	{ID = 20306009, Count = 1},
	{ID = 20308068, Count = 1},
}

-- ��Ʒ��
x700939_g_ChanPin = {
	{ID = 10210030, Odds = 1666},
	{ID = 10210031, Odds = 3332},
	{ID = 10210032, Odds = 4998},
	{ID = 10210033, Odds = 6664},
	{ID = 10210034, Odds = 8330},
	{ID = 10210035, Odds = 10000},
}
--------------------------------------------------------------------------------
-- ���ϲ�����Ҫ��д
--------------------------------------------------------------------------------

----------------------------------------------------------------------------------------
--	����ʹ�ü�麯��
----------------------------------------------------------------------------------------
function x700939_AbilityCheck(sceneId, selfId)
	-- �����������
	VigorValue = x700939_g_RecipeLevel * 2 + 1
	if GetHumanVigor(sceneId, selfId) < VigorValue then
		return OR_NOT_ENOUGH_VIGOR
	end

	-- ����Ƿ�����㹻
	StartPos = LuaFnGetMaterialStartBagPos(sceneId, selfId)
	EndPos = LuaFnGetMaterialEndBagPos(sceneId, selfId)

	for idx, Mat in x700939_g_CaiLiao do
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
function x700939_AbilityConsume(sceneId, selfId)
	-- ���Ƚ�����������
	VigorCost = x700939_g_RecipeLevel * 2 + 1
	VigorValue = GetHumanVigor(sceneId, selfId) - VigorCost
	SetHumanVigor(sceneId, selfId, VigorValue)

	-- Ȼ����в�������
	StartPos = LuaFnGetMaterialStartBagPos(sceneId, selfId)
	EndPos = LuaFnGetMaterialEndBagPos(sceneId, selfId)

	for idx, Mat in x700939_g_CaiLiao do
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
function x700939_AbilityProduce(sceneId, selfId)
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, x700939_g_AbilityID)

	-- �����һ���� [1, 10000]
	rand = random(10000)

	for i, item in x700939_g_ChanPin do
		if item.Odds >= rand then
			Quality = CallScriptFunction( ABILITYLOGIC_ID, "CalcQuality", x700939_g_RecipeLevel, AbilityLevel, x700939_g_AbilityMaxLevel )

			if LuaFnTryRecieveItem(sceneId, selfId, item.ID, Quality) < 0 then
				return OR_ERROR
			end

			LuaFnSendAbilitySuccessMsg( sceneId, selfId, x700939_g_AbilityID, x700939_g_RecipeID, item.ID )
			return OR_OK
		end
	end

	return OR_ERROR
end
