<?php
/*
 *自定义函数文件，这里你可以定义自己的函数供cmseasy系统调用；
 */
 
if (!defined('ROOT')) exit('Can\'t Access !');

function getcategoryparentsid($catid){ //自定义函数示例：调用栏目的最高父栏目id
	$p = category::getparentsid($catid);
	$n = count($p);
	$c = $p[$n-1];
	return $c;	
}

function index_archive($catid){ //首页自定栏目内容调用（可分页）
	$index_archive=new archive();
	$index_category=category::getInstance();
	$index_view_category=$index_category->category;
	if (front::get('page')) $page=front::get('page');
	else $page=1;
	$index_view_page=$page;
	front::check_type($page);	
	$_catpage = category::categorypages($catid);
	if($_catpage){
		$index_pagesize = $_catpage;
	}else{
		$index_pagesize = config::get('list_pagesize');
	}
	front::check_type($index_pagesize);
	$index_view_categorys=category::getpositionlink2($catid);

        $topid=category::gettopparent($catid);
        if (!isset($index_category->category[$catid])||
                !isset($index_category->category[$topid])) {
            $this->out('message/error.html');
        }

        $limit=(($index_view_page-1)*$index_pagesize).','.$index_pagesize;
        $categories=array();
        if (@$index_category->category[$catid]['ispages']) $categories=$index_category->sons($catid);
        $categories[]=$catid;

        $index_view_pages=@$index_category->category[$catid]['ispages'];

        if (!rank::catget($catid, $index_view_usergroupid)) $this->out('message/error.html');

        $order="`listorder` asc,`adddate` DESC";

        if (@$index_category->category[$catid]['includecatarchives']) $articles=$index_archive->getrows('catid in ('.implode(',', $categories).') and checked=1', $limit, $order);
        else $articles=$index_archive->getrows('catid='.$catid.' and checked=1', $limit, $order);

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
		
        $index_view_archives=$articles;
		if (@$index_category->category[$catid]['includecatarchives']) $index_view_record_count=$index_archive->rec_count('catid in('.implode(',', $categories).')');
        else $index_view_record_count=$index_archive->rec_count('catid='.$catid);


        front::$record_count=$index_view_record_count;
		
		return $index_view_archives;
} 
function index_pagination($catid, $tpl='system/index_pagination.html') { //首页自定栏目内容调用分页函数
    front::$view->_var->catid=$catid;
    return template($tpl);
}

function user_cb_item($table, $field, $value) {
    return user_select_option($field, setting::$var[$table][$field], $value);
}

function user_cb_data(&$data, $table='archive') {
    foreach ($data as $key=>$value) {
        if (preg_match('/^my_/', $key) && isset(setting::$var[$table][$key]) && @setting::$var[$table][$key]['selecttype']) {
            $data[$key]=user_cb_item($table, $key, $value);
        }
    }
}

function user_select_option($name,$form,$value) {
	    $num = $value-1;
        preg_match_all('/\(([\d\w]+)\)(\S+)/im', $form['select'], $result, PREG_SET_ORDER);
        $values=explode(',',trim($value,','));
        $res=array();
        foreach($values as $key=>$value) {
            $res[$key]=$result[$num][2];
        }
        return implode(',',$res);
    }
?>