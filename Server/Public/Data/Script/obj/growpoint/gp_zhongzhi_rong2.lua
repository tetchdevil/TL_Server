--������ű�����2
--�ű���
--g_ScriptId = 711064

--����������
x711064_g_GpId = 565

--��һ��������ı��
x711064_g_GpIdNext = 566

function	 x711064_OnRecycle(sceneId,selfId,targetId)
	itemBoxX = GetItemBoxWorldPosX(sceneId,targetId)
	itemBoxZ = GetItemBoxWorldPosZ(sceneId,targetId)
	ItemBoxId = ItemBoxEnterScene(itemBoxX,itemBoxZ,x711064_g_GpIdNext,sceneId,1,20105010)
	
	SetItemBoxOwner(sceneId,ItemBoxId,selfId)		--��ItemBox�趨����
	SetItemBoxPickOwnerTime(sceneId,ItemBoxId,480000)	--�趨��ʱ��
	EnableItemBoxPickOwnerTime(sceneId,ItemBoxId)		--����ʱ�俪ʼ��ʱ

	SetItemBoxMaxGrowTime(sceneId,ItemBoxId,600000)	--�趨����ʱ��
	return 1
end
