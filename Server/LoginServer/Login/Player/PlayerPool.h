

#ifndef __PLAYERPOOL_H__
#define __PLAYERPOOL_H__

#include "Type.h"
#include "LoginPlayer.h"



//����������ݵ����ݳ�
//

class PlayerPool
{

	
public :
	PlayerPool( ) ;
	~PlayerPool( ) ;

	//��ʼ�����ݳ�
	BOOL				Init( uint MaxPlayerCount = MAX_POOL_SIZE ) ;
	
	//ȡ��ShareMem�ĳ�ʼ��
	//BOOL				PostInit();


	//������ҵ�PlayerIDȡ������ָ��
	LoginPlayer*			GetPlayer( PlayerID_t PlayerID )
	{
		if( PlayerID==INVALID_ID || PlayerID>=(PlayerID_t)m_MaxPlayerCount || PlayerID<0 )
			return NULL ;
		return &(m_pPlayer[PlayerID]) ;
	};

	//�ӿ������ݳ������һ���������
	LoginPlayer*			NewPlayer( ) ;
	LoginPlayer*			NewPlayer(PlayerID_t PlayerID);
	//��һ�����������ջ���
	VOID				DelPlayer( PlayerID_t PlayerID ) ;

private :
	LoginPlayer*		m_pPlayer ;
	uint				m_Position ;

	MyLock				m_Lock ;
	uint				m_PlayerCount ;

	uint				m_MaxPlayerCount ;


	
	VOID				SetPosition(uint pos);



};


extern PlayerPool* g_pPlayerPool ;


#endif