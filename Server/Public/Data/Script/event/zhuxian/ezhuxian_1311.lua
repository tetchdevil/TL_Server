--Ѱ������
--��ʾ���1
--����14�����������1��

--�ű���
x201311_g_scriptId = 201311

--��һ�������ID
x201311_g_missionIdPre = 50	

--�����
x201311_g_missionId = 51

--Ŀ��NPC
x201311_g_name	="��ٴ"

--������
local  PlayerName=""
x201311_g_missionName="��ʾ���1"
x201311_g_missionText_0="���飿ϰ�䣿��ô�������������˭��ȥ�������ң�ÿ��������ϣ�ǿ���塢��ұ��٣�����Ҳ����Ҽ��ո߳������ҵ���������ְ...\n�����ٴֻƾ��Ͼ�����������λ�Ӹ߹٣���ȷ���˻��ɡ���˵�ƺ������ԣ��ҹ���һ�࣬�����ܲ����׳�Щ���õ���Ϣ��"
x201311_g_missionText_1="�öſ��ƹ����ٴ"
x201311_g_missionText_2="���������ٺ�һ�����������������е����ơ�\nͯ����ƥ��10������10������������һ�죬��Ҫ�������������ң���������...��!��!��!��!����..."
x201311_g_MoneyBonus=166
x201311_g_ItemBonus={{id=10105001,num=1}}

--**********************************
--������ں���
--**********************************
function x201311_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x201311_g_missionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x201311_g_missionId) > 0)  then
		if targetId == g_targetId then
			x201311_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x201311_CheckAccept(sceneId,selfId) > 0 then
   		if targetId ~= g_targetId then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
			AddText(sceneId,x201311_g_missionName)
			AddText(sceneId,x201311_g_missionText_0)
			AddText(sceneId,"[[����Ŀ��]]")
			AddText(sceneId,x201311_g_missionText_1)
			AddMoneyBonus( sceneId, x201311_g_MoneyBonus )
			for i, item in x201311_g_ItemBonus do
						AddItemBonus( sceneId, item.id, item.num )
					end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x201311_g_scriptId,x201311_g_missionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x201311_OnEnumerate( sceneId, selfId, targetId )
    --�����Ҳ��������ɵ�
	
	--�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x201311_g_missionIdPre) <= 0 then
    	return
    end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x201311_g_missionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x201311_g_missionId) > 0 then
		if targetId == g_targetId then
			AddNumText(sceneId, x201311_g_scriptId,x201311_g_missionName);
		end
    --���������������
    elseif x201311_CheckAccept(sceneId,selfId) > 0 then
		if targetId~= g_targetId then
			AddNumText(sceneId,x201311_g_scriptId,x201311_g_missionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x201311_CheckAccept( sceneId, selfId )
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
function x201311_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x201311_g_missionId, x201311_g_scriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x201311_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x201311_g_missionId )
end

--**********************************
--����
--**********************************
function x201311_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x201311_g_missionName)
     AddText(sceneId,x201311_g_missionText_2)
   AddMoneyBonus( sceneId, x201311_g_MoneyBonus )
    for i, item in x201311_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x201311_g_scriptId,x201311_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x201311_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x201311_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x201311_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		for i, item in x201311_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			AddMoney(sceneId,selfId,x201311_g_MoneyBonus );
			DelMission( sceneId,selfId,  x201311_g_missionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x201311_g_missionId )
			CallScriptFunction( 201312, "OnDefaultEvent",sceneId, selfId, targetId)
		else
		--������û�мӳɹ�
		end
	        
	end
end

--**********************************
--ɱ����������
--**********************************
function x201311_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x201311_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x201311_OnItemChanged( sceneId, selfId, itemdataId )
end







