--��ҽ���һ�� area ʱ����
function x400913_OnEnterArea( sceneId, selfId )
	if	IsHaveMission( sceneId, selfId, 702)>0	then
		CallScriptFunction((210222), "OnAbandon",sceneId, selfId)
	elseif	IsHaveMission( sceneId, selfId, 711)>0	then
		CallScriptFunction((210231), "OnAbandon",sceneId, selfId)
	elseif	IsHaveMission( sceneId, selfId, 1061)>0	then
		CallScriptFunction((220901), "OnAbandon",sceneId, selfId)
	end
	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 2,275,50)
end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x400913_OnTimer( sceneId, selfId )
	-- ���룬������� area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5�����δ����
	if StandingTime >= 5000 then
		x400913_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪һ�� area ʱ����
function x400913_OnLeaveArea( sceneId, selfId )
end
