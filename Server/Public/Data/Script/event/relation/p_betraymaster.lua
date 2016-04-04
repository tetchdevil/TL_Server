-- ��ʦ����

--�ű���
x806006_g_scriptId = 806006

--��ʦ
x806006_g_BetrayMaster = {}
x806006_g_BetrayMaster["Id"] = 1005
x806006_g_BetrayMaster["Name"] = "��ʦ"


--**********************************
--������ں���
--**********************************
function x806006_OnDefaultEvent( sceneId, selfId, targetId )
	if x806006_CheckSubmit( sceneId, selfId ) > 0 then
		x806006_OnAccept( sceneId, selfId )
	end
end

--**********************************
--�о��¼�
--**********************************
function x806006_OnEnumerate( sceneId, selfId, targetId )
	if x806006_CheckAccept(sceneId, selfId) > 0 then
		AddNumText(sceneId, x806006_g_scriptId, x806006_g_BetrayMaster["Name"]);
	end
end

--**********************************
--����������
--**********************************
function x806006_CheckAccept( sceneId, selfId )

	--��飺
	--������ʦ��
	if LuaFnHaveMaster( sceneId, selfId ) == 0 then
		return 0
	end

	--ͽ�����Ͻ�Ǯ���ڵ���N=20000
	if LuaFnGetMoney( sceneId, selfId ) < 20000 then
		return 0
	end

	return 1

end

--**********************************
--����Ƿ������ʦ
--**********************************
function x806006_CheckSubmit( sceneId, selfId )

	if x806006_CheckAccept( sceneId, selfId ) == 1 then
		return 1
	end

	return 0

end

--**********************************
--����
--**********************************
function x806006_OnAccept( sceneId, selfId )
	--�۳����Ͻ�Ǯ20000��
	LuaFnCostMoney( sceneId, selfId, 20000 )

	MasterGUID = LuaFnGetMasterGUID( sceneId, selfId )

	MasterName = LuaFnGetFriendName( sceneId, selfId, MasterGUID )
	selfName = LuaFnGetName( sceneId, selfId )

	--����ͨ�ʼ���ʦ��
	LuaFnSendNormalMail( sceneId, selfId, MasterName, "���ͽ��" .. selfName .. "�����ڼ����������£�������������ʦͽ��ϵ��" )

	MyGUID = LuaFnGetGUID( sceneId, selfId )

	--����ִ���ʼ���ʦ��
	LuaFnSendScriptMail( sceneId, MasterName, MAIL_BETRAYMASTER, MyGUID, 0, 0 )

	--ɾ��ͽ�ܳƺ�
	LuaFnAwardSpouseTitle( sceneId, selfId, "" )
	DispatchAllTitle( sceneId, selfId )

	--����ִ����ʦ
	LuaFnBetrayMaster( sceneId, selfId )
end
