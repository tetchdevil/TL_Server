--������
--����
--�ű���715006
--����100%
--�ȼ�1

--ÿ�δ򿪱ض���õĲ�Ʒ
x715006_g_MainItemId = 40003003

--���ɺ�����ʼ************************************************************************
--ÿ��ItemBox�����10����Ʒ
function 		x715006_OnCreate(sceneId,growPointType,x,y)
	--����ItemBoxͬʱ����һ����Ʒ
	targetId  = ItemBoxEnterScene(x,y,growPointType,sceneId,1,x715006_g_MainItemId)	--ÿ�������������ܵõ�һ����Ʒ,����ֱ�ӷ���itembox��һ��
	--���1~3�������,�����1����Ҫ����,�������1����AddItemToBox������Ʒ
	--ItemCount = random(1,3)
	--if ItemCount ~= 1 then
	--	for i=1, (ItemCount - 1) do
			AddItemToBox(sceneId,targetId,1,x715006_g_MainItemId)
	--	end
	--end
	--�����Ҫ��Ʒ
	--if random(1,100) == 1 then
	--	AddItemToBox(sceneId,targetId,1,g_SubItemId)
	--end	
end
--���ɺ�������**********************************************************************


--��ǰ������ʼ&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	 x715006_OnOpen(sceneId,selfId,targetId)
--��������
-- 0 ��ʾ�򿪳ɹ�
	--ABilityID		=	GetItemBoxRequireAbilityID(sceneId,targetId)
	--AbilityLevel = QueryHumanAbilityLevel(sceneId,selfId,ABilityID)
	
	--if AbilityLevel<g_AbilityLevel then
	--if	IsHaveMission
	--	return OR_NO_LEVEL
	--else
		return OR_OK
	--	end
	--end
--��ǰ��������&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


--���պ�����ʼ########################################################################
function	 x715006_OnRecycle(sceneId,selfId,targetId)
	  --ȡ�õ�ǰ������
		--ABilityID	=	GetItemBoxRequireAbilityID(sceneId,targetId)
		--AbilityExp	=	GetAbilityExp(sceneId, selfId, ABilityID)
		--�ж������ڵĵȼ��Ƿ�Ӧ������������
		--AbilityLevel	=	QueryHumanAbilityLevel(sceneId,selfId,ABilityID)
		--if AbilityLevel - g_AbilityLevel <= 5 then
		--	ExpPlus = 1
		--elseif AbilityLevel - g_AbilityLevel <=10 then
		--	ExpPlus = 1/((AbilityLevel - g_AbilityLevel)+1)
		--else
		--	ExpPlus = 0
		--end
		--�жϵ�ǰ�����ȼ���Ҫ���ӵ������Ⱥ��Ƿ񳬹����ȼ�����������
		--if (AbilityExp + ExpPlus) >= LEVELUP_ABILITY_PENGREN[AbilityLevel].AbilityExpLimitTop then
		--	AbilityExp = LEVELUP_ABILITY_PENGREN[AbilityLevel].AbilityExpLimitTop
		--else
		--	AbilityExp = AbilityExp + ExpPlus
		--end
		--����������
		--SetAbilityExp(sceneId, selfId, ABilityID, AbilityExp)
		--֪ͨ���������������
		--AbilityExp	=	GetAbilityExp(sceneId, selfId, ABilityID)
		--Msg2Player(sceneId,selfId,"������������"..AbilityExp,MSG2PLAYER_PARA)
		
		--����1�����������
		return 1
end
--���պ�������########################################################################



--�򿪺�����ʼ@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x715006_OnProcOver(sceneId,selfId,targetId)
	return 0
end
--�򿪺�������@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
