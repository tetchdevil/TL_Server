--��ҽ���һ�� area ʱ����
function x400914_OnEnterArea( sceneId, selfId )
	if	IsHaveMission( sceneId, selfId, 4012)>0	then
		CallScriptFunction((231000), "OnAbandon",sceneId, selfId)
	end
end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x400914_OnTimer( sceneId, selfId )
	-- ���룬������� area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5�����δ����
	if StandingTime >= 5000 then
		x400914_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪һ�� area ʱ����
function x400914_OnLeaveArea( sceneId, selfId )
end
