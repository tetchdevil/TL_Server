--������ű���ɴ2
--�ű���
--g_ScriptId = 711067

--����������
x711067_g_GpId = 568

--��һ��������ı��
x711067_g_GpIdNext = 569

function	 x711067_OnRecycle(sceneId,selfId,targetId)
	itemBoxX = GetItemBoxWorldPosX(sceneId,targetId)
	itemBoxZ = GetItemBoxWorldPosZ(sceneId,targetId)
	ItemBoxId = ItemBoxEnterScene(itemBoxX,itemBoxZ,x711067_g_GpIdNext,sceneId,1,20105011)
	
	SetItemBoxOwner(sceneId,ItemBoxId,selfId)		--��ItemBox�趨����
	SetItemBoxPickOwnerTime(sceneId,ItemBoxId,480000)	--�趨��ʱ��
	EnableItemBoxPickOwnerTime(sceneId,ItemBoxId)		--����ʱ�俪ʼ��ʱ

	SetItemBoxMaxGrowTime(sceneId,ItemBoxId,600000)	--�趨����ʱ��
	return 1
end
