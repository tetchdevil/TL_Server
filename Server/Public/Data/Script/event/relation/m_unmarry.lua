-- �������

--�ű���
x806005_g_scriptId = 806005

--���
x806005_g_Unmarry= {}
x806005_g_Unmarry["Id"] = 1001
x806005_g_Unmarry["Name"] = "���"
x806005_g_Unmarry["Skills"] = {260, 261}

--**********************************
--������ں���
--**********************************
function x806005_OnDefaultEvent( sceneId, selfId, targetId )
	-- tid �Ƿ�����ϵ����ң��ڴ˼�������Ժ������ӳ����оͲ��ټ�����ж�
	--��Ů��ӣ����������2��
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

	local selfSex = LuaFnGetSex( sceneId, selfId )
	local tSex = LuaFnGetSex( sceneId, tid )
	local male
	local female

	if selfSex == tSex then
		return
	end

	if selfSex == 1 then
		male = selfId
		female = tid
	else
		male = tid
		female = selfId
	end

	if x806005_CheckSubmit( sceneId, male, female ) > 0 then
		x806005_OnAccept( sceneId, male, female )
	end

end

--**********************************
--�о��¼�
--**********************************
function x806005_OnEnumerate( sceneId, selfId, targetId )
	if x806005_CheckAccept(sceneId, selfId) > 0 then
		AddNumText(sceneId, x806005_g_scriptId, x806005_g_Unmarry["Name"]);
	end
end

--**********************************
--����������
--**********************************
function x806005_CheckAccept( sceneId, selfId )

	--��飺
	--��Ů��ӣ����������2��
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

	--�����Ƿ���
	if LuaFnIsSpouses( sceneId, selfId, tid ) == 0 then
		return 0
	end

	local selfSex = LuaFnGetSex( sceneId, selfId )
	local tSex = LuaFnGetSex( sceneId, tid )
	local male

	if selfSex == tSex then
		return 0
	end

	if selfSex == 1 then
		male = selfId
	else
		male = tid
	end

	--�з����Ͻ�Ǯ���ڵ���N=55555
	if LuaFnGetMoney( sceneId, male ) < 55555 then
		return 0
	end

	return 1
end

--**********************************
--����Ƿ�������
--**********************************
function x806005_CheckSubmit( sceneId, male, female )

	--�����Ƿ���
	if LuaFnIsSpouses( sceneId, male, female ) == 0 then
		return 0
	end

	--�з����Ͻ�Ǯ���ڵ���N=55555
	if LuaFnGetMoney( sceneId, male ) < 55555 then
		return 0
	end

	return 1
end

--**********************************
--����
--**********************************
function x806005_OnAccept( sceneId, male, female )
	--�۳��з����Ͻ�Ǯ55555��
	LuaFnCostMoney( sceneId, male, 55555 )

	--ɾ��˫����������
	for i, skillId in x806005_g_Unmarry["Skills"] do
		DelSkill( sceneId, male, skillId )
		DelSkill( sceneId, female, skillId )
	end

	--�����Ѻö�
	LuaFnSetFriendPoint( sceneId, male, female, 10 )
	LuaFnSetFriendPoint( sceneId, female, male, 10 )

	--ɾ���ƺ�
	LuaFnAwardSpouseTitle( sceneId, female, "" )
	DispatchAllTitle( sceneId, female )
	LuaFnAwardSpouseTitle( sceneId, male, "" )
	DispatchAllTitle( sceneId, male )

	--
	LuaFnUnMarry( sceneId, male, female )
end
