--Ѿ��

--�ű���
x020004_g_scriptId = 020004

--**********************************
--�¼��б�
--**********************************
function x020004_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerSex=GetSex(sceneId,selfId)
		if PlayerSex == 0 then
			PlayerSex = "����"
		else
			PlayerSex = "����"
		end
		AddText(sceneId,"  "..PlayerSex.."�����ǲ��Ǿ������ǿ�������˵������ʵ���������ģ�ֻ��������鲻�á�#r  ��ү������ѡ�˷�����ȴ�Ƕ�̫��Ү���������Ǹ������Ļ���̫�ӡ�#r  ������ʹ�ϱߣ���ү�ֳ���������ս����ټ������꿤���ǿ���һ���˴���#r  ��������ֻ����֪������ȴ���ܰ�����ʲô��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
