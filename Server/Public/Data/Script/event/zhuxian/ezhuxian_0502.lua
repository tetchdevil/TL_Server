--��������
--��ƶ

--�ű���
x200502_g_scriptId = 200502

--ǰ������
x200502_g_missionIdPre = 11

--�����
x200502_g_missionId = 12

--�����ı�����
x200502_g_missionName="��ƶ2"
x200502_g_missionInfo="������������"
--���������ҹ��Ѱ���˵����鲻�ܲ��ܣ������ھ����ְ���\n���ʱ���ﻹ�м������鷳�㡣����ǰΪ�����編֮�£������������������෴ĿΪ��������˵���չ�֮�����������ƶ���������������٣�������ȥ��������ҵĳ��⡣"
x200502_g_missionRenWuMuBiao="����Ŀ�꣺\n�ҵ���������̱�ͺõĳ���"
x200502_g_missionRenSubmitInfo="�ȿ�"
--�������������á�����һֱ�ڵ����ء�"

--����ID
x200502_g_ItemID = 30002061

--����

--�ջ���
x200502_g_name="������" 

--**********************************
--������ں���
--**********************************
function x200502_OnDefaultEvent( sceneId, selfId, targetId )

    --����ѽӴ�����
    if IsMissionHaveDone( sceneId, selfId, x200502_g_missionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x200502_g_missionId) > 0 then
		if g_targetId == targetId then
			--���ͽ�����ǰ��������Ϣ
    		BeginEvent(sceneId)
    		AddText(sceneId,g_missionRenContinueInfo);
    		AddItemDemand( sceneId, x200502_g_ItemID, 1 );
    		EndEvent(sceneId)
    		
    		done = x200502_CheckSubmit( sceneId, selfId );
   			DispatchMissionDemandInfo(sceneId,selfId,targetId,x200502_g_scriptId,x200502_g_missionId,done)
 		end
    --���������������
    elseif x200502_CheckAccept(sceneId,selfId) > 0 then
		if g_targetId ~= targetId then
			--�����������ʱ��ʾ����Ϣ
	    	BeginEvent(sceneId)
    		AddText(sceneId,x200502_g_missionName);
    		AddText(sceneId,x200502_g_missionInfo);
    		AddText(sceneId,x200502_g_missionRenWuMuBiao);
	    	EndEvent(sceneId)
	    	DispatchMissionInfo(sceneId,selfId,targetId,x200502_g_scriptId,x200502_g_missionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x200502_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x200502_g_missionIdPre) <= 0 then
    	return
    end	
    if IsMissionHaveDone( sceneId, selfId, x200502_g_missionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x200502_g_missionId) > 0 then
		if g_targetId == targetId then
			AddNumText(sceneId, x200502_g_scriptId,x200502_g_missionName)
		end
    --���������������
    elseif x200502_CheckAccept(sceneId,selfId) > 0 then
		if g_targetId ~= targetId then
			AddNumText(sceneId, x200502_g_scriptId, x200502_g_missionName);
		end
    end
end

--**********************************
--��ⴥ������
--**********************************
function x200502_CheckAccept( sceneId, selfId )
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
function x200502_OnAccept( sceneId, selfId )

	--������������б�
	--����������Ʒ
	BeginAddItem( sceneId )
	AddItem( sceneId, x200502_g_ItemID, 1 )
	ret = EndAddItem( sceneId, selfId )

	if ret > 0 then 
		AddItemListToHuman(sceneId,selfId)
		ret = AddMission( sceneId,selfId, x200502_g_missionId, x200502_g_scriptId, 0, 0, 0 )
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
		end
	end
end

--**********************************
--����
--**********************************
function x200502_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    res = DelMission( sceneId, selfId, x200502_g_missionId )
	if res > 0 then
		--��ȥ������Ʒ
		DelItem( sceneId, selfId, x200502_g_ItemID, 1 )
	end
end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x200502_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x200502_g_missionRenSubmitInfo);
    EndEvent(sceneId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200502_g_scriptId,x200502_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200502_CheckSubmit( sceneId, selfId )
    itemNum = GetItemCount( sceneId, selfId, x200502_g_ItemID );
    if itemNum > 0 then
    	return 1;
    end
	return 0
end

--**********************************
--�ύ����ɣ�
--**********************************
function x200502_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	ret = x200502_CheckSubmit( sceneId, selfId );
	if ret > 0 then
		--ɾ����������б��ж�Ӧ������
		ret = DelMission( sceneId, selfId, x200502_g_missionId );
		if ret > 0 then
    		DelItem( sceneId,selfId,x200502_g_ItemID,1)
			MissionCom( sceneId, selfId, x200502_g_missionId )
			CallScriptFunction( 200601, "OnDefaultEvent",sceneId, selfId, targetId)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x200502_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x200502_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200502_OnItemChanged( sceneId, selfId, itemdataId )
end
