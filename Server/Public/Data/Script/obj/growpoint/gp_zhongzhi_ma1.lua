--������ű���������
--�ű���
--g_ScriptId = 711036

--����������
x711036_g_GpId = 537

--��һ��������ı��
x711036_g_GpIdNext = 538

function	 x711036_OnRecycle(sceneId,selfId,targetId)
	itemBoxX = GetItemBoxWorldPosX(sceneId,targetId)
	itemBoxZ = GetItemBoxWorldPosZ(sceneId,targetId)
	ItemBoxId = ItemBoxEnterScene(itemBoxX,itemBoxZ,x711036_g_GpIdNext,sceneId,0)
	
	SetItemBoxMaxGrowTime(sceneId,ItemBoxId,450000)	--�趨����ʱ��
	return 1
end
