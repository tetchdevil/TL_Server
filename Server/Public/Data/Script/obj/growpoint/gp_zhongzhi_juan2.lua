--������ű�����2
--�ű���
--g_ScriptId = 711049

--����������
x711049_g_GpId = 550

--��һ��������ı��
x711049_g_GpIdNext = 551

function	 x711049_OnRecycle(sceneId,selfId,targetId)
	itemBoxX = GetItemBoxWorldPosX(sceneId,targetId)
	itemBoxZ = GetItemBoxWorldPosZ(sceneId,targetId)
	ItemBoxId = ItemBoxEnterScene(itemBoxX,itemBoxZ,x711049_g_GpIdNext,sceneId,1,20105005)
	
	SetItemBoxOwner(sceneId,ItemBoxId,selfId)		--��ItemBox�趨����
	SetItemBoxPickOwnerTime(sceneId,ItemBoxId,480000)	--�趨��ʱ��
	EnableItemBoxPickOwnerTime(sceneId,ItemBoxId)		--����ʱ�俪ʼ��ʱ

	SetItemBoxMaxGrowTime(sceneId,ItemBoxId,600000)	--�趨����ʱ��
	return 1
end
