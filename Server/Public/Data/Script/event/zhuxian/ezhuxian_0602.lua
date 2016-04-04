--�ͻ�
--�ع��ں�2

--�ű���
x200602_g_scriptId = 200602

--ǰ������
x200602_g_missionIdPre  = 13;

--�����
x200602_g_missionId = 14

--�����ı�����
x200602_g_missionName="�ع��ں�2"
x200602_g_missionInfo="���ҩ�����͸�������"
--�������Ϸ�����һ�����Σ��¾��̷�������ÿ���˶�Ӧ���������尡��"
x200602_g_missionRenWuMuBiao="����Ŀ�꣺\n��ҩ���������䡣"
x200602_g_missionRenContinueInfo="�����ˣ������Ӱ�ʱ��������ҩ�������������¾Ʒ��°ɡ�"
x200602_g_missionRenSubmitInfo="�Ҹе�������ˡ�ʵ����̫�ͷ����ˣ�"

--����ID
x200602_g_ItemID = 10105001

--����

--�ջ���
x200602_g_name="������" 

--**********************************
--������ں���
--**********************************
function x200602_OnDefaultEvent( sceneId, selfId, targetId )
	
    --����ѽӴ�����
    if IsMissionHaveDone( sceneId, selfId, x200602_g_missionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x200602_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x200602_g_name then
			--���ͽ�����ǰ��������Ϣ
    		BeginEvent(sceneId)
    		AddText(sceneId,x200602_g_missionRenContinueInfo);
    		AddItemDemand( sceneId, x200602_g_ItemID, 1 );
    		EndEvent(sceneId)
    		
    		done = x200602_CheckSubmit( sceneId, selfId );
   			DispatchMissionDemandInfo(sceneId,selfId,targetId,x200602_g_scriptId,x200602_g_missionId,done)
 		end
    --���������������
    elseif x200602_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200602_g_name then
			--�����������ʱ��ʾ����Ϣ
	    	BeginEvent(sceneId)
    		AddText(sceneId,x200602_g_missionName);
    		AddText(sceneId,x200602_g_missionInfo);
    		AddText(sceneId,x200602_g_missionRenWuMuBiao);
	    	EndEvent(sceneId)
	    	DispatchMissionInfo(sceneId,selfId,targetId,x200602_g_scriptId,x200602_g_missionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x200602_OnEnumerate( sceneId, selfId, targetId )

    if IsMissionHaveDone( sceneId, selfId, x200602_g_missionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x200602_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x200602_g_name then
			AddNumText(sceneId, x200602_g_scriptId,x200602_g_missionName)
		end
    --���������������
    elseif x200602_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200602_g_name then
			AddNumText(sceneId, x200602_g_scriptId, x200602_g_missionName);
		end
    end
end

--**********************************
--��ⴥ������
--**********************************
function x200602_CheckAccept( sceneId, selfId )
	bDone = IsMissionHaveDone( sceneId, selfId, x200602_g_missionIdPre );
	if bDone > 0 then
		return 1;
	else
		return 0;
	end
end

--**********************************
--����
--**********************************
function x200602_OnAccept( sceneId, selfId )

	--������������б�
	--����������Ʒ
	BeginAddItem( sceneId )
	AddItem( sceneId, x200602_g_ItemID, 1 )
	ret = EndAddItem( sceneId, selfId )

	if ret > 0 then 
		AddItemListToHuman(sceneId,selfId)
		ret = AddMission( sceneId,selfId, x200602_g_missionId, x200602_g_scriptId, 0, 0, 0 )
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
		end
	end
end

--**********************************
--����
--**********************************
function x200602_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    res = DelMission( sceneId, selfId, x200602_g_missionId )
	if res > 0 then
		--��ȥ������Ʒ
		DelItem( sceneId, selfId, x200602_g_ItemID, 1 )
	end
end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x200602_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x200602_g_missionRenSubmitInfo);
    EndEvent(sceneId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200602_g_scriptId,x200602_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200602_CheckSubmit( sceneId, selfId )
    itemNum = GetItemCount( sceneId, selfId, x200602_g_ItemID );
    if itemNum > 0 then
    	return 1;
    end
	return 0
end

--**********************************
--�ύ����ɣ�
--**********************************
function x200602_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	ret = x200602_CheckSubmit( sceneId, selfId );
	if ret > 0 then
		--ɾ����������б��ж�Ӧ������
		ret = DelMission( sceneId, selfId, x200602_g_missionId );
		if ret > 0 then
    		DelItem( sceneId,selfId,x200602_g_ItemID,1)
			MissionCom( sceneId, selfId, x200602_g_missionId )
			CallScriptFunction( 200603, "OnDefaultEvent",sceneId, selfId, targetId)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x200602_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x200602_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200602_OnItemChanged( sceneId, selfId, itemdataId )
end
