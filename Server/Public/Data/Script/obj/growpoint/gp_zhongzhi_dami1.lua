--������ű�����������
--�ű���
--g_ScriptId = 711003

--����������
x711003_g_GpId = 504

--��һ��������ı��
x711003_g_GpIdNext = 505

function	 x711003_OnRecycle(sceneId,selfId,targetId)
	itemBoxX = GetItemBoxWorldPosX(sceneId,targetId)
	itemBoxZ = GetItemBoxWorldPosZ(sceneId,targetId)
	ItemBoxId = ItemBoxEnterScene(itemBoxX,itemBoxZ,x711003_g_GpIdNext,sceneId,0)
	
	SetItemBoxMaxGrowTime(sceneId,ItemBoxId,450000)	--�趨����ʱ��
	return 1
end
