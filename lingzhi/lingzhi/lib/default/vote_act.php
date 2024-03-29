<?php
/**
 * cmseasy: vote_act.php
 * ============================================================================
 * 版权所有 2008-2009 cmseasy，并保留所有权利。
 * -------------------------------------------------------
 * 这不是一个自由软件！也不是一个开源软件！您不能在任何目的的前提下对程序代码进行破解、修改和使用；
 * 不允许对程序代码以任何形式任何目的的再发布。
 * ============================================================================
 *
 * @version:    v1.7.091010
 * ---------------------------------------------
 * $Id: vote_act.php Sat Dec 06 17:13:23 CST 2008
 */


if (!defined('ROOT')) exit('Can\'t Access !');

class vote_act extends act {
    function init() {
        //会员
        if(cookie::get('login_username') && cookie::get('login_password')) {
            $user=new user();
            $user=$user->getrow(array('username'=>cookie::get('login_username')));
            if(is_array($user) && cookie::get('login_password')==front::cookie_encode($user['password'])) {
                $this->view->user=$user;
                $this->view->usergroupid=$user['groupid'];

            }
        }
        else $this->view->usergroupid=0;
    }

    function do_action() {

        if(front::post('submit') && front::post('vote') && front::post('aid')) {
            front::check_type(front::post('aid'));

            if(!isset($this->view->user)) front::flash('请登陆！');

            $vote=new vote();
            $_vote=$vote->getrow('aid='.front::post('aid'));

            if(eregi($this->view->user['username'].',',$_vote['users'])) {
                front::flash('不能重复投票！');
                front::redirect(front::$from);
            }

            $_votes=$_vote['votes'];
            if(!$_votes) $_votes=array();
            else $_votes=unserialize($_votes);

            $_votes[front::post('vote')]=$_votes[front::post('vote')]+1;
            $votes=serialize($_votes);

            $vote_data=array_merge($_vote,array('votes'=>$votes,'aid'=>front::post('aid'),'users'=>$_vote['users'].$this->view->user['username'].','));
            $vote->rec_replace($vote_data,front::post('aid'));
            front::flash('投票成功！');
        }else {
            front::flash('投票失败！');
        }
        front::redirect(front::$from);
    }

    function view_action() {
        $this->view->aid=front::get('aid');
        echo tool::text_javascript($this->fetch());
    }

    function show_action() {
        $this->render();
    }

}

