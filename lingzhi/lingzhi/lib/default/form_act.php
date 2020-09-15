<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of form_act
 *
 * 
 */
if (!defined('ROOT')) exit('Can\'t Access !');

class form_act extends act {
    protected $_table;

    function init() {
        if(front::$act=='message') return;

        //        $user='';
        //        if(cookie::get('login_username') && cookie::get('login_password')) {
        //            $user=new user();
        //            $user=$user->getrow(array('username'=>cookie::get('login_username')));
        //        }
        //        if(!$user)  front::redirect(url::create('user/login'));
        //        $this->view->user=$user;
        //        $this->_user=new user;

        $this->table=front::get('form');
        if(!preg_match('/^my_\w+/',$this->table)) exit('PAGE NOT FOUND!');

        $this->_table=new defind($this->table);
        if(!$this->_table->getFields()) exit('PAGE NOT FOUND!');

        $this->view->form=$this->_table->get_form();

        $this->_pagesize=config::get('manage_pagesize');

        $this->view->manage=$this->table;
        $this->view->primary_key=$this->_table->primary_key;

        $fieldlimit=$this->_table->getcols(front::$act=='list'?'user_manage':'user_modify');
        $field=$this->_table->getFields();
        helper::filterField($field,$fieldlimit);
        $this->view->field=$field;

        if(!front::get('page')) front::$get['page']=1;
    }

    private function sendmail($smtpemailto,$title,$mailbody){
		if(!$fp = @fsockopen(config::get('smtp_host'),25, $errno, $errstr, 30)) {
		   $charset='utf-8';
		   $headers = "From:".config::get('smtp_user_add'). "\r\n";
           $headers .= 'Content-type: text/html; charset='.$charset. "\r\n";
		   $email_subject = '=?'.$charset.'?B?'.base64_encode(str_replace("\r", '', str_replace("\n", '', $title))).'?=';
           @mail($smtpemailto,$email_subject,$mailbody,$headers);
        }else{			
           include_once(ROOT.'/lib/plugins/smtp.php');
           $mailsubject = mb_convert_encoding($title, 'GB2312','UTF-8');//邮件主题
           $mailtype = "HTML";//邮件格式（HTML/TXT）,TXT为文本邮件
           $smtp = new include_smtp(config::get('smtp_host'),config::get('smtp_port'),config::get('smtp_auth'),config::get('smtp_mail_username'),config::get('smtp_mail_password'));//这里面的一个true是表示使用身份验证,否则不使用身份验证.
           $smtp->debug = false;
           $smtp->sendmail($smtpemailto, config::get('smtp_user_add'), $mailsubject, $mailbody, $mailtype);	
		}
    }	
	
    function add_action() {

        if(front::post('submit')) {
			
		 if(config::get('verifycode')){
            if(!session::get('verify') || front::post('verify')<>session::get('verify')) {
                front::flash('验证码错误！');
                $this->render(@setting::$var[$this->table]['myform']['template']);
                $this->end=false;
                return;
            }
		 }

            front::$post['checked']=0;
            front::$post['userid']=$this->view->user['userid'];
            front::$post['username']=$this->view->user['username'];
            front::$post['author']=$this->view->user['username'];
            front::$post['adddate']=date('Y-m-d H:i:s');
            front::$post['ip']=front::ip();


            foreach(front::$post as $k=>$p) {
                if( is_array($p))  front::$post[$k]=implode(',',$p);
            }

            $data=front::$post;

            $insert=$this->_table->rec_insert($data);
            if($insert<1) {
                front::flash('表单提交失败！');
            }
            else {
                if(is_array(front::$post) && !empty(front::$post)){
                    foreach(front::$post as $k => $v){
                        if(preg_match('/^my_.*?mail$/i', $k) && strstr($v,'@')){
                            $email = front::$post[$k];
                            break;
                        }
                    }
                }
                $code = '';
                foreach ($this->view->field as $k =>$v){
                    $cname = setting::$var[$this->table][$k]['cname'];
                    $val = front::$post[$k];
                    $code .= $cname.": ".$val."<br>";
                }
                $smtpemailto = config::get('email');//管理员邮箱
                $title = setting::$var[$this->table]['myform']['cname'].'的结果';
                if($email){
                    $this->sendmail($email,$title,$code); //发送给填写人
                }
                $this->sendmail($smtpemailto,$title,$code); //发送给管理员
                front::redirect(url::create('/form/message'));
            }
        }
        
        $this->render(@setting::$var[$this->table]['myform']['template']);

        $this->end=false;
    }

    //    function list_action() {
    //        $limit=((front::get('page')-1)*20).',20';
    //        $where="userid={$this->view->user['userid']}";
    //
    //        if(front::post('my_name')) front::check_type(front::post('my_name'),'safe');
    //        if(front::post('my_title')) front::check_type(front::post('my_title'),'safe');
    //
    //        $word=front::post('my_name')?front::post('my_name'):front::post('my_title');
    //
    //        if($word && front::post('my_name')) $where .=' and my_name like '."'%$word%'";
    //        if($word && front::post('my_title')) $where .=' and my_title like '."'%$word%'";
    //
    //        $this->_view_table=$this->_table->getrows($where,$limit,'1 desc',$this->_table->getcols('user_manage'));
    //        $this->view->record_count=$this->_table->record_count;
    //    }

    function message_action() {

    }

    function view($table) {
        $this->view->data=$table['data'];
    }

    public static function get_my_tables() {
        $tables=array();
        $forms=tdatabase::getInstance()->getTables();
        foreach($forms as $form) {
            if(preg_match('/^'.config::get('database','prefix').'(my_\w+)/xi',$form['name'],$res))
                $tables[]=$res[1];
        }
        return $tables;
    }

    public static function table_cname($table) {
        $tablec=@setting::$var[$table]['cname'];
        if(!$tablec)  $tablec=$table;
        return $tablec;
    }

    function end() {
        if(isset($this->end) && !$this->end) return;

        if(!isset($this->_view_table['data']) && isset($this->_view_table))
            $this->_view_table['data']=$this->_view_table;

        if(isset($this->_view_table))
            $this->view($this->_view_table);

        $this->render();
    }

    function search_action() {
        if(front::get('keyword') && !front::post('keyword'))
            front::$post['keyword']=front::get('keyword');

        front::check_type(front::post('keyword'),'safe');

        if(front::post('keyword')) {
            $this->view->keyword=trim(front::post('keyword'));
            session::set('keyword',$this->view->keyword);
        }
        else {
            session::set('keyword',null);
            $this->view->keyword=session::get('keyword');
        }
        
        $type = $this->view->type;

        //$this->archive=new archive();
        //phpox 搜索自定义字段开始
        $condition = "";
        if(front::post('catid')){
        	$condition .= "catid = '".front::post('catid')."' AND ";
        }
        $condition .= "(title like '%".$this->view->keyword."%'";
        $sets=settings::getInstance()->getrow(array('tag'=>'table-fieldset'));
        $arr = unserialize($sets['value']);
        if(is_array($arr['archive']) && !empty($arr['archive'])){
        	foreach ($arr['archive'] as $v){
        		if($v['issearch'] == '1'){
        			$condition .= " OR {$v['name']} like '%{$this->view->keyword}%'";
        		}
        	}
        }
        $condition .= ")";
        $order = "`listorder` desc,1 DESC";
        $limit=(($this->view->page-1)*$this->pagesize).','.$this->pagesize;
        $articles=$this->archive->getrows($condition,$limit,$order);
        //phpox搜索自定义字段结束
        
        //$limit=(($this->view->page-1)*$this->pagesize).','.$this->pagesize;
        //$articles=$this->archive->getrows("title like '%".$this->view->keyword."%'",$limit);

        foreach($articles as $order=>$arc) {
            $articles[$order]['url']=archive::url($arc);
            $articles[$order]['catname']=category::name($arc['catid']);
            $articles[$order]['caturl']=category::url($arc['catid']);

            $articles[$order]['adddate']= sdate($arc['adddate']);

            $articles[$order]['stitle']= strip_tags($arc['title']);
        }

        $this->view->articles=$articles;
        $this->view->archives=$articles;

        $this->view->record_count=$this->archive->record_count;
    }
}

