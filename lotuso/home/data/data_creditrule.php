<?php
if(!defined('IN_UCHOME')) exit('Access Denied');
$_SGLOBAL['creditrule']=Array
	(
	'register' => Array
		(
		'rid' => 1,
		'rulename' => '��ͨ�ռ�',
		'action' => 'register',
		'cycletype' => '0',
		'cycletime' => '0',
		'rewardnum' => 1,
		'rewardtype' => 1,
		'norepeat' => '0',
		'credit' => 10,
		'experience' => '0'
		),
	'realname' => Array
		(
		'rid' => 2,
		'rulename' => 'ʵ����֤',
		'action' => 'realname',
		'cycletype' => '0',
		'cycletime' => '0',
		'rewardnum' => 1,
		'rewardtype' => 1,
		'norepeat' => '0',
		'credit' => 20,
		'experience' => 20
		),
	'realemail' => Array
		(
		'rid' => 3,
		'rulename' => '������֤',
		'action' => 'realemail',
		'cycletype' => '0',
		'cycletime' => '0',
		'rewardnum' => 1,
		'rewardtype' => 1,
		'norepeat' => '0',
		'credit' => 40,
		'experience' => 40
		),
	'invitefriend' => Array
		(
		'rid' => 4,
		'rulename' => '�ɹ��������',
		'action' => 'invitefriend',
		'cycletype' => 4,
		'cycletime' => '0',
		'rewardnum' => 20,
		'rewardtype' => 1,
		'norepeat' => '0',
		'credit' => 10,
		'experience' => 10
		),
	'setavatar' => Array
		(
		'rid' => 5,
		'rulename' => '����ͷ��',
		'action' => 'setavatar',
		'cycletype' => '0',
		'cycletime' => '0',
		'rewardnum' => 1,
		'rewardtype' => 1,
		'norepeat' => '0',
		'credit' => 15,
		'experience' => 15
		),
	'videophoto' => Array
		(
		'rid' => 6,
		'rulename' => '��Ƶ��֤',
		'action' => 'videophoto',
		'cycletype' => '0',
		'cycletime' => '0',
		'rewardnum' => 1,
		'rewardtype' => 1,
		'norepeat' => '0',
		'credit' => 40,
		'experience' => 40
		),
	'report' => Array
		(
		'rid' => 7,
		'rulename' => '�ɹ��ٱ�',
		'action' => 'report',
		'cycletype' => 4,
		'cycletime' => '0',
		'rewardnum' => '0',
		'rewardtype' => 1,
		'norepeat' => '0',
		'credit' => 2,
		'experience' => 2
		),
	'updatemood' => Array
		(
		'rid' => 8,
		'rulename' => '��������',
		'action' => 'updatemood',
		'cycletype' => 1,
		'cycletime' => '0',
		'rewardnum' => 3,
		'rewardtype' => 1,
		'norepeat' => '0',
		'credit' => 3,
		'experience' => 3
		),
	'hotinfo' => Array
		(
		'rid' => 9,
		'rulename' => '�ȵ���Ϣ',
		'action' => 'hotinfo',
		'cycletype' => 4,
		'cycletime' => '0',
		'rewardnum' => '0',
		'rewardtype' => 1,
		'norepeat' => '0',
		'credit' => 10,
		'experience' => 10
		),
	'daylogin' => Array
		(
		'rid' => 10,
		'rulename' => 'ÿ���½',
		'action' => 'daylogin',
		'cycletype' => 1,
		'cycletime' => '0',
		'rewardnum' => 1,
		'rewardtype' => 1,
		'norepeat' => '0',
		'credit' => 15,
		'experience' => 15
		),
	'visit' => Array
		(
		'rid' => 11,
		'rulename' => '���ʱ��˿ռ�',
		'action' => 'visit',
		'cycletype' => 1,
		'cycletime' => '0',
		'rewardnum' => 10,
		'rewardtype' => 1,
		'norepeat' => 2,
		'credit' => 1,
		'experience' => 1
		),
	'poke' => Array
		(
		'rid' => 12,
		'rulename' => '���к�',
		'action' => 'poke',
		'cycletype' => 1,
		'cycletime' => '0',
		'rewardnum' => 10,
		'rewardtype' => 1,
		'norepeat' => 2,
		'credit' => 1,
		'experience' => 1
		),
	'guestbook' => Array
		(
		'rid' => 13,
		'rulename' => '����',
		'action' => 'guestbook',
		'cycletype' => 1,
		'cycletime' => '0',
		'rewardnum' => 20,
		'rewardtype' => 1,
		'norepeat' => 2,
		'credit' => 2,
		'experience' => 2
		),
	'getguestbook' => Array
		(
		'rid' => 14,
		'rulename' => '������',
		'action' => 'getguestbook',
		'cycletype' => 1,
		'cycletime' => '0',
		'rewardnum' => 5,
		'rewardtype' => 1,
		'norepeat' => 2,
		'credit' => 1,
		'experience' => '0'
		),
	'doing' => Array
		(
		'rid' => 15,
		'rulename' => '�����¼',
		'action' => 'doing',
		'cycletype' => 1,
		'cycletime' => '0',
		'rewardnum' => 5,
		'rewardtype' => 1,
		'norepeat' => '0',
		'credit' => 1,
		'experience' => 1
		),
	'publishblog' => Array
		(
		'rid' => 16,
		'rulename' => '������־',
		'action' => 'publishblog',
		'cycletype' => 1,
		'cycletime' => '0',
		'rewardnum' => 3,
		'rewardtype' => 1,
		'norepeat' => '0',
		'credit' => 5,
		'experience' => 5
		),
	'uploadimage' => Array
		(
		'rid' => 17,
		'rulename' => '�ϴ�ͼƬ',
		'action' => 'uploadimage',
		'cycletype' => 1,
		'cycletime' => '0',
		'rewardnum' => 10,
		'rewardtype' => 1,
		'norepeat' => '0',
		'credit' => 2,
		'experience' => 2
		),
	'camera' => Array
		(
		'rid' => 18,
		'rulename' => '�Ĵ�ͷ��',
		'action' => 'camera',
		'cycletype' => 1,
		'cycletime' => '0',
		'rewardnum' => 5,
		'rewardtype' => 1,
		'norepeat' => '0',
		'credit' => 3,
		'experience' => 3
		),
	'publishthread' => Array
		(
		'rid' => 19,
		'rulename' => '������',
		'action' => 'publishthread',
		'cycletype' => 1,
		'cycletime' => '0',
		'rewardnum' => 5,
		'rewardtype' => 1,
		'norepeat' => '0',
		'credit' => 5,
		'experience' => 5
		),
	'replythread' => Array
		(
		'rid' => 20,
		'rulename' => '�ظ�����',
		'action' => 'replythread',
		'cycletype' => 1,
		'cycletime' => '0',
		'rewardnum' => 10,
		'rewardtype' => 1,
		'norepeat' => 1,
		'credit' => 1,
		'experience' => 1
		),
	'createpoll' => Array
		(
		'rid' => 21,
		'rulename' => '����ͶƱ',
		'action' => 'createpoll',
		'cycletype' => 1,
		'cycletime' => '0',
		'rewardnum' => 5,
		'rewardtype' => 1,
		'norepeat' => '0',
		'credit' => 2,
		'experience' => 2
		),
	'joinpoll' => Array
		(
		'rid' => 22,
		'rulename' => '����ͶƱ',
		'action' => 'joinpoll',
		'cycletype' => 1,
		'cycletime' => '0',
		'rewardnum' => 10,
		'rewardtype' => 1,
		'norepeat' => 1,
		'credit' => 1,
		'experience' => 1
		),
	'createevent' => Array
		(
		'rid' => 23,
		'rulename' => '����',
		'action' => 'createevent',
		'cycletype' => 1,
		'cycletime' => '0',
		'rewardnum' => 1,
		'rewardtype' => 1,
		'norepeat' => '0',
		'credit' => 3,
		'experience' => 3
		),
	'joinevent' => Array
		(
		'rid' => 24,
		'rulename' => '����',
		'action' => 'joinevent',
		'cycletype' => 1,
		'cycletime' => '0',
		'rewardnum' => 1,
		'rewardtype' => 1,
		'norepeat' => 1,
		'credit' => 1,
		'experience' => 1
		),
	'recommendevent' => Array
		(
		'rid' => 25,
		'rulename' => '�Ƽ��',
		'action' => 'recommendevent',
		'cycletype' => 4,
		'cycletime' => '0',
		'rewardnum' => '0',
		'rewardtype' => 1,
		'norepeat' => '0',
		'credit' => 10,
		'experience' => 10
		),
	'createshare' => Array
		(
		'rid' => 26,
		'rulename' => '�������',
		'action' => 'createshare',
		'cycletype' => 1,
		'cycletime' => '0',
		'rewardnum' => 3,
		'rewardtype' => 1,
		'norepeat' => '0',
		'credit' => 2,
		'experience' => 2
		),
	'comment' => Array
		(
		'rid' => 27,
		'rulename' => '����',
		'action' => 'comment',
		'cycletype' => 1,
		'cycletime' => '0',
		'rewardnum' => 40,
		'rewardtype' => 1,
		'norepeat' => 1,
		'credit' => 1,
		'experience' => 1
		),
	'getcomment' => Array
		(
		'rid' => 28,
		'rulename' => '������',
		'action' => 'getcomment',
		'cycletype' => 1,
		'cycletime' => '0',
		'rewardnum' => 20,
		'rewardtype' => 1,
		'norepeat' => 1,
		'credit' => 1,
		'experience' => '0'
		),
	'installapp' => Array
		(
		'rid' => 29,
		'rulename' => '��װӦ��',
		'action' => 'installapp',
		'cycletype' => 4,
		'cycletime' => '0',
		'rewardnum' => '0',
		'rewardtype' => 1,
		'norepeat' => 3,
		'credit' => 5,
		'experience' => 5
		),
	'useapp' => Array
		(
		'rid' => 30,
		'rulename' => 'ʹ��Ӧ��',
		'action' => 'useapp',
		'cycletype' => 1,
		'cycletime' => '0',
		'rewardnum' => 10,
		'rewardtype' => 1,
		'norepeat' => 3,
		'credit' => 1,
		'experience' => 1
		),
	'click' => Array
		(
		'rid' => 31,
		'rulename' => '��Ϣ��̬',
		'action' => 'click',
		'cycletype' => 1,
		'cycletime' => '0',
		'rewardnum' => 10,
		'rewardtype' => 1,
		'norepeat' => 1,
		'credit' => 1,
		'experience' => 1
		),
	'editrealname' => Array
		(
		'rid' => 32,
		'rulename' => '�޸�ʵ��',
		'action' => 'editrealname',
		'cycletype' => '0',
		'cycletime' => '0',
		'rewardnum' => 1,
		'rewardtype' => '0',
		'norepeat' => '0',
		'credit' => 5,
		'experience' => '0'
		),
	'editrealemail' => Array
		(
		'rid' => 33,
		'rulename' => '����������֤',
		'action' => 'editrealemail',
		'cycletype' => '0',
		'cycletime' => '0',
		'rewardnum' => 1,
		'rewardtype' => '0',
		'norepeat' => '0',
		'credit' => 5,
		'experience' => '0'
		),
	'delavatar' => Array
		(
		'rid' => 34,
		'rulename' => 'ͷ��ɾ��',
		'action' => 'delavatar',
		'cycletype' => '0',
		'cycletime' => '0',
		'rewardnum' => 1,
		'rewardtype' => '0',
		'norepeat' => '0',
		'credit' => 10,
		'experience' => 10
		),
	'invitecode' => Array
		(
		'rid' => 35,
		'rulename' => '��ȡ������',
		'action' => 'invitecode',
		'cycletype' => '0',
		'cycletime' => '0',
		'rewardnum' => 1,
		'rewardtype' => '0',
		'norepeat' => '0',
		'credit' => '0',
		'experience' => '0'
		),
	'search' => Array
		(
		'rid' => 36,
		'rulename' => '����һ��',
		'action' => 'search',
		'cycletype' => '0',
		'cycletime' => '0',
		'rewardnum' => 1,
		'rewardtype' => '0',
		'norepeat' => '0',
		'credit' => 1,
		'experience' => '0'
		),
	'blogimport' => Array
		(
		'rid' => 37,
		'rulename' => '��־����',
		'action' => 'blogimport',
		'cycletype' => '0',
		'cycletime' => '0',
		'rewardnum' => 1,
		'rewardtype' => '0',
		'norepeat' => '0',
		'credit' => 10,
		'experience' => '0'
		),
	'modifydomain' => Array
		(
		'rid' => 38,
		'rulename' => '�޸�����',
		'action' => 'modifydomain',
		'cycletype' => '0',
		'cycletime' => '0',
		'rewardnum' => 1,
		'rewardtype' => '0',
		'norepeat' => '0',
		'credit' => 5,
		'experience' => '0'
		),
	'delblog' => Array
		(
		'rid' => 39,
		'rulename' => '��־��ɾ��',
		'action' => 'delblog',
		'cycletype' => '0',
		'cycletime' => '0',
		'rewardnum' => 1,
		'rewardtype' => '0',
		'norepeat' => '0',
		'credit' => 10,
		'experience' => 10
		),
	'deldoing' => Array
		(
		'rid' => 40,
		'rulename' => '��¼��ɾ��',
		'action' => 'deldoing',
		'cycletype' => '0',
		'cycletime' => '0',
		'rewardnum' => 1,
		'rewardtype' => '0',
		'norepeat' => '0',
		'credit' => 2,
		'experience' => 2
		),
	'delimage' => Array
		(
		'rid' => 41,
		'rulename' => 'ͼƬ��ɾ��',
		'action' => 'delimage',
		'cycletype' => '0',
		'cycletime' => '0',
		'rewardnum' => 1,
		'rewardtype' => '0',
		'norepeat' => '0',
		'credit' => 4,
		'experience' => 4
		),
	'delpoll' => Array
		(
		'rid' => 42,
		'rulename' => 'ͶƱ��ɾ��',
		'action' => 'delpoll',
		'cycletype' => '0',
		'cycletime' => '0',
		'rewardnum' => 1,
		'rewardtype' => '0',
		'norepeat' => '0',
		'credit' => 4,
		'experience' => 4
		),
	'delthread' => Array
		(
		'rid' => 43,
		'rulename' => '���ⱻɾ��',
		'action' => 'delthread',
		'cycletype' => '0',
		'cycletime' => '0',
		'rewardnum' => 1,
		'rewardtype' => '0',
		'norepeat' => '0',
		'credit' => 4,
		'experience' => 4
		),
	'delevent' => Array
		(
		'rid' => 44,
		'rulename' => '���ɾ��',
		'action' => 'delevent',
		'cycletype' => '0',
		'cycletime' => '0',
		'rewardnum' => 1,
		'rewardtype' => '0',
		'norepeat' => '0',
		'credit' => 6,
		'experience' => 6
		),
	'delshare' => Array
		(
		'rid' => 45,
		'rulename' => '����ɾ��',
		'action' => 'delshare',
		'cycletype' => '0',
		'cycletime' => '0',
		'rewardnum' => 1,
		'rewardtype' => '0',
		'norepeat' => '0',
		'credit' => 4,
		'experience' => 4
		),
	'delguestbook' => Array
		(
		'rid' => 46,
		'rulename' => '���Ա�ɾ��',
		'action' => 'delguestbook',
		'cycletype' => '0',
		'cycletime' => '0',
		'rewardnum' => 1,
		'rewardtype' => '0',
		'norepeat' => '0',
		'credit' => 4,
		'experience' => 4
		),
	'delcomment' => Array
		(
		'rid' => 47,
		'rulename' => '���۱�ɾ��',
		'action' => 'delcomment',
		'cycletype' => '0',
		'cycletime' => '0',
		'rewardnum' => 1,
		'rewardtype' => '0',
		'norepeat' => '0',
		'credit' => 2,
		'experience' => 2
		)
	)
?>