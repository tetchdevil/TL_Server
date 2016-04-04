--������ʦ�������¼��ű�
--����

--�ű���
x224000_g_ScriptId = 220400

--�����
x224000_g_MissionId = 1064

--����Ŀ��npc
x224000_g_Name	="����" 

--����ȼ�
x224000_g_MissionLevel = 1

--�����ı�����
x224000_g_MissionName="˽��"
x224000_g_MissionInfo="���кܶ�������Ҫ����Ŷ"  --��������
x224000_g_MissionTarget="��Щ������������"		--����Ŀ��
x224000_g_ContinueInfo="�������"		--δ��������npc�Ի�
x224000_g_MissionComplete="��л��"					--�������npc˵���Ļ�

--������
x224000_g_MoneyBonus=100
x224000_g_ItemBonus={{id=30002002,num=1}}

--��ɫMission����˵��
--0�ţ�δ��
--1�ţ�δ��
--2�ţ�δ��
--3�ţ�δ��
--4�ţ�δ��
--5�ţ�δ��
--6�ţ�δ��
--7�ţ�δ��

--**********************************
--������ں���
--**********************************
function x224000_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	
	if IsHaveMission(sceneId,selfId,x224000_g_MissionId) > 0 then --����ѽӴ�����
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x224000_g_MissionName)
			AddText(sceneId,x224000_g_ContinueInfo)
		EndEvent( )
		bDone = x224000_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x224000_g_ScriptId,x224000_g_MissionId,bDone)
	
	elseif x224000_CheckAccept(sceneId,selfId) > 0 then --���������������
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x224000_g_MissionName)
			AddText(sceneId,x224000_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x224000_g_MissionTarget)
			AddMoneyBonus( sceneId, x224000_g_MoneyBonus )
			for i, item in x224000_g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x224000_g_ScriptId,x224000_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x224000_OnEnumerate( sceneId, selfId, targetId )

    --��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x224000_g_MissionId) > 0 then
		return 
	end

    if IsHaveMission(sceneId,selfId,x224000_g_MissionId) > 0 then  --����ѽӴ�����
		AddNumText(sceneId,x224000_g_ScriptId,x224000_g_MissionName);
    elseif x224000_CheckAccept(sceneId,selfId) > 0 then		--���������������
		AddNumText(sceneId,x224000_g_ScriptId,x224000_g_MissionName);
    end
end

--**********************************
--����������
--**********************************
function x224000_CheckAccept( sceneId, selfId )
	--��������
	if GetLevel( sceneId, selfId ) >= x224000_g_MissionLevel then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x224000_OnAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x224000_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x224000_g_MissionId )
end

--**********************************
--����
--**********************************
function x224000_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x224000_g_MissionName)
		AddText(sceneId,x224000_g_MissionComplete)
		AddMoneyBonus( sceneId, x224000_g_MoneyBonus )
		for i, item in x224000_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x224000_g_ScriptId,x224000_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x224000_CheckSubmit( sceneId, selfId )
	return 0
end

--**********************************
--�ύ
--**********************************
function x224000_OnSubmit( sceneId, selfId, targetId,selectRadioId )
end

--**********************************
--ɱ����������
--**********************************
function x224000_OnKillObject( sceneId, selfId, objdataId, objId )
end

--**********************************
--���������¼�
--**********************************
function x224000_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x224000_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--����ύ����Ʒ������
--**********************************
function x224000_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
end

