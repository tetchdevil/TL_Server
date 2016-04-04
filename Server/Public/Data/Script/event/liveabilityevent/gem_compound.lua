-- ��ʯ�ϳ�

-- �ű���
x701602_g_scriptId = 701602

-- �ű�����
x701602_g_scriptName = "�ϳɱ�ʯ"

--**********************************************************************
--������ں���
--**********************************************************************
function x701602_OnDefaultEvent( sceneId, selfId, targetId )

	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 23)

end

--**********************************************************************
--�о��¼�
--**********************************************************************
function x701602_OnEnumerate( sceneId, selfId, targetId )

	AddNumText(sceneId, x701602_g_scriptId, x701602_g_scriptName)

end

--**********************************************************************
--��ʯ�ϳɽӿ�
--bagIndex1, bagIndex2�����鱦ʯ���ڵĸ���
--**********************************************************************
function x701602_GemCompound( sceneId, selfId, bagIndex1, bagIndex2 )

	SerialNum1 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, bagIndex1 )
	SerialNum2 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, bagIndex2 )

	if SerialNum1 ~= SerialNum2 then
		return OR_STUFF_LACK
	end

	Quality = LuaFnGetItemQuality( SerialNum1 )
	if Quality >= 9 then
		return OR_CANNOT_UPGRADE
	end

	-- ���㾫������
	EnergyCost = Quality * 2 + 1
	MyNewEnergy = GetHumanEnergy( sceneId, selfId ) - EnergyCost
	if MyNewEnergy < 0 then
		return OR_NOT_ENOUGH_ENERGY
	end

	-- �����µı�ʯ�ı�ţ����� Quality ��Ȩָ
	NewSerialNum = SerialNum1 + 100000

	-- ���ľ���
	SetHumanEnergy( sceneId, selfId, MyNewEnergy )

	-- ɾ��ԭ����
	LuaFnEraseItem( sceneId, selfId, bagIndex1 )
	LuaFnEraseItem( sceneId, selfId, bagIndex2 )

	-- ���ɺϳ�����һ�� 1 ��Ʒ�ʣ���Ӱ�챦ʯ
	res = LuaFnTryRecieveItem( sceneId, selfId, NewSerialNum, 1 )
	if res == -1 then
		Msg2Player( sceneId, selfId, "�������ݣ���ʯ�ϳ�ʧ��(ԭ��ʯ��ţ�" .. SerialNum1 .. "���ϳɱ�ʯ��ţ�"
					.. NewSerialNum .. ")�����ύ������Ϣ��", MSG2PLAYER_PARA)
		return OR_FAILURE
	end

	-- ��ʾ������
	LuaFnSendAbilitySuccessMsg( sceneId, selfId, -1, -1, NewSerialNum )
	return OR_OK
end
