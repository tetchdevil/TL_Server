--��������

--�ű���
x805003_g_scriptId =805003

x805003_g_copysceneName="������"

--**********************************
--��ں���
--**********************************
function x805003_OnDefaultEvent( sceneId, selfId, targetId )
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)

	LuaFnSetSceneLoad_Map(sceneId, "changbai.nav"); --��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�

	LuaFnSetSceneLoad_Monster(sceneId, "changbai_monster.ini");
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, 15000);
	LuaFnSetCopySceneData_Timer(sceneId, 0);
	LuaFnSetCopySceneData_Param(sceneId, 0, 777);--���ø������ݣ����ｫ0����������������Ϊ777�����ڱ�ʾ������777(�����Զ���)
	LuaFnSetCopySceneData_Param(sceneId, 1, 805003);--��1����������Ϊ���������¼��ű���

	LuaFnCreateCopyScene(); --��ʼ����ɺ���ô�����������
end

--**********************************
--�����¼�
--**********************************
function x805003_OnCopySceneReady( sceneId, destsceneId )
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId) ;	
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid);
	NewWorld( sceneId, leaderObjId, destsceneId, 11, 11 ) ;
end


--**********************************
--�о��¼�
--**********************************
function x805003_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId, x805003_g_scriptId,x805003_g_copysceneName);
end

--**********************************
--����������
--**********************************
function x805003_CheckAccept( sceneId, selfId )
	return 1
end

--**********************************
--����
--**********************************
function x805003_OnAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x805003_OnAbandon( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x805003_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x805003_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x805003_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--ɱ����������
--**********************************
function x805003_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x805003_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x805003_OnItemChanged( sceneId, selfId, itemdataId )
end







