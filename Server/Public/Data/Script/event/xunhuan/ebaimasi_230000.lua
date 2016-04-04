--�������������¼��ű�
--����
--�ű���
x230000_g_ScriptId = 230000

--�����
x230000_g_MissionId = 4011

--����Ŀ��npc
x230000_g_Name	="�����ʦ"

--�洢�����
x230000_g_rand = 0					--������1λ

--�����ı�����
x230000_g_MissionName="����������"
x230000_g_MissionInfo="�����ӷ�"  --��������
x230000_g_MissionTarget="������������"		--����Ŀ��
x230000_g_ContinueInfo="����������ô?"		--δ��������npc�Ի�
x230000_g_MissionComplete="̫лл����"					--�������npc˵�Ļ�

--������


--**********************************
--������ں���
--**********************************
function x230000_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--�������Ѿ����˰���������
	if IsHaveMission(sceneId,selfId,x230000_g_MissionId) > 0 then
		x230000_HaveMissionToDo( sceneId, selfId, targetId )
	else
		--���δ�Ӱ���������
		x230000_NoMissionToDo( sceneId, selfId, targetId )
	end
end

--**********************************
--������  ��  ���������Ĵ���
--**********************************
function x230000_HaveMissionToDo( sceneId, selfId,targetId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x230000_g_MissionId)
	x230000_g_rand = GetMissionParam(sceneId,selfId,misIndex,1)
	x230000_g_MissionCondition = GetMissionParam(sceneId,selfId,misIndex,0)
	if GetName(sceneId,targetId) == x230000_g_Name then			--�жϸ�npc�Ƿ��ǽ������npc
		if	CallScriptFunction( x230000_g_rand, "CheckSubmit",sceneId, selfId, targetId ) == 1 then
			--��Ϊ��������ű���x230000_g_rand�ᱻ�ĳɱ����������������Ҫ����ȡ��һ��
			x230000_g_rand = GetMissionParam(sceneId,selfId,misIndex,1)
			CallScriptFunction( x230000_g_rand, "OnDefaultEvent",sceneId, selfId, targetId )
		else
			--��ʾ�Ի���
			x230000_AcceptDialog(sceneId, selfId,x230000_g_rand,"  ʩ����ôû����ɶ�ƶɮ�ĳ�ŵ�ͻ����ˣ� ����һ���Զ����ŵ��ˣ�Ӧ�ò�����������ƶɮ�ɡ�\n",targetId)
		end
	end
end

--**********************************
--������  û��  ���������Ĵ���
--**********************************
function x230000_NoMissionToDo( sceneId, selfId, targetId )
	--����Ƿ������Ѿ��ﵽ20��,�������,���ܽ�
	if GetMissionCount(sceneId,selfId) == 20 then
		BeginEvent(sceneId)
			strText = "�޷����ܸ�������"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	--���û����������
	--���������������
	if x230000_CheckAccept(sceneId,selfId) > 0 then
		--�õ���ҵȼ�
		x230000_g_Level = GetLevel(sceneId,selfId)
		if x230000_g_Level >= 10  then	--and x230000_g_Level <20
		--�õ�һ�������
		--randomseed(clock())
		x230000_g_rand = random(230001,230012)
		CallScriptFunction( x230000_g_rand, "OnAccept",sceneId, selfId, targetId )
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x230000_OnEnumerate( sceneId, selfId, targetId )
	--����ѽ�����,���г�����
	if IsHaveMission(sceneId,selfId,x230000_g_MissionId) > 0 then
		misIndex = GetMissionIndexByID(sceneId,selfId,x230000_g_MissionId)
		x230000_g_rand = GetMissionParam(sceneId,selfId,misIndex,1)
		x230000_g_MissionCondition = GetMissionParam(sceneId,selfId,misIndex,0)		--�õ������Ƿ���ɣ������ɣ����ڽ��ŵ��˴�������ʾ����δ�������ʾ
		if GetName(sceneId,targetId) == x230000_g_Name then		--����Ƿ������npc
			AddNumText(sceneId,x230000_g_ScriptId,x230000_g_MissionName)
		end
    --���û����������������������,���г�����
    elseif x230000_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) == x230000_g_Name then		--����Ƿ������npc
			AddNumText(sceneId,x230000_g_ScriptId,x230000_g_MissionName)
		end
    end
end

--**********************************
--����������
--**********************************
function x230000_CheckAccept( sceneId, selfId )
	--��Ҫ10�����ܽ�
	if GetLevel( sceneId, selfId ) >= 10 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x230000_OnAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x230000_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x230000_g_MissionId )
	--������ͻ�����,Ҫ��������Ʒɾ��
	--if IsHaveMission(sceneId,selfId,4012) > 0 then
	--	DelMission( sceneId, selfId, 4012 )
	--elseif IsHaveMission(sceneId,selfId,4013) > 0 then
	--	DelMission( sceneId, selfId, 4013 )
	--end
end

--**********************************
--����
--**********************************
function x230000_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x230000_g_MissionName)
		AddText(sceneId,x230000_g_MissionComplete)
		--AddMoneyBonus( sceneId, g_MoneyBonus )
		--for i, item in g_ItemBonus do
		--	AddItemBonus( sceneId, item.id, item.num )
		--end
		--for i, item in g_RadioItemBonus do
		--	AddRadioItemBonus( sceneId, item.id, item.num )
		--end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x230000_g_ScriptId,x230000_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x230000_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x230000_g_MissionId)
    x230000_g_rand = GetMissionParam(sceneId,selfId,misIndex,1)		--�õ����������к�
    
		--�������������
	if x230000_g_rand == 1 then
		num1 = GetMissionParam(sceneId,selfId,misIndex,0)
		if num1 ==1 then
			return 1
		else
		return 0
		end

		--�����Ѱ������
	elseif x230000_g_rand >= 2 and x230000_g_rand <= 9 then
		itemCount = GetItemCount( sceneId, selfId, g_SubMission[x230000_g_rand].id )
		if itemCount < g_SubMission[x230000_g_rand].num then
			return 0
		else
			return 1
		end

		--�����ɱ������
	elseif x230000_g_rand == 10 then
		x230000_g_MissionCondition = GetMissionParam(sceneId,selfId,misIndex,0)
		if x230000_g_MissionCondition ==1 then
			return 1
		else
		return 0
		end
	end
end

--**********************************
--�ύ
--**********************************
function x230000_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x230000_g_MissionId)
	x230000_g_rand = GetMissionParam(sceneId,selfId,misIndex,1)
	x230000_g_MissionRound = GetMissionData(sceneId,selfId,10)

	--���㽱����Ǯ������
	if mod(x230000_g_MissionRound,10) == 0 then
		x230000_g_Money = 100 * 15
	else
		x230000_g_Money = 100 * mod(x230000_g_MissionRound,10)
	end
	--************��������****************
	if x230000_g_rand == 1 then
		DelMission( sceneId, selfId, x230000_g_MissionId )
		MissionCom( sceneId,selfId, x230000_g_MissionId )
				
		--����Ǯ����
		AddMoney(sceneId,selfId,x230000_g_Money)
		--������ֵ����
		AddExp( sceneId,selfId,x230000_g_Money)	
		Msg2Player( sceneId,selfId,"��õ�"..x230000_g_Money.."���",MSG2PLAYER_PARA)
		Msg2Player( sceneId,selfId,"��õ�"..x230000_g_Money.."����",MSG2PLAYER_PARA)
		--��ʾ�Ի���
		BeginEvent(sceneId)
			AddText(sceneId,"��ϲ����������񣬸���"..x230000_g_Money.."��Һ�"..x230000_g_Money.."�㾭��")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
	--************Ѱ������****************
	elseif x230000_g_rand >= 2 and x230000_g_rand <= 9 then
		ret = DelMission( sceneId, selfId, x230000_g_MissionId )
		if ret > 0 then
			MissionCom( sceneId,selfId, x230000_g_MissionId )
			--�۳�������Ʒ
			DelItem( sceneId, selfId, g_SubMission[x230000_g_rand].id, g_SubMission[x230000_g_rand].num )
			--��ʾ�Ի���
			AddMoney(sceneId,selfId,x230000_g_Money)
			AddExp( sceneId,selfId,x230000_g_Money)	
			Msg2Player( sceneId,selfId,"��õ�"..x230000_g_Money.."���",MSG2PLAYER_PARA)
			Msg2Player( sceneId,selfId,"��õ�"..x230000_g_Money.."����",MSG2PLAYER_PARA)
			BeginEvent(sceneId)
				AddText(sceneId,"��ϲ����������񣬸���"..x230000_g_Money.."��Һ�"..x230000_g_Money.."�㾭��")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	
	--************ɱ������****************
	elseif x230000_g_rand == 10 then
		ret = DelMission( sceneId, selfId, x230000_g_MissionId )
		if ret > 0 then
			MissionCom( sceneId,selfId, x230000_g_MissionId )
			AddMoney(sceneId,selfId,x230000_g_Money)
			AddExp( sceneId,selfId,x230000_g_Money)	
			Msg2Player( sceneId,selfId,"��õ�"..x230000_g_Money.."���",MSG2PLAYER_PARA)
			Msg2Player( sceneId,selfId,"��õ�"..x230000_g_Money.."����",MSG2PLAYER_PARA)
			BeginEvent(sceneId)
				AddText(sceneId,"��ϲ����������񣬸���"..x230000_g_Money.."��Һ�"..x230000_g_Money.."�㾭��")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x230000_OnKillObject( sceneId, selfId, objdataId )

end

--**********************************
--���������¼�
--**********************************
function x230000_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x230000_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--���������ʾ�Ľ���
--**********************************
function x230000_AcceptDialog(sceneId, selfId,x230000_g_rand,g_Dialog,targetId)
	BeginEvent(sceneId)
		AddText(sceneId,g_Dialog)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--���������ʾ�Ľ���
--**********************************
function x230000_SubmitDialog(sceneId, selfId,x230000_g_rand)

end

--**********************************
--�����͵�����ʾ�Ľ���
--**********************************
function x230000_SubmitDialog(sceneId, selfId,x230000_g_rand)

end

function x230000_DisplayMissionTips(sceneId,selfId,g_MissionTip)
	BeginEvent(sceneId)
		strText = g_MissionTip
		AddText(sceneId,strText)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--ȡ�ñ��¼���MissionId������obj�ļ��жԻ��龰���ж�
--**********************************
function x230000_GetEventMissionId(sceneId, selfId)
	return x230000_g_MissionId
end
