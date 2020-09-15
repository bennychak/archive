<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of guestbook_act
 *
 * 
 */
class guestbook_act extends act {

    function init() {

        $user='';
        if(cookie::get('login_username') && cookie::get('login_password')) {
            $user=new user();
            $user=$user->getrow(array('username'=>cookie::get('login_username')));
        }
        //    if(!$user)  front::redirect(url::create('user/login'));
        $this->view->user=$user;
        $this->_user=new user;

        $this->table='guestbook';
        $this->_table=new $this->table;
        if(!$this->_table->getFields()) exit('PAGE NOT FOUND!');

        $this->view->form=$this->_table->get_form();

        $this->_pagesize=config::get('manage_pagesize');

        $this->view->manage=$this->table;
        $this->view->primary_key=$this->_table->primary_key;

        $fieldlimit=$this->_table->getcols(front::$act=='list'?'user_list':'user_modify');
        $field=$this->_table->getFields();
        helper::filterField($field,$fieldlimit);
        $this->view->field=$field;

        if(!front::get('page')) front::$get['page']=1;
    }


    function index_action() {
        $this->list_action();

        if(front::post('submit')) {

            if(!front::post('title')) {
                front::flash('请填写标题！');
                return false;
            }
            if(!front::post('content')) {
                front::flash('请选择内容！');
                return false;
            }
			
			if(config::get('verifycode')){
				if(front::post('verify')<>session::get('verify')) {
					front::flash('验证码错误！');
					return false;
				}
			}

            front::$post['checked']=0;

            if(empty($this->view->user)) {
                front::$post['userid']=0;
                front::$post['username']='游客：'. front::$post['nickname'];
            }else {
                front::$post['userid']=$this->view->user['userid'];
                front::$post['username']=$this->view->user['username'];
            }

            front::$post['adddate']=date('Y-m-d H:i:s');
            front::$post['ip']=front::ip();

            
			if (!get_magic_quotes_gpc()) {
				front::$post['content'] = addslashes(front::$post['content']);
			} 
			//front::$post['content']=htmlspecialchars(front::$post['content']);
            front::$post['title']=strip_tags(front::$post['title']);

            $data=front::$post;

            $insert=$this->_table->rec_insert($data);
            if($insert<1) {
                front::flash('留言失败！');
            }
            else {
                front::flash('留言成功！');
                $this->view->submit_success=true;
                front::redirect(url::create('guestbook/index/success/'.time()));
            }
        }

    }


    function list_action() {
     //   if(empty($this->view->user['userid'])) return;

        $limit=((front::get('page')-1)*config::get('list_pagesize')).','.config::get('list_pagesize');

        $where=null;//="userid={$this->view->user['userid']}";
        $this->_view_table=$this->_table->getrows($where,$limit,'1 desc',$this->_table->getcols('user_list'));
        $this->view->record_count=$this->_table->record_count;
    }

    function view($table) {
        $this->view->data=$table['data'];
    }

    function end() {
        if(!isset($this->_view_table['data']) && isset($this->_view_table))
            $this->_view_table['data']=$this->_view_table;

        if(isset($this->_view_table))
            $this->view($this->_view_table);

        $this->render();
    }

}

