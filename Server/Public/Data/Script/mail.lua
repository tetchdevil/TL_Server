
--�ű��ʼ��Ľű��ļ�

--�ű���
x888889_g_scriptId = 888889


function x888889_ExecuteMail( sceneId, selfId, param0, param1, param2, param3 )

	if param0 == MAIL_REPUDIATE then
		x888889_Mail_Repudiate( sceneId, selfId, param0, param1, param2, param3 )
	elseif param0 == MAIL_BETRAYMASTER then
		x888889_Mail_BetrayMaster( sceneId, selfId, param0, param1, param2, param3 )
	elseif param0 == MAIL_EXPELPRENTICE then
		x888889_Mail_ExpelPrentice( sceneId, selfId, param0, param1, param2, param3 )
	elseif param0 == MAIL_UPDATE_ATTR then
		LuaFnUpdateAttr(sceneId, selfId, param0, param1, param2, param3)
	end

end

function x888889_Mail_Repudiate( sceneId, selfId, param0, param1, param2, param3 )

	SpouseGUID = LuaFnGetSpouseGUID( sceneId, selfId )

	--ɾ���ƺţ�
	LuaFnAwardSpouseTitle( sceneId, selfId, "" )
	DispatchAllTitle( sceneId, selfId )

	--ɾ����������
	Skills = {260, 261}
	for i, skillId in Skills do
		DelSkill( sceneId, selfId, skillId )
	end

	--���ӽ�ǮN=100000��Ϊ������
	LuaFnAddMoney( sceneId, selfId, 100000 )

	--����һ����Ʒ��˼����Ϊ������������ռ乻���������ˣ�
	LuaFnBeginAddItem( sceneId )
	LuaFnAddItem( sceneId, 30002002, 1 )
	ret = LuaFnEndAddItem( sceneId, selfId )

	if ret == 1 then
		LuaFnAddItemListToHuman( sceneId, selfId )
	end

	--�ͶԷ��ĺ��Ѷ����ó�N=X��10��
	LuaFnSetFriendPointByGUID( sceneId, selfId, SpouseGUID, 10 )

	--ɾ�����״̬��
	LuaFnDivorce( sceneId, selfId )

end

function x888889_Mail_BetrayMaster( sceneId, selfId, param0, param1, param2, param3 )
	--����ͽ��
	LuaFnExpelPrentice( sceneId, selfId, param1 )
end

function x888889_Mail_ExpelPrentice( sceneId, selfId, param0, param1, param2, param3 )
	--ɾ��ͽ�ܳƺ�
	LuaFnAwardSpouseTitle( sceneId, selfId, "" )
	DispatchAllTitle( sceneId, selfId )

	--�뿪ʦ��
	LuaFnBetrayMaster( sceneId, selfId )
end
