<?php

/**
 * cmseasy: archive_act.php
 * ============================================================================
 * 版权所有 2008-2009 cmseasy，并保留所有权利。
 * -------------------------------------------------------
 * 这不是一个自由软件！也不是一个开源软件！您不能在任何目的的前提下对程序代码进行破解、修改和使用；
 * 不允许对程序代码以任何形式任何目的的再发布。
 * ============================================================================
 *
 * @version:    v1.7.091010
 * ---------------------------------------------
 * $Id: archive_act.php Sat Dec 06 09:43:22 CST 2008
 */
if (!defined('ROOT')) exit('Can\'t Access !');

class archive_act extends act {

    public $auto_end=true;

    function init() {
        $this->archive=new archive();

        $this->category=category::getInstance();
        //	$this->category->init();
        $this->view->category=$this->category->category;

        if (front::get('page')) $page=front::get('page');
        else $page=1;

        $this->view->page=$page;

        front::check_type($page);
		
		$_catpage = category::categorypages(front::get('catid'));
		if($_catpage){
			$this->pagesize = $_catpage;
		}else{
			$this->pagesize = config::get('list_pagesize');
		}        

        front::check_type($this->pagesize);

        //通用信息
        $announcement=new announcement();
        $this->view->announcements=$announcement->getrows(null, 10);		

        //会员
        $this->view->usergroupid=0;

        front::check_type(cookie::get('login_username'), 'safe');
        front::check_type(cookie::get('login_password'), 'safe');
		
		$this->view->showarchive=archive::getInstance()->getrow(front::get('aid'));
		$addcontentuser = new user();
		$addcontentuser=$addcontentuser->getrow(array('userid'=>$this->view->showarchive['userid']));
		
		if (is_array($addcontentuser)) {
			$this->view->adduser=$addcontentuser;
		}
		

        if (cookie::get('login_username')&&cookie::get('login_password')) {
            $user=new user();
            $user=$user->getrow(array('username'=>cookie::get('login_username')));
            if (is_array($user)&&cookie::get('login_password')==front::cookie_encode($user['password'])) {
                $this->view->user=$user;
                $this->view->usergroupid=$user['groupid'];
            }			
        }

        /*
          if(isset($this->view->catid) && !rank::checktyperank($this->view->catid,$this->view->usergroupid,'view'))
          //echo '<h1>你越权了！</h1>';
          {
          front::flash('你没有权限访问！');
          exit($this->fetch('message/index.html'));
          } */
        //
    }

    function set_verify() {
        return array(
            'is_int'=>'id,aid',
            'is_word'=>'',
            'is_email'=>'',
            'is_text'=>''
        );
    }

    function index_action() {

    }

    //phpox1109 生成RSS
    function rss_action() {
        $sitename=config::get('sitename');
        $site_url=config::get('site_url');
        $catid=intval(front::get('catid'));
        if (!$catid) {
            $title=$sitename;
            $url=$site_url;
            $articles=$this->archive->getrows('', 30);
        }
        else {
            $type=$this->category->category[$catid];
            $title=$type['catname'].'-'.$sitename;
            $url=$site_url.url('archive/list/catid/'.$catid);
            $articles=$this->archive->getrows('catid='.$catid, 30);
        }

        $code="<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n";
        $code .= "<rss version=\"2.0\">\r\n";
        $code .= "<channel>\r\n";
        $code .= "<title>{$title}</title>\r\n";
        $code .= "<link><![CDATA[{$url}]]></link>\r\n";
        $code .= "<description>{$title}</description>\r\n";
        $i=1;
        if (is_array($articles)&&!empty($articles)) {
            foreach ($articles as $arr) {
                $text=strip_tags(mb_substr($arr['content'], 0, 588));
                $code .= "<item id=\"{$i}\">\r\n";
                $code .= "<title><![CDATA[{$arr['title']}]]></title>\r\n";
                $code .= "<link><![CDATA[".url('archive/show/aid/')."{$arr['aid']}]]></link>\r\n";
                $code .= "<description><![CDATA[{$text}]]></description>\r\n";
                $code .= "<pubDate>{$arr['adddate']}</pubDate>\r\n";
                $code .= "</item>\r\n";
                $i++;
            }
        }
        $code .= "</channel>\r\n";
        $code .= "</rss>";
        //ob_start();
        header('Content-type: application/xml');
        echo $code;
        exit;
    }

    function list_action() {
        front::check_type(front::get('catid'));

        $this->view->categorys=category::getpositionlink2(front::get('catid'));

        $topid=category::gettopparent(front::get('catid'));
        if (!isset($this->category->category[front::get('catid')])||
                !isset($this->category->category[$topid])) {
            $this->out('message/error.html');
        }

        $limit=(($this->view->page-1)*$this->pagesize).','.$this->pagesize;
        $categories=array();
        if (@$this->category->category[front::get('catid')]['ispages']) $categories=$this->category->sons(front::get('catid'));
        $categories[]=front::get('catid');

        $this->view->pages=@$this->category->category[front::get('catid')]['ispages'];

        if (!rank::catget(front::get('catid'), $this->view->usergroupid)) $this->out('message/error.html');

        //<!-------------------
        //$this->archive=new archive();
        $order="`listorder` asc,`adddate` DESC";

        if (@$this->category->category[front::get('catid')]['includecatarchives']) $articles=$this->archive->getrows('catid in ('.implode(',', $categories).') and checked=1', $limit, $order);
        else $articles=$this->archive->getrows('catid='.front::get('catid').' and checked=1', $limit, $order);

        if (!is_array($articles)){
			$this->out('message/error.html');
		}
		foreach ($articles as $order=>$arc) {
			$articles[$order]['url']=archive::url($arc);
			$articles[$order]['catname']=category::name($arc['catid']);
			$articles[$order]['caturl']=category::url($arc['catid']);

			$articles[$order]['adddate']=sdate($arc['adddate']);

			$articles[$order]['stitle']=strip_tags($arc['title']);
			$articles[$order]['strgrade']=archive::getgrade($arc['grade']);
		}
		
        $this->view->archives=$articles;
        $this->view->articles=$articles;


        //--------------------->

        if (@$this->category->category[front::get('catid')]['includecatarchives']) $this->view->record_count=$this->archive->rec_count('catid in('.implode(',', $categories).')');
        else $this->view->record_count=$this->archive->rec_count('catid='.front::get('catid'));


        front::$record_count=$this->view->record_count;
        $this->view->catid=front::get('catid');
		$this->view->ifson=category::hasson($articles[0]['catid'] ? $articles[0]['catid'] : $this->view->catid);
        $this->view->topid=category::gettopparent(front::get('catid'));
        $this->view->parentid=@$this->category->getparent($this->view->catid);

        $template=@$this->category->category[front::get('catid')]['template'];
        if ($template&&file_exists(TEMPLATE.'/'.$this->view->_style.'/'.$template)) $this->out($template);
        else {
            $tpl=category::gettemplate($this->view->catid);

            //list-cache
            if (category::getishtml($this->view->catid)) {
                $path=ROOT.category::url($this->view->catid, @front::$get['page']>1 ? front::$get['page'] : null);
                if (!preg_match('/\.[a-zA-Z]+$/', $path)) $path=rtrim(rtrim($path, '/'), '\\').'/index.html';
                $this->cache_path=$path;
            }

            $this->out($tpl);
        }
    }

    function search_action() {
        if (front::get('keyword')&&!front::post('keyword')) front::$post['keyword']=front::get('keyword');

        front::check_type(front::post('keyword'), 'safe');

        if (front::post('keyword')) {
            $this->view->keyword=trim(front::post('keyword'));
            session::set('keyword', $this->view->keyword);
        }
        else {
            session::set('keyword', null);
            $this->view->keyword=session::get('keyword');
        }

        $type=$this->view->category;

        //$this->archive=new archive();
        //phpox 搜索自定义字段开始
        $condition="";
        if (front::post('catid')) {
            $condition .= "catid = '".front::post('catid')."' AND ";
        }
        $condition .= "(title like '%".$this->view->keyword."%'";
        $sets=settings::getInstance()->getrow(array('tag'=>'table-fieldset'));
        $arr=unserialize($sets['value']);
        if (is_array($arr['archive'])&&!empty($arr['archive'])) {
            foreach ($arr['archive'] as $v) {
                if ($v['issearch']=='1') {
                    $condition .= " OR {$v['name']} like '%{$this->view->keyword}%'";
                }
            }
        }
        $condition .= ")";
        $order="`listorder`,1 DESC";
        $limit=(($this->view->page-1)*$this->pagesize).','.$this->pagesize;
        $articles=$this->archive->getrows($condition, $limit, $order);
        //phpox搜索自定义字段结束
        //$limit=(($this->view->page-1)*$this->pagesize).','.$this->pagesize;
        //$articles=$this->archive->getrows("title like '%".$this->view->keyword."%'",$limit);

        foreach ($articles as $order=>$arc) {
            $articles[$order]['url']=archive::url($arc);
            $articles[$order]['catname']=category::name($arc['catid']);
            $articles[$order]['caturl']=category::url($arc['catid']);

            $articles[$order]['adddate']=sdate($arc['adddate']);

            $articles[$order]['stitle']=strip_tags($arc['title']);
        }

        $this->view->articles=$articles;
        $this->view->archives=$articles;

        $this->view->record_count=$this->archive->record_count;
    }

    function asearch_action() {
        if (front::get('keyword')&&!front::post('keyword')) front::$post['keyword']=front::get('keyword');

        front::check_type(front::post('keyword'), 'safe');

        if (front::post('keyword')) {
            $this->view->keyword=trim(front::post('keyword'));
            session::set('keyword', $this->view->keyword);
        }
        else {
            session::set('keyword', null);
            $this->view->keyword=session::get('keyword');
        }


        //$this->archive=new archive();

        $limit=(($this->view->page-1)*$this->pagesize).','.$this->pagesize;
        $articles=$this->archive->getrows("title like '%".$this->view->keyword."%'", $limit);

        foreach ($articles as $order=>$arc) {
            $articles[$order]['url']=archive::url($arc);
            $articles[$order]['catname']=category::name($arc['catid']);
            $articles[$order]['caturl']=category::url($arc['catid']);

            $articles[$order]['adddate']=sdate($arc['adddate']);

            $articles[$order]['stitle']=strip_tags($arc['title']);
        }

        $this->view->articles=$articles;
        $this->view->archives=$articles;

        $this->view->record_count=$this->archive->record_count;
    }

    function show_action() {
        //$this->archive=new archive();
        if (!front::get('aid')) front::$get['aid']=front::get('id');

        front::check_type(front::$get['aid']);

        $this->view->aid=trim(front::get('aid'));
        $this->view->archive=archive::getInstance()->getrow(front::get('aid'));

        $this->view->categorys=category::getpositionlink2($this->view->archive['catid']);

        //
        if (!is_array($this->view->archive)) $this->out('message/error.html');

        if ($this->view->archive['checked']<1) exit('未审核！');

        if (!rank::arcget(front::get('aid'), $this->view->usergroupid)) {
            $this->out('message/error.html');
        }	

        $this->view->catid=$this->view->archive['catid'];
        $this->view->topid=category::gettopparent($this->view->catid);
        $this->view->parentid=$this->category->getparent($this->view->catid);

        if (!rank::catget($this->view->catid, $this->view->usergroupid)) $this->out('message/error.html');

        if (!isset($this->category->category[$this->view->catid])||
                !isset($this->category->category[$this->view->topid])) {
            //	$this->out('message/error.html');
        }

        $template=@$this->view->archive['template'];

        $linkword=new linkword();
        $linkwords=$linkword->getrows(null, 1000, 'linkorder desc');
        $content=$this->view->archive['content'];

        $contents=preg_split('%<div style="page-break-after: always"><span style="display: none">&nbsp;</span></div>%si', $content);
        if ($contents) {
            $this->view->pages=count($contents);
            front::$record_count=$this->view->pages*config::get('list_pagesize');
            $content=$contents[$this->view->page-1];
        }

        foreach ($linkwords as $linkword) {
            if (trim($linkword['linkurl'])&&!preg_match('%^http://$%', trim($linkword['linkurl']))) {
                $linkword['linktimes']=(int) $linkword['linktimes'];
                $link="<a href='$linkword[linkurl]' target='_blank'>$linkword[linkword]</a>";
            }
            else {
                $link="<a href='".url('archive/search/keyword/'.urlencode($linkword['linkword']))."' target='_blank'>$linkword[linkword]</a>";
            }
            if (isset($link))
            //$content=preg_replace("%([^'|\"].*)($linkword[linkword])(.*[^'|\"])%i","\\1$link\\3",$content,$linkword['linktimes']); $content=str_replace("'", "\"", $content);
                    $content=preg_replace("%(?!\"]*>)$linkword[linkword](?!\s*\")%i", "\\1$link\\2", $content, $linkword['linktimes']);

            unset($link);
        }

        //标签链接
        $taghtml='';
        $tag_table=new tag();
        foreach ($tag_table->urls($this->view->archive['tag']) as $tag=>$url) {
            $taghtml.="<a href='$url' target='_blank'>$tag</a>&nbsp;&nbsp;";
        }
        $this->view->archive['tag']=$taghtml;

        //专题链接
        $this->view->archive['special']=null;
        if ($this->view->archive['spid']) {
            $spurl=special::url($this->view->archive['spid']);
            $sptitle=special::gettitle($this->view->archive['spid']);
            $this->view->archive['special']="<a href='$spurl' target='_blank'>$sptitle</a>&nbsp;&nbsp;";
        }

        //分类
        $this->view->archive['type']=null;
        if ($this->view->archive['typeid']) {
            $typeurl=type::url($this->view->archive['typeid']);
            $typetitle=type::name($this->view->archive['typeid']);
            $this->view->archive['type']="<a href='$typeurl' target='_blank'>$typetitle</a>&nbsp;&nbsp;";
        }
		
        //地区
        $this->view->archive['area']=null;
        $this->view->archive['area']=area::getpositonhtml($this->view->archive['province_id'], $this->view->archive['city_id'], $this->view->archive['section_id']);

//        $this->view->archive['area']=null;
//        if ($this->view->archive['province_id']) {
//            $provurl=area::province_url($this->view->archive['province_id']);
//            $provname=area::name($this->view->archive['province_id']);
//            $this->view->archive['area'].="<a href='$provurl' target='_blank'>$provname</a>&nbsp;&nbsp;";
//        }
//        if ($this->view->archive['city_id']) {
//            $cityurl=area::city_url($this->view->archive['city_id']);
//            $cityname=area::name($this->view->archive['city_id']);
//            $this->view->archive['area'].="<a href='$cityurl' target='_blank'>$cityname</a>&nbsp;&nbsp;";
//        }
//        if ($this->view->archive['section_id']) {
//            $securl=area::section_url($this->view->archive['section_id']);
//            $secname=area::name($this->view->archive['section_id']);
//            $this->view->archive['area'].="<a href='$securl' target='_blank'>$secname</a>&nbsp;&nbsp;";
//        }


        $this->view->archive['content']=$content;

        $aid=front::$get['aid'];
        $catid=$this->view->catid;
        $sql1="SELECT aid,title,catid FROM `{$this->archive->name}` WHERE catid = '$catid' AND aid > '$aid' ORDER BY aid ASC LIMIT 0,1";
        $sql2="SELECT aid,title,catid FROM `{$this->archive->name}` WHERE catid = '$catid' AND aid < '$aid' ORDER BY aid DESC LIMIT 0,1";
        $n=$this->archive->rec_query_one($sql1);
        $p=$this->archive->rec_query_one($sql2);
        $this->view->archive['p']=$p;
        $this->view->archive['n']=$n;
        $this->view->archive['p']['url']=archive::url($p);
        $this->view->archive['n']['url']=archive::url($n);
        $this->view->archive['strgrade']=archive::getgrade($this->view->archive['grade']);

        if ($template&&file_exists(TEMPLATE.'/'.$this->view->_style.'/'.$template)) $this->out($template);
        else {
            $tpl=category::gettemplate($this->view->catid, 'showtemplate');

            if (category::getarcishtml($this->view->archive)) {
                $path=ROOT.archive::url($this->view->archive);
                if (!preg_match('/\.[a-zA-Z]+$/', $path)) $path=rtrim(rtrim($path, '/'), '\\').'/index.html';
                $this->cache_path=$path;
            }

            $this->out($tpl);
        }
    }

    function view_js_action() {
        front::check_type(front::get('aid'));
        //	$this->archive=new archive();
        $aid=front::get('aid');
        $this->archive->rec_update('view=view+1', $aid);
        $archive=$this->archive->getrow($aid);
        echo tool::text_javascript($archive['view']);
        exit;
    }
	
	function orders_action(){
		
		if (!front::get('aid')) front::$get['aid']=front::get('id');
		if(!front::get('oid')){
			front::check_type(front::$get['aid']);
		}
		$this->view->aid=trim(front::get('aid')); 
		
		if(front::post('submit')){
			front::$post['mid']=$this->view->user['userid']?$this->view->user['userid']:0;
			front::$post['adddate']=time();
			front::$post['ip']=front::ip();
			front::$post['aid']=$this->view->aid;
			front::$post['oid']=date('YmdHis').'-'.rand(1,9).'-'.front::$post['mid'];
			//print_r(front::$post);
			$this->orders=new orders();
			$insert=$this->orders->rec_insert(front::$post);
			if ($insert < 1) { //
                front::flash("{$this->tname}添加失败！");
            }else{
				echo '<script type="text/javascript">alert("'.lang(orderssuccess).'")</script>';
				front::refresh(url('archive/orders/oid/'.front::$post['oid'],true));
			}
		}elseif(front::get('oid')){
			$where=array();
			$where['oid']=front::get('oid');
			$this->view->orders=orders::getInstance()->getrow($where);
			if($this->view->orders['status']==1){
				$this->view->orders['status']=lang('ordersalreadydo');
			}elseif($this->view->orders['status']==0){
				$this->view->orders['status']=lang('ordersnotalreadydo');
			}elseif($this->view->orders['status']==2){
				$this->view->orders['status']=lang('ordersalreadying');
			}
			$this->out('message/orderssuccess.html');
		}else{			
			$this->view->archive=archive::getInstance()->getrow(front::get('aid'));
			$this->view->categorys=category::getpositionlink2($this->view->archive['catid']);       
	
			if (!is_array($this->view->archive)) $this->out('message/error.html');
			if ($this->view->archive['checked']<1) exit('未审核！');
			if (!rank::arcget(front::get('aid'), $this->view->usergroupid)) {
				$this->out('message/error.html');
			}
		}		
	}

    function out($tpl) {
        if (front::$debug) return;
        $this->render($tpl);
        $this->out=true;
        exit;
    }

    function end() {
        if (isset($this->out)) return;

        if ($this->auto_end) {
            if (front::$debug) $this->render('style/index.html');
            else $this->render();
        }
    }

}