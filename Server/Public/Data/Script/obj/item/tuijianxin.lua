function x300019_OnDefaultEvent( sceneId, selfId, targetId )	
	BeginEvent(sceneId)
			AddText(sceneId,"�Ŵ����ɵ��ֵܽ����ǣ�#r#r���Ǻã�#r#r����������ļ��ܴ��ڸ�����ŵĳ����ˣ�������Ǵ�����Ĵ�������������ε����ѡ�лл��");
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end


function x300019_IsSkillLikeScript( sceneId, selfId)
	return 0;
end
