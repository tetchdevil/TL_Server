--ɱ�ֵ�������
--�ưͻ���
--MisDescBegin
--�ű���
x210309_g_ScriptId = 210309

--��һ�������ID
--g_MissionIdPre =

--�����
x210309_g_MissionId = 469

--����Ŀ��npc
x210309_g_Name	="½��" 

--������߱��
x210309_g_ItemId = 1

--���������������
--g_ItemNeedNum = 1

--�������
x210309_g_MissionKind = 14

--����ȼ�
x210309_g_MissionLevel = 51

--�Ƿ��Ǿ�Ӣ����
x210309_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x210309_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

--������Ҫ�õ�����Ʒ
x210309_g_DemandItem = {{id=40002129,num=1,name="�ưͻ���"}}
x210309_g_DemandKill = {{id=552,num=1,name="�ưͶ�Գ"}}

--�����ı�����
x210309_g_MissionName="�ưͻ���"
x210309_g_MissionInfo=[[
        ����ֻҪ����һζ���ưͻ������Ϳ��Գ�����������˵ľ��Ų���������ζ���ưͻ�����ֻ��һֻ����˵��������������Ķ�Գ�����ڵ���
        ]]  --��������
x210309_g_MissionTarget=[[
        ɱ���ưͶ�Գ���õ��ưͻ���.
]]		--����Ŀ��
x210309_g_ContinueInfo="ɱ���ưͶ�Գ���𣬿��ȥ�Ұɡ�"		--δ��������npc�Ի�
x210309_g_MissionComplete="����̫��л����!"					--�������npc˵���Ļ�

x210309_g_MoneyBonus=1032
x210309_g_ItemBonus={{id=30002001,num=1},{id=10412001,num=1}}
x210309_g_RadioItemBonus={{id=10100001,num=1},{id=10210001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210309_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x210309_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x210309_g_MissionId) > 0 then
		--���������������Ϣ
		if x210309_CheckSubmit(sceneId, selfId )==1 then
			x210309_OnComplete( sceneId, selfId, targetId);
		else
			x210309_OnContinue( sceneId, selfId, targetId);
		end
	elseif x210309_CheckAccept(sceneId,selfId) > 0 then
	  --���������������
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId, x210309_g_MissionName)
			AddText(sceneId, x210309_g_MissionInfo)
			AddText(sceneId, "#{M_MUBIAO}")
			AddText(sceneId, x210309_g_MissionTarget)
			AddMoneyBonus( sceneId, x210309_g_MoneyBonus )
			for i, item in x210309_g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
			for i, item in x210309_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x210309_g_ScriptId,x210309_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x210309_OnEnumerate( sceneId, selfId, targetId )
	--��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210309_g_MissionId) > 0 then
    	return 
	end
  --����ѽӴ�����
  if IsHaveMission(sceneId,selfId,x210309_g_MissionId) > 0 then
		AddNumText(sceneId,x210309_g_ScriptId,x210309_g_MissionName);
	--���������������
  elseif x210309_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x210309_g_ScriptId,x210309_g_MissionName);
  end
end

--**********************************
--����������
--**********************************
function x210309_CheckAccept( sceneId, selfId )
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
function x210309_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210309_g_MissionId, x210309_g_ScriptId, 1, 0, 1 );
	misIndex = GetMissionIndexByID(sceneId, selfId, x210309_g_MissionId);			--�õ���������к�
	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0);						--�������кŰ���������ĵ�0λ��0 (����������)
end

--**********************************
--����
--**********************************
function x210309_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x210309_g_MissionId );
end

--**********************************
--����
--**********************************
function x210309_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
  BeginEvent(sceneId);
	AddText(sceneId, x210309_g_MissionName);
	AddText(sceneId, x210309_g_ContinueInfo);
	for i, item in x210309_g_DemandItem do
		AddItemDemand( sceneId, item.id, item.num )
	end
	EndEvent();
	bDone = x210309_CheckSubmit(sceneId, selfId );
	DispatchMissionDemandInfo(sceneId, selfId, targetId, x210309_g_ScriptId, x210309_g_MissionId, bDone);
end

--**********************************
--�������
--**********************************
function x210309_OnComplete( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
  BeginEvent(sceneId)
	AddText(sceneId, x210309_g_MissionName);
	AddText(sceneId, x210309_g_MissionComplete);
	AddMoneyBonus( sceneId, x210309_g_MoneyBonus );
  for i, item in x210309_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num );
	end
  for i, item in x210309_g_RadioItemBonus do
		AddRadioItemBonus( sceneId, item.id, item.num );
	end
  EndEvent( )
  DispatchMissionContinueInfo(sceneId, selfId, targetId, x210309_g_ScriptId, x210309_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210309_CheckSubmit( sceneId, selfId )
	for i, item in x210309_g_DemandItem do
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
function x210309_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x210309_CheckSubmit( sceneId, selfId, selectRadioId ) then
  	BeginAddItem(sceneId);
		for i, item in x210309_g_ItemBonus do
			AddItem( sceneId, item.id, item.num );
		end
		for i, item in x210309_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num );
			end
		end
		ret = EndAddItem(sceneId, selfId);
		--���������
		if ret > 0 then
			AddMoney(sceneId, selfId, x210309_g_MoneyBonus );
			ret = DelMission( sceneId, selfId, x210309_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId, selfId, x210309_g_MissionId );
				--�۳�������Ʒ
				for i, item in x210309_g_DemandItem do
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
function x210309_OnKillObject( sceneId, selfId, objdataId, objId)--������˼�������š����objId�������λ�úš�����objId
  print(x210309_g_MissionName .. " ��Ҫɱ���Ĺ���id:".. x210309_g_DemandKill[1].id .. "ɱ���Ĺ���id=" .. objdataId);
	if objdataId == x210309_g_DemandKill[1].id then
		num = GetMonsterOwnerCount(sceneId, objId)--ȡ�������������ӵ�з���Ȩ������
		for i=0,num-1 do
			humanObjId = GetMonsterOwnerID(sceneId, objId, i)--ȡ��ӵ�з���Ȩ���˵�objId
			if IsHaveMission(sceneId, humanObjId, x210309_g_MissionId) > 0 then	--��������ӵ������	
				for i, item in x210309_g_DemandItem do
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
function x210309_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210309_OnItemChanged( sceneId, selfId, itemdataId )
	local misIndex = GetMissionIndexByID(sceneId, selfId, x210309_g_MissionId);
	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0); --������Ϊû���������
	local bMissionDone = true;
  BeginEvent(sceneId)
  
	for i, item in x210309_g_DemandItem do
		if itemdataId == item.id then
			local nItemNum = GetItemCount(sceneId, selfId, item.id);
			local strText = format("�ѵõ�%s%d/%d", item.name, nItemNum, item.num );
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
