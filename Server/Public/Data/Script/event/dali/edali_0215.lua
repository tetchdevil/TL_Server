--��������

--************************************************************************
--MisDescBegin

--�ű���
x210215_g_ScriptId = 210215

--��һ�������ID
x210215_g_MissionIdPre = 454

--�����
x210215_g_MissionId = 455

--����Ŀ��npc
x210215_g_Name	="��ƮƮ" 

--�������
x210215_g_MissionKind = 13

--����ȼ�
x210215_g_MissionLevel = 5

--�Ƿ��Ǿ�Ӣ����
x210215_g_IfMissionElite = 0

--********���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������******

--**********************************�����Ƕ�̬****************************

--�����ı�����
x210215_g_MissionName="���֣���������"
x210215_g_MissionInfo="��ô���ѧ���ˣ��治�����ڰ��Ұ�С��������2�������ҿ�����ѧ����ô����## ȥ�����������ɽ��С��������2����"  --��������
x210215_g_MissionTarget="����ƮƮ��С��������2��"		--����Ŀ��
x210215_g_ContinueInfo="С���ӻ�û����2����"		--δ��������npc�Ի�
x210215_g_MissionComplete="�ţ���������ͦ�ã��������ȥ������ʦ�ɡ�"					--�������npc˵���Ļ�
x210215_g_SignPost = {x = 263, z = 129, tip = "��ƮƮ"}

--������
x210215_g_MoneyBonus=100
x210215_g_ItemBonus={{id=40002108,num=1}}

--MisDescEnd
--************************************************************************

--��ɫMission����˵��
--0�ţ�δ��
--1�ţ�δ��
--2�ţ�δ��
--3�ţ�δ��
--4�ţ�δ��
--5�ţ�δ��
--6�ţ�δ��
--7�ţ�δ��
x210215_g_PetNeedLevel=2	--��Ҫ�����������ĵȼ�
x210215_g_PetDataID=3500	--�������ı��

--**********************************
--������ں���
--**********************************
function x210215_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	
	if IsHaveMission(sceneId,selfId,x210215_g_MissionId) > 0 then --����ѽӴ�����
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x210215_g_MissionName)
			AddText(sceneId,x210215_g_ContinueInfo)
			AddMoneyBonus( sceneId, x210215_g_MoneyBonus )
		EndEvent( )
		bDone = x210215_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x210215_g_ScriptId,x210215_g_MissionId,bDone)
	elseif x210215_CheckAccept(sceneId,selfId) > 0 then --���������������
		--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x210215_g_MissionName)
				AddText(sceneId,x210215_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210215_g_MissionTarget)
				for i, item in x210215_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
				AddMoneyBonus( sceneId, x210215_g_MoneyBonus )
				EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210215_g_ScriptId,x210215_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x210215_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x210215_g_MissionIdPre) <= 0 then
    	return
    end
    --��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x210215_g_MissionId) > 0 then
		return 
	end
    if IsHaveMission(sceneId,selfId,x210215_g_MissionId) > 0 then
			AddNumText(sceneId,x210215_g_ScriptId,x210215_g_MissionName,2,-1);
		--���������������
	elseif x210215_CheckAccept(sceneId,selfId) > 0 then
			AddNumText(sceneId,x210215_g_ScriptId,x210215_g_MissionName,1,-1);
	end
end

--**********************************
--����������
--**********************************
function x210215_CheckAccept( sceneId, selfId )
	--��������
	if GetLevel( sceneId, selfId ) >= x210215_g_MissionLevel then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210215_OnAccept( sceneId, selfId )
	local ret = LuaFnCreatePet(sceneId, selfId, x210215_g_PetDataID ) --���������һֻ����
	if ret==1 then
		--������������б�
		AddMission( sceneId,selfId, x210215_g_MissionId, x210215_g_ScriptId, 0, 0, 0 )	--�������
		BeginEvent(sceneId)
			strText = "��õ���һ������!"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		Msg2Player(  sceneId, selfId,"#Y����������������",MSG2PLAYER_PARA )
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, SCENE_DALI, x210215_g_SignPost.x, x210215_g_SignPost.z, x210215_g_SignPost.tip )
	end
end

--**********************************
--����
--**********************************
function x210215_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210215_g_MissionId )
    
    --ɾ���������
	petcount = LuaFnGetPetCount(sceneId, selfId) --ȡ�ó�������
	for	i=0,petcount-1 do
		petdataid = LuaFnGetPet_DataID(sceneId, selfId, i) --ȡ�ó�����
		if petdataid==x210215_g_PetDataID then
			ret0 = LuaFnDeletePet(sceneId, selfId, i)
		end
    end
end

--**********************************
--����
--**********************************
function x210215_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210215_g_MissionName)
		AddText(sceneId,x210215_g_MissionComplete)
		AddMoneyBonus( sceneId, x210215_g_MoneyBonus )
		for i, item in x210215_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210215_g_ScriptId,x210215_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210215_CheckSubmit( sceneId, selfId )
	return 2
end

--**********************************
--�ύ
--**********************************
function x210215_OnSubmit( sceneId, selfId, targetId,selectRadioId )
end

--**********************************
--ɱ����������
--**********************************
function x210215_OnKillObject( sceneId, selfId, objdataId, objId )
end

--**********************************
--���������¼�
--**********************************
function x210215_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210215_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--����ύ����Ʒ������
--**********************************
function x210215_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
	
	if indexpet == 255 then --����ֵ����255��ʾ�գ�û�ύ����
		BeginEvent(sceneId)
			strText = "���ṩһ������!"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	else
		petlevel = LuaFnGetPet_Level(sceneId, selfId, indexpet ) --����ȼ�
		petdataid = LuaFnGetPet_DataID(sceneId, selfId, indexpet ) --������
		
		if petlevel>=x210215_g_PetNeedLevel and petdataid==x210215_g_PetDataID then
	
			--BeginAddItem(sceneId)
			--for i, item in x210215_g_ItemBonus do
			--	AddItem( sceneId,item.id, item.num )
			--end
			--ret = EndAddItem(sceneId,selfId)
			
			--���������
			--if ret > 0 then
				AddMoney(sceneId,selfId,x210215_g_MoneyBonus );
				LuaFnAddExp( sceneId, selfId,600)
				ret0 = DelMission( sceneId, selfId, x210215_g_MissionId ) --ɾ������
				ret1 = LuaFnDeletePet(sceneId, selfId, indexpet ) --ɾ������
				if ret0>0 and ret1>0 then
					MissionCom( sceneId,selfId, x210215_g_MissionId )
					Msg2Player(  sceneId, selfId,"#Y���������������",MSG2PLAYER_PARA )
					CallScriptFunction( 210216, "OnDefaultEvent",sceneId, selfId, npcid)
				end
				
				BeginEvent(sceneId)
					strText = "�������"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
		else
			BeginEvent(sceneId)
				strText = "������������!"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
			--else
			--������û�мӳɹ�
--				BeginEvent(sceneId)
--					strText = "��������,�޷��������"
--					AddText(sceneId,strText);
--				EndEvent(sceneId)
--				DispatchMissionTips(sceneId,selfId)
--			end  
--		else
--			BeginEvent(sceneId)
--				strText = "������������!"
--				AddText(sceneId,strText);
--			EndEvent(sceneId)
--			DispatchMissionTips(sceneId,selfId)
--		end
end

