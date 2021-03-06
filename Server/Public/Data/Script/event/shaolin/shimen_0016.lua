--少林寺任务
--寻物
--MisDescBegin
--脚本号
x220016_g_ScriptId = 220016

--前提任务
--g_MissionIdPre =

--任务号
x220016_g_MissionId = 1060

--任务目标npc
x220016_g_Name	="慧方"

--任务归类
x220016_g_MissionKind = 20

--任务等级
x220016_g_MissionLevel = 10

--是否是精英任务
x220016_g_IfMissionElite = 0

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************
--任务是否已经完成
x220016_g_IsMissionOkFail = 0		--变量的第0位

--任务环数
x220016_g_MissionRound	= 11			--记录循环任务变量的第11个数
--以上是动态**************************************************************

--任务变量第一位用来存储随机得到的脚本号

--任务文本描述
x220016_g_MissionName="少林寺门派任务"
x220016_g_MissionInfo="开一个大力舍利，把它送给潘天耕"  --任务描述
x220016_g_MissionTarget="把大力舍利送给潘天耕"		--任务目标
x220016_g_ContinueInfo="你把舍利送到了吗？"		--未完成任务的npc对话
x220016_g_MissionComplete="不愧是少林弟子"					--完成任务npc说话的话

--MisDescEnd

--**********************************
--任务入口函数
--**********************************
function x220016_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	--如果玩家完成过这个任务（实际上如果完成了任务这里就不会显示，但是再检测一次比较安全）
    --if IsMissionHaveDone(sceneId,selfId,x220016_g_MissionId) > 0 then
	--	return
	--end
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x220016_g_MissionId) > 0 then
		--发送任务需求的信息
		BeginEvent(sceneId)
			AddText(sceneId,x220016_g_MissionName)
			AddText(sceneId,x220016_g_ContinueInfo)
			--for i, item in g_DemandItem do
			--	AddItemDemand( sceneId, item.id, item.num )
			--end
			AddMoneyBonus( sceneId, g_MoneyBonus )
		EndEvent()
		bDone = x220016_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x220016_g_ScriptId,x220016_g_MissionId,bDone)		
    --满足任务接收条件
    elseif x220016_CheckAccept(sceneId,selfId) > 0 then
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x220016_g_MissionName)
			AddText(sceneId,x220016_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x220016_g_MissionTarget)
			--for i, item in g_ItemBonus do
			--	AddItemBonus( sceneId, item.id, item.num )
			--end
			--for i, item in g_RadioItemBonus do
			--	AddRadioItemBonus( sceneId, item.id, item.num )
			--end
			AddMoneyBonus( sceneId, g_MoneyBonus )
			EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x220016_g_ScriptId,x220016_g_MissionId)
    end
end

--**********************************
--列举事件
--**********************************
function x220016_OnEnumerate( sceneId, selfId, targetId )
    --如果已接此任务
    if IsHaveMission(sceneId,selfId,x220016_g_MissionId) > 0 then
		AddNumText(sceneId,x220016_g_ScriptId,x220016_g_MissionName,2,-1);
		--满足任务接收条件
	elseif x220016_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x220016_g_ScriptId,x220016_g_MissionName,1,-1);
	end
end

--**********************************
--检测接受条件
--**********************************
function x220016_CheckAccept( sceneId, selfId )
	--需要1级才能接
	if GetLevel( sceneId, selfId ) >= 1 then
		return 1
	else
		return 0
	end
end

--**********************************
--接受
--**********************************
function x220016_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	AddMission( sceneId,selfId, x220016_g_MissionId, x220016_g_ScriptId, 0, 0, 0 )
	misIndex = GetMissionIndexByID(sceneId,selfId,x220016_g_MissionId)			--得到任务的序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--根据序列号把任务变量的第0位置0 (任务完成情况)
	SetMissionByIndex(sceneId,selfId,misIndex,1,x220016_g_ScriptId)						--根据序列号把任务变量的第1位置为任务脚本号
	SetMissionByIndex(sceneId,selfId,misIndex,3,1)						--根据序列号把任务变量的第3位置为任务目标NPC编号，1为潘天耕
	--得到环数
	x220016_g_MissionRound = GetMissionData(sceneId,selfId,11)
	--环数增加1
	x220016_g_MissionRound = x220016_g_MissionRound + 1
	if	x220016_g_MissionRound >= 21 then
		SetMissionData(sceneId, selfId, 11, 1)
	else
		SetMissionData(sceneId, selfId, 11, x220016_g_MissionRound)
	end
	--检测玩家身上的道具是否已经满足完成条件，如果已经满足，则把完成任务的变量置为0
	--if x220016_CheckSubmit( sceneId, selfId ) == 1 then
	--	SetMissionByIndex(sceneId,selfId,misIndex,0,1)					--把任务完成标志置为1
	--end
	--显示内容告诉玩家已经接受了任务
	BeginEvent(sceneId)
		AddText(sceneId,x220016_g_MissionInfo)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
	Msg2Player(  sceneId, selfId,"#Y接受任务：少林寺师门任务",MSG2PLAYER_PARA )
end

--**********************************
--放弃
--**********************************
function x220016_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
    DelMission( sceneId, selfId, x220016_g_MissionId )
	SetMissionData(sceneId,selfId,11,0)	--环数清0
end

--**********************************
--继续
--**********************************
function x220016_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x220016_g_MissionName)
		AddText(sceneId,x220016_g_MissionComplete)
		AddMoneyBonus( sceneId, g_MoneyBonus )
		--for i, item in g_ItemBonus do
		--	AddItemBonus( sceneId, item.id, item.num )
		--end
		--for i, item in g_RadioItemBonus do
		--	AddRadioItemBonus( sceneId, item.id, item.num )
		--end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x220016_g_ScriptId,x220016_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x220016_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x220016_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,0)
    if num == 1 then
		return 1
	end
	return 0
end

--**********************************
--提交
--**********************************
function x220016_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	local Level = GetLevel( sceneId, selfId)	
	if x220016_CheckSubmit( sceneId, selfId, selectRadioId ) then
		DelMission( sceneId, selfId, x220016_g_MissionId )
		MissionCom( sceneId,selfId, x220016_g_MissionId )
		--得到环数
		x220016_g_MissionRound = GetMissionData(sceneId,selfId,11)
		--计算奖励经验的数量
		if mod(x220016_g_MissionRound,10) == 0 then
			x220016_g_Exp = Level * 10 * 10										--等级+环数函数，受经验调节常数的影响
		else
			x220016_g_Exp = Level * mod(x220016_g_MissionRound,10) * 10
		end
		if	floor((x220016_g_MissionRound - 1) / 10) >=1  then
			x220016_g_Exp = x220016_g_Exp +50												--11~20环任务，每环额外增加50点经验
		end
		--增加经验值
		AddExp( sceneId,selfId,x220016_g_Exp)
		AddMoney( sceneId, selfId, x220016_g_Exp)	
		--显示对话框
		BeginEvent(sceneId)
			AddText(sceneId,"恭喜你完成了任务，给你"..x220016_g_Exp.."点经验和"..x220016_g_Exp.."钱")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x220016_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x220016_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x220016_OnItemChanged( sceneId, selfId, itemdataId )
end
