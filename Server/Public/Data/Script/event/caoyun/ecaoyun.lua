--MisDescBegin

x311010_g_MissionId = 4021

x311010_g_ScriptId = 311010
--MisDescEnd
-- ����ʹ�Ի�UI 	0
-- ����UI					1

--������ 
--1.��������ʹ�Ի�UI
--2.��������UI
--3.��������UI
--4.ѡ��"����"ʱ�۸�ı�
--5.ѡ��"ɱ��"ʱ�۸�ı�
--6.ѡ��"��ù�Ʊ"�󣬽������ʾ����һλ������1�����ʾ�ӵ��ˣ���ʾ��ȷ����Ϣ��
--																				����0�����ʾû�ӵ�����ʾ����
--7.

--�������
--��һλ�����(��)������ֵ  						��0λ		Price_Up
--�ڶ�λ�����(��)ɱ�۵�ֵ							��1λ		Price_Down
--����λ����������Ρ������׵�����			��2λ   ��*100+��*10+��
--����λ�����������CD�ϴ�ʹ��ʱ��			��3λ		
--����λ�����ɱ�۵�CD�ϴ�ʹ��ʱ��			��4λ		
--����λ����ǹ�Ʊ�ϵ����  						��5λ		Balance
--����λ������ĸ�����ʹ��1:��������������ʹ��2:�������ݣ�3�������4������Գ��������		��6λ TransNPC
--�ڰ�λ����ǻ����ϴη����¼���ʱ�䣬һ����ʱ���ڣ�ֻ��ִ��һ�λ��̵������¼���
--
--��Ʊ����Ʒ���40002109
--g_CashItem={{id=40002109,num=1}}
x311010_g_CashItem_id = 40002109
x311010_g_CashItem_count = 1

--**********************************
--������ں���
--**********************************
function x311010_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
  if IsMissionHaveDone(sceneId,selfId,x311010_g_MissionId) > 0 then
		return
	end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x311010_g_MissionId) > 0 then
--���������������Ϣ

--		BeginEvent(sceneId)
--		AddText(sceneId,g_MissionName)
--		AddText(sceneId,g_ContinueInfo)
--		for i, item in g_DemandItem do
--			AddItemDemand( sceneId, item.id, item.num )
--		end
--		EndEvent( )

--		bDone = CheckSubmit( sceneId, selfId )
--		DispatchMissionDemandInfo(sceneId,selfId,targetId,x311010_g_ScriptId,x311010_g_MissionId,bDone)


	--���������������
	elseif x311010_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
	end
end

--**********************************
--�о��¼�
--**********************************
function x311010_OnEnumerate( sceneId, selfId, targetId )
--��������ɹ��������

	  if IsMissionHaveDone(sceneId,selfId,x311010_g_MissionId) > 0 then
	   	return 
		end

    --����ѽӴ�����
    if IsHaveMission(sceneId,selfId,x311010_g_MissionId) > 0 then
--			AddNumText(sceneId,x311010_g_ScriptId,"�������");
--			AddNumText(sceneId,x311010_g_ScriptId,"�һ���Ʊ");
			CallScriptFunction( SCENE_SCRIPT_ID, "PlaySoundEffect", sceneId, selfId, 101 );
			
			local TransportNPCName=GetName(sceneId,targetId);
			local TransNPC = -1;

			if TransportNPCName == "������" then
				TransNPC = 1;
			elseif TransportNPCName == "½ʿ�" then
				TransNPC = 3;
			elseif TransportNPCName == "������" then
				TransNPC = 2;
			elseif TransportNPCName == "����" then
			
				local ItemNum = GetItemCount(sceneId,selfId,x311010_g_CashItem_id)
				if ItemNum < x311010_g_CashItem_count then
					BeginUICommand(sceneId)
						UICommand_AddInt(sceneId,5)
						UICommand_AddInt(sceneId,6)
					EndUICommand(sceneId)
					DispatchUICommand(sceneId,selfId, 0)
					return
				end
				
				--***
				misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)

				local Pre_Time = GetMissionParam(sceneId,selfId,misIndex,7)
				Pre_Time = 0
				local Now_Time = LuaFnGetCurrentTime()

				if Now_Time - Pre_Time > 10*60 then
					SetMissionByIndex(sceneId,selfId,misIndex,7,Now_Time)
					--���һ���¼�
					--������
					--****
				else
					BeginUICommand(sceneId)
						UICommand_AddInt(sceneId,5)
						UICommand_AddInt(sceneId,10)
					EndUICommand(sceneId)
					DispatchUICommand(sceneId,selfId, 0)
					return
				end
					--�Ƿ���ֳ������
				if 1 > 0 then
						TransNPC = 4;
						SetMissionByIndex(sceneId,selfId,misIndex,6,TransNPC)
						x311010_OnPopupBargainingUI(sceneId, selfId );
						return
				end
			
				--�Ƿ���ֽ���ɱ��cool down			
				if 1 < 0 then
					--��������ɱCD
					misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)
					SetMissionByIndex(sceneId,selfId,misIndex,4,0)
					
					BeginUICommand(sceneId)
						UICommand_AddInt(sceneId,5)
						UICommand_AddInt(sceneId,11)
						UICommand_AddInt(sceneId,0)
					EndUICommand(sceneId)
					DispatchUICommand(sceneId,selfId, 0)
					return
						
				end
			
				--�Ƿ���ֽ�������cool down
				if 1 < 0 then
					--������������CD
					misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)
					SetMissionByIndex(sceneId,selfId,misIndex,3,0)
					
					BeginUICommand(sceneId)
						UICommand_AddInt(sceneId,5)
						UICommand_AddInt(sceneId,11)
						UICommand_AddInt(sceneId,1)
					EndUICommand(sceneId)
					DispatchUICommand(sceneId,selfId, 0)
					return
						
				end
				
				BeginUICommand(sceneId)
					UICommand_AddInt(sceneId,5)
					UICommand_AddInt(sceneId,10)
				EndUICommand(sceneId)
				DispatchUICommand(sceneId,selfId, 0)
				return
				
			end
			
			if TransNPC == -1 then
				return
			end
			
			misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)
			SetMissionByIndex(sceneId,selfId,misIndex,6,TransNPC)
			SetMissionByIndex(sceneId,selfId,misIndex,0,0)
			SetMissionByIndex(sceneId,selfId,misIndex,1,0)
			
--			local Mission_Round =	GetMissionData(sceneId,selfId,2)
--	missiondata�е�2λ��¼�������˵Ļ���
--			PrintStr("���ͻ�����")
--			PrintNum(Mission_Round+1)
--			SetMissionData(sceneId,selfId,2,Mission_Round + 1)
--			PrintStr("������ϣ�")
			
			BeginUICommand(sceneId)
				UICommand_AddInt(sceneId,3)
				--client Ҫ��UI ����ʾ"�������"��"�һ���Ʊ"��2��button
				UICommand_AddInt(sceneId,targetId)
				--���Ұ�NPC��ID����client���Ա���һ�����á�
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 0)
			
    --���������������
    elseif x311010_CheckAccept(sceneId,selfId) > 0 then
    
    	local TransportNPCName=GetName(sceneId,targetId);
			local TransNPC = -1;
			
			if TransportNPCName == "������" then
				TransNPC = 1;
			elseif TransportNPCName == "½ʿ�" then
				TransNPC = 3;
			elseif TransportNPCName == "������" then
				TransNPC = 2;
			elseif TransportNPCName == "����" then
				TransNPC = 4;
			end
			
			if TransportNPCName == "����" then
				BeginUICommand(sceneId)
					UICommand_AddInt(sceneId,5)
					UICommand_AddInt(sceneId,10)
				EndUICommand(sceneId)
				DispatchUICommand(sceneId,selfId, 0)
				return
			end
			BeginUICommand(sceneId)
				UICommand_AddInt(sceneId,4)
				--client Ҫ��UI ����ʾ"��ù�Ʊ"���button
				UICommand_AddInt(sceneId,targetId)
				--���Ұ�NPC��ID����client���Ա���һ�����á�
				UICommand_AddInt(sceneId,TransNPC)
				

			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 0)
		else
			
			BeginUICommand(sceneId)
					UICommand_AddInt(sceneId,5)
					UICommand_AddInt(sceneId,10)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 0)
			return

    end
end 


--**********************************
--����������
--**********************************
function x311010_CheckAccept( sceneId, selfId )
	--��Ҫ1�����ܽ�
	if GetLevel( sceneId, selfId ) >= 1 then
		return 1
	else
		return 0
	end
end

function x311010_OnHaggleUp( sceneId, selfId )	--���������"����"��ִ�д˽ű�

--�ж����Ƿ������
--����ʱ����жϣ��ж���κ��ϴ�֮��ʱ��Ĳ��
--should add some code

--ȡ���������ֵ
	misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)
	Price_Up = GetMissionParam(sceneId,selfId,misIndex,0)
	Pre_Time = GetMissionParam(sceneId,selfId,misIndex,3)
	TransNpc = GetMissionParam(sceneId,selfId,misIndex,6)

	local Now_Time = LuaFnGetCurrentTime();
--��ǰʱ����ôȡ?
	if Now_Time - Pre_Time < 10*60 then
			BeginUICommand(sceneId)
				UICommand_AddInt(sceneId,5)
				UICommand_AddInt(sceneId,9)
				UICommand_AddInt(sceneId,Pre_Time + 10*60 - Now_Time)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 0)
			return
			
	end
	if TransNpc == 0 then
		return
	end

--������ı��Price_Up
--****
--should add some code

--������۸��Ϊ10000
	Price_Up = 10000
	--���ó��µ�ֵ

	SetMissionByIndex(sceneId,selfId,misIndex,0,Price_Up)	

--����Ҫ�洢��ʱ��ʱ��
--��ǰʱ����ôȡ?
	local New_Time = LuaFnGetCurrentTime();
	SetMissionByIndex(sceneId,selfId,misIndex,3,New_Time)	
--should add some code
	BeginEvent(sceneId)
		strText = "�����ɹ�����Ʒ����������Ϊ1���"			
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
	BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,4)
--������۸��ΪPrice_Up
			UICommand_AddInt(sceneId,misIndex)
--��ʱ��������ȴʱ���Ϊ10���ӣ�����֪client
	
--��2λ��ʾ��ǰ��ʣ��PriceUpʱ��
		Pre_Time = GetMissionParam(sceneId,selfId,misIndex,3)
		Now_Time = LuaFnGetCurrentTime();
		if Now_Time - Pre_Time < 10*60 then
			UICommand_AddInt(sceneId,Pre_Time + 10*60 - Now_Time)
		else
			UICommand_AddInt(sceneId,0)
		end
		--��3λ��ʾ��ǰ��ʣ��PriceDownʱ��
		Pre_Time = GetMissionParam(sceneId,selfId,misIndex,4)
		if Now_Time - Pre_Time < 15*60 then
			UICommand_AddInt(sceneId,Pre_Time + 15*60 - Now_Time)
		else
			UICommand_AddInt(sceneId,0)
		end
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1)
end


function x311010_OnHaggleDown( sceneId, selfId )	--���������"ɱ��"��ִ�д˽ű�

--�ж����Ƿ��ɱ��
--����ʱ����жϣ��ж���κ��ϴ�֮��ʱ��Ĳ��
--should add some code
--ȡ���������ֵ
	misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)
	Price_Down = GetMissionParam(sceneId,selfId,misIndex,1)
	Pre_Time = GetMissionParam(sceneId,selfId,misIndex,4)
	TransNpc = GetMissionParam(sceneId,selfId,misIndex,6)
	

--��ǰʱ����ôȡ?
	Now_Time = LuaFnGetCurrentTime();
	if Now_Time - Pre_Time < 15*60 then

			BeginUICommand(sceneId)
				UICommand_AddInt(sceneId,5)
				UICommand_AddInt(sceneId,9)
				UICommand_AddInt(sceneId,Pre_Time + 15*60 - Now_Time)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 0)
			return
			
	end
	
	if TransNpc == 0 then
		return
	end

--������ı��Price_Up
--*****
--should add some code

--ɱ�ۺ�۸��Ϊ7000
	Price_Down = 7000
	--���ó��µ�ֵ

	SetMissionByIndex(sceneId,selfId,misIndex,1,Price_Down)	
	


--����Ҫ�洢��ʱ��ʱ��
--��ǰʱ����ôȡ?
	local New_Time = LuaFnGetCurrentTime();
	SetMissionByIndex(sceneId,selfId,misIndex,4,New_Time)	
--should add some code

	BeginEvent(sceneId)
		strText = "ɱ�۳ɹ�����Ʒ����۽���Ϊ70����"			
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,5)
--ɱ�ۺ�۸��ΪPrice_Down
			UICommand_AddInt(sceneId,misIndex)
--			UICommand_AddInt(sceneId,15*60)
--��ʱ��������ȴʱ���Ϊ15���ӣ�����֪client
--��2λ��ʾ��ǰ��ʣ��PriceUpʱ��
		Pre_Time = GetMissionParam(sceneId,selfId,misIndex,3)
		Now_Time = LuaFnGetCurrentTime();
		if Now_Time - Pre_Time < 10*60 then
			UICommand_AddInt(sceneId,Pre_Time + 10*60 - Now_Time)
		else
			UICommand_AddInt(sceneId,0)
		end
		--��3λ��ʾ��ǰ��ʣ��PriceDownʱ��
		Pre_Time = GetMissionParam(sceneId,selfId,misIndex,4)
		if Now_Time - Pre_Time < 15*60 then
			UICommand_AddInt(sceneId,Pre_Time + 15*60 - Now_Time)
		else
			UICommand_AddInt(sceneId,0)
		end
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1)

end

--**********************************
--ɱ����������
--**********************************
function x311010_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x311010_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x311010_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--���������
--Ҳ���ǵ��ˡ���ù�Ʊ��
--**********************************
function x311010_OnAcceptMission( sceneId, selfId )

  --����ѽӴ�����
  if IsHaveMission(sceneId,selfId,x311010_g_MissionId) > 0 then
  		return
  end
  
	local ItemNum = GetItemCount(sceneId,selfId,x311010_g_CashItem_id)
	if ItemNum >= x311010_g_CashItem_count then
		--1,0,1�ǿ���x311010_OnKillObject,x311010_OnEnterArea,x311010_OnItemChanged�Ƿ�����
		ret = AddMission( sceneId,selfId, x311010_g_MissionId, x311010_g_ScriptId, 0, 0, 0 )
		misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)			--�õ���������к�
		SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0 (����������)
		SetMissionByIndex(sceneId,selfId,misIndex,1,0)
		SetMissionByIndex(sceneId,selfId,misIndex,2,0)
		SetMissionByIndex(sceneId,selfId,misIndex,3,0)
		SetMissionByIndex(sceneId,selfId,misIndex,4,0)
		--���㵽�׸ø�������Ǯ
		--should add some code
		local Balance = 20000;
		SetMissionByIndex(sceneId,selfId,misIndex,5,Balance)
		SetMissionByIndex(sceneId,selfId,misIndex,6,0)
		SetMissionByIndex(sceneId,selfId,misIndex,7,0)
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			BeginUICommand(sceneId)
				UICommand_AddInt(sceneId,5)
				UICommand_AddInt(sceneId,2)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 0)
		end
	elseif x311010_CheckAccept(sceneId,selfId) > 0 then
		--1,0,1�ǿ���x311010_OnKillObject,x311010_OnEnterArea,x311010_OnItemChanged�Ƿ�����
		BeginAddItem( sceneId )
		AddItem( sceneId, x311010_g_CashItem_id, x311010_g_CashItem_count )
		ret = EndAddItem( sceneId, selfId )
		CallScriptFunction( SCENE_SCRIPT_ID, "PlaySoundEffect", sceneId, selfId, 62 );
		if ret > 0 then 
		
			ret = AddMission( sceneId,selfId, x311010_g_MissionId, x311010_g_ScriptId, 0, 0, 0 )
			misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)			--�õ���������к�
			SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0 (����������)
			SetMissionByIndex(sceneId,selfId,misIndex,1,0)
			SetMissionByIndex(sceneId,selfId,misIndex,2,0)
			SetMissionByIndex(sceneId,selfId,misIndex,3,0)
			SetMissionByIndex(sceneId,selfId,misIndex,4,0)
			--���㵽�׸ø�������Ǯ
			--should add some code
			local Balance = 20000;
			SetMissionByIndex(sceneId,selfId,misIndex,5,Balance)
			SetMissionByIndex(sceneId,selfId,misIndex,6,0)
			SetMissionByIndex(sceneId,selfId,misIndex,7,0)
			
			if ret > 0 then
				AddItemListToHuman(sceneId,selfId)
				BeginUICommand(sceneId)
					UICommand_AddInt(sceneId,5)
					UICommand_AddInt(sceneId,2)
				EndUICommand(sceneId)
				DispatchUICommand(sceneId,selfId, 0)
			end
			
		else
		
			BeginEvent(sceneId)
				strText = "��������,�޷���������"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
		end
			
	end

end

--**********************************
--�������׽���
--����������ʹ������ˡ�������������ߵ�����̣�����������˽��׽���
--**********************************
function x311010_OnPopupBargainingUI( sceneId, selfId )

	  if IsMissionHaveDone(sceneId,selfId,x311010_g_MissionId) > 0 then
	   	return 
		end
	
    --����ѽӴ�����
    if IsHaveMission(sceneId,selfId,x311010_g_MissionId) > 0 then

  	  local ItemNum = GetItemCount(sceneId,selfId,x311010_g_CashItem_id)

			if ItemNum < x311010_g_CashItem_count then
				BeginUICommand(sceneId)
					UICommand_AddInt(sceneId,5)
					UICommand_AddInt(sceneId,6)
				EndUICommand(sceneId)
				DispatchUICommand(sceneId,selfId, 0)
				return
			end
			
    	local Mission_Round =	GetMissionData(sceneId,selfId,2)
    	if Mission_Round >= 20 then
    	
				BeginUICommand(sceneId)
					UICommand_AddInt(sceneId,5)
					UICommand_AddInt(sceneId,5)
				EndUICommand(sceneId)
				DispatchUICommand(sceneId,selfId, 0)
				return
				
    	end

			BeginUICommand(sceneId)
				--��1λ��ʾ���UI�������Ĳ���
				UICommand_AddInt(sceneId,3)
				
				misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)
				local TransNPC = GetMissionParam(sceneId,selfId,misIndex,6)
				
				if TransNPC == 0 or TransNPC == -1 then
					return
				end
				
				--��2λ��ʾ������������š�
				UICommand_AddInt(sceneId,misIndex)
				
--				if TransNPC == 1 then
--					UICommand_AddInt(sceneId,1)
--				elseif TransNPC == 2 then
--					UICommand_AddInt(sceneId,2)
--				elseif TransNPC == 3 then
--					UICommand_AddInt(sceneId,3)
--				elseif TransNPC == 4 then
--					UICommand_AddInt(sceneId,4)
					--���ﻹҪ��֤���ǲ����ܳ�������������UI
					--should add some code.
--				end
				--�����ⲽ���ܲ�����
				
				--���������Σ������׵ļ۸񵽵��Ƕ��٣��浽����ı�����
				--should add some code
				local Price_Buy,Price_Sell;
				
--				if GetTime() == 23 or GetTime() == 0 then
						Price_Buy = 8000;
						Price_Sell = Price_Buy * 120 / 100
--				else
--						Price_Buy = 10000;
--						Price_Sell = Price_Buy * 120 / 100
--				end
				 
				--��3λ��ʾ��ļ۸�
				UICommand_AddInt(sceneId,Price_Buy)
				--��4λ��ʾ���ļ۸�
				UICommand_AddInt(sceneId,Price_Sell)
				--��5λ��ʾ����ű���ID
				UICommand_AddInt(sceneId,x311010_g_ScriptId)
				--��6λ��ʾ���̲���������Ʒ
				UICommand_AddInt(sceneId,1)
				--��7λ��ʾ��ǰ��ʣ��PriceUpʱ��
				Pre_Time = GetMissionParam(sceneId,selfId,misIndex,3)
				Now_Time = LuaFnGetCurrentTime();
				if Now_Time - Pre_Time < 10*60 then
					UICommand_AddInt(sceneId,Pre_Time + 10*60 - Now_Time)
				else
					UICommand_AddInt(sceneId,0)
				end
--				PrintNum(Pre_Time + 10*60 - Now_Time);
				--��8λ��ʾ��ǰ��ʣ��PriceDownʱ��
				Pre_Time = GetMissionParam(sceneId,selfId,misIndex,4)
				if Now_Time - Pre_Time < 15*60 then
					UICommand_AddInt(sceneId,Pre_Time + 15*60 - Now_Time)
				else
					UICommand_AddInt(sceneId,0)
				end
--				PrintNum(Pre_Time + 15*60 - Now_Time);

--client Ҫ��ʾ�����׽��棬��������ĵ�һ�������������Ρ������׵�button����ʾɱ������button
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1)

		end

end

--**********************************
--���������ĳ���Σ�������
--**********************************
function x311010_OnTrade( sceneId, selfId, ManipulateID )

--�ж����Ƿ���Բ����ⲽ
--should add some code

--			local trade,cargo;

			misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)
			local TransNPC = GetMissionParam(sceneId,selfId,misIndex,6)
			local trade = 0;

--	 		trade = ManipulateID / 10;
--			cargo = mod(ManipulateID,10);
				
			if TransNPC == 0 or TransNPC == -1 then
				return
			end
			
--cargo
--1 ���β���
--2	��������
--3	���ײ���

--trade
--0	��
--1 ��
--������λ�ж��ˡ�

--�������NPC��Player���ϵ�������жϣ����Σ����������������������
			if ManipulateID == TransNPC then

					--��ʱ�ǹ�����
					--���ж����Player�Ƿ��Ѿ���������

					misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)
					Price_Down = GetMissionParam(sceneId,selfId,misIndex,1)
					Cargo			= GetMissionParam(sceneId,selfId,misIndex,2)
					local Cargo_Standard = 0;
					local purchased = 0;

					--���ж����Player�Ƿ��Ѿ���������
					if TransNPC == 1 then
						Cargo_Standard = 100;
						if Cargo >= Cargo_Standard then
							purchased = 1;							
						end
					elseif TransNPC == 2 then
						Cargo_Standard = 10;
						if mod(Cargo,100) >= Cargo_Standard then
							purchased = 1;
						end
					elseif TransNPC == 3 then
						Cargo_Standard = 1;
						if mod(Cargo,10) >= Cargo_Standard then
							purchased = 1;
						end
					end
						
					if purchased > 0 then
					
						BeginUICommand(sceneId)
							UICommand_AddInt(sceneId,5)
							UICommand_AddInt(sceneId,7)
							UICommand_AddInt(sceneId,ManipulateID)
						EndUICommand(sceneId)
						DispatchUICommand(sceneId,selfId, 0)
				
						return
					end
					--should add some code

					if Price_Down == 0 then
					--û�о���ɱ�ۣ�����Ҫ���¼��㵽�׸ö���Ǯ����
					--should add some code
--***					--������ĳ������ͬ�Ϳ���
						Price_Down = 8000;
						
						--ȡ�����
						--�������Ҹ�����
						BeginAddItem(sceneId)
						AddItem( sceneId,20101002, 1 )
						ret = EndAddItem(sceneId,selfId)
						if ret > 0 then
							AddItemListToHuman(sceneId,selfId)
						else
						--������Ʒû�мӳɹ�
							BeginEvent(sceneId)
								strText = "��������,û���õ�������Ʒ"
								AddText(sceneId,strText);
							EndEvent(sceneId)
							DispatchMissionTips(sceneId,selfId)
						end	
					end

					Balance = GetMissionParam(sceneId,selfId,misIndex,5)
					Balance = Balance - Price_Down;
					SetMissionByIndex(sceneId,selfId,misIndex,5,Balance)
					SetMissionByIndex(sceneId,selfId,misIndex,1,0)
					Cargo = Cargo + Cargo_Standard
					SetMissionByIndex(sceneId,selfId,misIndex,2,Cargo)
						BeginEvent(sceneId)
							if (ManipulateID ==1) then
								strText = "��ɹ�������һ����"
							elseif ( ManipulateID == 2) then
								strText = "��ɹ�������һ����"
							elseif( ManipulateID ==3) then
								strText = "��ɹ�������һ����"
							end
							AddText(sceneId,strText);
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,selfId)
					--�������ϵı��λ��Ϊ��������
					--����client��UI���ҵĻ����ڣ���ʾ��
					BeginUICommand(sceneId)
							UICommand_AddInt(sceneId,5)
							UICommand_AddInt(sceneId,11)
							UICommand_AddInt(sceneId,Price_Down)
					EndUICommand(sceneId)
					DispatchUICommand(sceneId,selfId, 0)
				else
					--if TransNPC == 2 or TransNPC == 3 or TransNPC ==4 then
					--��ʱ�ǳ�����
					misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)
					Price_Up = GetMissionParam(sceneId,selfId,misIndex,0)
					Cargo			= GetMissionParam(sceneId,selfId,misIndex,2)
	
					--���ж����Player�Ƿ��Ѿ���������
					--should add some code
					
					local Cargo_Standard=0
					local purchased = 0;
					
					--���ж����Player�Ƿ��Ѿ���������
					if ManipulateID == 1 then
						Cargo_Standard = 100
						if Cargo < Cargo_Standard then
							purchased = 1;
						end
					elseif ManipulateID == 2 then
						Cargo_Standard = 10
						if mod(Cargo,100) < Cargo_Standard then
							purchased = 1;
						end
					elseif ManipulateID == 3 then
						Cargo_Standard = 1
						if mod(Cargo,10) < Cargo_Standard then
							purchased = 1;
						end
					end
					
					if purchased > 0 then
						BeginUICommand(sceneId)
							UICommand_AddInt(sceneId,5)
							UICommand_AddInt(sceneId,8)
							UICommand_AddInt(sceneId,ManipulateID)
						EndUICommand(sceneId)
						DispatchUICommand(sceneId,selfId, 0)
						
						return
					end
					
					if Price_Up == 0 then
					--û�о�������������Ҫ���¼��㵽�׸ö���Ǯ����
					--should add some code
--***					--������ĳ������ͬ�Ϳ���
						Price_Up = 9600;
					end
					Balance = GetMissionParam(sceneId,selfId,misIndex,5)
					INP = 10000;
					--***INPҪ����ʱ��仯
					Balance = Balance + Price_Up + INP * 10 * mod( GetMissionData(sceneId,selfId,2) , 10 ) / 100;
					SetMissionByIndex(sceneId,selfId,misIndex,5,Balance)
					SetMissionByIndex(sceneId,selfId,misIndex,0,0)
					--�������ϵı��Ϊ��Ϊ�����˻���

					Cargo = Cargo - Cargo_Standard

					SetMissionByIndex(sceneId,selfId,misIndex,2,Cargo)
					trade = 1
				end
--			elseif ManipulateID == 2 then
--should add some code
--			elseif ManipulateID == 3 then
--should add some code
--			elseif ManipulateID == 4 then
--should add some code
--		end
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,5)
			UICommand_AddInt(sceneId,11)
			UICommand_AddInt(sceneId,Price_Up)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 0)
		
--��ȡ������������۸�������ִ�в�����
--�����ǽ����⻷������Ҫ�ı�
		if trade == 1 then
--����+1
			misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)
			local Mission_Round =	GetMissionData(sceneId,selfId,2)
--missiondata�е�2λ��¼�������˵Ļ���
			SetMissionData(sceneId,selfId,2,Mission_Round + 1)
			BeginEvent(sceneId)
				if (ManipulateID == 1) then
					strText = "��ɹ�������һ����"
				elseif ( ManipulateID == 2) then
					strText = "��ɹ�������һ����"
				elseif ( ManipulateID ==3 ) then
					strText = "��ɹ�������һ����"				
				end
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			BeginEvent(sceneId)
				strText = format("��������Ϊ��%d��", (Mission_Round + 1))
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
--������������sell_price��buy_price�������
--�����Ȳ����㡣

		end
	
end

--**********************************
--�һ���Ʊ
--**********************************
function x311010_OnRedeemUI( sceneId, selfId )

	  if IsMissionHaveDone(sceneId,selfId,x311010_g_MissionId) > 0 then
	   	return 
		end

    --����ѽӴ�����
    if IsHaveMission(sceneId,selfId,x311010_g_MissionId) > 0 then
				
				local ItemNum = GetItemCount(sceneId,selfId,x311010_g_CashItem_id)
				
				if ItemNum < x311010_g_CashItem_count then
					BeginUICommand(sceneId)
						UICommand_AddInt(sceneId,5)
						UICommand_AddInt(sceneId,4)
					EndUICommand(sceneId)
					DispatchUICommand(sceneId,selfId, 0)
					return
				end
				
			--���������񣬲����ݹ�Ʊ�ϵ������������ؽ���
			--Ǯ�;����
			--���ܽ������������й�ϵ
			GetMissionData(sceneId,selfId,2)
			
			BeginUICommand(sceneId)
				UICommand_AddInt(sceneId,5)
				UICommand_AddInt(sceneId,3)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 0)
			
--		���㽱��
			misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)
			Balance = GetMissionParam(sceneId,selfId,misIndex,5)
			TransNPC = GetMissionParam(sceneId,selfId,misIndex,6)
			
			if TransNPC == 4 then
				return
			end
			
			if	Balance > 20000	then
				AddMoney(sceneId,selfId,(Balance-20000 ));
				BeginEvent(sceneId)	
					strText = format("������������еõ�%dͭ�ҵ����˻��졣", (Balance-20000 ) )
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
			else
				BeginEvent(sceneId)	
					strText = format("�㾭Ӫ���ƣ������������û�л�û��졣" )
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
			end
			--�۳���Ʊ

			DelItem( sceneId, selfId, x311010_g_CashItem_id, x311010_g_CashItem_count )
			CallScriptFunction( SCENE_SCRIPT_ID, "PlaySoundEffect", sceneId, selfId, 66 );
			ret = DelMission( sceneId, selfId, x311010_g_MissionId )
			if ret > 0 then
				SetMissionData(sceneId,selfId,2,0)
			end
						
		end

end


--**********************************
--�ж�Ӧ�ý������Ĵ�ѹ�г���cool down
--**********************************
function x311010_OnFinishHaggleDown( sceneId, selfId )

	misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)
	SetMissionByIndex(sceneId,selfId,misIndex,4,0)
			
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,5)
		UICommand_AddInt(sceneId,14)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 0)
	return
end

--**********************************
--�ж�Ӧ�ý������ĺ�̧��۵�cool down
--**********************************
function x311010_OnFinishHaggleUp( sceneId, selfId )

	--������������CD
	misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)
	SetMissionByIndex(sceneId,selfId,misIndex,3,0)
		
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,5)
		UICommand_AddInt(sceneId,13)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 0)
	return
end

--**********************************
--����
--**********************************
function x311010_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    res = DelMission( sceneId, selfId, x311010_g_MissionId )
	if res > 0 then
		--��ȥ������Ʒ
		DelItem( sceneId, selfId, x311010_g_CashItem_id, x311010_g_CashItem_count )
	end
	SetMissionData(sceneId,selfId,2,0)
end
