-- ��ʦ����

--�ű���
x806007_g_scriptId = 806007

--��ʦ
x806007_g_FinishAppr= {}
x806007_g_FinishAppr["Id"] = 1004
x806007_g_FinishAppr["Name"] = "��ʦ"


--**********************************
--������ں���
--**********************************
function x806007_OnDefaultEvent( sceneId, selfId, targetId )
	-- tid �Ǽ�����ʦ�����
	--���������2��
	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		return
	end

	if LuaFnGetTeamSize( sceneId, selfId ) ~= 2 then
		return
	end

	if LuaFnGetTeamSceneMemberCount( sceneId, selfId ) ~= 1 then
		return
	end

	local tid = LuaFnGetTeamSceneMember( sceneId, selfId, 0 )

	if x806007_CheckSubmit( sceneId, selfId, tid ) > 0 then
		x806007_OnAccept( sceneId, selfId, tid )
	end

end

--**********************************
--�о��¼�
--**********************************
function x806007_OnEnumerate( sceneId, selfId, targetId )
	if x806007_CheckAccept(sceneId, selfId) > 0 then
		AddNumText(sceneId, x806007_g_scriptId, x806007_g_FinishAppr["Name"]);
	end
end

--**********************************
--����������
--**********************************
function x806007_CheckAccept( sceneId, selfId )

	--��飺
	--�����ֻ��ʦͽ������
	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		return 0
	end

	if LuaFnGetTeamSize( sceneId, selfId ) ~= 2 then
		return 0
	end

	if LuaFnGetTeamSceneMemberCount( sceneId, selfId ) ~= 1 then
		return 0
	end

	local tid = LuaFnGetTeamSceneMember( sceneId, selfId, 0 )

	if LuaFnIsPrentice( sceneId, selfId, tid ) ~= 1 then
		return 0
	end

	--ͽ�ܵȼ���50�����ҡ�55��ʱ
	if LuaFnGetLevel( sceneId, tid ) < 50 then
		return 0
	end

	if LuaFnGetLevel( sceneId, tid ) > 55 then
		return 0
	end

	--˫�������б�����һ���ռ䣬�����м䵯������XXX�ı������ˡ�
	LuaFnBeginAddItem( sceneId )
	LuaFnAddItem( sceneId, 30002002, 1 )
	ret = LuaFnEndAddItem( sceneId, selfId )

	if ret ~= 1 then
		return 0
	end

	ret = LuaFnEndAddItem( sceneId, tid )

	if ret ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--����Ƿ���Գ�ʦ
--**********************************
function x806007_CheckSubmit( sceneId, selfId, tid )

	if LuaFnIsPrentice( sceneId, selfId, tid ) ~= 1 then
		return 0
	end

	--ͽ�ܵȼ���50�����ҡ�55��ʱ
	if LuaFnGetLevel( sceneId, tid ) < 50 then
		return 0
	end

	if LuaFnGetLevel( sceneId, tid ) > 55 then
		return 0
	end

	--˫�������б�����һ���ռ䣬�����м䵯������XXX�ı������ˡ�
	LuaFnBeginAddItem( sceneId )
	LuaFnAddItem( sceneId, 30002002, 1 )
	ret = LuaFnEndAddItem( sceneId, selfId )

	if ret ~= 1 then
		return 0
	end

	ret = LuaFnEndAddItem( sceneId, tid )

	if ret ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--����
--**********************************
function x806007_OnAccept( sceneId, selfId, tid )
	--˫���ĺ��Ѷȶ����ڵ���N=300���н���
	local flag = 0
	local MasterFriendPoint = LuaFnGetFriendPoint( sceneId, selfId, tid )
	if MasterFriendPoint < 300 then
		flag = 1
	elseif LuaFnGetFriendPoint( sceneId, tid, selfId ) < 300 then
		flag = 1
	end

	if flag ~= 1 then
		--��ʦ������ʦ�£�X=0-1000000�� N=M��1000����MIN(X=500, ʦ����ͽ�ܵ��Ѻö�*T)
		MoralPoint = 1000

		if (MasterFriendPoint * 1) < 500 then
			MoralPoint = MoralPoint + MasterFriendPoint
		else
			MoralPoint = MoralPoint + 500
		end

		MoralPoint = MoralPoint + LuaFnGetMasterMoralPoint( sceneId, selfId )

		if MoralPoint > 1000000 then
			MoralPoint = 1000000
		end

		LuaFnSetMasterMoralPoint( sceneId, selfId, MoralPoint )

		--ToDO: ��Ʒ��Ҫ��С����
		LuaFnAddItemListToHuman( sceneId, selfId )
		LuaFnAddItemListToHuman( sceneId, tid )
	end


	--ɾ��ͽ�ܳƺ�
	LuaFnAwardSpouseTitle( sceneId, tid, "" )
	DispatchAllTitle( sceneId, tid )

	LuaFnFinishAprentice( sceneId, tid, selfId )
end
