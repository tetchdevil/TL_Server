-- �������

--�ű���
x806003_g_scriptId = 806003

--���
x806003_g_Marry= {}
x806003_g_Marry["Id"] = 1000
x806003_g_Marry["Name"] = "���"
--x806003_g_Marry["g_MarryInfo"] = "����ͽ��ܡ�"
--x806003_g_Marry["CantMarry"] = "С����������~~~"
--����ָ
x806003_g_Marry["ItemBonus"] = 10422099
--��鼼��
x806003_g_Marry["Skills"] = {260, 261}
--x806003_g_Marry["ContinueInfo"] = "�Ͻ��˸Ͻ��ˣ�����ɾͿ�ʼ����ˡ�"

--**********************************
--������ں��� ������
--**********************************
function x806003_OnDefaultEvent( sceneId, selfId, targetId )
	-- ����Ѿ����
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

	if x806003_CheckSubmit( sceneId, male, female ) > 0 then
		x806003_OnAccept( sceneId, male, female )
	end
end

--**********************************
--�о��¼�
--**********************************
function x806003_OnEnumerate( sceneId, selfId, targetId )
	if x806003_CheckAccept(sceneId, selfId) > 0 then
		AddNumText(sceneId, x806003_g_scriptId, x806003_g_Marry["Name"]);
	end
end

--**********************************
--����������
--**********************************
function x806003_CheckAccept( sceneId, selfId )

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

	if LuaFnIsFriend( sceneId, selfId, tid ) ~= 1 then
		return 0
	end

	if LuaFnIsFriend( sceneId, tid, selfId ) ~= 1 then
		return 0
	end

	-- ���̫Զ��
	if IsInDist( sceneId, selfId, tid, 10 ) ~= 1 then
		return 0
	end

	--��Ů˫���ĺ��Ѷȶ����ڵ���N=1000��
	if LuaFnGetFriendPoint( sceneId, selfId, tid ) < 1000 then
		return 0
	end

	if LuaFnGetFriendPoint( sceneId, tid, selfId ) < 1000 then
		return 0
	end

	--��Ů˫��������
	if LuaFnIsMarried( sceneId, selfId ) > 0 then
		return 0
	end

	if LuaFnIsMarried( sceneId, tid ) > 0 then
		return 0
	end

	--�ȼ������ڵ���N��35����
	if LuaFnGetLevel( sceneId, selfId ) < 35 then
		return 0
	end

	if LuaFnGetLevel( sceneId, tid ) < 35 then
		return 0
	end

	--�з����Ͻ�Ǯ���ڵ���N=520520��
	if LuaFnGetMoney( sceneId, male ) < 520520 then
		return 0
	end

	return 1
end

--**********************************
--����Ƿ���Խ��
--**********************************
function x806003_CheckSubmit( sceneId, male, female )

	if LuaFnIsFriend( sceneId, male, female ) ~= 1 then
		return 0
	end

	if LuaFnIsFriend( sceneId, female, male ) ~= 1 then
		return 0
	end

	-- ���̫Զ��
	if IsInDist( sceneId, male, female, 10 ) ~= 1 then
		return 0
	end

	--��Ů˫���ĺ��Ѷȶ����ڵ���N=1000��
	if LuaFnGetFriendPoint( sceneId, male, female ) < 1000 then
		return 0
	end

	if LuaFnGetFriendPoint( sceneId, female, male ) < 1000 then
		return 0
	end

	--��Ů˫��������
	if LuaFnIsMarried( sceneId, male ) > 0 then
		return 0
	end

	if LuaFnIsMarried( sceneId, female ) > 0 then
		return 0
	end

	--�ȼ������ڵ���N��35����
	if LuaFnGetLevel( sceneId, male ) < 35 then
		return 0
	end

	if LuaFnGetLevel( sceneId, female ) < 35 then
		return 0
	end

	--�з����Ͻ�Ǯ���ڵ���N=520520��
	if LuaFnGetMoney( sceneId, male ) < 520520 then
		return 0
	end

	--��Ů˫�����϶�Ҫ������һ����Ʒ�ռ䣻
	LuaFnBeginAddItem( sceneId )
	LuaFnAddItem( sceneId, x806003_g_Marry["ItemBonus"], 1 )
	ret = LuaFnEndAddItem( sceneId, male )

	if ret ~= 1 then
		return 0
	end

	ret = LuaFnEndAddItem( sceneId, female )

	if ret ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--����
--**********************************
function x806003_OnAccept( sceneId, male, female )
	--�۳��з����Ͻ�Ǯ520520��
	LuaFnCostMoney( sceneId, male, 520520 )

	--�ֱ�����һ����ָ����Ů��
	--ֱ���� x806003_CheckSubmit �� AddItem �Ľ��
	--ToDO: ��ָ��Ҫ�������˵�����
	LuaFnAddItemListToHuman( sceneId, male )
	LuaFnAddItemListToHuman( sceneId, female )

	--��˫���ֱ����ӻ�������
	for i, skillId in x806003_g_Marry["Skills"] do
		AddSkill( sceneId, male, skillId )
		AddSkill( sceneId, female, skillId )
	end

	local maleName = LuaFnGetName( sceneId, male )
	local femaleName = LuaFnGetName( sceneId, female )

	--�ֱ�EMAIL����Ů˫����������к��ѣ��������ѶȲ����ģ���
	LuaFnSendMailToAllFriend( sceneId, male, "���װ������ѣ����Ѻ�" .. femaleName .. "ϲ����Ե��ף�����ǰɣ�" )
	LuaFnSendMailToAllFriend( sceneId, female, "���װ������ѣ����Ѻ�" .. maleName .. "ϲ����Ե��ף�����ǰɣ�" )

	--����һ���ƺš�ĳĳ�ķ������ĳĳ�����ӡ���
	LuaFnAwardSpouseTitle( sceneId, female, maleName .. "������" )
	DispatchAllTitle( sceneId, female )
	LuaFnAwardSpouseTitle( sceneId, male, femaleName .. "�ķ��" )
	DispatchAllTitle( sceneId, male )

	LuaFnMarry( sceneId, male, female )
end
