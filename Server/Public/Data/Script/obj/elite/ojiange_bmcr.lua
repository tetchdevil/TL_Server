--����Ӣ����
--[����]��é����
--����

x320703_g_PosCount =10
x320703_g_RespawnPos={	
			{x=197,z=216},
			{x=202,z=204},
			{x=237,z=272},
			{x=274,z=280},
			{x=275,z=225},
			{x=169,z=195},
			{x=143,z=173},
			{x=134,z=106},
			{x=169,z=151},
			{x=214,z=171}
		}

--**********************************
--�¼��������
--**********************************
function x320703_OnDefaultEvent( sceneId, selfId,targetId )
	
end

function x320703_OnDie( sceneId, selfId, killerId )
	pos = random(1,x320703_g_PosCount)
	SetRevPos(sceneId, selfId, x320703_g_RespawnPos[pos].x,x320703_g_RespawnPos[pos].z )
end
