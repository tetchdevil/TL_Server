--����NPC
--������
--�������Ժ���ܳ�Ϊѭ������

--**********************************
--�¼��������
--**********************************
function x000077_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local	i=random(0,1)
		if	i<=0	 then
			AddText(sceneId,"�����������ޱȣ���Ҫʮ���Խ���̫���Ͼ����ۣ����еý�ȡ�")
		else
			AddText(sceneId,"��ô�󸻴��ı��డ������ô�и����˲����⸶ʮ���Խ�ɣ�")
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
