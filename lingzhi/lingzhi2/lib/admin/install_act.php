<?php

/**
 * cmseasy: install_act.php
 * ============================================================================
 * 版权所有 2008-2009 cmseasy，并保留所有权利。
 * -------------------------------------------------------
 * 这不是一个自由软件！也不是一个开源软件！您不能在任何目的的前提下对程序代码进行破解、修改和使用；
 * 不允许对程序代码以任何形式任何目的的再发布。
 * ============================================================================
 *
 * @version:    v1.7.091010
 * ---------------------------------------------
 * $Id: install_act.php Sat Dec 06 09:43:36 CST 2008
 */
if (!defined('ROOT')) exit('Can\'t Access !');

class install_act extends act {

    function init() {
        header('Cache-control: private, must-revalidate'); //支持页面回跳
        if (self::installed()) exit('系统已安装！若要再安装，请删除文件 /install/locked ! ');
    }

    function index_action() {
        $this->view->mysql_pass=false;

        if (front::post('submit')) {
            $connect=@mysql_connect(front::post('hostname'), front::post('user'), front::post('password'));

            if (front::post('createdb') && !@mysql_select_db(front::post('database'))) {
                @mysql_query("CREATE DATABASE ".front::post('database'));
                @mysql_query("ALTER DATABASE `$_POST[database]` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci");
            }

            if ($connect) {

                $ver=mysql_query('SELECT VERSION()  as ver');
                $ver=mysql_fetch_array($ver);
                $this->view->mysql_verion=$ver['ver'];
                $this->view->mysql_ver=(int) $ver['ver'];

                $db=@mysql_select_db(front::post('database'));

                if ($db) $this->view->mysql_pass=true;
                else $this->view->dberror=true;

                config::modify(front::$post);
                config::modify(array('cookie_password'=>md5(rand().time())));
                config::modify(array('install_admin'=>front::post('admin_username')));

                if (!front::post('admin_password') || !front::post('admin_username') || front::post('admin_password') <> front::post('admin_password2')) {
                    $this->view->adminerror=true;
                }

                if ($this->view->mysql_pass && front::post('install')) {
					$this->instalsqltype=front::post('testdata');
					$this->smodarr=front::post('smod');
                    $this->install();
                    file_put_contents(ROOT.'/install/locked', 'install-locked !');
                }
                mysql_close($connect);
            }
            else config::modify(front::$post);
        }

        $this->render();
    }

    private function install() {
        $cnzz=new cnzz();
        $infos=$cnzz->getinfo();
        //file_put_contents('log1.txt',var_export($infos,true));
        config::modify(array('cnzz_user'=>$infos[0]));
        config::modify(array('cnzz_pass'=>$infos[1]));
		if($this->instalsqltype){
			$sqlquery=file_get_contents(ROOT.'/install/data/install_testdb.sql');			
		}else{
			$sqlquery=file_get_contents(ROOT.'/install/data/install.sql');
		}
		$smods = '';		
		if(!empty($this->smodarr)){
			$smods=implode(',',$this->smodarr);
			foreach($this->smodarr as $val){
				$modsqlquery.=file_get_contents(ROOT.'/install/data/install_'.$val.'.sql');
				if(!$modsqlquery) exit('模块数据库文件不存在！');				
				config::modifymod(front::$post,$val);
				config::modifymod(array('url'=>front::post('site_url').$val),$val);
				config::modifymod(array('username'=>front::post('user')),$val);
				config::modifymod(array('host'=>front::post('hostname')),$val);				
			} 			
		}
		config::modify(array('mods'=>$smods));		      
        if (!$sqlquery) exit('数据库文件不存在！');
		$sqlquery=$sqlquery.$modsqlquery;
        $sqlquery=str_replace('`cmseasy_', '`'.config::get('database', 'prefix'), $sqlquery);
        $sqlquery=str_replace('\'admin\'', '\''.front::post('admin_username').'\'', $sqlquery);
        $sqlquery=str_replace('\'21232f297a57a5a743894a0e4a801fc3\'', '\''.md5(front::post('admin_password')).'\'', $sqlquery);

        $mysql=new user;
        $sqlquery=str_replace("\r", "", $sqlquery);
        $sqls=split(";[ \t]{0,}\n", $sqlquery);
        $nerrCode="";
        $i=0;
        foreach ($sqls as $q) {
            $q=trim($q);
            if ($q == "") {
                continue;
            }
            if ($mysql->query($q)) $i++;
            else $nerrCode .= "执行： <font color='blue'>$q</font> 出错!</font><br>";
        }

        $user=new user();
        if (is_array($user->getrow("username='".front::post('admin_username')."'"))) $this->view->install=true;
    }
}