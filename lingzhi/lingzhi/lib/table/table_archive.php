<?php
/**
 * cmseasy: table_archive.php
 * ============================================================================
 * 版权所有 2008-2009 cmseasy，并保留所有权利。
 * -------------------------------------------------------
 * 这不是一个自由软件！也不是一个开源软件！您不能在任何目的的前提下对程序代码进行破解、修改和使用；
 * 不允许对程序代码以任何形式任何目的的再发布。
 * ============================================================================
 *
 * @version:    v1.7.091010
 * ---------------------------------------------
 * $Id: table_archive.php Fri Jan 09 20:06:36 CST 2009
 */
if (!defined('ROOT')) exit('Can\'t Access !');

class table_archive  extends table_mode {

    function view_before(&$data) {
        $pics = unserialize($data['pics']);
        if(is_array($pics) && !empty($pics)){
            foreach ($pics as $k => $v){
                $data['pics'.$k] = $v;
            }
        }
		$archive['pics'] = $v;
        unset($data['pics']);
        $rank=new rank();
        $rank=$rank->getrow('aid='.front::get('id'));
        if(is_array($rank))
            $data['_ranks']=unserialize($rank['ranks']);
        else $data['_ranks']=array();

        unset($data['ranks']);

        //if(!$data['template']) $data['template']=category::gettemplate($data['catid'],'showtemplate');
        //if(!$data['htmlrule']) $data['htmlrule']=category::gethtmlrule($data['catid'],'showhtmlrule');
    }

    function vaild() {
        if(!front::post('title')) {
            front::flash('请填写标题！');
            return false;
        }
        if(!front::post('catid')) {
            front::flash('请选择分类！');
            return false;
        }
        return true;
    }


    function add_before(act $act) {
        front::$post['userid']=$act->view->user['userid'];
        front::$post['username']=$act->view->user['username'];
		if(empty(front::$post['author'])){
			front::$post['author']=$act->view->user['username'];
		}        
        front::$post['checked']=1;
		if(empty(front::$post['adddate'])){
			front::$post['adddate']=date('Y-m-d H:i:s');
		}
        /*$pics = array();
        foreach(front::$post as $k => $v){
            if(preg_match('/pics(\d+)/i', $k,$out)){
                $pics[$out[1]] = $v;
                unset(front::$post[$k]);
            }
        }
        front::$post['pics'] = serialize($pics);*/
    }

    function save_before() {
	    parent::save_before();
        $pics = array();
        foreach(front::$post as $k => $v){
            if(preg_match('/pics(\d+)/i', $k,$out)){
                $pics[$out[1]] = $v;
                unset(front::$post[$k]);
            }
        }
        front::$post['pics'] = serialize($pics);
        //var_dump(front::$post);exit;
        if(!front::post('attr1')) {
            front::$post['attr1']='';
        }
        if(!front::$post['introduce'])
            front::$post['introduce']=cut(strip_tags(front::$post['content']),front::$post['introduce_len']*2);

        //水印
        $content=front::post('content');
        preg_match_all('%<img[^>]*?src="[^"]*?(/upload/(archive|attachment|images)/[^"]*?[^w]\.jpg)"%i', $content, $result, PREG_SET_ORDER);
        include_once ROOT.'/lib/plugins/watermark.php';
        foreach($result as $img) {
			if(config::get('watermark_open')){
            imageWaterMark(ROOT.$img[1],config::get('watermark_pos'),ROOT.config::get('watermark_path'), null,5,"#FF0000",
                    config::get('watermark_ts'),config::get('watermark_qs'));
			}
            $img=$img[1];
            $img_new=str_replace('.jpg','w.jpg',$img);
            rename(ROOT.$img, ROOT.$img_new);
            front::$post['content']=str_replace($img, $img_new, front::$post['content']);
        }
    }

    function save_after($aid) {
        //标签
        $tag=preg_replace('/\s+/', ' ', trim(front::$post['tag']));
        $tags=explode(' ',$tag);
        $tag_table=new tag();
        $arctag_table=new arctag();
        foreach($tags as $tag) {
            if($tag)
                if(!$tag_table->getrow('tagname="'.$tag.'"'))
                    $tag_table->rec_insert(array('tagname'=>$tag));
            $tag=$tag_table->getrow('tagname="'.$tag.'"');
            $arctag_table->rec_replace(array('aid'=>$aid,'tagid'=>$tag['tagid']));
        }

        //附件
        if(session::get('attachment_id') || front::post('attachment_id')) {
            $attachment_id=session::get('attachment_id')?session::get('attachment_id'):front::post('attachment_id');
            $attachment=new attachment();
            $attachment->rec_update(array('aid'=>$aid,'intro'=>front::post('attachment_intro')),$attachment_id);
            if(session::get('attachment_id')) session::del('attachment_id');
        }


        //权限
        if(front::post('_ranks')) {

            $_ranks=serialize(front::post('_ranks'));
            $rank=new rank();
            if(is_array($rank->getrow(array('aid'=>$aid))))
                $rank->rec_update(array('ranks'=>$_ranks),'aid='.$aid);
            else
                $rank->rec_insert(array('aid'=>$aid,'ranks'=>$_ranks));
        }
        else {
            $rank=new rank();
            $rank->rec_delete('aid='.$aid);
        }

        //投票
        if(front::post('vote')) {
            $votes=front::$post['vote'];
            $images=front::$post['vote_image'];
            $vote=new vote();

            $_vote=$vote->getrow('aid='.$aid);
            if(!$_vote) $_vote=array('aid'=>$aid);

            $_vote['titles']=serialize($votes);
            $_vote['images']=serialize($images);
            $vote->rec_replace($_vote,$aid);
        }
        else {
            //	$vote=new vote();
            //	$vote->rec_delete('aid='.$aid);
        }


        $arc_url='http://'.front::$domain.url('archive/show/aid/'.$aid,false);
        file_get_contents($arc_url);

    }



    function delete_before($id) {
        $arc=new archive();
        $info=$arc->getrow($id);
        if(category::getarcishtml($info)) {
            $path=ROOT.preg_replace("%".THIS_URL."[\\/]%",'',archive::url($info));
            if(file_exists($path)) unlink($path);
        }
    }

}