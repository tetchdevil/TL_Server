--����ͷ

--�ű���
x020009_g_scriptId = 020009

--**********************************
--�¼��б�
--**********************************
function x020009_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerSex=GetSex(sceneId,selfId)
		if PlayerSex == 0 then
			PlayerSex = "����"
		else
			PlayerSex = "������"
		end
		AddText(sceneId,"  "..PlayerSex.."��������ʵ�����Ѱɡ�#r  �ҽ��ҿ��ͣ��Ȳ��������ˣ�Ҳ���Ǻ��ˣ���Ҳ���ϴ���°���ġ�#r  ��ԭ�ϵĺ��Ӷ����ҿ���һ�����ġ���ϡ�С�������Ƕ��Ѿ��Ǵ����ˣ������Ÿ��Ե�����,�����˼ң������ˣ��������ˡ�#r  ��ʵ���Ǹ����ӣ�����̫�����֣������������˰���#r")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
