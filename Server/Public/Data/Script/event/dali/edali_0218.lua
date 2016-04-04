--�������� ������һֻ����
--��ɫ�ȼ�С��10���͸�һֻ���ӣ�һ����ɫһ��
--MisDescBegin
--�ű���
x210218_g_ScriptId = 210218

--�����
x210218_g_MissionId = 458

--����Ŀ��npc
x210218_g_Name	="��ƮƮ" 

--�������
x210218_g_MissionKind = 13

--����ȼ�
x210218_g_MissionLevel = 1

--�Ƿ��Ǿ�Ӣ����
x210218_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x210218_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

x210218_g_PetDataID = 3010

--�����ı�����
x210218_g_MissionName="����Ҫֻ����"
x210218_g_MissionInfo="�ðɣ������������ģ��͸���һֻ���Ӱɣ���Ҫ�úõİ�������"  --��������
x210218_g_MissionTarget="����һ��ƮƮ��"		--����Ŀ��
x210218_g_ContinueInfo="������������������ɰ���һֻ����Ҫ�ú��չ�����"		--δ��������npc�Ի�
x210218_g_MissionComplete="�ڴ���ú��档"					--�������npc˵���Ļ�

--������
x210218_g_MoneyBonus=100
x210218_g_ItemBonus={{id=30002002,num=1}}
x210218_g_RadioItemBonus={{id=10100001,num=1},{id=10210001,num=1}}
x210218_g_DemandTrueKill = {{name="��ԭ��",num=5}}	

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210218_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    if IsMissionHaveDone(sceneId,selfId,x210218_g_MissionId) > 0 then
		return
	end
	
	ret = LuaFnCreatePet(sceneId, selfId, x210218_g_PetDataID ) --���������һֻ����
	if ret == 1 then 
		--�¸����ڣ���ʾ���һЩ��
		BeginEvent(sceneId)
		AddText(sceneId,x210218_g_ContinueInfo)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		--�������
		MissionCom( sceneId,selfId, x210218_g_MissionId )
	else
		BeginEvent(sceneId)
			AddText(sceneId,"���Ѿ�����Я����������ˡ�")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x210218_OnEnumerate( sceneId, selfId, targetId )

    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210218_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    --else
    if IsHaveMission(sceneId,selfId,x210218_g_MissionId) > 0 then
		AddNumText(sceneId,x210218_g_ScriptId,x210218_g_MissionName);
    --���������������
    elseif x210218_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x210218_g_ScriptId,x210218_g_MissionName);
    end
end

--**********************************
--����������
--**********************************
function x210218_CheckAccept( sceneId, selfId )
	--��Ҫ2�����ܽ�
	if GetLevel( sceneId, selfId ) >= 1 and GetLevel( sceneId, selfId ) <= 10 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210218_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210218_g_MissionId, x210218_g_ScriptId, 1, 0, 0 )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x210218_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0
end

--**********************************
--����
--**********************************
function x210218_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210218_g_MissionId )
end

--**********************************
--����
--**********************************
function x210218_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210218_g_MissionName)
		AddText(sceneId,x210218_g_MissionComplete)
		AddMoneyBonus( sceneId, x210218_g_MoneyBonus )
		for i, item in x210218_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
		for i, item in x210218_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210218_g_ScriptId,x210218_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210218_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x210218_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,1)
    if num == x210218_g_DemandTrueKill[1].num then
       return 1
    end
	return 0
end

--**********************************
--�ύ
--**********************************
function x210218_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x210218_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
			for i, item in x210218_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
			
			for i, item in x210218_g_RadioItemBonus do
				if item.id == selectRadioId then
					AddItem( sceneId,item.id, item.num )
				end
			end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddMoney(sceneId,selfId,x210218_g_MoneyBonus );
			--�۳�������Ʒ
			--for i, item in g_DemandItem do
			--	DelItem( sceneId, selfId, item.id, item.num )
			--end
			ret = DelMission( sceneId, selfId, x210218_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId,selfId, x210218_g_MissionId )
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
function x210218_OnKillObject( sceneId, selfId, objdataId )
	if GetName(sceneId,objId) == x210218_g_DemandTrueKill[1].name	  then
		misIndex = GetMissionIndexByID(sceneId,selfId,x210218_g_MissionId)
		num = GetMissionParam(sceneId,selfId,misIndex,1)
			if num < x210218_g_DemandTrueKill[1].num then
			--��������ɱ�־����Ϊ1
			if num == x210218_g_DemandTrueKill[1].num - 1 then
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			end
			--���ô������+1
			SetMissionByIndex(sceneId,selfId,misIndex,1,num+1)
	  		BeginEvent(sceneId)
	  			strText = format("��ɱ����ԭ�� %d/5", GetMissionParam(sceneId,selfId,misIndex,1) )
	  			AddText(sceneId,strText);
	  		EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end

--**********************************
--���������¼�
--**********************************
function x210218_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210218_OnItemChanged( sceneId, selfId, itemdataId )
end
