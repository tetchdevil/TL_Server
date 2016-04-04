--�ͻ�����
--�޶���2

--�ű���
x201002_g_scriptId = 201002

--��һ�������ID
x201002_g_missionIdPre = 25

--�����
x201002_g_missionId = 26

--Ŀ��NPC
x201002_g_name	="��˼��"

--����ID
x201002_g_ItemID = 10105003

--�����ı�����
x201002_g_missionName="�޶���2"
x201002_g_missionInfo="ʲô�������ҵı���"
--�����б�����ҹ������֮ǰ�ѱ������һ�����������Ȼ�޷�Ū������������û�Ȿ�¡����������һ��ҵĺ��ӡ�����\n��һ��������Ȱ˵��\n�ðɣ������������㣬����ʱ������Щ�����ˣ���ȥ�������Ƭ����������ڵĸ�˼�飬�����������ĺ��Ӱɣ����������ҿɻ�ı�����ġ�"
x201002_g_missionRenWuMuBiao="����Ŀ�꣺\n�ѽ���Ƭ������˼��"
x201002_g_missionRenContinueInfo="����Ҷ�������Ҵ������"
--����ĺ����Ѿ���ȫ�ˣ��쵽��ٹ�ȥ������ɣ������������"
x201002_g_missionRenSubmitInfo="���ˣ�����ҵĺ����ܻ���"
--���Ҹ�����ţ����ҲԸ�⡣"

--**********************************
--������ں���
--**********************************
function x201002_OnDefaultEvent( sceneId, selfId, targetId )
	
    --����ѽӴ�����
    if IsMissionHaveDone( sceneId, selfId, x201002_g_missionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x201002_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x201002_g_name then
			--���ͽ�����ǰ��������Ϣ
    		BeginEvent(sceneId)
    		AddText(sceneId,x201002_g_missionRenContinueInfo);
    		AddItemDemand( sceneId, x201002_g_ItemID, 1 );
    		EndEvent(sceneId)
    		
    		done = x201002_CheckSubmit( sceneId, selfId );
   			DispatchMissionDemandInfo(sceneId,selfId,targetId,x201002_g_scriptId,x201002_g_missionId,done)
 		end
    --���������������
    elseif x201002_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x201002_g_name then
			--�����������ʱ��ʾ����Ϣ
	    	BeginEvent(sceneId)
    		AddText(sceneId,x201002_g_missionName);
    		AddText(sceneId,x201002_g_missionInfo);
    		AddText(sceneId,x201002_g_missionRenWuMuBiao);
	    	EndEvent(sceneId)
	    	DispatchMissionInfo(sceneId,selfId,targetId,x201002_g_scriptId,x201002_g_missionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x201002_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x201002_g_missionIdPre) <= 0 then
    	return
    end
	--��������ɹ��������
    if IsMissionHaveDone( sceneId, selfId, x201002_g_missionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x201002_g_missionId) > 0 then
		if GetName(sceneId,targetId) == x201002_g_name then
			AddNumText(sceneId, x201002_g_scriptId,x201002_g_missionName)
		end
    --���������������
    elseif x201002_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x201002_g_name then
			AddNumText(sceneId, x201002_g_scriptId, x201002_g_missionName);
		end
    end
end

--**********************************
--��ⴥ������
--**********************************
function x201002_CheckAccept( sceneId, selfId )
	bDone = IsMissionHaveDone( sceneId, selfId, x201002_g_missionIdPre );
	if bDone > 0 then
		return 1;
	else
		return 0;
	end
end

--**********************************
--����
--**********************************
function x201002_OnAccept( sceneId, selfId )

	--������������б�
	--����������Ʒ
	BeginAddItem( sceneId )
	AddItem( sceneId, x201002_g_ItemID, 1 )
	ret = EndAddItem( sceneId, selfId )

	if ret > 0 then 
		AddItemListToHuman(sceneId,selfId)
		ret = AddMission( sceneId,selfId, x201002_g_missionId, x201002_g_scriptId, 0, 0, 0 )
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
		end
	end
end

--**********************************
--����
--**********************************
function x201002_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    res = DelMission( sceneId, selfId, x201002_g_missionId )
	if res > 0 then
		--��ȥ������Ʒ
		DelItem( sceneId, selfId, x201002_g_ItemID, 1 )
	end
end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x201002_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x201002_g_missionRenSubmitInfo);
    EndEvent(sceneId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x201002_g_scriptId,x201002_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x201002_CheckSubmit( sceneId, selfId )
    itemNum = GetItemCount( sceneId, selfId, x201002_g_ItemID );
    if itemNum > 0 then
    	return 1;
    end
	return 0
end

--**********************************
--�ύ����ɣ�
--**********************************
function x201002_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	ret = x201002_CheckSubmit( sceneId, selfId );
	if ret > 0 then
		--ɾ����������б��ж�Ӧ������
		ret = DelMission( sceneId, selfId, x201002_g_missionId );
		if ret > 0 then
    		DelItem( sceneId,selfId,x201002_g_ItemID,1)
			MissionCom( sceneId, selfId, x201002_g_missionId )
			CallScriptFunction( 201101, "OnDefaultEvent",sceneId, selfId, targetId)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x201002_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x201002_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x201002_OnItemChanged( sceneId, selfId, itemdataId )
end
