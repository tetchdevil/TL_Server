--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x002015_OnDefaultEvent( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "����"
	else
		PlayerSex = "����"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  "..PlayerName..PlayerSex.."������Ҫ������ʥ�ϣ�û��ʥ�Ͼ�Ȼ���ڹ��У�����ǹغ��ڴ������ĺ��ҹ��Ĺ�ϵ�Ĵ��°���")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
