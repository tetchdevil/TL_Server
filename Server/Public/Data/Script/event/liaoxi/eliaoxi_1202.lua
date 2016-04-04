--��������    1������õ�������Ʒ 2���������ֵõ��ڶ���������Ʒ 3���������2��������Ʒ�������� 
--���Ϻڷ�
--MisDescBegin
--�ű���
x211202_g_ScriptId = 211202

--��һ�������ID
--g_MissionIdPre = 39

--�����
x211202_g_MissionId = 552

--Ŀ��NPC
x211202_g_Name	="����"

--������߱��
x211202_g_ItemId1 =40002069				--�Ƿ�

--���������������
x211202_g_ItemNeedNum1 = 1				

--���ʱ��Ҫ�������ϵĵ��߱��
x211202_g_ItemId2 = 40002070			--������

--���ʱ��Ҫ�������ϵĵ��ߵ�����
x211202_g_ItemNeedNum2 = 1

--�������
x211202_g_MissionKind = 32

--����ȼ�
x211202_g_MissionLevel = 57

--�Ƿ��Ǿ�Ӣ����
x211202_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������
--�����Ƿ��Ѿ����
x211202_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�Զ���
x211202_g_Custom={{id="�����Ϻڷ�",num=1}}	--�����ĵ�һλ

--�����ı�����
x211202_g_MissionName="���Ϻڷ�"
x211202_g_MissionInfo="����ڷ��Ⱥ,�㿴����,��ѹѹ��һƬ,�����ⶼ��ס��.���������������,���ҵ�һ�Ѹ��Ƿ�,��ȼ���̨�������ߺڷ�"  --��������
x211202_g_MissionTarget="�ڷ��̨��ȼ���Ƿ�,���Ϻڷ�"		--����Ŀ��
x211202_g_ContinueInfo="��Ҫ��ɱ����ԭ��,�õ�һ�Ѹ��Ƿ�,Ȼ�󵽷��̨��ȼ,�������Ϻڷ���"		--δ��������npc�Ի�
x211202_g_MissionComplete="�ɵò���"					--�������npc˵�Ļ�

x211202_g_MoneyBonus=1032
x211202_g_ItemBonus={{id=30002001,num=1},{id=10412001,num=1}}
x211202_g_RadioItemBonus={{id=10100001,num=1},{id=10210001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x211202_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x211202_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x211202_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,x211202_g_MissionName)
		AddText(sceneId,x211202_g_ContinueInfo)
		--for i, item in g_DemandItem do
		--			AddItemDemand( sceneId, item.id, item.num )
		--end
		EndEvent( )
		bDone = x211202_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x211202_g_ScriptId,x211202_g_MissionId,bDone)
	--���������������
	elseif x211202_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,x211202_g_MissionName)
		AddText(sceneId,x211202_g_MissionInfo)
		AddText(sceneId,"#{M_MUBIAO}")
		AddText(sceneId,x211202_g_MissionTarget)
		AddMoneyBonus( sceneId, x211202_g_MoneyBonus )
		for i, item in x211202_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
			for i, item in x211202_g_RadioItemBonus do
					AddRadioItemBonus( sceneId, item.id, item.num )
				end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x211202_g_ScriptId,x211202_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x211202_OnEnumerate( sceneId, selfId, targetId )

    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x211202_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    --else
    if IsHaveMission(sceneId,selfId,x211202_g_MissionId) > 0 then
		AddNumText(sceneId,x211202_g_ScriptId,x211202_g_MissionName);

    --���������������
    elseif x211202_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x211202_g_ScriptId,x211202_g_MissionName);
    end

end

--**********************************
--����������
--**********************************
function x211202_CheckAccept( sceneId, selfId )

	--��Ҫ2�����ܽ�
	if GetLevel( sceneId, selfId ) >= 1 then
		return 1
	else
		return 0
	end

end

--**********************************
--����
--**********************************
function x211202_OnAccept( sceneId, selfId )
	BeginAddItem( sceneId )
	AddItem( sceneId, x211202_g_ItemId2, 1 )
	ret = EndAddItem( sceneId, selfId )
	--������������б�
	if ret >0 then
		ret = AddMission( sceneId,selfId, x211202_g_MissionId, x211202_g_ScriptId, 1, 0, 0 )
		--if ret >0 then
			AddItemListToHuman(sceneId,selfId)
		--end
	end
end

--**********************************
--����
--**********************************
function x211202_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    ret = DelMission( sceneId, selfId, x211202_g_MissionId )
	--if ret >0 then
		DelItem ( sceneId,selfId,x211202_g_ItemId2,1)
	--end	
end

--**********************************
--����
--**********************************
function x211202_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x211202_g_MissionName)
    AddText(sceneId,x211202_g_MissionComplete)
    AddMoneyBonus( sceneId, x211202_g_MoneyBonus )
    for i, item in x211202_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    for i, item in x211202_g_RadioItemBonus do
		AddRadioItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x211202_g_ScriptId,x211202_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x211202_CheckSubmit( sceneId, selfId )

--  for i, item in g_DemandItem do
--		itemCount = GetItemCount( sceneId, selfId, item.id )
--		if itemCount < item.num then
--			return 0
--		end
--	end
--	return 1
	
	misIndex = GetMissionIndexByID(sceneId,selfId,x211202_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,0)
    
    if num == 1 then
       return 1
    end
	return 0
end

--**********************************
--�ύ
--**********************************
function x211202_OnSubmit( sceneId, selfId, targetId,selectRadioId )
		
	if x211202_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x211202_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		for i, item in x211202_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
		
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddMoney(sceneId,selfId,x211202_g_MoneyBonus );
			--�۳�������Ʒ
			--for i, item in g_DemandItem do
			--	DelItem( sceneId, selfId, item.id, item.num )
			--end
			ret = DelMission( sceneId, selfId, x211202_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId,selfId, x211202_g_MissionId )
				AddItemListToHuman(sceneId,selfId)
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
function x211202_OnKillObject( sceneId, selfId, objdataId ,objId)--������˼�������š����objId�������λ�úš�����objId
	if objdataId == 1810 then
		num = GetMonsterOwnerCount(sceneId,objId)--ȡ�������������ӵ�з���Ȩ������
		for i=0,num-1 do
			humanObjId = GetMonsterOwnerID(sceneId,objId,i)--ȡ��ӵ�з���Ȩ���˵�objId
			if IsHaveMission(sceneId,humanObjId,x211202_g_MissionId) > 0 then	--��������ӵ������	
				if (GetItemCount(sceneId,humanObjId,x211202_g_ItemId1) < x211202_g_ItemNeedNum1) then	--����Ƿ��Ѿ��õ��㹻��������Ʒ
					if (HaveItem (sceneId,humanObjId,x211202_g_ItemId2) > 0) then	--��������Ƿ������Ҫ�����������
						AddMonsterDropItem(sceneId,objId,humanObjId,x211202_g_ItemId1)    --��������������(���߻������ʬ�����)
					end
				end
			end
		end
	end
end

--**********************************
--���������¼�
--**********************************
function x211202_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x211202_OnItemChanged( sceneId, selfId, itemdataId )
end
