<?php
/**
 * cmseasy: index_admin.php
 * ============================================================================
 * 版权所有 2008-2009 cmseasy，并保留所有权利。
 * -------------------------------------------------------
 * 这不是一个自由软件！也不是一个开源软件！您不能在任何目的的前提下对程序代码进行破解、修改和使用；
 * 不允许对程序代码以任何形式任何目的的再发布。
 * ============================================================================
 *
 * @version:    v1.7.091010
 * ---------------------------------------------
 * $Id: index_admin.php Sat Dec 06 09:42:37 CST 2008
 */

if (!defined('ROOT')) exit('Can\'t Access !');

class index_admin extends admin {
	function init() {

	}


	function index_action() {
		session::del('mod');
	}

	function logout_action() {
		cookie::del('login_username');
		cookie::del('login_password');
		session::del('username');
		
		require_once ROOT.'/celive/include/config.inc.php';
		require_once ROOT.'/celive/include/celive.class.php';
		$login = new celive();
		$login->auth();		
		$GLOBALS['auth']->logout();
		$GLOBALS['auth']->check_logout1();
		
		front::redirect(url::create('index'));
	}

	function end(){
		$this->render('index.php');
	}
}