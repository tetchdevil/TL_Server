--����NPC
--����
--����ָ��

--**********************************
--�¼��������
--**********************************
function x002069_OnDefaultEvent( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "����"
	else
		PlayerSex = "����"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  �������������ģ�"..PlayerName..PlayerSex.."��Ҫ�úöԴ��Լ��ĳ���Ŷ��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
