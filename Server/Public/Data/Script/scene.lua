--�����Ľű��ļ�

--�ű���
x888888_g_scriptId_scene = 888888

x888888_g_defaultRelive_SceneID_1=0;
x888888_g_defaultRelive_SceneID_2=2;


function x888888_OnSceneInit( sceneId )
--�����ڳ�ʼ����ɺ����
end

function x888888_OnSceneTimer( sceneId, nowTime )
--������ʱ��
--sceneId��ʾ�����ţ�nowTime��ʾ��ǰʱ�䣨�����������ʱ�䣬��λ���룩

	sceneType = LuaFnGetSceneType(sceneId) ;
--	if sceneType == 1 then --���������Ǹ���
--		copyscenetype = LuaFnGetCopySceneData_Param(sceneId,0) ;--ȡ�ø�����
--		copyscenescript = LuaFnGetCopySceneData_Param(sceneId,1) ; --ȡ�ýű���
--		if copyscenetype==FUBEN_EXAMPLE then --����
--			--���Ӳ��ṩ��ʱʱ��
--			print("����ʹ�����Ӹ������ͣ����Ӹ������Ͳ��ṩ��ʱ�¼�")
--		elseif copyscenetype==FUBEN_EXAMPLE then --
--			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;
--		end
--	end
end

function x888888_OnSceneQuit( sceneId )
--�����ڹر�ǰ����

end

function x888888_OnScenePlayerEnter( sceneId, playerId )
	--����ȱʡ�ĸ�����Ϣ

	sceneType = LuaFnGetSceneType(sceneId) ;
	if sceneType == 1 then --���������Ǹ���
		copyscenescript = LuaFnGetCopySceneData_Param(sceneId,1) ; --ȡ�ýű���
		CallScriptFunction( copyscenescript, "OnPlayerEnter", sceneId, playerId ) ;
	else
		if GetCurCamp( sceneId, playerId ) == PLAYER_CAMP1 then
			SetPlayerDefaultReliveInfo( sceneId, playerId, "%100", -1, "0", x888888_g_defaultRelive_SceneID_1, 80, 75 );
		else
			SetPlayerDefaultReliveInfo( sceneId, playerId, "%100", -1, "0", x888888_g_defaultRelive_SceneID_2, 164, 156 );
		end
	end
end

function x888888_OnSceneHumanDie( sceneId, selfId, killerId )
	--���������ű��¼�
	sceneType = LuaFnGetSceneType(sceneId) ;
	if sceneType == 1 then --���������Ǹ���
		copyscenescript = LuaFnGetCopySceneData_Param(sceneId,1) ; --ȡ�ýű���
		CallScriptFunction( copyscenescript, "OnHumanDie", sceneId, selfId, killerId )
	end
end

function x888888_OnSceneHumanLevelUp( sceneId, objId, level )
--	if level==2 then
--		LuaFnSendNormalMail( sceneId, objId, GetName(sceneId,objId), "��ϲ������2���ˣ�����ʦ���������أ�" )
--	end
end

function x888888_OnSceneNotify( sceneId, destsceneId )
--sceneId Ϊ����������ڳ���ID, destsceneIdΪ��������ID
--�˺�����Ӧ���ñ�ʾ���������Ѿ���ʼ����ɣ����Դ��������

--	destsceneType = LuaFnGetSceneType(destsceneId) ;
--	if destsceneType == 1 then --���������Ǹ���
--		copyscenetype = LuaFnGetCopySceneData_Param(destsceneId,0) ;--ȡ�ø�����
--		copyscenescript = LuaFnGetCopySceneData_Param(destsceneId,1) ; --ȡ�ýű���
--		if copyscenetype==FUBEN_EXAMPLE then --����
--			--���Ӳ��ṩ���������¼�
--			print("����ʹ�����Ӹ������ͣ����Ӹ������Ͳ��ṩ���������¼�")
--		elseif copyscenetype==FUBEN_EXAMPLE then --
--			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;
--		end
--	end
end

-- ��·
function x888888_AskTheWay( sceneId, selfId, sceneNum, x, y, tip )
	Msg2Player( sceneId, selfId, "@*;flagNPC;" .. sceneNum .. ";" .. x .. ";" .. y .. ";" .. tip, MSG2PLAYER_PARA )
	Msg2Player( sceneId, selfId, "@*;flashNPC;" .. sceneNum .. ";" .. x .. ";" .. y .. ";" .. tip, MSG2PLAYER_PARA )
end

-- ��·
function x888888_AskTheWayPos( sceneId, selfId, sceneNum, x, y, tip )
	Msg2Player( sceneId, selfId, "@*;flagPOS;" .. sceneNum .. ";" .. x .. ";" .. y .. ";" .. tip, MSG2PLAYER_PARA )
	Msg2Player( sceneId, selfId, "@*;flashPOS;" .. sceneNum .. ";" .. x .. ";" .. y .. ";" .. tip, MSG2PLAYER_PARA )
end

-- ������Ч��UICommandID = 123
function x888888_PlaySoundEffect( sceneId, selfId, soundId )
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, soundId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 123)
end

--��ҽ�ɫʱ���¼�
function x888888_OnScenePlayerTimer( sceneId, selfId, nowtime )
	--SetCharacterTimer( sceneId, selfId, 0 )
end

--��ҽ�ɫ��½��Ϸ�¼�, ���¼�������ҵ���x888888_OnScenePlayerEnter�¼�֮�����
function x888888_OnScenePlayerLogin( sceneId, selfId, nowtime )
	--CallScriptFunction( 888890, "OnDefaultEvent", sceneId, selfId )
end

--��Ҵ�����ɫ���һ�ε�½��Ϸ�¼�, ���¼�������ҵ���x888888_OnScenePlayerEnter��
--��֮��x888888_OnScenePlayerLogin�¼�֮ǰ����
function x888888_OnScenePlayerFirstLogin( sceneId, selfId, nowtime )
	LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "��ӭ�����������磡" )
	
	local equips = {10101000}
	local equip  = 1--random(1,5)
	local caps   = {10110000}
	local cap    = 1
	local boots  = {10111000}
	local boot   = 1
	local wrists = {10112000}
	local wrist  = 1
	local wears  = {10113000}
	local wear   = 1

	--local mp = GetMenPai(sceneId,selfId)
	--if mp == OR_ZHANSHI then
	--elseif mp == OR_ZHANSHI then
	--elseif mp == OR_DAOSHI then
	--end
	BeginAddItem( sceneId )
	AddItem( sceneId, equips[equip], 1 )
	AddItem( sceneId, caps[cap], 1 )
	AddItem( sceneId, boots[boot], 1 )
	AddItem( sceneId, wrists[wrist], 1 )
	AddItem( sceneId, wears[wear], 1 )
	EndAddItem( sceneId, selfId )
	AddItemListToHuman( sceneId, selfId )
	
	--for test
	--AddGemsToHuman(sceneId, selfId)
	--for test
	
	--AddMission( sceneId,selfId, 718, 210238, 0, 0, 0 )
	
end
