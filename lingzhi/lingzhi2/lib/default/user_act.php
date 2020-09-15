<?php
/**
 * MyCMS: user_act.php
 * ============================================================================
 * 版权所有 2008-2009 MyCMS，并保留所有权利。
 * -------------------------------------------------------
 * 这不是一个自由软件！也不是一个开源软件！您不能在任何目的的前提下对程序代码进行破解、修改和使用；
 * 不允许对程序代码以任何形式任何目的的再发布。
 * ============================================================================
 *
 * @version:    v1.5.090422
 * ---------------------------------------------
 * $Id: user_act.php Sat Dec 06 17:13:23 CST 2008
 */


if (!defined('ROOT')) exit('Can\'t Access !');

class user_act extends act {
    function init() {
        $user='';
        if(cookie::get('login_username') && cookie::get('login_password')) {
            $user=new user();
            $user=$user->getrow(array('username'=>cookie::get('login_username')));
        }
        //phpox1115 用户找回密码
        if(!is_array($user) && front::$act != 'login' && front::$act != 'register' && front::$act != 'login_js' && front::$act != 'login_success' && front::$act != 'getpass'  && front::$act != 'edit')  front::redirect(url::create('user/login'));
        else $this->view->user=$user;

        $this->_user=new user;
        $this->view->form = $this->_user->get_form();
        $this->view->field = $this->_user->getFields();
        $this->view->primary_key=$this->_user->primary_key;
    }

    function index_action() {
    	$this->view->data=$this->view->user;
    }
    
    function edit_action() {
    	if(front::post('submit')) {
    		$this->_user->rec_update(front::$post,'userid='.$this->view->user['userid']);
    		
            front::flash('修改资料成功！');
            front::redirect(url::create('user/index'));
    	}
    	$this->view->data=$this->view->user;
    }

    function login_action() {
        if(!$this->loginfalsemaxtimes())
        if(front::post('submit')) {

        if(config::get('verifycode')){
		//verify
            if(!session::get('verify') || front::post('verify')<>session::get('verify')) {
                front::flash('验证码错误！');
                return;
            }
		}

            if(front::post('username') && front::post('password')) {

                $username=front::post('username');
                $password=md5(front::post('password'));

                $data=array(
                    'username'=>$username,
                    'password'=>$password,
                );

                $user=new user();
                $user=$user->getrow(array('username'=>$data['username'],'password'=>$data['password']));

                if(!is_array($user)) {
                    $this->login_false();
                    return;
                }

                //写入cookie
                $user=$data;
                cookie::set('login_username',$user['username']);
                cookie::set('login_password',front::cookie_encode($user['password']));
                session::set('username',$user['username']);


                //这里可以有其他事件
                //front::redirect(url::create('user'));
                $this->view->from=front::post('from')? front::post('from'):front::$from;
                $this->view->message=$this->fetch('user/login_success.html');
                return;
            }
            else {
                $this->login_false();
                return;
            }
        }
    }

    function login_false() {
        cookie::set('loginfalse',(int)cookie::get('loginfalse')+1,time()+3600);
        $event=new event;
        $event->rec_insert(array('event'=>'loginfalse','addtime'=>time(),'ip'=>front::ip()));
        front::flash('登陆失败！');
    }

    
    function loginfalsemaxtimes() {
        if(cookie::get('loginfalse')>5  || event::loginfalsemaxtimes()) {
            front::flash('帐号输入错误次数太多！请1小时后再登录！');
            return true;
        }
    }

    //状态
    function login_js_action() {
        if(cookie::get('login_username') && cookie::get('login_password')) {
            $user=$this->_user->getrow(array('username'=>cookie::get('login_username')));

            if(is_array($user) && cookie::get('login_password')==front::cookie_encode($user['password'])) {
                $this->view->user=$user;
                session::set('username',$user['username']);
            }
        }
        echo tool::text_javascript($this->fetch());
        exit;
    }

    function logout_action() {
        cookie::del('login_username');
        cookie::del('login_password');
        session::del('username');
        front::redirect(url::create('user/login'));
        exit;
    }

    function register_action() {
        if(front::post('submit')) {
			if(!config::get('reg_on')) {
    front::flash('网站已经关闭注册！');
    return;
 }
           
		  if(config::get('verifycode')){ 
            if(!session::get('verify') || front::post('verify')<>session::get('verify')) {
                front::flash('验证码错误！');
                return;
            }
		  }

            if(front::post('username') != strip_tags(front::post('username'))
                || front::post('username') != htmlspecialchars(front::post('username'))
            ) {
                front::flash('用户名不规范！');
                return;
            }

            if(strlen(front::post('username'))<4) {
                front::flash('用户名太短！');
                return;
            }
			if(strlen(front::post('e_mail'))<1) {
                front::flash('请填写邮箱！');
                return;
            } 
           

            if(front::post('username') && front::post('password')) {
                $username=front::post('username');
                $password=md5(front::post('password'));
                $e_mail=front::post('e_mail');            
                $data=array(
                    'username'=>$username,
                    'password'=>$password,
                    'e_mail'=>$e_mail,                    
                    'groupid'=>101
                );

                if($this->_user->getrow(array('username'=>$username))) {
                    front::flash('该用户名已被注册！');
                    return;
                }

                $insert=$this->_user->rec_insert($data);
                if($insert) front::flash('注册成功！');
                else {
                    front::flash('注册失败！');
                    return;
                }

                //写入cookie
                $user=$data;
                cookie::set('login_username',$user['username']);
                cookie::set('login_password',front::cookie_encode($user['password']));
                session::set('username',$user['username']);
                //这里可以有其他事件
                front::redirect(url::create('user'));
                exit;
            }
            else {
                front::flash('注册失败！');
                return;
            }
        }

    }

    function changepassword_action() {

        if(front::post('dosubmit') && front::post('password')) {
            if(!front::post('oldpassword') || !is_array($this->_user->getrow(array('password'=>md5(front::post('oldpassword'))),'userid='.$this->view->user['userid']))) {
                front::flash('原密码不正确！密码修改失败！');
                return;
            }

            $this->_user->rec_update(array('password'=>md5(front::post('password'))),'userid='.$this->view->user['userid']);
            front::flash('密码修改成功！请记住新密码，并使用新密码再次登陆！');
        }
    }
    
    //phpox1115 找回密码  
	//@aiens 1218 修改:若无安全提问,直接跳转到邮箱填写,新密码采用系统生成和邮件发送
    function getpass_action(){
    	if(front::post('step') == ''){
    		echo template('user/getpass.html');
    	}else if(front::post('step') == '1') {
    		if(!session::get('verify') || front::post('verify')<>session::get('verify')) {
                front::flash('验证码错误！');
                return;
            }
            
            if(strlen(front::post('username'))<4) {
                front::flash('用户名太短！');
                return;
            }
            $user=new user();
            $user=$user->getrow(array('username'=>front::post('username')));
            $this->view->user = $user;
            session::set('answer',$user['answer']);
            session::set('username',$user['username']);
			session::set('e_mail',$user['e_mail']);
			if(!empty($user['answer'])) {
            echo template('user/getpass_1.html');
			} else {
				session::set('ischk','true');
                echo template('user/getpass_2.html');
			}
    	}else if (front::post('step') == '2'){
			
    		if(strlen(front::post('answer'))<1) {
                echo '<script>alert("请输入答案！");</script>';
				return;
            }
            if(front::post('answer') != session::get('answer')){
				echo '<script>alert("您的答案错误！");</script>';
				return;
            }
            session::set('ischk','true');
            echo template('user/getpass_2.html');
			
    	}else if (front::post('step') == '3'){
    		if(strlen(front::post('e_mail'))<1) {
				echo '<script>alert("请输入注册填写的邮箱！");</script>';
				return;
            }
            if(front::post('e_mail') != session::get('e_mail')) { 
				echo '<script>alert("邮箱和用户不匹配！");</script>';
				return;
			}
            if(session::get('ischk') == 'true'){
				
				function randomstr($length) {
                   $str = '1234567890abcdefghijklmnopqrstuvwxyz
                   ABCDEFGHIJKLOMNOPQRSTUVWXYZ';    //字符池
                   for($i=0; $i<$length; $i++) {
					   $str1 .= $str{mt_rand(0,35)};    //生成php随机数
				   }
				   return $str1;
				 }
				
				$password1 = randomstr(6);
				$password = md5($password1);
            	$user=new user();
            	$user->rec_update(array('password'=>$password),'username="'.session::get('username').'"');
				config::setPath(ROOT.'/config/config.php');

              function sendmail($email_to, $email_subject, $email_message, $email_from = '') {
	             extract($GLOBALS, EXTR_SKIP);
	             require ROOT.'/lib/manage/sendmail_inc.php';
              }
				
				$mail[email]=config::get('email');
				sendmail(session::get('username').' <'.session::get('e_mail').'>', '会员找回密码', ' 尊敬的'.session::get('username').',您好! 您的新密码是:'.$password1.' 您可以登录后到会员中心进行修改!' ,$mail[email]);
            	echo '<script>alert("系统重新生成的密码已经发送到你的邮箱,跳转到登录页！!");window.location="index.php?case=user&act=login"</script>';
            }else {
				echo '<script>alert("参数错误！");</script>';
				return;
				
                
            }
    	}
    	exit;
    }

    function fckupload_action() {

        $uploads=array();
        if(is_array($_FILES)) {
            $upload=new upload();
            foreach($_FILES as $name=>$file) {
                $uploads[$name]=$upload->run($file);
            }
            $this->view->uploads=$uploads;
        }

        $this->render('../admin/system/fckupload.php');
        exit;
    }


    function fckuploadcheck_action() {
        if(empty($this->view->user) || !$this->view->user['userid'])
        exit('PAGE NOT FOUND');
        
        fckuser::$user=$this->view->user;
        $this->end=false;
    }

    function end() {
        if(isset($this->end) && !$this->end) return;

        if(front::$debug)
            $this->render('style/index.html');
        else
            $this->render();
    }

}