--��������
--�ع��ں�1

--�ű���
x200601_g_scriptId =002019

x200601_g_missionIdPre = 12	--��һ�������ID

--�����
x200601_g_missionId = 13

--Ŀ��NPC�Ӱ�ʱ
x200601_g_name	="�Ӱ�ʱ" 

--������
local  PlayerName=""
x200601_g_missionName="�ع��ں�1"
x200601_g_missionText_0="�ȿ�"
--������ë���ַ��ˡ������ܰ���ȥ������ҽ�Ӱ�ʱ����ȡһ��ҩ��"
x200601_g_missionText_1="�Ӱ�ʱ��������ҩ�ꡣ"
x200601_g_missionText_2="��������������ȡҩ����"
--�������䵱�꺦��̫�࣬�����ز��ڴ�Ҳ�����տ�����������������Ϊ��ȡҩ��Ҳ�����������þ�����"
x200601_g_MoneyBonus=100
x200601_g_ItemBonus={{id=10105001,num=1}}

--**********************************
--������ں���
--**********************************
function x200601_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x200601_g_missionId) > 0 ) then
    	return
		elseif( IsHaveMission(sceneId,selfId,x200601_g_missionId) > 0)  then
			--�����NPC�����������
		if GetName(sceneId,targetId) == x200601_g_name then
					x200601_OnContinue( sceneId, selfId, targetId )
			end
    --���������������
    elseif x200601_CheckAccept(sceneId,selfId) > 0 then
   		--�����NPC�����񷢲���
		if GetName(sceneId,targetId)~= x200601_g_name then
				--�����������ʱ��ʾ����Ϣ
				BeginEvent(sceneId)
					AddText(sceneId,x200601_g_missionName)
					AddText(sceneId,x200601_g_missionText_0)
					AddText(sceneId,"[[����Ŀ��]]")
					AddText(sceneId,x200601_g_missionText_1)
					AddMoneyBonus( sceneId, x200601_g_MoneyBonus )
					for i, item in x200601_g_ItemBonus do
						AddItemBonus( sceneId, item.id, item.num )
					end
				EndEvent( )
				DispatchMissionInfo(sceneId,selfId,targetId,x200601_g_scriptId,x200601_g_missionId)
			end
    end
end

--**********************************
--�о��¼�
--**********************************
function x200601_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x200601_g_missionIdPre) <= 0 then
    	return
    end
	--��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x200601_g_missionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x200601_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x200601_g_name then
			AddNumText(sceneId, x200601_g_scriptId,x200601_g_missionName);
		end
    --���������������
    elseif x200601_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200601_g_name then
			AddNumText(sceneId,x200601_g_scriptId,x200601_g_missionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x200601_CheckAccept( sceneId, selfId )
	--��Ҫ1�����ܽ�
	if GetLevel( sceneId, selfId ) >= 1 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x200601_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x200601_g_missionId, x200601_g_scriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x200601_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x200601_g_missionId )
end

--**********************************
--����
--**********************************
function x200601_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    	AddText(sceneId,x200601_g_missionName)
     	AddText(sceneId,x200601_g_missionText_2)
   		AddMoneyBonus( sceneId, x200601_g_MoneyBonus )
    	for i, item in x200601_g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200601_g_scriptId,x200601_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200601_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x200601_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200601_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x200601_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			AddMoney(sceneId,selfId,x200601_g_MoneyBonus );
			DelMission( sceneId,selfId,  x200601_g_missionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x200601_g_missionId )
			CallScriptFunction( 200602, "OnDefaultEvent",sceneId, selfId, targetId)
		else
		--������û�мӳɹ�
		end
	        
	end
end

--**********************************
--ɱ����������
--**********************************
function x200601_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x200601_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200601_OnItemChanged( sceneId, selfId, itemdataId )
end







