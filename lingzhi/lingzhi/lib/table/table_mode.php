<?php
/**
 * cmseasy: table_mode.php
 * ============================================================================
 * 版权所有 2008-2009 cmseasy，并保留所有权利。
 * -------------------------------------------------------
 * 这不是一个自由软件！也不是一个开源软件！您不能在任何目的的前提下对程序代码进行破解、修改和使用；
 * 不允许对程序代码以任何形式任何目的的再发布。
 * ============================================================================
 *
 * @version:    v1.7.091010
 * ---------------------------------------------
 * $Id: table_mode.php Fri Jan 09 20:06:50 CST 2009
 */
if (!defined('ROOT')) exit('Can\'t Access !');

class table_mode {

    function vaild() {
        return true;
    }

    function filter() {

        foreach(front::$post as $key =>$value) {
            if(is_string($value))
            front::$post[$key]=tool::filterXss($Exc ? $value : tool::removehtml($value));
        }
    }

    function add_before() {

    }

    function add_after() {

    }

    function edit_before() {

    }

    //@编辑的数据进入数据库前处理
    function save_before() {
    //多选
        foreach(front::$post as $k=>$p) {
            if(preg_match('/^my_/',$k) && is_array($p))  front::$post[$k]=implode(',',$p);
            if(preg_match('/^attr1/',$k))  front::$post[$k]=implode(',',$p);
        }
    }

    function save_after() {
    }

    //@从数据库读出数据显示前处理
    function view_before() {

    }

    function delete_before() {

    }
    
    function delete_after() {

    }
}