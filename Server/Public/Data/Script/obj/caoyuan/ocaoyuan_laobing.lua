--�ϱ�

--�ű���
x020006_g_scriptId = 020006

--**********************************
--�¼��б�
--**********************************
function x020006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId," "..PlayerName.."���ˣ����á�#r �����֮ǰ�������꿤ÿ�����͢����ǧƥս��Ҳ͵͵�����ϱ�һЩ��#r ��ʵ�Һ��ٺ�����˵����ֻ����Ϊ���ǿ����Ŀ��ˡ��Ҹ����۴�����ʮ�꣬һֱ�����ξ����ͣͣ�ģ����ʱ����ǳ��ˣ�ͣ����Ҫ�����⡣#r ������С����ЩС����һ���棬���ɻ���Щ��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
