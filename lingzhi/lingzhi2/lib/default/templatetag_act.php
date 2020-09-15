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
 * @version:    v3.0 r20100724 rc1
 * ---------------------------------------------
 * $Id: announ_act.php Sat Dec 06 09:43:17 CST 2008
 */

if (!defined('ROOT')) exit('Can\'t Access !');

class templatetag_act extends act {
	function init() {


	}

	function get_action() {
        front::check_type(front::get('id'));
		$tagid=front::get('id');
		echo tool::text_javascript(templatetag::tag($tagid));
	}

	function test_action() {
        front::check_type(front::get('id'));
		$tagid=front::get('id');
		echo templatetag::tag($tagid);
	}

	function visual_action() {
		if($this->view->usergroupid != '888') exit('PAGE NOT FOUND!');
		
		$id=front::get('id');
		$tpl=str_replace('_d_','/',$id);
		$tpl=str_replace('#','',$tpl);
		$tpl=str_replace('_html','.html',$tpl);
		$content=file_get_contents(TEMPLATE.'/'.config::get('template_dir').'/'.$tpl);
		echo @front::$view->_eval(front::$view->compile($content));
		$this->render('../admin/system/tag_visual.php');
	}
}