--����NPC
--��ͳ
--�����ϰ�

x000059_g_shoptableindex=15

x000059_g_scriptId=000059

--**********************************
--�¼��������
--**********************************
function x000059_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"����������¥������ˮϯ�ɣ��������֮����Ҳ�����뿪������")
		AddNumText(sceneId,x000059_g_scriptId,"����ʳ��",-1,0)
		AddNumText(sceneId,x000059_g_scriptId,"��",-1,1)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000059_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		DispatchShopItem( sceneId, selfId,targetId, x000059_g_shoptableindex )
	elseif	GetNumText()==1	then
		local ene=GetHumanEnergy( sceneId, selfId)
		if	ene>=40	then
			SetHumanEnergy( sceneId, selfId, ene-40)
			AddMoney( sceneId,selfId, 3000)
			BeginEvent(sceneId)
				strText = "�������40����,���30������"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		else
			BeginEvent(sceneId)
				strText = "��ľ�������40��,�ϰ岻��Ҫ���"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end
