-- ��ͽ����

--�ű���
x806008_g_scriptId = 806008

--��ͽ
x806008_g_Recruit= {}
x806008_g_Recruit["Id"] = 1003
x806008_g_Recruit["Name"] = "��ͽ"
x806008_g_Recruit["Name2"] = "��ʦ"

--**********************************
--������ں��� ������ͽ
--**********************************
function x806008_OnDefaultEvent( sceneId, selfId, targetId )
	-- tid �Ǽ�����Ϊͽ�ܵ����
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

	--��ǰû��ʦ����ֻ��ͬʱ��һλ���Ϊʦ
	if LuaFnHaveMaster( sceneId, tid ) ~= 0 then
		return 0
	end

	BeginEvent(sceneId)
		local MasterName = LuaFnGetName( sceneId, selfId )
		AddText(sceneId, x806008_g_Recruit["Name2"])
		AddText(sceneId, "���Ƿ�Ը���" .. MasterName .. "Ϊʦ��")
	EndEvent( )
	DispatchMissionInfo(sceneId, tid, targetId, x806008_g_scriptId, x806008_g_Recruit["Id"])

	BeginEvent(sceneId)
		local ApprenticeName = LuaFnGetName( sceneId, tid )
		AddText(sceneId, "�ȴ�" .. ApprenticeName .. "�𸴡�")
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)

end

--**********************************
--�о��¼�
--**********************************
function x806008_OnEnumerate( sceneId, selfId, targetId )
	if x806008_CheckAccept(sceneId, selfId) > 0 then
		AddNumText(sceneId, x806008_g_scriptId, x806008_g_Recruit["Name"])
	end
end

--**********************************
--����������
--**********************************
function x806008_CheckAccept( sceneId, selfId )

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

	--ʦ���ȼ���61��
	if LuaFnGetLevel( sceneId, selfId ) < 61 then
		return 0
	end

	--���ͬʱ������ͽ�ܣ������н��ʦͽ��ϵ��3�죬������ͽ�ܳ�ʦ�󣬿���������ͽ��
	if LuaFnGetPrenticeCount( sceneId, selfId ) >= 2 then
		return 0
	end

	if LuaFnGetPrenticeBetrayTime( sceneId, selfId ) < (86400 * 3) then
		return 0
	end

	--ͽ�ܵȼ���15���ҡ�25����25��ʱ��ǰ���鲻������������
	if LuaFnGetLevel( sceneId, tid ) < 15 then
		return 0
	end

	if LuaFnGetLevel( sceneId, tid ) > 25 then
		return 0
	end

	if LuaFnGetLevel( sceneId, tid ) == 25 then
		if LuaFnCanLevelUp( sceneId, tid ) ~= 0 then
			return 0
		end
	end

	--��ǰû��ʦ����ֻ��ͬʱ��һλ���Ϊʦ
	if LuaFnHaveMaster( sceneId, tid ) ~= 0 then
		return 0
	end

	--���Ƿ��޻���
	if LuaFnIsSpouses( sceneId, selfId, tid ) ~= 0 then
		return 0
	end

	if LuaFnIsBrother( sceneId, selfId, tid ) ~= 0 then
		return 0
	end

	--�����Ǻ���
	if LuaFnIsFriend( sceneId, selfId, tid ) ~= 1 then
		return 0
	end

	if LuaFnIsFriend( sceneId, tid, selfId ) ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--����
--**********************************
function x806008_OnAccept( sceneId, selfId )
	-- tid �Ǽ�����Ϊʦ�������
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

	if x806008_CheckSubmit( sceneId, tid, selfId ) > 0 then
		x806008_OnSubmit( sceneId, selfId, tid )
	end
end

--**********************************
--����Ƿ���԰�ʦ/��ͽ
--**********************************
function x806008_CheckSubmit( sceneId, selfId, tid )

	--ʦ���ȼ���61��
	if LuaFnGetLevel( sceneId, selfId ) < 61 then
		return 0
	end

	--���ͬʱ������ͽ�ܣ������н��ʦͽ��ϵ��3�죬������ͽ�ܳ�ʦ�󣬿���������ͽ��
	if LuaFnGetPrenticeCount( sceneId, selfId ) >= 2 then
		return 0
	end

	if LuaFnGetPrenticeBetrayTime( sceneId, selfId ) < (86400 * 3) then
		return 0
	end

	--ͽ�ܵȼ���15���ҡ�25����25��ʱ��ǰ���鲻������������
	if LuaFnGetLevel( sceneId, tid ) < 15 then
		return 0
	end

	if LuaFnGetLevel( sceneId, tid ) > 25 then
		return 0
	end

	if LuaFnGetLevel( sceneId, tid ) == 25 then
		if LuaFnCanLevelUp( sceneId, tid ) ~= 0 then
			return 0
		end
	end

	--��ǰû��ʦ����ֻ��ͬʱ��һλ���Ϊʦ
	if LuaFnHaveMaster( sceneId, tid ) ~= 0 then
		return 0
	end

	--���Ƿ��޻���
	if LuaFnIsSpouses( sceneId, selfId, tid ) ~= 0 then
		return 0
	end

	if LuaFnIsBrother( sceneId, selfId, tid ) ~= 0 then
		return 0
	end

	--�����Ǻ���
	if LuaFnIsFriend( sceneId, selfId, tid ) ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x806008_OnSubmit( sceneId, selfId, tid )
	--ͽ������һ���ƺ�
	local MasterName = LuaFnGetName( sceneId, tid )
	LuaFnAwardSpouseTitle( sceneId, selfId, MasterName .. "��ͽ��" )
	DispatchAllTitle( sceneId, selfId )

	LuaFnAprentice( sceneId, selfId, tid )
end
