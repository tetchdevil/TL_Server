--������ű�����ͷ2
--�ű���
--g_ScriptId = 711034

--����������
x711034_g_GpId = 535

--��һ��������ı��
x711034_g_GpIdNext = 536

function	 x711034_OnRecycle(sceneId,selfId,targetId)
	itemBoxX = GetItemBoxWorldPosX(sceneId,targetId)
	itemBoxZ = GetItemBoxWorldPosZ(sceneId,targetId)
	ItemBoxId = ItemBoxEnterScene(itemBoxX,itemBoxZ,x711034_g_GpIdNext,sceneId,1,20104012)
	
	SetItemBoxOwner(sceneId,ItemBoxId,selfId)		--��ItemBox�趨����
	SetItemBoxPickOwnerTime(sceneId,ItemBoxId,480000)	--�趨��ʱ��
	EnableItemBoxPickOwnerTime(sceneId,ItemBoxId)		--����ʱ�俪ʼ��ʱ

	SetItemBoxMaxGrowTime(sceneId,ItemBoxId,600000)	--�趨����ʱ��
	return 1
end
