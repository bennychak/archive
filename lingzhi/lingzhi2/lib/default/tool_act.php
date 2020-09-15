<?php
/**
 * cmseasy: tool_act.php
 * ============================================================================
 * 版权所有 2008-2009 cmseasy，并保留所有权利。
 * -------------------------------------------------------
 * 这不是一个自由软件！也不是一个开源软件！您不能在任何目的的前提下对程序代码进行破解、修改和使用；
 * 不允许对程序代码以任何形式任何目的的再发布。
 * ============================================================================
 *
 * @version:    v1.7.091010
 * ---------------------------------------------
 * $Id: tool_act.php Sat Dec 06 17:13:14 CST 2008
 */


if (!defined('ROOT')) exit('Can\'t Access !');

class tool_act extends act {
    function init() {

    }

    function index_action() {
    }

    function verify_action() {
        echo verify::show();
    }

    function upload_action() {
        $res=array();

        $uploads=array();

        if(is_array($_FILES)) {
            $upload=new upload();
            foreach($_FILES as $name=>$file) {
                if(!$file['name'] || !preg_match('/\.(jpg|gif|png|bmp)$/',$file['name'])) {
                    continue;
                }
                $uploads[$name]=$upload->run($file);
                $res[$name]['name']=$uploads[$name];

                if(empty($uploads[$name])) {
                    $res['error']=$name.'上传失败！';
                    break;
                }

                $path=$upload->save_path;
                chmod($path, 0644);

                $catid=get('catid');
                $type=get('type');
                //缩略图
                if($type=='thumb') {
                    $thumb=new thumb();
                    $thumb->set($path,'file');
                    //$path=str_replace('.','_s.',$path);

                    if($catid)
                        $thumb->create($path,category::getwidthofthumb($catid),category::getheightofthumb($catid));
                    else
                        $thumb->create($path,config::get('thumb_width'),config::get('thumb_height'));
                }

                //$res['error']=var_export($_GET,true);

                $_name=str_replace('_upload','',$name);

                $res[$name]['code']="
                if(document.form1)
                document.form1.$_name.value=data[key].name;
                else
                $('#$_name').val(data[key].name);
                image_preview('$_name',data[key].name);
                        ";
            }
        }
        echo json::encode($res);
    }


    function upload_thumb_action() {
        $res=array();

        $uploads=array();

        if(is_array($_FILES)) {
            $upload=new upload();
            foreach($_FILES as $name=>$file) {
                if(!$file['name'] || !preg_match('/\.(jpg|gif|png|bmp)$/',$file['name'])) {
                    continue;
                }
                $uploads[$name]=$upload->run($file);

                if(empty($uploads[$name])) {
                    $res['error']=$name.'上传失败！';
                    break;
                }

                $res[$name]['name']=$uploads[$name];

                //缩略图
                $path=$upload->save_path;
                chmod($path, 0644);
                $thumb=new thumb();
                $thumb->set($path,'file');
                //$path=str_replace('.','_s.',$path);
                $catid=get('catid');
                $type=get('type');

                if($catid)
                    $thumb->create($path,category::getwidthofthumb($catid),category::getheightofthumb($catid));
                else
                    $thumb->create($path,config::get('thumb_width'),config::get('thumb_height'));

                $_name=str_replace('_upload','',$name);

                $res[$name]['code']="
                document.form1.$_name.value=data[key].name;
                image_preview('$_name',data[key].name);
                        ";
            }
        }
        echo json::encode($res);
    }

    function upload3_action() {
        $res=array();

        $uploads=array();

        if(is_array($_FILES)) {
            $upload=new upload();
            foreach($_FILES as $name=>$file) {
                if(!$file['name'] || !preg_match('/\.(jpg|gif|png|bmp)$/',$file['name'])) {
                    continue;
                }
                $uploads[$name]=$upload->run($file);
                $res[$name]['name']=front::$view->base_url.'/'.$uploads[$name];

                //缩略图
                $path=$upload->save_path;
                chmod($path, 0644);
                $thumb=new thumb();
                $thumb->set($path,'file');
                //$path=str_replace('.','_s.',$path);
                $thumb->create($path,config::get('slide_width'));

                $_name=str_replace('_upload','',$name);

                $res[$name]['code']="document.config_form.$_name.value=data[key].name;image_preview('$_name',data[key].name);";
            }
        }
        echo json::encode($res);
    }


    function upload1_action() {
        $res=array();

        $uploads=array();

        if(is_array($_FILES)) {
            $upload=new upload();
            foreach($_FILES as $name=>$file) {
                if(!$file['name'] || !preg_match('/\.(jpg|gif|png|bmp)$/',$file['name'])) {
                    continue;
                }
                $uploads[$name]=$upload->run($file);
                $res[$name]['name']=$uploads[$name];

                //缩略图
                $path=$upload->save_path;
                chmod($path, 0644);
                $_name=str_replace('_upload','',$name);

                $res[$name]['code']="document.form1.$_name.value=data[key].name;image_preview('$_name',data[key].name);";
            }
        }
        //file_put_contents('log.txt',json::encode($res) );
        echo json::encode($res);
    }

    function upload2_action() {
        $res=array();

        $uploads=array();

        if(is_array($_FILES)) {
            $upload=new upload();
            foreach($_FILES as $name=>$file) {
                if(!$file['name'] || !preg_match('/\.(jpg|gif|png|bmp)$/',$file['name'])) {
                    continue;
                }
                $uploads[$name]=$upload->run($file);
                $res[$name]['name']=$uploads[$name];

                //缩略图
                $path=$upload->save_path;
                chmod($path, 0644);
                $_name=str_replace('_upload','',$name);

                $res[$name]['code']="document.form1.$_name.value=data[key].name;image_preview('$_name',data[key].name);";
            }
        }
        //file_put_contents('log.txt',json::encode($res) );
        echo json::encode($res);
    }


    function upload_file_action() {
        $res=array();

        $uploads=array();
        if(is_array($_FILES)) {
            $upload=new upload();
            $upload->dir='attachment';
			$_file_type = str_replace(',','|',config::get('upload_filetype'));
            foreach($_FILES as $name=>$file) {
                if(!$file['name'] || !preg_match('/\.('.$_file_type.')$/',$file['name']))  continue;
                $uploads[$name]=$upload->run($file);
                $res[$name]['name']=$uploads[$name];

                $_name=str_replace('_upload','',$name);

                $res[$name]['code']="
                document.form1.$_name.value=data[key].name;
                        ";
            }
        }

        echo json::encode($res);
    }



    function uploadfile_action() {
        $res=array();
        $uploads=array();
        if(is_array($_FILES)) {
            $upload=new upload();
            $upload->dir='attachment';
            $upload->max_size=2048000;
            $attachment=new attachment();
			$_file_type = str_replace(',','|',config::get('upload_filetype'));

            foreach($_FILES as $name=>$file) {

                $res[$name]['size']=ceil($file['size']/1024);

                if($file['size']>$upload->max_size) {
                    $res[$name]['code']="alert('附件超过上限(".ceil($upload->max_size/1024)."K)！');";
                    break;
                }

                if(!front::checkstr(file_get_contents($file['tmp_name']))) {
                    $res[$name]['code']='上传失败！附件没有通过验证！';
                    break;
                }

                if(!$file['name'] || !preg_match('/\.('.$_file_type.')$/',$file['name']))  continue;
                $uploads[$name]=$upload->run($file);

                if(!$uploads[$name]) {
                    $res[$name]['code']="alert('附件保存失败！');";
                    break;
                }

                $res[$name]['name']=$uploads[$name];

                $res[$name]['type']=$file['type'];

                $attachment->rec_insert(array('path'=>$uploads[$name],'intro'=>front::post('attachment_intro'),'adddate'=>date('Y-m-d H:i:s')));
                $res[$name]['id']=$attachment->insert_id();

                $rname=preg_replace('%(.*)[\\\\\/](.*)_\d+(\.[a-z]+)$%i','$2$3',$uploads[$name]);

                $res[$name]['code']="
                document.form1.attachment_id.value=data[key].id;
                if(!document.form1.attachment_intro.value) {
                document.form1.attachment_intro.value='$rname';
                }
                get('attachment_path').innerHTML=data[key].name;
                get('file_info').innerHTML='附件已保存！大小为:'+data[key].size+'K ';
                        ";

                session::set('attachment_id',$res[$name]['id']);
            }
        }
        echo json::encode($res);
    }

    function uploadimage_action() {
        $res=array();
        $uploads=array();
        if(is_array($_FILES)) {
            $upload=new upload();
            $upload->dir='attachment';
            $upload->max_size=2048000;
            $attachment=new attachment();
			$_file_type = str_replace(',','|',config::get('upload_filetype'));

            foreach($_FILES as $name=>$file) {

                $res[$name]['size']=ceil($file['size']/1024);

                if($file['size']>$upload->max_size) {
                    $res[$name]['code']="alert('附件超过上限(".ceil($upload->max_size/1024)."K)！');";
                    break;
                }

                if(!front::checkstr(file_get_contents($file['tmp_name']))) {
                    $res[$name]['code']='上传失败！附件没有通过验证！';
                    break;
                }

                if(!$file['name'] || !preg_match('/\.('.$_file_type.')$/',$file['name']))  continue;
                $uploads[$name]=$upload->run($file);

                if(!$uploads[$name]) {
                    $res[$name]['code']="alert('附件保存失败！');";
                    break;
                }

                $res[$name]['name']=$uploads[$name];

                $res[$name]['type']=$file['type'];

               // $attachment->rec_insert(array('path'=>$uploads[$name],'intro'=>front::post('attachment_intro'),'adddate'=>date('Y-m-d H:i:s')));
                //$res[$name]['id']=$attachment->insert_id();

                $rname=preg_replace('%(.*)[\\\\\/](.*)_\d+(\.[a-z]+)$%i','$2$3',$uploads[$name]);

                $res[$name]['code']="
                document.form1.attachment_id.value=data[key].id;
                if(!document.form1.attachment_intro.value) {
                document.form1.attachment_intro.value='$rname';
                }
                get('attachment_path').innerHTML=data[key].name;
                get('file_info').innerHTML='附件已保存！大小为:'+data[key].size+'K ';
                        ";

                //session::set('attachment_id',$res[$name]['id']);

                echo config::get('base_url').'/'.$uploads[$name];
                return;
            }
        }
        echo json::encode($res);
    }

    function deleteattachment_action() {
        $attachment=new attachment();
        $attachment->del(front::get('id'));
    }

    function ding_action() {
        echo tool::text_javascript('null');
    }

}