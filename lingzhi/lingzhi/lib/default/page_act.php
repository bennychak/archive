<?php
/**
 * cmseasy: page_act.php
 * ============================================================================
 * 版权所有 2008-2009 cmseasy，并保留所有权利。
 * -------------------------------------------------------
 * 这不是一个自由软件！也不是一个开源软件！您不能在任何目的的前提下对程序代码进行破解、修改和使用；
 * 不允许对程序代码以任何形式任何目的的再发布。
 * ============================================================================
 *
 * @version:    v1.7.091010
 * ---------------------------------------------
 * $Id: page_act.php Thu Jan 22 21:19:33 CST 2009
 */


if (!defined('ROOT')) exit('Can\'t Access !');

class page_act extends act {
	function init() {
		$this->render('page/'.front::$act.'.html');
		exit;
	}
}