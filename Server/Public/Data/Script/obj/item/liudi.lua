--����

--�ű���
x300002_g_scriptId = 300002
--**********************************
--ˢ���¼�
--**********************************
function x300002_OnDefaultEvent( sceneId, selfId, targetId, eventId )
		if	sceneId == 30 then
			LuaFnCreateMonster(sceneId,529,181,258,1,0,-1)
		else
			BeginEvent(sceneId)
				strText = "�������޷�ʹ��"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
		DelItem( sceneId,selfId,40002077,1)
end

function x300002_IsSkillLikeScript( sceneId, selfId)
	return 0;
end
