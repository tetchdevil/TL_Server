--����NPC
--�׳���
--��ͨ

--**********************************
--�¼��������
--**********************************
function x002058_OnDefaultEvent( sceneId, selfId,targetId )

	local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "����"
	else
		PlayerSex = "����"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  "..PlayerName..PlayerSex.."�����ִ����������������������Ҫ�������ˣ������أ��������˳û���ˮ���㣬�¹ٿ�����Щ����Ҫ������/��������ء�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
