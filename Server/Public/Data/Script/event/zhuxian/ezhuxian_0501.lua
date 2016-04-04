--��������
--��ƶ

--�ű���
x200501_g_scriptId = 200501

--ǰ������
x200501_g_missionIdPre = 10

--�����
x200501_g_missionId = 11

--�����ı�����
x200501_g_missionName="��ƶ1"
x200501_g_missionInfo="���˵�������������"
--����Щ����Ҳ��Ҫ�����ҵĸ��ϡ�����Щ������Ҳֻ�в̱忴�����ۡ�"
x200501_g_missionRenWuMuBiao="����Ŀ�꣺\n������ת�͸��̱�"
x200501_g_missionRenContinueInfo="�����͸��ҵ���"
x200501_g_missionRenSubmitInfo="ԭ��������"
--��\n�Ҹ���������ݣ��ϴ������ҵ�һ����ʦʲô������������������֪�����ʦ��������רҵߦ����Ƥ�ġ�Ҳ�ѹ���������������"

--����ID
x200501_g_ItemID = 30002061

--����

--�ջ���
x200501_g_name ="�̱�" 

--**********************************
--������ں���
--**********************************
function x200501_OnDefaultEvent( sceneId, selfId, targetId )

    --����ѽӴ�����
    if IsMissionHaveDone( sceneId, selfId, x200501_g_missionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x200501_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x200501_g_name then
			--���ͽ�����ǰ��������Ϣ
    		BeginEvent(sceneId)
    		AddText(sceneId,x200501_g_missionRenContinueInfo);
    		AddItemDemand( sceneId, x200501_g_ItemID, 1 );
    		EndEvent(sceneId)
    		
    		done = x200501_CheckSubmit( sceneId, selfId );
   			DispatchMissionDemandInfo(sceneId,selfId,targetId,x200501_g_scriptId,x200501_g_missionId,done)
 		end
    --���������������
    elseif x200501_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200501_g_name then
			--�����������ʱ��ʾ����Ϣ
	    	BeginEvent(sceneId)
    		AddText(sceneId,x200501_g_missionName);
    		AddText(sceneId,x200501_g_missionInfo);
    		AddText(sceneId,x200501_g_missionRenWuMuBiao);
	    	EndEvent(sceneId)
	    	DispatchMissionInfo(sceneId,selfId,targetId,x200501_g_scriptId,x200501_g_missionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x200501_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x200501_g_missionIdPre) <= 0 then
    	return
    end
    if IsMissionHaveDone( sceneId, selfId, x200501_g_missionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x200501_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x200501_g_name then
			AddNumText(sceneId, x200501_g_scriptId,x200501_g_missionName)
		end
    --���������������
    elseif x200501_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200501_g_name then
			AddNumText(sceneId, x200501_g_scriptId, x200501_g_missionName);
		end
    end
end

--**********************************
--��ⴥ������
--**********************************
function x200501_CheckAccept( sceneId, selfId )
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
function x200501_OnAccept( sceneId, selfId )

	--������������б�
	--����������Ʒ
	BeginAddItem( sceneId )
	AddItem( sceneId, x200501_g_ItemID, 1 )
	ret = EndAddItem( sceneId, selfId )

	if ret > 0 then 
		AddItemListToHuman(sceneId,selfId)
		ret = AddMission( sceneId,selfId, x200501_g_missionId, x200501_g_scriptId, 0, 0, 0 )
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
		end
	end
end

--**********************************
--����
--**********************************
function x200501_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    res = DelMission( sceneId, selfId, x200501_g_missionId )
	if res > 0 then
		--��ȥ������Ʒ
		DelItem( sceneId, selfId, x200501_g_ItemID, 1 )
	end
end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x200501_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x200501_g_missionRenSubmitInfo);
    EndEvent(sceneId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200501_g_scriptId,x200501_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200501_CheckSubmit( sceneId, selfId )
    itemNum = GetItemCount( sceneId, selfId, x200501_g_ItemID );
    if itemNum > 0 then
    	return 1;
    end
	return 0
end

--**********************************
--�ύ����ɣ�
--**********************************
function x200501_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	ret = x200501_CheckSubmit( sceneId, selfId );
	if ret > 0 then
		--ɾ����������б��ж�Ӧ������
		ret = DelMission( sceneId, selfId, x200501_g_missionId );
		if ret > 0 then
    		DelItem( sceneId,selfId,x200501_g_ItemID,1)
			MissionCom( sceneId, selfId, x200501_g_missionId )
			CallScriptFunction( 200502, "OnDefaultEvent",sceneId, selfId, targetId)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x200501_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x200501_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200501_OnItemChanged( sceneId, selfId, itemdataId )
end
