--���＼��ѧϰUI 3

x311111_g_ScriptId = 311111;

x311111_g_MenPaiId = 0;
x311111_g_MenPaiSkillIds = {701,702,703}
--**********************************
--�о��¼�
--**********************************
function x311111_OnEnumerate( sceneId, selfId, targetId, sel )
	if(sel == 6) then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId); --���÷���������Ϣ����
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 5)
		
		local ret = DispatchPetPlacardList(sceneId,selfId,targetId,-1,-1,1);
		if(0 == ret) then
			Msg2Player( sceneId,selfId,"����û��ע��ĳ���",MSG2PLAYER_PARA)
		end
	else
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId);
			UICommand_AddInt(sceneId,sel)		--���ü���ѧϰ����
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 3)
	end
end

--������飬����0 ���ʧ�� ,1 ���ɹ�
function x311111_PetSkillStudy_MenPaiCheck(sceneId, selfId)
	if(x311111_g_MenPaiId ~= tonumber(GetMenPai(sceneId, selfId))) then
		return 0;
	else
		return 1;
	end
end

--���ɼ���ѧϰ
function x311111_PetSkillStudy_MenPai_Learn(sceneId, selfId, petHid, petLid, skillId)
	local ret = PetStudySkill_MenPai(sceneId, selfId, petHid, petLid, skillId);
	if( 1 == ret ) then
		Msg2Player( sceneId,selfId,"�������ɼ���ѧϰ�ɹ�",MSG2PLAYER_PARA)
	else
		Msg2Player( sceneId,selfId,"�������ɼ���ѧϰʧ��",MSG2PLAYER_PARA)
	end
end

--ѱ���Ѳ�ѯ
function x311111_PetSkillStudy_Ask_Money(sceneId, selfId, petHid, petLid)
	local money = CalcPetDomesticationMoney(sceneId, selfId, petHid, petLid);
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, money)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 4)
end

--ѱ������
function x311111_PetSkillStudy_Domestication(sceneId, selfId, petHid, petLid)
	local ret = PetDomestication(sceneId, selfId, petHid, petLid);
	if( 1 == ret ) then
		Msg2Player( sceneId,selfId,"����ѱ���ɹ�",MSG2PLAYER_PARA)
	else
		Msg2Player( sceneId,selfId,"����ѱ��ʧ��",MSG2PLAYER_PARA)
	end
end

--�鿴ǰһƪ������Ϣ
function x311111_PetInviteFriend_Ask_NewPage(sceneId, selfId, npcId, guid1, guid2, dir)
	local ret = DispatchPetPlacardList(sceneId, selfId, npcId, guid1, guid2, dir)
	if(0 == ret) then
		Msg2Player( sceneId,selfId,"û�и��������",MSG2PLAYER_PARA)
	end
end
