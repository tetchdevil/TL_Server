--������
--��Ӧ����ܣ�����	���㼼�ܵı��9
--����
--�ű���712001
--����100%
--�ȼ�1

--ÿ�δ򿪱ض���õĲ�Ʒ
x712001_g_MainItemId = 20102001
--���ܵõ��Ĳ�Ʒ
--g_SubItemId = 20304005
--��Ҫ����Id
x712001_g_AbilityId = 9
--��Ҫ���ܵȼ�
x712001_g_AbilityLevel = 1


function 	x712001_OnCreate(sceneId,growPointType,x,y)
	ItemCount = 0-- ��Ʒ����
	ItemBoxId = ItemBoxEnterScene(x,y,growPointType,sceneId,ItemCount)	--��������
end

function	 x712001_OnOpen(sceneId,selfId,targetId)
	--�����㼼�ܵȼ�
	AbilityId		=	GetItemBoxRequireAbilityID(sceneId,targetId)
	AbilityLevel = QueryHumanAbilityLevel(sceneId,selfId,AbilityId)
	if AbilityLevel<x712001_g_AbilityLevel then
		return OR_NO_LEVEL
	end

	--��������,����һ�ε������ʱ��
	x712001_g_FishTime = random(80000)+20000	--���һ��20-100��֮��������
	--x712001_g_FishTime = random(8000)+2000	--���һ��2-10��֮��������
	SetAbilityOperaTime(sceneId,selfId,x712001_g_FishTime)	--����һ�ε������ʱ��
	--SetAbilityOperaRobotTime(sceneId, selfId,g_totaltime)	--���ۼ�ʱ�丶��������
	
	return OR_OK

end

function	x712001_OnProcOver(sceneId,selfId,targetId)
   
	ret_1 = TryRecieveItem(sceneId,selfId,x712001_g_MainItemId,1)
	if ret_1 > 0 then					-->0��ʾ��Ʒ�ɹ����뱳����
		Msg2Player(sceneId,selfId,"�����һ�����㡣",MSG2PLAYER_PARA)
		-- ����������
		ABilityID	=	GetItemBoxRequireAbilityID(sceneId,targetId)
		CallScriptFunction(ABILITYLOGIC_ID, "GainExperience", sceneId, selfId, ABilityID, x712001_g_AbilityLevel)
	elseif ret_1 == -1 then
		Msg2Player(sceneId,selfId,"��������",MSG2PLAYER_PARA)
	end
	return 0
end