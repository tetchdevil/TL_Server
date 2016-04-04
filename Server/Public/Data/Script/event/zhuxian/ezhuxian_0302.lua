--��������
--�����ͽ2

--�ű���
x200302_g_scriptId = 200302

--ǰ������
x200302_g_missionIdPre = 6;

--�����
x200302_g_missionId = 7

--Ŀ��NPC
x200302_g_name	="�ް�Ȫ"

--������Ʒ
x200302_g_DemandItem={{id=10105001,num=1}}

--������


--�����ı�����
x200302_g_missionName="�����ͽ"
x200302_g_missionInfo="�ް�Ȫ�þ�̰��"
--,���������ص�,�˳ƴ����ͽ.�����һƿ�ſ��ƺ�,��������һ����˵ʵ����."
x200302_g_missionInfo1="�ſ��Ʊ���Ӧ����ȥ�Ƶ����"
--,���������̵�ϵͳ��û������,���ȸ���һƿ��."
x200302_g_missionRenWuMuBiao="����Ŀ�꣺\n�Ѷſ��ƽ����ް�Ȫ"
x200302_g_missionRenContinueInfo="��Ҳ֪�����ķ���,��л��ľ���."
x200302_g_missionRenSubmitInfo="(�����Ⱦ���)"
--\nĽ�ݲ���������!�Ҵް�Ȫ��������Ҫ��,Ҳһ��Ҫ�������Ƥ�������ҿ�ʦ��!"

--������
x200302_g_MoneyBonus=2000
x200302_g_ItemBonus={{id=10105001,num=1}}


--**********************************
--������ں���
--**********************************
function x200302_OnDefaultEvent( sceneId, selfId, targetId )
	
    --����ѽӴ�����
    if IsMissionHaveDone( sceneId, selfId, x200302_g_missionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x200302_g_missionId) > 0 then
		--���ͽ�����ǰ��������Ϣ
    	done = 1;
    	BeginEvent(sceneId)
    	AddText(sceneId,x200302_g_missionRenContinueInfo);
    	for i, item in x200302_g_DemandItem do
    		AddItemDemand( sceneId, item.id, item.num );
    		if done > 0 then
    			itemNum = GetItemCount( sceneId, selfId, item.id );
    			if itemNum < item.num then
    				done = 0
    			end
    		end
    	end
    	EndEvent(sceneId)

  		DispatchMissionDemandInfo(sceneId,selfId,targetId,x200302_g_scriptId,x200302_g_missionId,done)
    --���������������
    elseif x200302_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
	    BeginEvent(sceneId)
    	AddText(sceneId,x200302_g_missionName);
    	AddText(sceneId,x200302_g_missionInfo);
    	AddText(sceneId,x200302_g_missionInfo1);
    	AddText(sceneId,x200302_g_missionRenWuMuBiao);
    	for i, item in x200302_g_ItemBonus do
    		AddItemBonus( sceneId, item.id, item.num );
    	end
	    EndEvent(sceneId)
	    DispatchMissionInfo(sceneId,selfId,targetId,x200302_g_scriptId,x200302_g_missionId)
    end
end

--**********************************
--�о��¼�
--**********************************
function x200302_OnEnumerate( sceneId, selfId, targetId )
    if IsMissionHaveDone( sceneId, selfId, x200302_g_missionId ) > 0 then
		return 
    elseif IsHaveMission(sceneId,selfId,x200302_g_missionId) > 0 then
		AddNumText(sceneId, x200302_g_scriptId,x200302_g_missionName)
    --���������������
    elseif x200302_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId, x200302_g_scriptId, x200302_g_missionName);
    end
end

--**********************************
--��ⴥ������
--**********************************
function x200302_CheckAccept( sceneId, selfId )
	bDone = IsMissionHaveDone( sceneId, selfId, x200302_g_missionIdPre );
	if bDone > 0 then
		return 1;
	else
		return 0;
	end
end

--**********************************
--����
--**********************************
function x200302_OnAccept( sceneId, selfId )

	--������������б�
	--����������Ʒ
	AddMission( sceneId,selfId, x200302_g_missionId, x200302_g_scriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x200302_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x200302_g_missionId )
end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x200302_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x200302_g_missionRenSubmitInfo);
    for i, item in x200302_g_ItemBonus do
    	AddItemBonus( sceneId, item.id, item.num );
    end
	EndEvent(sceneId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200302_g_scriptId,x200302_g_missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200302_CheckSubmit( sceneId, selfId )
    for i, item in x200302_g_DemandItem do
    	itemNum = GetItemCount( sceneId, selfId, item.id );
    	if itemNum < item.num then
    		return 0;
    	end
    end
    return 1;
end

--**********************************
--�ύ����ɣ�
--**********************************
function x200302_OnSubmit( sceneId, selfId,targetId,selectRadioID )
    ret = x200302_CheckSubmit( sceneId, selfId );
	if ret > 0 then
    	BeginAddItem(sceneId)
		for i, item in x200302_g_ItemBonus do
			AddItem( sceneId, item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			for i, item in x200302_g_DemandItem do
				DelItem( sceneId, selfId, item.id, item.num )
			end
			--ɾ����������б��ж�Ӧ������
			ret = DelMission( sceneId, selfId, x200302_g_missionId );
			if ret > 0 then
				MissionCom( sceneId, selfId, x200302_g_missionId )
				CallScriptFunction( 200303, "OnDefaultEvent",sceneId, selfId, targetId)
			end
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x200302_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x200302_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200302_OnItemChanged( sceneId, selfId, itemdataId )
end
