<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of tag_act
 *
 * @author wgz
 */
class type_act extends act {

    function list_action() {

        $this->view->page=front::get('page') ? front::get('page') : 1;
        $this->pagesize=config::get('list_pagesize');
        $limit=(($this->view->page - 1) * $this->pagesize).','.$this->pagesize;

        $type=new type();

        $types=array();
        $types=$type->sons(front::get('typeid'));
        $types[]=front::get('typeid');
        $where='typeid in ('.implode(',', $types).')';

        $this->view->type=$type->getrow('typeid='.front::get('typeid'));
		
		$this->view->pages=@$this->view->type['ispages'];
		
		$this->view->typeid=front::get('typeid');

        $archive=new archive();
        $archives=$archive->getrows($where, $limit,'listorder,typeid desc');

        foreach ($archives as $order=>$arc) {
            $archives[$order]['url']=archive::url($arc);
            $archives[$order]['typename']=type::name($arc['typeid']);
            $archives[$order]['typeurl']=type::url($arc['typeid']);

            $archives[$order]['adddate']=sdate($arc['adddate']);

            $archives[$order]['stitle']=strip_tags($arc['title']);
        }

        $this->view->archives=$archives;
        $this->view->record_count=$archive->rec_count($where);
        front::$record_count=$this->view->record_count;
		
		$this->type=type::getInstance();
		$template=$this->type->type[front::get('typeid')]['template'];
        if ($template&&file_exists(TEMPLATE.'/'.$this->view->_style.'/'.$template)) $this->out($template);
        else {
            $tpl=type::gettemplate($this->view->typeid);

            //list-cache
            if (type::getishtml($this->view->typeid)) {
                $path=ROOT.type::url($this->view->typeid, @front::$get['page']>1 ? front::$get['page'] : null);
                if (!preg_match('/\.[a-zA-Z]+$/', $path)) $path=rtrim(rtrim($path, '/'), '\\').'/index.html';
                $this->cache_path=$path;
            }

            $this->out($tpl);
        }
		
		
    }

    function end() {
        $this->render();
    }
	
	function out($tpl) {
        if (front::$debug) return;
        $this->render($tpl);
        $this->out=true;
        exit;
    }

}

