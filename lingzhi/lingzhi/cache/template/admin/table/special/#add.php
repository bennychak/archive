<?php defined('ROOT') or exit('Can\'t Access !'); ?>
<script language="javascript" src="<?php echo $base_url;?>/common/js/common.js"></script>


<div id="position">
    <a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="<?php echo $skin_path;?>/undo.gif" style="float:right;" /></a>当前位置：添加内容
</div>


<div class="blank10"></div>

<form method="post" name="form1" action="<?php if(front::$act=='edit') $id="/id/".$data[$primary_key]; else $id='';
      echo modify("/act/".front::$act."/table/".$table.$id);?>" enctype="multipart/form-data" onsubmit="return checkform();">
    <input type="hidden" name="onlymodify" value=""/>

    <script type="text/javascript" src="<?php echo $base_url;?>/common/js/jquery-1.2.6.min.js"></script>
    <script type="text/javascript" src="<?php echo $base_url;?>/common/js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="<?php echo $base_url;?>/common/js/ThumbAjaxFileUpload.js"></script>
    <link rel="stylesheet" href="<?php echo $base_url;?>/common/js/jquery/ui/ui.datepicker.css" type="text/css" media="screen" title="core css file" charset="utf-8" />
    <script language="javascript" src="<?php echo $base_url;?>/common/js/jquery/ui/ui.datepicker.js"></script>


    <div class="hid_box">
        <strong>标题</strong>
        <div class="hbox" style="background:none;">
            <?php echo form::getform('title',$form,$field,$data);?>
        </div>
    </div>

    <div class="hid_box">
        <strong>横幅</strong>
        <div class="hbox" style="background:none;">
            <?php echo form::getform('banner',$form,$field,$data);?>
        </div>
    </div>

        <div class="hid_box">
        <strong>描述</strong>
        <div class="hbox" style="background:none;">
            <?php echo form::getform('description',$form,$field,$data);?>
        </div>
    </div>


    <div class="blank10"></div>
    <div class="blank10"></div>
    <input type="submit" name="submit" value=" 提交 " class="button" />

</form>