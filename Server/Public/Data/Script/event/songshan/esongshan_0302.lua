--ɱ������
--����ͭ��
--MisDescBegin
--�ű���
x210302_g_ScriptId = 210302

--��һ�������ID
--g_MissionIdPre =

--�����
x210302_g_MissionId = 462

--����Ŀ��npc
x210302_g_Name	="���" 

--�������
x210302_g_MissionKind = 14

--����ȼ�
x210302_g_MissionLevel = 52

--�Ƿ��Ǿ�Ӣ����
x210302_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������
--�����Ƿ��Ѿ����
x210302_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������Ҫɱ���Ĺ�
x210302_g_DemandKill = {{id=1600,num=10,name="����ͭ��"}}		--������1λ

--�����Ƕ�̬**************************************************************

--�����ı�����
x210302_g_MissionName="����ͭ��"
x210302_g_MissionTarget="ɱ��10������ͭ��"		--����Ŀ��
x210302_g_ContinueInfo="�汿�������ȥ��"		--δ��������npc�Ի�
x210302_g_MissionComplete="�ţ����������������"					--�������npc˵���Ļ�

--������
x210302_g_MoneyBonus=12000
x210302_g_ItemBonus={{id=30002001,num=1},{id=10412001,num=1}}
x210302_g_RadioItemBonus={{id=10100001,num=1},{id=10210001,num=1}}

--MisDescEnd

--Only used at server
x210302_g_MissionInfo=[[
    ��������
    Ŷ�����㰡��%s����Ǹ��������Ѿ������ŵ�ʧ�������ˡ�
    ÿ���ұ����ۣ������ǿ��Կ�������Щ�׶��������ľ�˰�������ͭ�˰�������ӭ���������һ��ܿ����ҹ������游�������Աߣ�������Ѫ����Ц�š�
    �����㣬ȥ����ɱ��%dֻ%s��]]  --��������
    
--**********************************
--������ں���
--**********************************
function x210302_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x210302_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId, selfId, x210302_g_MissionId) > 0 then
		--���������������Ϣ
		if x210302_CheckSubmit(sceneId, selfId )==1 then
			x210302_OnComplete( sceneId, selfId, targetId);
		else
			x210302_OnContinue( sceneId, selfId, targetId);
		end
	elseif x210302_CheckAccept(sceneId, selfId) > 0 then --���������������
		--�����������ʱ��ʾ����Ϣ
		local PlayerName = GetName(sceneId, selfId);
		local strText = format(x210302_g_MissionInfo, PlayerName, x210302_g_DemandKill[1].num, x210302_g_MissionName);
		BeginEvent(sceneId);
		AddText(sceneId, x210302_g_MissionName);
		AddText(sceneId, strText);
		AddText(sceneId, "#{M_MUBIAO}");
		AddText(sceneId, x210302_g_MissionTarget);
		AddMoneyBonus( sceneId, x210302_g_MoneyBonus );
		for i, item in x210302_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num );
		end
		for i, item in x210302_g_RadioItemBonus do
					AddRadioItemBonus( sceneId, item.id, item.num );
		end
		EndEvent();
		DispatchMissionInfo(sceneId, selfId, targetId, x210302_g_ScriptId, x210302_g_MissionId);
	end
end

--**********************************
--�о��¼�
--**********************************
function x210302_OnEnumerate( sceneId, selfId, targetId )
	
  --��������ɹ��������
  if IsMissionHaveDone(sceneId, selfId, x210302_g_MissionId) > 0 then
  	return 
  end
  --����ѽӴ�����
  --else
  if IsHaveMission(sceneId, selfId, x210302_g_MissionId) > 0 then
		AddNumText(sceneId, x210302_g_ScriptId, x210302_g_MissionName);
    --���������������
  elseif x210302_CheckAccept(sceneId, selfId) > 0 then
		AddNumText(sceneId,x210302_g_ScriptId,x210302_g_MissionName);
  end
end

--**********************************
--����������
--**********************************
function x210302_CheckAccept( sceneId, selfId )
	--��Ҫ2�����ܽ�
	if GetLevel( sceneId, selfId ) >= 15 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210302_OnAccept( sceneId, selfId )
	--������������б�
	print(format("������%s����", x210302_g_MissionName));
	AddMission( sceneId, selfId, x210302_g_MissionId, x210302_g_ScriptId, 1, 0, 0 );		--�������
	misIndex = GetMissionIndexByID(sceneId, selfId, x210302_g_MissionId);			--�õ���������к�
	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0);						--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId, selfId, misIndex, 1, 0);						--�������кŰ���������ĵ�1λ��0
end

--**********************************
--����
--**********************************
function x210302_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210302_g_MissionId )
end

--**********************************
--����
--**********************************
function x210302_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
  BeginEvent(sceneId);
	AddText(sceneId, x210302_g_MissionName);
	AddText(sceneId, x210302_g_ContinueInfo);
	EndEvent();
	bDone = x210302_CheckSubmit(sceneId, selfId );
	DispatchMissionDemandInfo(sceneId, selfId, targetId, x210302_g_ScriptId, x210302_g_MissionId, bDone);
end

--**********************************
--�������
--**********************************
function x210302_OnComplete( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
  BeginEvent(sceneId)
	AddText(sceneId, x210302_g_MissionName);
	AddText(sceneId, x210302_g_MissionComplete);
	AddMoneyBonus( sceneId, x210302_g_MoneyBonus );
  for i, item in x210302_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num );
	end
  for i, item in x210302_g_RadioItemBonus do
		AddRadioItemBonus( sceneId, item.id, item.num );
	end
  EndEvent( )
  DispatchMissionContinueInfo(sceneId, selfId, targetId, x210302_g_ScriptId, x210302_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210302_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x210302_g_MissionId);
  num = GetMissionParam(sceneId, selfId, misIndex, 1);
  if num >= x210302_g_DemandKill[1].num then
  	return 1;
  end
	return 0;
end

--**********************************
--�ύ
--**********************************
function x210302_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x210302_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x210302_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		for i, item in x210302_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddMoney(sceneId,selfId,x210302_g_MoneyBonus );
			--�۳�������Ʒ
			ret = DelMission( sceneId, selfId, x210302_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId,selfId, x210302_g_MissionId )
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
function x210302_OnKillObject( sceneId, selfId, objdataId )
	local PlayerName = GetName(sceneId, selfId);
	--local misIndex = GetMissionIndexByID(sceneId, selfId, x210302_g_MissionId);
	--local nNum = GetMissionParam(sceneId, selfId, misIndex, 1);
	print("���:" .. PlayerName);
 	if objdataId == x210302_g_DemandKill[1].id then
		local misIndex = GetMissionIndexByID(sceneId, selfId, x210302_g_MissionId);
	  local num = GetMissionParam(sceneId, selfId, misIndex, 1);
	  if num < x210302_g_DemandKill[1].num then
		--��������ɱ�־����Ϊ1
		if num == 1 then
			SetMissionByIndex(sceneId, selfId, misIndex, 0, 1);
		end
		--���ô������+1
	  SetMissionByIndex(sceneId, selfId, misIndex, 1, num+1);
	  BeginEvent(sceneId);
	  local strText = format("��ɱ��%s%d/%d", x210302_g_DemandKill[1].name, num+1, x210302_g_DemandKill[1].num );
	  AddText(sceneId, strText);
	  EndEvent(sceneId);
		DispatchMissionTips(sceneId, selfId);
	end
end
 
end

--**********************************
--���������¼�
--**********************************
function x210302_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210302_OnItemChanged( sceneId, selfId, itemdataId )
end
