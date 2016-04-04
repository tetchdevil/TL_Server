--ɱ�ֵ�������
--������
--MisDescBegin
--�ű���
x210305_g_ScriptId = 210305

--��һ�������ID
--x210305_g_MissionIdPre =

--�����
x210305_g_MissionId = 465

--��һ�������ID
x210305_g_MissionIdPre = 463

--����Ŀ��npc
x210305_g_Name	="½��˪" 

--������߱��
--g_ItemId = 1

--���������������
--g_ItemNeedNum = 1

--�������
x210305_g_MissionKind = 14

--����ȼ�
x210305_g_MissionLevel = 51

--�Ƿ��Ǿ�Ӣ����
x210305_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x210305_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

--������Ҫ�õ�����Ʒ
x210305_g_DemandItem = {{id=40002128,num=1,name="Կ��"}}
x210305_g_DemandKill = {{id=551,num=1,name="ǿ���ľ��"}}

--�����ı�����
x210305_g_MissionName="������"
x210305_g_MissionInfo=[[
        ����ֻҪŪ�������ﵽ�׷�����ʲô���飬�Ϳ����κò����˵Ĳ��ˡ�
        ����������˵�������˳�����󣬾��ö����ֵܰ������ã���Կ���ӵ�¬���ٲ���ľ��Ⱥ���ˡ�����Ӧ����ĳһ��ǿ���ľ�����аɡ�
        ]]  --��������
x210305_g_MissionTarget=[[
        ɱ��ǿ���ľ�ˣ��õ�������Ժ�����Կ�ף���������½��˪��
]]		--����Ŀ��
x210305_g_ContinueInfo="���ҵ�Կ�����𣬿��ȥ�Ұɡ�"		--δ��������npc�Ի�
x210305_g_MissionComplete="����̫��л����!"					--�������npc˵���Ļ�

x210305_g_MoneyBonus=1032
x210305_g_ItemBonus={{id=30002001,num=1},{id=10412001,num=1}}
x210305_g_RadioItemBonus={{id=10100001,num=1},{id=10210001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210305_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x210305_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x210305_g_MissionId) > 0 then
		--���������������Ϣ
		if x210305_CheckSubmit(sceneId, selfId )==1 then
			x210305_OnComplete( sceneId, selfId, targetId);
		else
			x210305_OnContinue( sceneId, selfId, targetId);
		end
	elseif x210305_CheckAccept(sceneId,selfId) > 0 then --���������������
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId, x210305_g_MissionName)
			AddText(sceneId, x210305_g_MissionInfo)
			AddText(sceneId, "#{M_MUBIAO}")
			AddText(sceneId, x210305_g_MissionTarget)
			AddMoneyBonus( sceneId, x210305_g_MoneyBonus )
			for i, item in x210305_g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
			for i, item in x210305_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x210305_g_ScriptId,x210305_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x210305_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x210305_g_MissionIdPre) <= 0 then
    	return
    end
	--��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210305_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    if IsHaveMission(sceneId,selfId,x210305_g_MissionId) > 0 then
		AddNumText(sceneId,x210305_g_ScriptId,x210305_g_MissionName);
	--���������������
    elseif x210305_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x210305_g_ScriptId,x210305_g_MissionName);
    end
end

--**********************************
--����������
--**********************************
function x210305_CheckAccept( sceneId, selfId )
	--��Ҫ1�����ܽ�
	if GetLevel( sceneId, selfId ) >= 15 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210305_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210305_g_MissionId, x210305_g_ScriptId, 1, 0, 1 );
	misIndex = GetMissionIndexByID(sceneId, selfId, x210305_g_MissionId);			--�õ���������к�
	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0);						--�������кŰ���������ĵ�0λ��0 (����������)
end

--**********************************
--����
--**********************************
function x210305_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x210305_g_MissionId );
end

--**********************************
--����
--**********************************
function x210305_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
  BeginEvent(sceneId);
	AddText(sceneId, x210305_g_MissionName);
	AddText(sceneId, x210305_g_ContinueInfo);
	for i, item in x210305_g_DemandItem do
		AddItemDemand( sceneId, item.id, item.num )
	end
	EndEvent();
	bDone = x210305_CheckSubmit(sceneId, selfId );
	DispatchMissionDemandInfo(sceneId, selfId, targetId, x210305_g_ScriptId, x210305_g_MissionId, bDone);
end

--**********************************
--�������
--**********************************
function x210305_OnComplete( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
  BeginEvent(sceneId)
	AddText(sceneId, x210305_g_MissionName);
	AddText(sceneId, x210305_g_MissionComplete);
	AddMoneyBonus( sceneId, x210305_g_MoneyBonus );
  for i, item in x210305_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num );
	end
  for i, item in x210305_g_RadioItemBonus do
		AddRadioItemBonus( sceneId, item.id, item.num );
	end
  EndEvent( )
  DispatchMissionContinueInfo(sceneId, selfId, targetId, x210305_g_ScriptId, x210305_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210305_CheckSubmit( sceneId, selfId )
	for i, item in x210305_g_DemandItem do
		itemCount = GetItemCount( sceneId, selfId, item.id )
		if itemCount < item.num then
			return 0
		end
	end
	return 1
end

--**********************************
--�ύ
--**********************************
function x210305_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x210305_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId);
			for i, item in x210305_g_ItemBonus do
				AddItem( sceneId, item.id, item.num );
			end
			for i, item in x210305_g_RadioItemBonus do
				if item.id == selectRadioId then
					AddItem( sceneId,item.id, item.num );
				end
			end
		ret = EndAddItem(sceneId, selfId);
		--���������
		if ret > 0 then
			AddMoney(sceneId, selfId, x210305_g_MoneyBonus );
			ret = DelMission( sceneId, selfId, x210305_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId, selfId, x210305_g_MissionId );
				--�۳�������Ʒ
				for i, item in x210305_g_DemandItem do
					DelItem( sceneId, selfId, item.id, item.num );
				end
				AddItemListToHuman(sceneId, selfId);
			end
		else
			--������û�мӳɹ�
			BeginEvent(sceneId)
				strText = "��������,�޷��������"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x210305_OnKillObject( sceneId, selfId, objdataId, objId)--������˼�������š����objId�������λ�úš�����objId
  print("Monster id:".. x210305_g_DemandKill[1].id);
	if objdataId == x210305_g_DemandKill[1].id then
		num = GetMonsterOwnerCount(sceneId, objId)--ȡ�������������ӵ�з���Ȩ������
		for i=0,num-1 do
			humanObjId = GetMonsterOwnerID(sceneId, objId, i)--ȡ��ӵ�з���Ȩ���˵�objId
			if IsHaveMission(sceneId, humanObjId, x210305_g_MissionId) > 0 then	--��������ӵ������	
				for i, item in x210305_g_DemandItem do
					if( GetItemCount(sceneId,humanObjId, item.id) < item.num ) then
						AddMonsterDropItem(sceneId, objId, humanObjId, item.id)    --��������������(���߻������ʬ�����)
					end
				end
			end
		end
	end
end

--**********************************
--���������¼�
--**********************************
function x210305_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210305_OnItemChanged( sceneId, selfId, itemdataId )
	local misIndex = GetMissionIndexByID(sceneId, selfId, x210305_g_MissionId);
	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0); --������Ϊû���������
	local bMissionDone = true;
  BeginEvent(sceneId)
  
	for i, item in x210305_g_DemandItem do
		if itemdataId == item.id then
			local nItemNum = GetItemCount(sceneId, selfId, item.id);
			local strText = format("�ѵõ�%s%d/%d", item.name, nItemNum, item.num);
			AddText(sceneId, strText);
			if nItemNum < item.num then
				bMissionDone = false;
			end
		end
	end
	--����Ʒ�����ﵽҪ�����ʱ������ɱ�־��Ȼ��0,��������־���ó�1
	if bMissionDone then
		SetMissionByIndex(sceneId, selfId, misIndex, 0, 1) --ȷʵ���������
	end
	
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end
