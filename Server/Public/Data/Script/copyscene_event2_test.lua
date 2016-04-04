--��������

--�ű���
x805002_g_scriptId =805002

x805002_g_copysceneName="�굶�ߵ�"

--**********************************
--��ں���
--**********************************
function x805002_OnDefaultEvent( sceneId, selfId, targetId )
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)

	LuaFnSetSceneLoad_Map(sceneId, "suzhou.nav"); --��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�

	LuaFnSetSceneLoad_Monster(sceneId, "suzhou_monster.ini");
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, 15000);
	LuaFnSetCopySceneData_Timer(sceneId, 0);
	LuaFnSetCopySceneData_Param(sceneId, 0, 888);--���ø������ݣ����ｫ0����������������Ϊ888�����ڱ�ʾ������888(�����Զ���)
	LuaFnSetCopySceneData_Param(sceneId, 1, 805002);--��1����������Ϊ���������¼��ű���

	LuaFnCreateCopyScene(); --��ʼ����ɺ���ô�����������
end

--**********************************
--�����¼�
--**********************************
function x805002_OnCopySceneReady( sceneId, destsceneId )
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId) ;	
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid);
	NewWorld( sceneId, leaderObjId, destsceneId, 11, 11 ) ;
end

--**********************************
--�о��¼�
--**********************************
function x805002_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId, x805002_g_scriptId,x805002_g_copysceneName);
end

--**********************************
--����������
--**********************************
function x805002_CheckAccept( sceneId, selfId )
	return 1
end

--**********************************
--����
--**********************************
function x805002_OnAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x805002_OnAbandon( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x805002_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x805002_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x805002_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--ɱ����������
--**********************************
function x805002_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x805002_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x805002_OnItemChanged( sceneId, selfId, itemdataId )
end







