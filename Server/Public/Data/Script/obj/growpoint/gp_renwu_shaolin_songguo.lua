--������
--�ɹ�
--�ű���715009
--�ɹ�100%
--�ȼ�1

--ÿ�δ򿪱ض���õĲ�Ʒ
x715009_g_MainItemId = 40002127
--�����
x715009_g_MissionId = 1060

--���ɺ�����ʼ************************************************************************
--ÿ��ItemBox�����10����Ʒ
function	x715009_OnCreate(sceneId,growPointType,x,y)
	--����ItemBoxͬʱ����һ����Ʒ
	ItemBoxEnterScene(x,y,growPointType,sceneId,1,x715009_g_MainItemId)	--ÿ�������������ܵõ�һ����Ʒ,����ֱ�ӷ���itembox��һ��
end
--���ɺ�������**********************************************************************


--��ǰ������ʼ&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	x715009_OnOpen(sceneId,selfId,targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x715009_g_MissionId)			--�õ���������к�
	if	IsHaveMission(sceneId,selfId,x715009_g_MissionId) > 0	 then
		if	GetMissionParam( sceneId, selfId, misIndex,5) == 3  then
			return OR_OK
		else
			return OR_U_CANNT_DO_THIS_RIGHT_NOW
		end
	else
		return OR_MISSION_NOT_FIND
	end
end
--��ǰ��������&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


--���պ�����ʼ########################################################################
function	x715009_OnRecycle(sceneId,selfId,targetId)
	--����1�����������
	return 1
end
--���պ�������########################################################################



--�򿪺�����ʼ@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x715009_OnProcOver(sceneId,selfId,targetId)
	return 0
end
--�򿪺�������@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
