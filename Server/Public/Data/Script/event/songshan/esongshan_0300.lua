--ɱ������

--�׶

--MisDescBegin

--�ű���

x210300_g_ScriptId = 210300



--��һ�������ID

--g_MissionIdPre =



--�����

x210300_g_MissionId = 460



--����Ŀ��npc

x210300_g_Name	="���" 



--�������

x210300_g_MissionKind = 14



--����ȼ�

x210300_g_MissionLevel = 52



--�Ƿ��Ǿ�Ӣ����

x210300_g_IfMissionElite = 0



--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������

--�����Ƿ��Ѿ����

x210300_g_IsMissionOkFail = 0		--�����ĵ�0λ



x210300_g_DemandKill = {{id=1585,num=10}};



--�����Ƕ�̬**************************************************************



--�����ı�����

x210300_g_MissionName="�׶"

x210300_g_MissionTarget="ɱ��10���׶"		--����Ŀ��
x210300_g_MissionInfo="�����㣬ȥ����ɱ10���׶"

x210300_g_ContinueInfo="�汿�������ȥ��"		--δ��������npc�Ի�

x210300_g_MissionComplete="�ţ����������������"					--�������npc˵���Ļ�



--������

x210300_g_MoneyBonus=12000

x210300_g_ItemBonus={{id=30002001,num=1},{id=10412001,num=1}}

x210300_g_RadioItemBonus={{id=10100001,num=1},{id=10210001,num=1}}


--������Ҫɱ���Ĺ�
x210300_g_DemandTrueKill = {{name="�׶",num=10}};		--������1λ


--MisDescEnd




--**********************************

--������ں���

--**********************************

function x210300_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�

	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��

    --if IsMissionHaveDone(sceneId,selfId,x210300_g_MissionId) > 0 then

	--	return

	--end

	--����ѽӴ�����

	if IsHaveMission(sceneId, selfId, x210300_g_MissionId) > 0 then

		BeginEvent(sceneId)
			AddText(sceneId,x210300_g_MissionName)
			AddText(sceneId,x210300_g_ContinueInfo)
			AddMoneyBonus( sceneId, x210300_g_MoneyBonus )
		EndEvent( )
		bDone = x210300_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x210300_g_ScriptId,x210300_g_MissionId,bDone)	


	--���������������

	elseif x210300_CheckAccept(sceneId, selfId) > 0 then

		--�����������ʱ��ʾ����Ϣ

		local PlayerName = GetName(sceneId, selfId);

		local strText = format(x210300_g_MissionInfo, PlayerName, x210300_g_DemandKill[1].num, x210300_g_MissionName);

		BeginEvent(sceneId);

		AddText(sceneId,x210300_g_MissionName);

		AddText(sceneId, strText);

		AddText(sceneId, "#{M_MUBIAO}");

		AddText(sceneId, x210300_g_MissionTarget);

		AddMoneyBonus( sceneId, x210300_g_MoneyBonus );

		for i, item in x210300_g_ItemBonus do

					AddItemBonus( sceneId, item.id, item.num );

		end

		for i, item in x210300_g_RadioItemBonus do

					AddRadioItemBonus( sceneId, item.id, item.num );

		end

		EndEvent();

		DispatchMissionInfo(sceneId, selfId, targetId, x210300_g_ScriptId, x210300_g_MissionId);

	end

end



--**********************************

--�о��¼�

--**********************************

function x210300_OnEnumerate( sceneId, selfId, targetId )

  --��������ɹ��������

  if IsMissionHaveDone(sceneId, selfId, x210300_g_MissionId) > 0 then

	return

  end

  --����ѽӴ�����

  if IsHaveMission(sceneId, selfId, x210300_g_MissionId) > 0 then

		AddNumText(sceneId,x210300_g_ScriptId,x210300_g_MissionName);

    --���������������

  elseif x210300_CheckAccept(sceneId, selfId) > 0 then

		AddNumText(sceneId,x210300_g_ScriptId,x210300_g_MissionName);

  end

end



--**********************************

--����������

--**********************************

function x210300_CheckAccept( sceneId, selfId )

	--��Ҫ15�����ܽ�

	if GetLevel( sceneId, selfId ) >= 15 then

		return 1

	else

		return 0

	end

end



--**********************************

--����

--**********************************

function x210300_OnAccept( sceneId, selfId )

	--������������б�


	AddMission( sceneId, selfId, x210300_g_MissionId, x210300_g_ScriptId, 1, 0, 0 );		--�������

	misIndex = GetMissionIndexByID(sceneId, selfId, x210300_g_MissionId);			--�õ���������к�

	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0);						--�������кŰ���������ĵ�0λ��0

	SetMissionByIndex(sceneId, selfId, misIndex, 1, 0);						--�������кŰ���������ĵ�1λ��0

end



--**********************************

--����

--**********************************

function x210300_OnAbandon( sceneId, selfId )

	--ɾ����������б��ж�Ӧ������

    DelMission( sceneId, selfId, x210300_g_MissionId )

end



--**********************************

--����

--**********************************

function x210300_OnContinue( sceneId, selfId, targetId )

	--�ύ����ʱ��˵����Ϣ

 	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210300_g_MissionName)
		AddText(sceneId,x210300_g_MissionComplete)
		AddMoneyBonus( sceneId, x210300_g_MoneyBonus )
		AddText(sceneId,"�㽫�õ���")
		for i, item in x210300_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num );
		end
		for i, item in x210300_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num );
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210300_g_ScriptId,x210300_g_MissionId)

end



--**********************************

--�������

--**********************************

function x210300_OnComplete( sceneId, selfId, targetId )

	--�ύ����ʱ��˵����Ϣ

  BeginEvent(sceneId)

	AddText(sceneId, x210300_g_MissionName);

	AddText(sceneId, x210300_g_MissionComplete);

	AddMoneyBonus( sceneId, x210300_g_MoneyBonus );

  for i, item in x210300_g_ItemBonus do

		AddItemBonus( sceneId, item.id, item.num );

	end

  for i, item in x210300_g_RadioItemBonus do

		AddRadioItemBonus( sceneId, item.id, item.num );

	end

  EndEvent( )

  DispatchMissionContinueInfo(sceneId, selfId, targetId, x210300_g_ScriptId,x210300_g_MissionId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x210300_CheckSubmit( sceneId, selfId )

	misIndex = GetMissionIndexByID(sceneId,selfId,x210300_g_MissionId);

	num = GetMissionParam(sceneId, selfId, misIndex, 1);

	if num >= x210300_g_DemandTrueKill[1].num then

	  	return 1;

	end

	return 0;

end



--**********************************

--�ύ

--**********************************

function x210300_OnSubmit( sceneId, selfId, targetId, selectRadioId)

	if x210300_CheckSubmit( sceneId, selfId, selectRadioId ) then

  	BeginAddItem(sceneId)

		for i, item in x210300_g_ItemBonus do

			AddItem( sceneId,item.id, item.num )

		end

		for i, item in x210300_g_RadioItemBonus do

			if item.id == selectRadioId then

				AddItem( sceneId,item.id, item.num )

			end

		end

		ret = EndAddItem(sceneId,selfId)

		--���������

		if ret > 0 then

			AddMoney(sceneId,selfId,x210300_g_MoneyBonus );

			--�۳�������Ʒ

			ret = DelMission( sceneId, selfId, x210300_g_MissionId )

			if ret > 0 then

				MissionCom( sceneId,selfId, x210300_g_MissionId )

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

function x210300_OnKillObject( sceneId, selfId, objdataId ,objId)

 if GetName(sceneId,objId) == x210300_g_DemandTrueKill[1].name	  then

		misIndex = GetMissionIndexByID(sceneId,selfId,x210300_g_MissionId)

		num = GetMissionParam(sceneId,selfId,misIndex,1)

	  if num < x210300_g_DemandTrueKill[1].num then

		--��������ɱ�־����Ϊ1

		if num == x210300_g_DemandTrueKill[1].num - 1 then

			SetMissionByIndex(sceneId,selfId,misIndex,0,1)

		end

		--���ô������+1

	    SetMissionByIndex(sceneId,selfId,misIndex,1,num+1)

	  	BeginEvent(sceneId)

			strText = format("��ɱ���׶%d/10", GetMissionParam(sceneId,selfId,misIndex,1) )

			AddText(sceneId,strText);

	  	EndEvent(sceneId)

	  	DispatchMissionTips(sceneId,selfId)

	  end

	end

end



--**********************************

--���������¼�

--**********************************

function x210300_OnEnterArea( sceneId, selfId, zoneId )

end



--**********************************

--���߸ı�

--**********************************

function x210300_OnItemChanged( sceneId, selfId, itemdataId )

end

