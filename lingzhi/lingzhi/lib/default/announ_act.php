<?php
/**
 * cmseasy: announ_act.php
 * ============================================================================
 * 版权所有 2008-2009 cmseasy，并保留所有权利。
 * -------------------------------------------------------
 * 这不是一个自由软件！也不是一个开源软件！您不能在任何目的的前提下对程序代码进行破解、修改和使用；
 * 不允许对程序代码以任何形式任何目的的再发布。
 * ============================================================================
 *
 * @version:    v1.7.091010
 * ---------------------------------------------
 * $Id: announ_act.php Sat Dec 06 09:43:17 CST 2008
 */

if (!defined('ROOT')) exit('Can\'t Access !');

class announ_act extends act {
	function init() {

	}

	function show_action() {
        front::check_type(front::get('id'));
		$announcement=new announcement();
		$this->view->announ=$announcement->getrow(front::get('id'));
	}

	function end() {
		if(front::$debug)
		$this->render('style/index.html');
		else
		$this->render();
	}

}