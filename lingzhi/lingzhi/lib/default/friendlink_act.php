<?php
/**
 * cmseasy: index_act.php
 * ============================================================================
 * 版权所有 2008-2009 cmseasy，并保留所有权利。
 * -------------------------------------------------------
 * 这不是一个自由软件！也不是一个开源软件！您不能在任何目的的前提下对程序代码进行破解、修改和使用；
 * 不允许对程序代码以任何形式任何目的的再发布。
 * ============================================================================
 *
 * @version:    v1.7.091010
 * ---------------------------------------------
 * $Id: index_act.php Sat Dec 06 09:43:28 CST 2008
 */

if (!defined('ROOT')) exit('Can\'t Access !');

class friendlink_act extends act{

	function click_action() {		    
            $friendlink=new friendlink();
            $friendlink->rec_update(array('hits'=>'[hits+1]'),front::get('id'));
			$where=" id=".front::get('id')." ";
			$friendlinks=$friendlink->getrows($where, $limit, 'listorder asc,id asc');
			$url=$friendlinks[0][url];		
			header("location: $url");  
	}


}