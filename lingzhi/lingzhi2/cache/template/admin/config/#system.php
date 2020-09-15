<?php defined('ROOT') or exit('Can\'t Access !'); ?>
<script type="text/javascript" src="<?php echo $base_url;?>/common/js/common.js"></script>
<script type="text/javascript" src="<?php echo $base_url;?>/common/js/jquery-1.2.6.min.js"></script>
<script type="text/javascript" src="<?php echo $base_url;?>/common/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="<?php echo $base_url;?>/common/js/ThumbAjaxFileUpload.js"></script>
<div id="position">
    <a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="<?php echo $skin_path;?>/undo.gif" style="float:right;" /></a>当前位置：网站设置
</div>

<div class="padding5">
    <img src="<?php echo $skin_path;?>/wj.gif" style="margin-right:10px;" />欢迎来到网站设置页面。您可以在这里控制您站点的主要功能。
</div>


<div class="blank10"></div>


<div class="box" style="display:block;">

<div class="box1">
<ul style="text-align:center">
  <li><a href="<?php echo url::create('config/system/set/site');?>">网站设置</a></li>
  <li><a href="<?php echo url::create('config/system/set/system');?>">系统设置</a></li>
  <li><a href="<?php echo url::create('config/system/set/image');?>">图片设置</a></li>
  <li><a href="<?php echo url::create('config/system/set/upload');?>">附件设置</a></li>
  <li><a href="<?php echo url::create('config/system/set/security');?>">安全设置</a></li>
  <li><a href="<?php echo url::create('config/system/set/template');?>">模板设置</a></li>
  <li><a href="<?php echo url::create('config/system/set/mail');?>">邮件设置</a></li>
  <li><a href="<?php echo url::create('config/system/set/enlarge');?>">客服设置</a></li>
  <li><a href="<?php echo url::create('config/system/set/slide');?>">幻灯片设置</a></li>
  <li><a href="<?php echo url::create('config/system/set/cnzz');?>">统计设置</a></li>
  </ul>
</div>

<form method="post" action="<?php echo uri();?>" name="config_form">
<div class="clear"></div>
<table border="0" cellspacing="0" cellpadding="4" class="list" name="table" id="table">
<tbody id="listtable">
        <tr bgcolor="">

        </tr> 
</thead>
    <tr><td colspan="10"></td></tr>
    


        <?php foreach($units as $key => $unit) { ?>

       <tr><th colspan="10">
                    <?php echo $unit;?>
                </th>
            </tr>


        <?php if(isset($items[$key])) { ?>
        <?php foreach($items[$key] as $item) { ?>

            <tr>
                <td class="left"><?php echo $item['title'];?></td>
                <td class="right"  colspan="8">
                    <?php if(isset($item['select']) && is_array($item['select'])) { ?>
                    <?php echo form::select($item['name'],get($item['name']),$item['select']);?>
                    <?php } elseif (strlen(get($item['name']))>50) { ?>
                    <?php echo form::textarea($item['name'],get($item['name']),'cols="40" rows="5"');?>
                    <?php } elseif (isset($item['image'])) { ?>
                    <?php echo form::upload_image($item['name'],get($item['name']));?>
                    <?php } else { ?>
                    <?php echo form::input($item['name'],get($item['name']),'size="'.min(strlen(get($item['name']))*2,50).'"');?>
                    <?php } ?>
                    <?php if($item['name']=='watermark_pos') { ?>
                    <?php echo template('config/watermark_pos_select.php'); ?>
                    <?php } ?>
                </td>
                <td class="gray">
                    <?php if(isset($item['intro'])) { ?>
                    <?php echo $item['intro'];?>
                    <?php } ?>
                </td>
            </tr>
            <?php } ?>


        <?php } ?>
        <?php } ?>

</tbody>
</table>
<div class="blank30"></div>
<span style="margin-left:100px;"><input type="submit" name="submit" value=" 提交 " class="button" /></span>
<div class="blank10"></div>

</form>

</div>