--�±�

--�ű���
x020007_g_scriptId = 020007

--**********************************
--�¼��б�
--**********************************
function x020007_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"  "..PlayerName.."���˺ã���ʵ��Ҳ�Ǻ��ˣ��������#r  ����ɹ��ĸ��嶼�У��������������ĸ���͢��������һ������˵�����ε���Ժ����Ҳ�Ǻ��ˣ���ȻҲ������#r  ������ô���˿����Ŀ��ˣ�Ҫ˵�����������������Ƣ�ԣ������꿤��ģ�����Σ����˼�Ҳ���ϴ�����С����ûʲô������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
