--������ű����ƶ�3
--�ű���
--g_ScriptId = 711026

--����������
x711026_g_GpId = 527

--��������Ҫ�ĵȼ�
x711026_g_ItemBoxNeedLevel = 9

function	x711026_OnOpen(SceneId,selfId,TargetId)
	--�õ����ܵȼ�
	AbilityLevel = QueryHumanAbilityLevel( SceneId, selfId, ABILITY_ZHONGZHI)
	if AbilityLevel >= x711026_g_ItemBoxNeedLevel then
		return OR_OK
	else
		return OR_NO_LEVEL
	end
end

function	x711026_OnProcOver(SceneId,selfId,TargetId)
	return OR_OK
end

function	 x711026_OnRecycle(SceneId,selfId,TargetId)
	--ȡ�������������
	GP_X = GetItemBoxWorldPosX(SceneId,TargetId)
	GP_Z = GetItemBoxWorldPosZ(SceneId,TargetId)
	--��ȡ��
	GP_X = floor(GP_X)
	GP_Z = floor(GP_Z)
	--�ж���ֲ�Ƶ�λ�����ĸ���ֲ�ƹ�Ͻ�ķ�Χ��
	for i, findid in PLANTNPC_ADDRESS do
		if	(GP_X >= findid.X_MIN)  and (GP_Z >= findid.Z_MIN) and (GP_X <= findid.X_MAX)  and (GP_Z <= findid.Z_MAX) and (SceneId == findid.Scene) then
			num = i	
			break
		end
	end
	
	--����Ҳ�����ȷ��λ���򷵻�
	if num == 0 then
		return
	end
	--�ҵ���ȷ�ı�ţ�����ֲ��-1
	PLANTFLAG[num] = PLANTFLAG[num] - 1
	return 1
end