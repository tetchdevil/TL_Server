--��Ѷ���

--�ű���
x300009_g_scriptId = 300009

x300009_g_event = 210211
--**********************************
--ˢ���¼�
--**********************************
function x300009_OnDefaultEvent( sceneId, selfId, targetId, eventId )
	CallScriptFunction(x300009_g_event,"OnUseItem",sceneId, selfId, targetId, eventId)
end

function x300009_IsSkillLikeScript( sceneId, selfId)
	return 0;
end
