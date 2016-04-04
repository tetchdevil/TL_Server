-- �����䷽�ű� ����ʹ�ü���������Ʒ
-- *******
-- ���� 7 ��
-- �ýű������������ر����ܺ�����
-- x700933_AbilityCheck ��������ʹ�ü�麯��
-- x700933_AbilityConsume �����ϳɽ����������������
-- x700933_AbilityProduce �����ϳɳɹ���������Ʒ

--------------------------------------------------------------------------------
-- ���²�����Ҫ��д
--------------------------------------------------------------------------------
--�ű�������
--2��ñ�䷽ ������Ʒ

-- �ű���
x700933_g_ScriptId = 700933

-- ����ܺ�
x700933_g_AbilityID = ABILITY_FENGREN

-- ��������ܵ���󼶱�
x700933_g_AbilityMaxLevel = 12

-- �䷽��
x700933_g_RecipeID = 107

-- �䷽�ȼ�(�����ܵĵȼ�)
x700933_g_RecipeLevel = 1

-- ���ϱ�
x700933_g_CaiLiao = {
	{ID = 20105007, Count = 2},
	{ID = 20107007, Count = 1},
	{ID = 20308087, Count = 1},
}

-- ��Ʒ��
x700933_g_ChanPin = {
	{ID = 10212018, Odds = 1666},
	{ID = 10212019, Odds = 3332},
	{ID = 10212020, Odds = 4998},
	{ID = 10212021, Odds = 6664},
	{ID = 10212022, Odds = 8330},
	{ID = 10212023, Odds = 10000},
}
--------------------------------------------------------------------------------
-- ���ϲ�����Ҫ��д
--------------------------------------------------------------------------------

----------------------------------------------------------------------------------------
--	����ʹ�ü�麯��
----------------------------------------------------------------------------------------
function x700933_AbilityCheck(sceneId, selfId)
	-- �����������
	VigorValue = x700933_g_RecipeLevel * 2 + 1
	if GetHumanVigor(sceneId, selfId) < VigorValue then
		return OR_NOT_ENOUGH_VIGOR
	end

	-- ����Ƿ�����㹻
	StartPos = LuaFnGetMaterialStartBagPos(sceneId, selfId)
	EndPos = LuaFnGetMaterialEndBagPos(sceneId, selfId)

	for idx, Mat in x700933_g_CaiLiao do
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
function x700933_AbilityConsume(sceneId, selfId)
	-- ���Ƚ�����������
	VigorCost = x700933_g_RecipeLevel * 2 + 1
	VigorValue = GetHumanVigor(sceneId, selfId) - VigorCost
	SetHumanVigor(sceneId, selfId, VigorValue)

	-- Ȼ����в�������
	StartPos = LuaFnGetMaterialStartBagPos(sceneId, selfId)
	EndPos = LuaFnGetMaterialEndBagPos(sceneId, selfId)

	for idx, Mat in x700933_g_CaiLiao do
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
function x700933_AbilityProduce(sceneId, selfId)
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, x700933_g_AbilityID)

	-- �����һ���� [1, 10000]
	rand = random(10000)

	for i, item in x700933_g_ChanPin do
		if item.Odds >= rand then
			Quality = CallScriptFunction( ABILITYLOGIC_ID, "CalcQuality", x700933_g_RecipeLevel, AbilityLevel, x700933_g_AbilityMaxLevel )

			if LuaFnTryRecieveItem(sceneId, selfId, item.ID, Quality) < 0 then
				return OR_ERROR
			end

			LuaFnSendAbilitySuccessMsg( sceneId, selfId, x700933_g_AbilityID, x700933_g_RecipeID, item.ID )
			return OR_OK
		end
	end

	return OR_ERROR
end
