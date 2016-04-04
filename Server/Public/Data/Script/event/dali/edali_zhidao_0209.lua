--ѧϰ����
--�Ŵ����ɼ��ܴ���

--MisDescBegin
--�ű���
x210209_g_ScriptId = 210209

--�����
x210209_g_MissionId = 449

--�������
x210209_g_MissionKind = 13

--������߱��
x210209_g_ItemId = 40002108

--����ȼ�
x210209_g_MissionLevel = 1

--�Ƿ��Ǿ�Ӣ����
x210209_g_IfMissionElite = 0

--������
x210209_g_MissionName="���֣�ѧϰ����"
x210209_g_MissionInfo="ȥ�ҾŴ����ɵĵ���ѧϰһ���"
x210209_g_MissionTarget="ѧϰ����"
x210209_g_MissionComplete="��Ȼ���������Ƽ��ţ����Ҿͽ̸���һ�����ּ��ܣ�Ҫ�ú�ѧϰ�������ϰ�ſ��ԡ�"
x210209_g_Name_0="����ʦ"
x210209_g_Name_1="����"
x210209_g_Name_2="ʯ��"
x210209_g_Name_3="����"
x210209_g_Name_4="�Ż�"
x210209_g_Name_5="·����"
x210209_g_Name_6="������"
x210209_g_Name_7="��̰"
x210209_g_Name_8="����˪"
x210209_g_Name_9="�̨����"

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210209_OnDefaultEvent( sceneId, selfId, targetId )
	if GetName(sceneId,targetId) ~= x210209_g_Name_0 then
		x210209_OnContinue( sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--�о��¼�
--**********************************
function x210209_OnEnumerate( sceneId, selfId, targetId )
	if x210209_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) == x210209_g_Name_1 then
			if	HaveSkill(  sceneId, selfId, 241)<0	then
				AddNumText(sceneId, x210209_g_ScriptId,x210209_g_MissionName);
			end
		elseif	GetName(sceneId,targetId) == x210209_g_Name_2	 then
			if	HaveSkill(  sceneId, selfId, 242)<0	then
				AddNumText(sceneId, x210209_g_ScriptId,x210209_g_MissionName);
			end
		elseif	GetName(sceneId,targetId) == x210209_g_Name_3	 then
			if	HaveSkill(  sceneId, selfId, 243)<0	then
				AddNumText(sceneId, x210209_g_ScriptId,x210209_g_MissionName);
			end
		elseif	GetName(sceneId,targetId) == x210209_g_Name_4	then
			if	HaveSkill(  sceneId, selfId, 244)<0	then
				AddNumText(sceneId, x210209_g_ScriptId,x210209_g_MissionName);
			end
		elseif	GetName(sceneId,targetId) == x210209_g_Name_5 then
			if	HaveSkill(  sceneId, selfId, 245)<0	then
				AddNumText(sceneId, x210209_g_ScriptId,x210209_g_MissionName);
			end
		elseif	GetName(sceneId,targetId) == x210209_g_Name_6 then
			if	HaveSkill(  sceneId, selfId, 246)<0	then
				AddNumText(sceneId, x210209_g_ScriptId,x210209_g_MissionName);
			end
		elseif	GetName(sceneId,targetId) == x210209_g_Name_7 then
			if	HaveSkill(  sceneId, selfId, 247)<0	then
				AddNumText(sceneId, x210209_g_ScriptId,x210209_g_MissionName);
			end
		elseif	GetName(sceneId,targetId) == x210209_g_Name_8 then
			if	HaveSkill(  sceneId, selfId, 248)<0	then
				AddNumText(sceneId, x210209_g_ScriptId,x210209_g_MissionName);
			end
		elseif	GetName(sceneId,targetId) == x210209_g_Name_9 then
			if	HaveSkill(  sceneId, selfId, 249)<0	then
				AddNumText(sceneId, x210209_g_ScriptId,x210209_g_MissionName);
			end
		end
	end
end

--**********************************
--����������
--**********************************
function x210209_CheckAccept( sceneId, selfId )
	--��Ҫ�е��߲��ܽ�
	if	HaveItemInBag ( sceneId, selfId, x210209_g_ItemId)>0	then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210209_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210209_g_MissionId, x210209_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#Y��������ѧϰ����",MSG2PLAYER_PARA )
end

--**********************************
--����
--**********************************
function x210209_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210209_g_MissionId )
end

--**********************************
--����
--**********************************
function x210209_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210209_g_MissionName)
		AddText(sceneId,x210209_g_MissionComplete)
		AddText(sceneId,"�㽫ѧ��һ���µļ���")
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210209_g_ScriptId,x210209_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210209_CheckSubmit( sceneId, selfId )
	if	HaveItemInBag (  sceneId, selfId, x210209_g_ItemId)==1	then
		return 1
	else
		return 0
	end
end

--**********************************
--�ύ
--**********************************
function x210209_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210209_CheckSubmit( sceneId, selfId, selectRadioId ) then
		--���������
		DelMission( sceneId, selfId, x210209_g_MissionId )
		MissionCom( sceneId, selfId, x210209_g_MissionId )
		--�۳�������Ʒ
		DelItem( sceneId, selfId, x210209_g_ItemId, 1 )
		if  GetName(sceneId,targetId) == x210209_g_Name_1	then
			AddSkill(  sceneId, selfId, 241)
			BeginEvent(sceneId)
				strText = "��ѧ���µļ��ܣ��������ּ��ܣ��⹦����"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		elseif	GetName(sceneId,targetId) == x210209_g_Name_2	then
			AddSkill(  sceneId, selfId, 242)
			BeginEvent(sceneId)
				strText = "��ѧ���µļ��ܣ��������ּ��ܣ��������"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		elseif	GetName(sceneId,targetId) == x210209_g_Name_3	then
			AddSkill(  sceneId, selfId, 243)
			BeginEvent(sceneId)
				strText = "��ѧ���µļ��ܣ�ؤ�����ּ��ܣ�Ҫ������"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		elseif	GetName(sceneId,targetId) == x210209_g_Name_4	then
			AddSkill(  sceneId, selfId, 244)
			BeginEvent(sceneId)
				strText = "��ѧ���µļ��ܣ��䵱���ּ��ܣ��ھ�����"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		elseif	GetName(sceneId,targetId) == x210209_g_Name_5	then
			AddSkill(  sceneId, selfId, 245)
			BeginEvent(sceneId)
				strText = "��ѧ���µļ��ܣ��������ּ��ܣ���������"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		elseif	GetName(sceneId,targetId) == x210209_g_Name_6	then
			AddSkill(  sceneId, selfId, 246)
			BeginEvent(sceneId)
				strText = "��ѧ���µļ��ܣ��������ּ��ܣ��ڹ�����"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		elseif	GetName(sceneId,targetId) == x210209_g_Name_7	then
			AddSkill(  sceneId, selfId, 247)
			BeginEvent(sceneId)
				strText = "��ѧ���µļ��ܣ����������ּ��ܣ���������"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		elseif	GetName(sceneId,targetId) == x210209_g_Name_8	then
			AddSkill(  sceneId, selfId, 248)
			BeginEvent(sceneId)
				strText = "��ѧ���µļ��ܣ���ɽ���ּ��ܣ�����Ӱ��"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		elseif	GetName(sceneId,targetId) == x210209_g_Name_9	then
			AddSkill(  sceneId, selfId, 249)
			BeginEvent(sceneId)
				strText = "��ѧ���µļ��ܣ���ң���ּ��ܣ�ȼ������"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
	Msg2Player(  sceneId, selfId,"#Y�������ѧϰ����",MSG2PLAYER_PARA )
end

--**********************************
--ɱ����������
--**********************************
function x210209_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210209_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210209_OnItemChanged( sceneId, selfId, itemdataId )
end
