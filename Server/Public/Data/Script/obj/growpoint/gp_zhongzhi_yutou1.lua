--������ű�����ͷ����
--�ű���
--g_ScriptId = 711033

--����������
x711033_g_GpId = 534

--��һ��������ı��
x711033_g_GpIdNext = 535

function	 x711033_OnRecycle(sceneId,selfId,targetId)
	itemBoxX = GetItemBoxWorldPosX(sceneId,targetId)
	itemBoxZ = GetItemBoxWorldPosZ(sceneId,targetId)
	ItemBoxId = ItemBoxEnterScene(itemBoxX,itemBoxZ,x711033_g_GpIdNext,sceneId,0)
	
	SetItemBoxMaxGrowTime(sceneId,ItemBoxId,450000)	--�趨����ʱ��
	return 1
end
