--̽����콻��ʯ
--�ű���
x211704_g_ScriptId = 211704

--�����
x211704_g_MissionId = 604

--�������
x211704_g_MissionKind = 31

--����ȼ�
x211704_g_MissionLevel = 59

--�Ƿ��Ǿ�Ӣ����
x211704_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������*******
--�����Ƿ��Ѿ����
x211704_g_IsMissionOkFail = 0		--�����ĵ�0λ

--*******************�����Ƕ�̬��ʾ***********

--�����ı�����
x211704_g_MissionName="�����ĺ���"
x211704_g_MissionInfo="̽����콻��ʯ"
x211704_g_MissionTarget="̽����콻��ʯ"
x211704_g_ContinueInfo="�ҵ���콻��ʯ����"		--δ��������npc�Ի�
x211704_g_MissionComplete="С��������ô����ҵ���"

--����

--������Ŀ��npc
x211704_g_Name = "֣��"

x211704_g_MoneyBonus=10200
x211704_g_Exp = 3000
x211704_g_ItemBonus={{id=30002001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x211704_OnDefaultEvent( sceneId, selfId, targetId )
	 --������������
    if IsMissionHaveDone( sceneId, selfId, x211704_g_MissionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x211704_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x211704_g_Name then
			--���ͽ�����ǰ��������Ϣ
    		BeginEvent(sceneId)
    		AddText(sceneId,x211704_g_ContinueInfo);
    		
    		AddMoneyBonus( sceneId, x211704_g_MoneyBonus )
		for i, item in x211704_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
    		EndEvent(sceneId)
    		
    		done = x211704_CheckSubmit( sceneId, selfId );
   			DispatchMissionDemandInfo(sceneId,selfId,targetId,x211704_g_ScriptId,x211704_g_MissionId,done)
 		end
    --���������������
    elseif x211704_CheckAccept(sceneId,selfId) > 0 then
		--if GetName(sceneId,targetId) ~= x211704_g_Name then		--���������̽����ͼ,���Է�����ͽ�������ͬһ��npc,��ǰ�ͻ�����ͬһ��npc,��˲���Ҫ����ж�
			--�����������ʱ��ʾ����Ϣ
	    	BeginEvent(sceneId)
    		AddText(sceneId,x211704_g_MissionName);
    		AddText(sceneId,x211704_g_MissionInfo);
    		AddText(sceneId,x211704_g_MissionTarget);
    		
    		AddMoneyBonus( sceneId, x211704_g_MoneyBonus )
		for i, item in x211704_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
				
	    	EndEvent(sceneId)
	    	DispatchMissionInfo(sceneId,selfId,targetId,x211704_g_ScriptId,x211704_g_MissionId)
		--end
    end
end

--**********************************
--�о��¼�
--**********************************
function x211704_OnEnumerate( sceneId, selfId, targetId )
	
	if IsMissionHaveDone( sceneId, selfId, x211704_g_MissionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x211704_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x211704_g_Name then
			AddNumText(sceneId, x211704_g_ScriptId,x211704_g_MissionName)
		end
    --���������������
    elseif x211704_CheckAccept(sceneId,selfId) > 0 then
		--if GetName(sceneId,targetId) ~= x211704_g_Name then      --���������̽����ͼ,���Է�����ͽ�������ͬһ��npc,��ǰ�ͻ�����ͬһ��npc,��˲���Ҫ����ж�
		AddNumText(sceneId, x211704_g_ScriptId, x211704_g_MissionName);
		--end
    end
end

--**********************************
--��ⴥ������
--**********************************
function x211704_CheckAccept( sceneId, selfId )
	--��Ҫ60�����ܽ�
	if GetLevel( sceneId, selfId ) >= 60 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x211704_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x211704_g_MissionId, x211704_g_ScriptId, 0, 1, 0 )
	misIndex = GetMissionIndexByID(sceneId,selfId,x211704_g_MissionId)	--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)	--�������кŰ���������ĵ�0λ��0
end

--**********************************
--����
--**********************************
function x211704_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x211704_g_MissionId )
end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x211704_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x211704_g_MissionComplete);
    EndEvent(sceneId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x211704_g_ScriptId,x211704_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x211704_CheckSubmit( sceneId, selfId )
    misIndex = GetMissionIndexByID(sceneId,selfId,x211704_g_MissionId)	
	num = GetMissionParam(sceneId,selfId,misIndex,0)
	if num < 1 then
		return 0
	else
		return 1
	end
end

--**********************************
--�ύ����ɣ�
--**********************************
function x211704_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	if x211704_CheckSubmit( sceneId, selfId, selectRadioId ) then
    		BeginAddItem(sceneId)
			for i, item in x211704_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
			
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then		
		
			AddExp(sceneId,selfId,x211704_g_Exp)
			AddMoney(sceneId,selfId,x211704_g_MoneyBonus );
			
			ret = DelMission( sceneId, selfId, x211704_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId, selfId, x211704_g_MissionId )
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
function x211704_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x211704_OnEnterArea( sceneId, selfId, areaId )
	if areaId == 100  then
		misIndex=GetMissionIndexByID(sceneId,selfId,x211704_g_MissionId)--ȡ�������������б��е�index
		num = GetMissionParam(sceneId,selfId,misIndex,0)--����indexȡ�����������һλ��ֵ
		if num < 1 then				--���������������ɵ�����
			SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)--���������һλ����1
			BeginEvent(sceneId)						--��ʾ��ʾ��Ϣ
			strText = format("�ҵ���콻��ʯ%d", GetMissionParam(sceneId,selfId,misIndex,0) )
			AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)						--����ʾ��Ϣ����
		end
	end
end

--**********************************
--���߸ı�
--**********************************
function x211704_OnItemChanged( sceneId, selfId, itemdataId )
end
