--������ű�����ͷ3
--�ű���
--g_ScriptId = 711035

--����������
x711035_g_GpId = 536

--��������Ҫ�ĵȼ�
x711035_g_ItemBoxNeedLevel = 12

function	x711035_OnOpen(SceneId,selfId,TargetId)
	--�õ����ܵȼ�
	AbilityLevel = QueryHumanAbilityLevel( SceneId, selfId, ABILITY_ZHONGZHI)
	if AbilityLevel >= x711035_g_ItemBoxNeedLevel then
		return OR_OK
	else
		return OR_NO_LEVEL
	end
end

function	x711035_OnProcOver(SceneId,selfId,TargetId)
	return OR_OK
end

function	 x711035_OnRecycle(SceneId,selfId,TargetId)
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
