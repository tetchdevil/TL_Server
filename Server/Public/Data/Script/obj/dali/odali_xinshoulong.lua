--Ǯ��

--�ű���
x002031_g_scriptId = 002031


--��ӵ�е��¼�ID�б�
--x002031_g_eventList={210205,210207,210208,311100}--210206
x002031_g_eventList={}
x002031_g_SkillList={{283,1,1},{283,2,2},{283,3,3},{283,4,4},{283,5,4}}
x002031_g_nowtargetId = 31;
--**********************************
--�¼��б�
--**********************************
function x002031_UpdateEventList( sceneId, selfId,targetId )
	
end

--**********************************
--�¼��������
--**********************************
function x002031_OnDefaultEvent( sceneId, selfId,targetId )
	x002031_g_MenPai = GetMenPai(sceneId, selfId)
	if x002031_g_MenPai == 0 then  --0Ϊսʿ
		BeginEvent(sceneId)
			AddText(sceneId,"����Ϊʦ�к��°���")
			AddNumText(sceneId, x002031_g_scriptId, "ѧϰ����",-1,0)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
			BeginEvent(sceneId)
			AddText(sceneId,"�������ѣ�ʩ����ƶɮ�к��°���")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002031_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if 0 == GetNumText() then
		BeginEvent(sceneId)
		for i, skill in x002031_g_SkillList do
			local skillid = skill[1]
			local skilllevel = skill[2]
			local skilltype = skill[3]
			--����Ƿ��Ѿ����������
			--Msg2Player( sceneId, selfId, "#R����ID:"..skillid.."\n���ܵȼ�:"..skilllevel.."\n��������:"..skilltype,0)
			if HaveSkillAndLevelNS(sceneId,selfId,skillid,skilllevel) <= 0 then
				AddSkillStudy(sceneId,skillid,skilllevel,skilltype)			
			end
		end
		
		EndEvent(sceneId);
		DispatchSkillStudyList(sceneId,selfId,targetId);
		x002031_g_nowtargetId = targetId;
	end
end
 
--**********************************
--�����¼�
--**********************************
function x002031_OnDie( sceneId, selfId, killerId )
end

--**********************************
--����ѧϰ
--**********************************
function x002031_OnSkillStudyEvent( sceneId, targetId, selfId , skillidandlevel )
	local skilllevel = mod(skillidandlevel,100);
	local skillid = (skillidandlevel-skilllevel)/100;
	if CheckStudySkillNS(sceneId,selfId,skillid,skilllevel) > 0 then
		--��Ǯ
		local money = GetStudyMoneyNS(sceneId,selfId,skillid,skilllevel);
		if money > 0 then
			if CostMoney(sceneId,selfId,money) < 0 then
				SaveLog(sceneId,selfId,"û���㹻�Ľ�Ǯȥѧϰ����");
				--Msg2Player( sceneId, selfId, "#R��Ǯ����", MSG2PLAYER_PARA );
			else
				if AddSkill(sceneId,selfId,skillid,skilllevel) <= 0 then
				--ѧϰ����û�гɹ�����
				--�۵�Ǯ���üӻ�ȥ
					AddMoney(sceneId,selfId,money);
					SaveLog(sceneId,selfId,"ѧϰ����ʧ�ܷ������ѵĽ�Ǯ");
				else
					BeginEvent(sceneId)
					for i, skill in x002031_g_SkillList do
						local skillid = skill[1]
						local skilllevel = skill[2]
						local skilltype = skill[3]
						--����Ƿ��Ѿ����������
						--Msg2Player( sceneId, selfId, "#R����ID:"..skillid.."\n���ܵȼ�:"..skilllevel.."\n��������:"..skilltype,0)
						if HaveSkillAndLevelNS(sceneId,selfId,skillid,skilllevel) <= 0 then
							AddSkillStudy(sceneId,skillid,skilllevel,skilltype)		
						end
					end
					
					EndEvent(sceneId);
					DispatchSkillStudyList(sceneId,selfId,targetId,x002031_g_nowtargetId);
				end
			end
		end
	else
		SaveLog(sceneId,selfId,"û��ѧϰ���ܵ�����");
	end
end