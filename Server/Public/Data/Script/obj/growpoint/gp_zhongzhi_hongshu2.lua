--������ű�������2
--�ű���
--g_ScriptId = 711013

--����������
x711013_g_GpId = 514

--��һ��������ı��
x711013_g_GpIdNext = 515

function	 x711013_OnRecycle(sceneId,selfId,targetId)
	itemBoxX = GetItemBoxWorldPosX(sceneId,targetId)
	itemBoxZ = GetItemBoxWorldPosZ(sceneId,targetId)
	ItemBoxId = ItemBoxEnterScene(itemBoxX,itemBoxZ,x711013_g_GpIdNext,sceneId,1,20104005)
	
	SetItemBoxOwner(sceneId,ItemBoxId,selfId)		--��ItemBox�趨����
	SetItemBoxPickOwnerTime(sceneId,ItemBoxId,480000)	--�趨��ʱ��
	EnableItemBoxPickOwnerTime(sceneId,ItemBoxId)		--����ʱ�俪ʼ��ʱ

	SetItemBoxMaxGrowTime(sceneId,ItemBoxId,600000)	--�趨����ʱ��
	return 1
end
