--ѡ��ֲ��Ľű�

--�ű���
x713550_g_scriptId = 713550

AbilityId =	ABILITY_ZHONGZHI

--**********************************
--������ں���
--**********************************
function x713550_OnDefaultEvent( sceneId, selfId, targetId, zhiwuId )
	--�ж���ֲ�Ƶ�λ��
	PlantFlag_X,PlantFlag_Z =  GetWorldPos(sceneId,targetId)	--�õ�npc����
	PlantFlag_X = floor(PlantFlag_X)
	PlantFlag_Z = floor(PlantFlag_Z)
	for i, findid in PLANTNPC_ADDRESS do
		if	((PlantFlag_X ==  findid.X)  and (PlantFlag_Z == findid.Z) and (sceneId == findid.Scene)) then
			num = i
			break
		end
	end
	--���û�ҵ���Ӧλ��
	if num == 0 then
		BeginEvent(sceneId)
			AddText(sceneId, "ˮ����ʧ���밮������Ȼ��")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end
	--������ز�������״̬
	if	PLANTFLAG[num] ~= 0 then
		BeginEvent(sceneId)
			AddText(sceneId, "�����ѱ���ֲ�����һ��������ɣ�")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end

	--�����������
	x713550_g_vigor = GetHumanVigor(sceneId,selfId)
	--����ֲ��ȼ�
	for i,g_findid in V_ZHONGZHI_ID do
		if g_findid == zhiwuId then
			x713550_g_ZhiWuLevel = V_ZHONGZHI_NEEDLEVEL[i]
			break
		end
	end
	if x713550_g_vigor < floor(x713550_g_ZhiWuLevel * 1.5 +2) then
		BeginEvent(sceneId)
			AddText(sceneId, "��Ļ�������!")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end
	--����������
	CallScriptFunction(ABILITYLOGIC_ID, "GainExperience", sceneId, selfId, AbilityId, x713550_g_ZhiWuLevel)
	--ɾ����Ӧ����
		CallScriptFunction(ABILITYLOGIC_ID, "VigorCostZhongZhi", sceneId, selfId, AbilityId, x713550_g_ZhiWuLevel)
	--����������
	for i,g_findid in V_ZHONGZHI_ID do
		if g_findid == zhiwuId then
			ItemBoxTypeId = V_ZHONGZHI_ITEMBOX_ID[i]
			break
		end
	end
	ItemBoxId01 = ItemBoxEnterScene(PlantFlag_X+1.5,PlantFlag_Z-1,ItemBoxTypeId,sceneId,0)
	ItemBoxId02 = ItemBoxEnterScene(PlantFlag_X+1.5,PlantFlag_Z+2,ItemBoxTypeId,sceneId,0)
	ItemBoxId03 = ItemBoxEnterScene(PlantFlag_X-0.5,PlantFlag_Z-1,ItemBoxTypeId,sceneId,0)
	ItemBoxId04 = ItemBoxEnterScene(PlantFlag_X-0.5,PlantFlag_Z+2,ItemBoxTypeId,sceneId,0)
	SetItemBoxMaxGrowTime(sceneId,ItemBoxId01,450000)
	SetItemBoxMaxGrowTime(sceneId,ItemBoxId02,450000)
	SetItemBoxMaxGrowTime(sceneId,ItemBoxId03,450000)
	SetItemBoxMaxGrowTime(sceneId,ItemBoxId04,450000)
		
	--AbilityExp	=	GetAbilityExp(sceneId, selfId, AbilityId)
	--����һЩ����
	--SetAbilityExp(sceneId, selfId, AbilityId, AbilityExp+1)
	--AbilityExp	=	GetAbilityExp(sceneId, selfId, AbilityId)
	
	PLANTFLAG[num] = 4
	BeginEvent(sceneId)
		AddText(sceneId, "���Ѿ���ʼ��ֲ")
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)

 	return OR_OK
end
