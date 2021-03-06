--寻物任务
--杜子腾要你给他找到一个馒头
--MisDescBegin
--脚本号
x210202_g_ScriptId = 210202

--任务号
x210202_g_MissionId = 442

--上一个任务的ID
x210202_g_MissionIdPre = 441

--目标NPC
x210202_g_Name	="杜子腾"

--任务道具编号
x210202_g_ItemId = 30101001

--任务道具需求数量
x210202_g_ItemNeedNum = 1

--任务归类
x210202_g_MissionKind = 13

--任务等级
x210202_g_MissionLevel = 1

--是否是精英任务
x210202_g_IfMissionElite = 0

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************
--任务是否已经完成
x210202_g_IsMissionOkFail = 0		--变量的第0位

--以上是动态**************************************************************

--任务需要得到的物品
x210202_g_DemandItem={{id=30101001,num=1}}		--变量第1位

--任务名
x210202_g_MissionName="新手：武林大会"
x210202_g_MissionInfo="年轻人给我做个馒头，让我看看你手艺如何。"
x210202_g_MissionTarget="把馒头送给杜子腾"
x210202_g_MissionComplete="做好了吗？不错不错，这是给你的奖励。"
x210202_g_MoneyBonus=120
x210202_g_SignPost = {x = 109, z = 167, tip = "杜子腾"}
x210202_g_ItemBonus={{id=30304001,num=1}}
--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x210202_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过这个任务（实际上如果完成了任务这里就不会显示，但是再检测一次比较安全）
    --if IsMissionHaveDone(sceneId,selfId,x210202_g_MissionId) > 0 then
	--	return
	--end
    --如果已接此任务
		if IsHaveMission(sceneId,selfId,x210202_g_MissionId) > 0 then
			--发送任务需求的信息
			BeginEvent(sceneId)
			AddText(sceneId,x210202_g_MissionName)
			AddText(sceneId,x210202_g_MissionComplete)
			for i, item in x210202_g_DemandItem do
				AddItemDemand( sceneId, item.id, item.num )
			end
			AddMoneyBonus( sceneId, x210202_g_MoneyBonus )
			EndEvent( )
			bDone = x210202_CheckSubmit( sceneId, selfId )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x210202_g_ScriptId,x210202_g_MissionId,bDone)
		--满足任务接收条件
		elseif x210202_CheckAccept(sceneId,selfId) > 0 then
			--发送任务接受时显示的信息
			BeginEvent(sceneId)
				AddText(sceneId,x210202_g_MissionName)
				AddText(sceneId,x210202_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210202_g_MissionTarget)
				for i, item in x210202_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
				AddMoneyBonus( sceneId, x210202_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210202_g_ScriptId,x210202_g_MissionId)
		end
end

--**********************************
--列举事件
--**********************************
function x210202_OnEnumerate( sceneId, selfId, targetId )
    --如果玩家还未完成上一个任务
    if 	IsMissionHaveDone(sceneId,selfId,x210202_g_MissionIdPre) <= 0 then
    	return
    end
    --如果玩家完成过这个任务
    if IsMissionHaveDone(sceneId,selfId,x210202_g_MissionId) > 0 then
    	return 
	end
    --如果已接此任务
	if IsHaveMission(sceneId,selfId,x210202_g_MissionId) > 0 then
		AddNumText(sceneId,x210202_g_ScriptId,x210202_g_MissionName,2,-1);
	--满足任务接收条件
	elseif x210202_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x210202_g_ScriptId,x210202_g_MissionName,1,-1);
	end
end

--**********************************
--检测接受条件
--**********************************
function x210202_CheckAccept( sceneId, selfId )
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
function x210202_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	AddMission( sceneId,selfId, x210202_g_MissionId, x210202_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#Y接受任务：武林大会",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, SCENE_DALI, x210202_g_SignPost.x, x210202_g_SignPost.z, x210202_g_SignPost.tip )
end

--**********************************
--放弃
--**********************************
function x210202_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
    DelMission( sceneId, selfId, x210202_g_MissionId )
end

--**********************************
--继续
--**********************************
function x210202_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x210202_g_MissionName)
		AddText(sceneId,x210202_g_MissionComplete)
		AddMoneyBonus( sceneId, x210202_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210202_g_ScriptId,x210202_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x210202_CheckSubmit( sceneId, selfId )
	for i, item in x210202_g_DemandItem do
		itemCount = GetItemCount( sceneId, selfId, item.id )
		if itemCount < item.num then
			return 0
		end
	end
	return 1
end

--**********************************
--提交
--**********************************
function x210202_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210202_CheckSubmit( sceneId, selfId, selectRadioId ) then
		BeginAddItem(sceneId)
			for i, item in x210202_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
		ret = EndAddItem(sceneId,selfId)
		if ret > 0 then
			AddMoney(sceneId,selfId,x210202_g_MoneyBonus );
			LuaFnAddExp(sceneId, selfId,40)
			ret = DelMission( sceneId, selfId, x210202_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId, selfId, x210202_g_MissionId )
				AddItemListToHuman(sceneId,selfId)
				--扣除任务物品
				for i, item in x210202_g_DemandItem do
					DelItem( sceneId, selfId, item.id, item.num )
				end
				Msg2Player(  sceneId, selfId,"#Y完成任务：武林大会",MSG2PLAYER_PARA )
				CallScriptFunction( 210203, "OnDefaultEvent",sceneId, selfId, targetId)
			end
		else
			--任务奖励没有加成功
			BeginEvent(sceneId)
				strText = "背包已满,无法完成任务"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x210202_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x210202_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210202_OnItemChanged( sceneId, selfId, itemdataId )
end
