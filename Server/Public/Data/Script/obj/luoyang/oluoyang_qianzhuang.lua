--Ǯׯ�ű�

--�ű���
x000076_g_scriptId = 000076

--��ӵ�е��¼�ID�б�
--g_eventList={211105,211106,211108}	

--����4���洢�仨�ѵ�Ǯ
--Ĭ����20�����ӣ���ʱ������һ����Ҫ����50000��5��ң�
x000076_g_Box	 = {{Capacity=20,Money=50000},
			{Capacity=40,Money=100000},
			{Capacity=60,Money=200000},
			{Capacity=80,Money=400000}
	    }

x000076_g_BoxNum = 0

--npc���Ĭ�Ϻ���������������ʾ�Ի����ֺ͹��ܰ�ť
function x000076_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		--��Ӵ����н���İ�ť
		AddNumText(sceneId, 7, "������")
		--�õ���ǰ���еĴ洢����
		local CurrentRentIndex = GetBankRentIndex(sceneId, selfId)
		--���Ҵ洢�����
		x000076_g_BoxNum = x000076_FindBoxNum( sceneId, selfId,targetId,CurrentRentIndex )
		if x000076_g_BoxNum ~= 0 then
			AddNumText(sceneId, x000076_g_Box[x000076_g_BoxNum].Capacity, "�����µĴ�����")
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x000076_OnEventRequest( sceneId, selfId, targetId, eventId )
		--������
		if eventId == 7 then
			BankBegin(sceneId, selfId,targetId)	
		--�����µĴ�����
		elseif eventId == 8 then
			--�õ���ǰ���еĴ洢����
			local CurrentRentIndex = GetBankRentIndex(sceneId, selfId)
			--���Ҵ洢�����
			x000076_g_BoxNum = x000076_FindBoxNum( sceneId, selfId,targetId,CurrentRentIndex )

			if GetMoney( sceneId, selfId) >= x000076_g_Box[x000076_g_BoxNum].Money then
				CostMoney(sceneId,selfId,x000076_g_Box[x000076_g_BoxNum].Money)
				--���Ӵ洢�䲢��ʾ
				x000076_EnableBankBox( sceneId, selfId,targetId,x000076_g_BoxNum )
				--�����н���
	  			BankBegin(sceneId, selfId,targetId)	
			else
				BeginEvent(sceneId)
	  				AddText(sceneId,"��Ľ�Ǯ����");
	  			EndEvent(sceneId)
	  			DispatchMissionTips(sceneId,selfId)
			end
		else
			--�õ���ǰ���еĴ洢����
			local CurrentRentIndex = GetBankRentIndex(sceneId, selfId)
			--���Ҵ洢�����
			x000076_g_BoxNum = x000076_FindBoxNum( sceneId, selfId,targetId,CurrentRentIndex )
			--��Ҫ����Ǯ����ʾ
			x000076_g_NeedMoney = x000076_MoneyChange( sceneId, selfId,targetId,x000076_g_Box[x000076_g_BoxNum].Money)
			BeginUICommand(sceneId)
				UICommand_AddInt(sceneId,x000076_g_scriptId);
				UICommand_AddInt(sceneId,targetId);
				UICommand_AddInt(sceneId,8)
				UICommand_AddString(sceneId,"OnEventRequest");
				UICommand_AddString(sceneId,"���Ҫ�������䣬����Ҫ����"..x000076_g_NeedMoney..".");
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 24)		--���������ѯ�ʴ������������д24
		end
end

--�Զ��庯����������ţ��򿪵���Ÿ��洢��
function x000076_EnableBankBox( sceneId, selfId,targetId,Num )
	--��Ҫ����Ǯ����ʾ
	x000076_g_NeedMoney = x000076_MoneyChange( sceneId, selfId,targetId,x000076_g_Box[Num].Money)
	EnableBankRentIndex(sceneId, selfId, Num+1)
	BeginEvent(sceneId)
		AddText(sceneId,"�㻨��"..x000076_g_NeedMoney.."���õ�һ��������");
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--�Զ��庯������������,�������
function x000076_FindBoxNum( sceneId, selfId,targetId,Capacity )
	--�õ���������
	for i, findBox in x000076_g_Box do
		if findBox.Capacity == Capacity then
			return i
		end
	end
	return 0
end

--�Զ��庯��,��������Money,����xx��xx��xxͭ,���ﲻ����������0�����
function x000076_MoneyChange( sceneId, selfId,targetId,Money )
		x000076_g_Money = Money
		x000076_g_Bronze = mod(x000076_g_Money,100)
		x000076_g_Silver = (mod(x000076_g_Money,10000) - x000076_g_Bronze)/100
		x000076_g_Gold = (x000076_g_Money - x000076_g_Bronze - x000076_g_Silver * 100)/10000
		if x000076_g_Gold ~= 0 and x000076_g_Silver ~= 0 and x000076_g_Bronze ~= 0 then
			x000076_g_MoneyMessage = x000076_g_Gold.."#-02"..x000076_g_Silver.."#-03"..x000076_g_Bronze.."#-04"
		elseif x000076_g_Gold ~= 0 and x000076_g_Silver ~= 0 and x000076_g_Bronze == 0 then
			x000076_g_MoneyMessage = x000076_g_Gold.."#-02"..x000076_g_Silver.."#-03"
		elseif x000076_g_Gold ~= 0 and x000076_g_Silver == 0 and x000076_g_Bronze ~= 0 then
			x000076_g_MoneyMessage = x000076_g_Gold.."#-02"..x000076_g_Bronze.."#-04"
		elseif x000076_g_Gold ~= 0 and x000076_g_Silver == 0 and x000076_g_Bronze == 0 then
			x000076_g_MoneyMessage = x000076_g_Gold.."#-02"
		elseif x000076_g_Gold == 0 and x000076_g_Silver ~= 0 and x000076_g_Bronze ~= 0 then
			x000076_g_MoneyMessage = x000076_g_Silver.."#-03"..x000076_g_Bronze.."#-04"
		elseif x000076_g_Gold == 0 and x000076_g_Silver ~= 0 and x000076_g_Bronze == 0 then
			x000076_g_MoneyMessage = x000076_g_Silver.."#-03"
		elseif x000076_g_Gold == 0 and x000076_g_Silver == 0 and x000076_g_Bronze ~= 0 then
			x000076_g_MoneyMessage = x000076_g_Bronze.."#-04"
		else
			x000076_g_MoneyMessage = "#-04"
		end
		return x000076_g_MoneyMessage
end
