--���ͺ���
x400900_g_scriptId=400900
--���ͺ���
x400900_g_scriptId=400900

function	x400900_TransferFunc(sceneId, selfId, newSceneId, posX, posY)
	--������û�д������״̬,��ֱ�Ӵ���
	local life=LuaFnIsCharacterLiving( sceneId,selfId)
	if	life==0	then
		return
	else
		if	GetTeamId( sceneId, selfId)<0	then
			NewWorld(sceneId, selfId, newSceneId, posX, posY)
		--�����Ҵ������״̬����������Ӹ���״̬,��ֱ�Ӵ���
		elseif	IsTeamFollow(sceneId, selfId)~=1	then
			NewWorld(sceneId, selfId, newSceneId, posX, posY)
		--�����Ҵ�����Ӹ���״̬,������Ƕӳ�,��С�Ӵ���
		elseif	LuaFnIsTeamLeader(sceneId,selfId)==1	 then
			num=LuaFnGetFollowedMembersCount( sceneId, selfId)
			local mems = {}
			for	i=0,num-1 do
				mems[i] = GetFollowedMember(sceneId, selfId, i)
				if mems[i] == -1 then
					return
				end
			end
			for	i=0,num-1 do
				NewWorld(sceneId, mems[i], newSceneId, posX, posY)
			end
		--�����Ҵ�����Ӹ���״̬,�Ҳ��Ƕӳ�,�򡭡����Է�����ϢҲ�ð�
		end
	end
end
