--ʹ���䷽�Ľű�

--�ű���
x713501_g_scriptId = 713501

--ʹ���䷽
function x713501_ReadRecipe( sceneId, playerId, recipeIndex )
	RecipeFlag = IsPrescrLearned( sceneId, playerId, recipeIndex )

	if RecipeFlag < 1 then
	-- û��ѧ��
		SetPrescription( sceneId, playerId, recipeIndex, 1 )
		Msg2Player( sceneId,playerId,"��ѧ��һ���µ��䷽",MSG2PLAYER_PARA)
		return 1
	else
	-- ��ѧ��
	-- Ŀǰ SetPrescription �Ǹ�˫���أ�ѧ�����ٵ��û���������ǲ��ݻ��䷽ʵ�塣����ʹ��
		Msg2Player( sceneId,playerId,"���䷽��ѧ��",MSG2PLAYER_PARA)
		return 0
	end

	return 0
end
