--����NPC
--������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x002014_OnDefaultEvent( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "����"
	else
		PlayerSex = "����"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  "..PlayerName..PlayerSex.."�������ɺã�����ȥ���������ķ羰��#r#r  �̲��ޱߣ��Ŀ��������ر�����������ʱ������һ����ζ����ͷ����������Ǵ���������ġ������¡���")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
