-- ǿ���������

--�ű���
x806004_g_scriptId = 806004

--ǿ�����
x806004_g_Repudiate= {}
x806004_g_Repudiate["Id"] = 1002
x806004_g_Repudiate["Name"] = "ǿ�����"
x806004_g_Repudiate["Skills"] = {260, 261}

--**********************************
--������ں���
--**********************************
function x806004_OnDefaultEvent( sceneId, selfId, targetId )
	if x806004_CheckSubmit( sceneId, selfId ) > 0 then
		x806004_OnAccept( sceneId, selfId )
	end
end

--**********************************
--�о��¼�
--**********************************
function x806004_OnEnumerate( sceneId, selfId, targetId )
	if x806004_CheckAccept(sceneId, selfId) > 0 then
		AddNumText(sceneId, x806004_g_scriptId, x806004_g_Repudiate["Name"]);
	end
end

--**********************************
--����������
--**********************************
function x806004_CheckAccept( sceneId, selfId )

	--��飺
	--�����ǽ��״̬
	if LuaFnIsMarried( sceneId, selfId ) == 0 then
		return 0
	end

	--�з����Ͻ�Ǯ���ڵ���N=200000
	if LuaFnGetMoney( sceneId, selfId ) < 200000 then
		return 0
	end

	return 1

end

--**********************************
--����Ƿ�������
--**********************************
function x806004_CheckSubmit( sceneId, selfId )

	if x806004_CheckAccept( sceneId, selfId ) == 1 then
		return 1
	end

	return 0

end

--**********************************
--����
--**********************************
function x806004_OnAccept( sceneId, selfId )

	-- ��Ҫ��������
	if LuaFnIsPasswordSetup( sceneId, selfId, 0 ) == 1 then
		if LuaFnIsPasswordUnlocked( sceneId, selfId, 1 ) == 0 then
			return
		end
	end

	--�۳����Ͻ�Ǯ200000��
	LuaFnCostMoney( sceneId, selfId, 200000 )

	--ɾ����������
	for i, skillId in x806004_g_Repudiate["Skills"] do
		DelSkill( sceneId, selfId, skillId )
	end

	--�����潵���Ѻö�
	SpouseGUID = LuaFnGetSpouseGUID( sceneId, selfId )
	LuaFnSetFriendPointByGUID( sceneId, selfId, SpouseGUID, 10 )

	SpouseName = LuaFnGetFriendName( sceneId, selfId, SpouseGUID )
	selfName = LuaFnGetName( sceneId, selfId )

	--����ͨ�ʼ�����ż֪ͨ���
	LuaFnSendNormalMail( sceneId, selfId, SpouseName, selfName .. "��ѡ��������ǿ������ˣ�������Ե�ɡ�" )

	--����ִ���ʼ�����ż��ִ�����
	LuaFnSendScriptMail( sceneId, SpouseName, MAIL_REPUDIATE, 0, 0, 0 )

	--ɾ���ƺ�
	LuaFnAwardSpouseTitle( sceneId, selfId, "" )
	DispatchAllTitle( sceneId, selfId )

	--���������
	LuaFnDivorce( sceneId, selfId )
end
