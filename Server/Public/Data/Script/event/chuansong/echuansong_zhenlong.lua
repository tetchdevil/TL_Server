--��ҽ���һ�� area ʱ����
function x400915_OnEnterArea( sceneId, selfId )
	if	IsHaveMission( sceneId, selfId, 4013)>0	then
		CallScriptFunction((231001), "OnAbandon",sceneId, selfId)
	end
end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x400915_OnTimer( sceneId, selfId )
	-- ���룬������� area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5�����δ����
	if StandingTime >= 5000 then
		x400915_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪һ�� area ʱ����
function x400915_OnLeaveArea( sceneId, selfId )
end
