<?php defined('ROOT') or exit('Can\'t Access !'); ?>
<script type="text/javascript" src="<?php echo $base_url;?>/js/list.js"></script>
<script src="<?php echo $base_url;?>/common/js/jquery/jquery-latest.js"></script>
<script  src="<?php echo $base_url;?>/common/js/jquery/ui/ui.core.js"></script>
<script  src="<?php echo $base_url;?>/common/js/jquery/ui/ui.resizable.js"></script>
<script  src="<?php echo $base_url;?>/common/js/jquery/ui/ui.draggable.js"></script>
<script  src="<?php echo $base_url;?>/common/js/jquery/ui/ui.dialog.js"></script>
<script src="<?php echo $base_url;?>/common/js/jquery/jquery.form.js"></script>
<link rel="stylesheet" href="<?php echo $base_url;?>/common/js/jquery/ui/themes/flora/flora.all.css" type="text/css"/>

<script src="<?php echo $base_url;?>/common/js/common.js"></script>

<script>
    function hide_edit(id) {
        $(id+'_save_button').css('display','none');
        $(id).hide('fast');
        $(id+'_textarea').html('');
        //$(id+'_content').resizable('destroy')
    }

    function show_edit(id) {
        $.ajax({
            url: '<?php echo url('template/fetch',true);?>',
            data:'&id='+id,
            type: 'POST',
            dataType: 'json',
            timeout: 3000,
            error: function(){
            },
            success: function(data){
                $(id+'_textarea').html(data.content);
                if(data.content)
                    $(id+'_save_button').css('display','block');
            }
        });

        $(id).show('fast');
        //$(id+'_content').resizable();
    }


    function show_fckedit(id) {
        $.ajax({
            url: '<?php echo url('template/fckedit',true);?>',
            data:'&id='+id,
            type: 'POST',
            dataType: 'json',
            timeout: 3000,
            error: function(){
            },
            success: function(data){
                $(id+'_textarea').html(data.content);
                if(data.content)
                    $(id+'_save_button').css('display','block');
            }
        });

        $(id).show('fast');
        //$(id+'_content').resizable();
    }

    function toggle_edit(id,fck) {
        if($(id).css('display')=='none') {
            show_edit(id);
            $(id+'_state_toggle').html('[收起]');
        }
        else {
            if(fck)  show_fckedit(id);
            else{
                hide_edit(id);
                $(id+'_state_toggle').html('[编辑]');
            }
        }
    }


    function edit_save(id,content) {
        $('#sid').val(id);
        $('#slen').val(content.length);
        $('#scontent').val(content);
        $('#editform').ajaxSubmit(function(data) {
            if(data=='ok') alert("保存成功!");
            else alert("保存失败!");
        });
    }


    function helper() {
        $("#example").dialog({ modal: true });
    }
</script>

<div id="position">
    <a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="<?php echo $skin_path;?>/undo.gif" style="float:right;" /></a>当前位置：编辑模板
</div>

<div class="padding10">
    <img src="<?php echo $skin_path;?>/wj.gif" style="margin-right:10px;" />欢迎来到在线编辑模板页面。您可以在网站后台即可完成网站样式的修改。
</div>

<div class="blank30"></div>

<form name="form1" id="form1" method="post" action="">

    <table border="0" cellspacing="0" cellpadding="4" class="list" name="table" id="table">
        <thead>
            <tr>
                <th width="50%">档案</th>
                <th width="25%">名称</th>
                <th width="25%">简短描述</th>
            </tr>
        </thead>
    </table>


    <?php foreach($tps as $tpl => $tp) { ?>
    <?php if (preg_match('/#/',$tp)) continue; ?>
    <?php $_tp=str_replace('_html','.html',$tp);?>
    <?php $_tp=str_replace('_css','.css',$_tp);?>
    <?php $_tp=str_replace('_js','.js',$_tp);?>
    <?php $tpt=str_replace('/','_d_',$tpl);?>

    <?php $cs=preg_replace('%\/.*%', '', $tpl);?>


    <div <?php if(preg_match('/\.|└/',$tp)) { ?>class="<?php echo $cs;?>_li" style="display:none" <?php } else { ?>id="<?php echo $tpt;?>_div"  style="margin-top:10px" <?php } ?>>

        <table border="0" cellspacing="0" cellpadding="4" class="list" name="table" id="table">
            <tbody>
                <tr class="s_out" onmouseover="m_over(this)" onmouseout="m_out(this)">
                    <td width="50%"><span style="float:left;">
                            <?php echo $_tp;?></span>
                        <?php if(preg_match('/.(html|css|js)/',$tp)) { ?>
                        <span style="cursor:pointer;padding-left:10px" onclick="toggle_edit('#<?php echo $tpt;?>')" id="<?php echo $tpt;?>_state_toggle">[编辑]</span>
                        <?php } elseif (!preg_match('/└/',$_tp)) { ?>
                        <span style="float:left;cursor:pointer;" onclick="$('.<?php echo $tpt;?>_li').toggle()" id="<?php echo $tpt;?>_dir_state_toggle"><img src="<?php echo $skin_path;?>/folder.gif" height="20"/></span>
                        <?php } ?>
                    </td>
                    <td  width="25%">
                        <input type="text" name="<?php echo $tpl;?>_name" size="15" value="<?php echo @help::tpl_name($tpl);?>">
                    </td>
                    <td width="25%">
                        <input type="text" name="<?php echo $tpl;?>_note" size="40" value="<?php echo @help::tpl_note($tpl);?>">
                    </td>
                </tr>
            </tbody>
        </table>

        <!--dir-->
        <div  id="<?php echo $tpt;?>" style="display:none">
            <table border="0" cellspacing="0" cellpadding="4" class="list" name="table" id="table">
                <tbody>
                    <tr class="s_out" onmouseover="m_over(this)" onmouseout="m_out(this)">
                        <td>
                            <div id="<?php echo $tpt;?>_textarea" style="width:100%;">... ...
                                <!--textarea rows="20" cols="78" id="<?php echo $tpt;?>_content" style="font-family: Fixedsys,verdana,宋体; font-size: 12px;" name="<?php echo $tpt;?>_content"></textarea-->
                            </div>
                            <div id="iframe-div">
                                <div style="width:99%;"> <!--iframe src="<?php echo url("templatetag/visual/id/$tpt",false);?>" id="tageditframe123" style="height:500px;width:100%;"></iframe--></div>
                            </div>
                            <div class="padding10">
                                <div id="<?php echo $tpt;?>_save_button" style="display:none">
                                    <span><input type="button" value="保存" name="<?php echo $tpt;?>_edit" class="button" onclick="if(get('<?php echo $tpt;?>_fck')) content=getContent('<?php echo $tpt;?>_content'); else content=this.form.<?php echo $tpt;?>_content.value;  edit_save('<?php echo $tpt;?>',content);"/>&nbsp;&nbsp;<!--input type="button" value="标签助手" class="greenbtn" onclick="helper()" name="<?php echo $tpt;?>_edit"  id="<?php echo $tpt;?>_edit" /--></span>
                                    <span><a href="<?php echo url("templatetag/visual/id/$tpt/prefix/".ADMIN_DIR,false);?>" target="_blank">可视化标签管理</a></span>
                                    <!--span><a href="javascript:;"  onclick="toggle_edit('#<?php echo $tpt;?>','fck');">使用内容编辑器(非模板使用)</a></span-->
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

    </div>
    <?php } ?>


    <div class="blank10"></div>
    <input type="submit" value=" 修改 " name="submit" class="button" />




</form>



<form name="editform" id="editform" method="post" action="<?php echo url('template/save');?>">
    <input type="hidden" value="" name="sid" id="sid" />
    <input type="hidden" value="" name="slen" id="slen" />
    <input type="hidden" value="" name="scontent" id="scontent" />
</form>

