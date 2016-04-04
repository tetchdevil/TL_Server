-- ���ʦ������

--�ű���
x806009_g_scriptId = 806009

--��ʦ
x806009_g_ExpelPrentice = {}
x806009_g_ExpelPrentice["Id"] = 1006
x806009_g_ExpelPrentice["Name"] = "���ʦ��"

--**********************************
--������ں���
--**********************************
function x806009_OnDefaultEvent( sceneId, selfId, targetId )
	if x806009_CheckSubmit( sceneId, selfId ) > 0 then
		x806009_OnAccept( sceneId, selfId, GetNumText() )
	end
end

--**********************************
--�о��¼�
--**********************************
function x806009_OnEnumerate( sceneId, selfId, targetId )
	for i=0,1 do
		guid = LuaFnGetPrenticeGUID( sceneId, selfId, i )

		if guid ~= -1 then
			if x806009_CheckAccept(sceneId, selfId) > 0 then
				PrenticeName = LuaFnGetFriendName( sceneId, selfId, guid )
				AddNumText(sceneId, x806009_g_scriptId, "��" .. PrenticeName .. x806009_g_ExpelPrentice["Name"], -1, i);
			end
		end
	end
end

--**********************************
--����������
--**********************************
function x806009_CheckAccept( sceneId, selfId, guid )

	--��飺
	--ʦ�����Ͻ�Ǯ���ڵ���N=50000
	if LuaFnGetMoney( sceneId, selfId ) < 50000 then
		return 0
	end

	return 1

end

--**********************************
--����Ƿ�������ͽ��
--**********************************
function x806009_CheckSubmit( sceneId, selfId )

	if x806009_CheckAccept( sceneId, selfId ) == 1 then
		return 1
	end

	return 0

end

--**********************************
--����
--**********************************
function x806009_OnAccept( sceneId, selfId, nIndex )
	--�۳����Ͻ�Ǯ50000��
	LuaFnCostMoney( sceneId, selfId, 50000 )

	PrenticeGUID = LuaFnGetPrenticeGUID( sceneId, selfId, nIndex )

	PrenticeName = LuaFnGetFriendName( sceneId, selfId, PrenticeGUID )
	selfName = LuaFnGetName( sceneId, selfId )

	--����ͨ�ʼ���ͽ��
	LuaFnSendNormalMail( sceneId, selfId, PrenticeName, "���ʦ��" .. selfName .. "�����ڼ����̵��㣬������������ʦͽ��ϵ��" )

	--����ִ���ʼ���ͽ��
	LuaFnSendScriptMail( sceneId, PrenticeName, MAIL_EXPELPRENTICE, 0, 0, 0 )

	--���������Ż�
	LuaFnExpelPrentice( sceneId, selfId, PrenticeGUID )
end
