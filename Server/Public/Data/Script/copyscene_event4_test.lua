--��������

--�ű���
x805004_g_scriptId =805004

x805004_g_copysceneName="˹̹��ķ"

--**********************************
--��ں���
--**********************************
function x805004_OnDefaultEvent( sceneId, selfId, targetId )
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)

	LuaFnSetSceneLoad_Map(sceneId, "luoyang.nav"); --��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�

	LuaFnSetSceneLoad_Monster(sceneId, "luoyang_monster.ini");
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, 15000);
	LuaFnSetCopySceneData_Timer(sceneId, 0);
	LuaFnSetCopySceneData_Param(sceneId, 0, 666);--���ø������ݣ����ｫ0����������������Ϊ666�����ڱ�ʾ������666(�����Զ���)
	LuaFnSetCopySceneData_Param(sceneId, 1, 805004);--��1����������Ϊ���������¼��ű���

	LuaFnCreateCopyScene(); --��ʼ����ɺ���ô�����������
end

--**********************************
--�����¼�
--**********************************
function x805004_OnCopySceneReady( sceneId, destsceneId )
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId) ;	
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid);
	NewWorld( sceneId, leaderObjId, destsceneId, 11, 11 ) ;
end


--**********************************
--�о��¼�
--**********************************
function x805004_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId, x805004_g_scriptId,x805004_g_copysceneName);
end

--**********************************
--����������
--**********************************
function x805004_CheckAccept( sceneId, selfId )
	return 1
end

--**********************************
--����
--**********************************
function x805004_OnAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x805004_OnAbandon( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x805004_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x805004_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x805004_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--ɱ����������
--**********************************
function x805004_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x805004_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x805004_OnItemChanged( sceneId, selfId, itemdataId )
end







