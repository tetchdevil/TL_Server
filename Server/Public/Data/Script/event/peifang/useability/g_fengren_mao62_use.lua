-- �����䷽�ű� ����ʹ�ü���������Ʒ
-- *******
-- ���� 7 ��
-- �ýű������������ر����ܺ�����
-- x700931_AbilityCheck ��������ʹ�ü�麯��
-- x700931_AbilityConsume �����ϳɽ����������������
-- x700931_AbilityProduce �����ϳɳɹ���������Ʒ

--------------------------------------------------------------------------------
-- ���²�����Ҫ��д
--------------------------------------------------------------------------------
--�ű�������
--2��ñ�䷽ ������Ʒ

-- �ű���
x700931_g_ScriptId = 700931

-- ����ܺ�
x700931_g_AbilityID = ABILITY_FENGREN

-- ��������ܵ���󼶱�
x700931_g_AbilityMaxLevel = 12

-- �䷽��
x700931_g_RecipeID = 105

-- �䷽�ȼ�(�����ܵĵȼ�)
x700931_g_RecipeLevel = 1

-- ���ϱ�
x700931_g_CaiLiao = {
	{ID = 20105007, Count = 2},
	{ID = 20107007, Count = 2},
	{ID = 20308067, Count = 1},
}

-- ��Ʒ��
x700931_g_ChanPin = {
	{ID = 10210018, Odds = 1666},
	{ID = 10210019, Odds = 3332},
	{ID = 10210020, Odds = 4998},
	{ID = 10210021, Odds = 6664},
	{ID = 10210022, Odds = 8330},
	{ID = 10210023, Odds = 10000},
}
--------------------------------------------------------------------------------
-- ���ϲ�����Ҫ��д
--------------------------------------------------------------------------------

----------------------------------------------------------------------------------------
--	����ʹ�ü�麯��
----------------------------------------------------------------------------------------
function x700931_AbilityCheck(sceneId, selfId)
	-- �����������
	VigorValue = x700931_g_RecipeLevel * 2 + 1
	if GetHumanVigor(sceneId, selfId) < VigorValue then
		return OR_NOT_ENOUGH_VIGOR
	end

	-- ����Ƿ�����㹻
	StartPos = LuaFnGetMaterialStartBagPos(sceneId, selfId)
	EndPos = LuaFnGetMaterialEndBagPos(sceneId, selfId)

	for idx, Mat in x700931_g_CaiLiao do
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
function x700931_AbilityConsume(sceneId, selfId)
	-- ���Ƚ�����������
	VigorCost = x700931_g_RecipeLevel * 2 + 1
	VigorValue = GetHumanVigor(sceneId, selfId) - VigorCost
	SetHumanVigor(sceneId, selfId, VigorValue)

	-- Ȼ����в�������
	StartPos = LuaFnGetMaterialStartBagPos(sceneId, selfId)
	EndPos = LuaFnGetMaterialEndBagPos(sceneId, selfId)

	for idx, Mat in x700931_g_CaiLiao do
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
function x700931_AbilityProduce(sceneId, selfId)
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, x700931_g_AbilityID)

	-- �����һ���� [1, 10000]
	rand = random(10000)

	for i, item in x700931_g_ChanPin do
		if item.Odds >= rand then
			Quality = CallScriptFunction( ABILITYLOGIC_ID, "CalcQuality", x700931_g_RecipeLevel, AbilityLevel, x700931_g_AbilityMaxLevel )

			if LuaFnTryRecieveItem(sceneId, selfId, item.ID, Quality) < 0 then
				return OR_ERROR
			end

			LuaFnSendAbilitySuccessMsg( sceneId, selfId, x700931_g_AbilityID, x700931_g_RecipeID, item.ID )
			return OR_OK
		end
	end

	return OR_ERROR
end
