--������ű���������
--�ű���
--g_ScriptId = 711063

--����������
x711063_g_GpId = 564

--��һ��������ı��
x711063_g_GpIdNext = 565

function	 x711063_OnRecycle(sceneId,selfId,targetId)
	itemBoxX = GetItemBoxWorldPosX(sceneId,targetId)
	itemBoxZ = GetItemBoxWorldPosZ(sceneId,targetId)
	ItemBoxId = ItemBoxEnterScene(itemBoxX,itemBoxZ,x711063_g_GpIdNext,sceneId,0)
	
	SetItemBoxMaxGrowTime(sceneId,ItemBoxId,450000)	--�趨����ʱ��
	return 1
end
