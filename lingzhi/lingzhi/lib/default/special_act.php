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

class special_act extends act {


    function list_action() {


        $this->view->page=front::get('page')?front::get('page'):1;
        $this->pagesize=config::get('list_pagesize');
        $limit=(($this->view->page-1)*$this->pagesize).','.$this->pagesize;

        $special=new special();

        $specials=$special->getrows('',$limit,'listorder,spid desc');
        foreach($specials as $order=>$sp) {
            $specials[$order]['url']=special::url($sp['spid']);
        }
        $this->view->specials=$specials;

        $this->view->record_count=$special->rec_count('');
        front::$record_count=$this->view->record_count;

        $this->view->page=true;
		

    }

    function show_action() {

        $this->view->page=front::get('page')?front::get('page'):1;
        $this->pagesize=config::get('list_pagesize');
        $limit=(($this->view->page-1)*$this->pagesize).','.$this->pagesize;

        $special=new special();
        $this->view->special=$special->getrow('spid='.front::get('spid'));
		
		$this->view->archive['title'] =  $this->view->special['title'];
		
		$this->view->pages=true;

        $archive=new archive();
        $archives=$archive->getrows('spid='.front::get('spid'),$limit);

        foreach($archives as $order=>$arc) {
            $archives[$order]['url']=archive::url($arc);
            $archives[$order]['catname']=category::name($arc['catid']);
            $archives[$order]['caturl']=category::url($arc['catid']);

            $archives[$order]['adddate']= sdate($arc['adddate']);

            $archives[$order]['stitle']= strip_tags($arc['title']);
        }

        $this->view->archives=$archives;
        $this->view->record_count=$archive->rec_count('spid='.front::get('spid'));
        front::$record_count=$this->view->record_count;
        $this->view->spid=front::get('spid');

    }

    function end() {
        $this->render();
    }
}

