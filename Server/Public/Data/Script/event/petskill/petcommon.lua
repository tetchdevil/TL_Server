-- ����ͨ�ù��ܽű�

-- �ű���
x335000_g_scriptId = 335000

-- ���＼��ѧϰ
function x335000_PetStudy( sceneId, selfId, skillId )
	petGUID_H = LuaFnGetHighSectionOfTargetPetGuid( sceneId, selfId )
	petGUID_L = LuaFnGetLowSectionOfTargetPetGuid( sceneId, selfId )

	PetStudySkill( sceneId, selfId, petGUID_H, petGUID_L, skillId )
	return 1
end


-- �жϳ����ʺϳ���ʳ��
-- nIndex ������ʹ�õĳ����ı���λ��
function x335000_IsPetCanUseFood( sceneId, selfId, nIndex )
	petGUID_H = LuaFnGetHighSectionOfTargetPetGuid( sceneId, selfId )
	petGUID_L = LuaFnGetLowSectionOfTargetPetGuid( sceneId, selfId )

	ret = LuaFnPetCanUseFood( sceneId, selfId, petGUID_H, petGUID_L, nIndex )
	if ret > 0 then
		return 1
	else
		return 0
	end
end

-- ���ӳ����������ֵ
function x335000_IncPetMaxHP( sceneId, selfId, value )
	if value <= 0 then
		return 0
	end

	petGUID_H = LuaFnGetHighSectionOfTargetPetGuid( sceneId, selfId )
	petGUID_L = LuaFnGetLowSectionOfTargetPetGuid( sceneId, selfId )

	value = value + LuaFnGetPetMaxHP( sceneId, selfId, petGUID_H, petGUID_L )

	LuaFnSetPetMaxHP( sceneId, selfId, petGUID_H, petGUID_L, value )
	return 1
end

-- ���ӳ�������ֵ
function x335000_IncPetHP( sceneId, selfId, value )
	if value <= 0 then
		return 0
	end

	petGUID_H = LuaFnGetHighSectionOfTargetPetGuid( sceneId, selfId )
	petGUID_L = LuaFnGetLowSectionOfTargetPetGuid( sceneId, selfId )

	value = value + LuaFnGetPetHP( sceneId, selfId, petGUID_H, petGUID_L )
	MaxHP = LuaFnGetPetMaxHP( sceneId, selfId, petGUID_H, petGUID_L )

	if value > MaxHP then
		value = MaxHP
	end

	LuaFnSetPetHP( sceneId, selfId, petGUID_H, petGUID_L, value )
	return 1
end

-- ���ӳ�������
function x335000_IncPetLife( sceneId, selfId, value )
	if value <= 0 then
		return 0
	end

	petGUID_H = LuaFnGetHighSectionOfTargetPetGuid( sceneId, selfId )
	petGUID_L = LuaFnGetLowSectionOfTargetPetGuid( sceneId, selfId )

	value = value + LuaFnGetPetLife( sceneId, selfId, petGUID_H, petGUID_L )

	LuaFnSetPetLife( sceneId, selfId, petGUID_H, petGUID_L, value )
	return 1
end

-- ���ӳ�����ֶ�
function x335000_IncPetHappiness( sceneId, selfId, value )
	if value <= 0 then
		return 0
	end

	petGUID_H = LuaFnGetHighSectionOfTargetPetGuid( sceneId, selfId )
	petGUID_L = LuaFnGetLowSectionOfTargetPetGuid( sceneId, selfId )

	value = value + LuaFnGetPetHappiness( sceneId, selfId, petGUID_H, petGUID_L )
	MaxHappiness = 100

	if value > MaxHappiness then
		value = MaxHappiness
	end

	LuaFnSetPetHappiness( sceneId, selfId, petGUID_H, petGUID_L, value )
	return 1
end
