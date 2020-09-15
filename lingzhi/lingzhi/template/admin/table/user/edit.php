
<script type="text/javascript" src="{$base_url}/common/js/jquery-1.2.6.min.js"></script>
<script type="text/javascript" src="{$base_url}/common/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="{$base_url}/common/js/ThumbAjaxFileUpload.js"></script>
<link rel="stylesheet" href="{$base_url}/common/js/jquery/ui/ui.datepicker.css" type="text/css" media="screen" title="core css file" charset="utf-8" />
<script language="javascript" src="{$base_url}/common/js/jquery/ui/ui.datepicker.js"></script>

<script language="javascript" src="{$base_url}/common/js/common.js"></script>

<div id="position">
<a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="{$skin_path}/undo.gif" style="float:right;" /></a>当前位置：编辑用户
</div>

<div class="padding10">
<img src="{$skin_path}/wj.gif" style="margin-right:10px;" />欢迎来到编辑用户页面。您可以编辑可登录网站的用户，使得网站与浏览者可以完成良好的互动形式。
</div>

<div class="blank10"></div>

<form method="post" name="form1" action="<?php if(front::$act=='edit') $id="/id/".$data[$primary_key]; else $id=''; echo modify("/act/".front::$act."/table/".$table.$id);?>"  onsubmit="return checkform();">

<table border="0" cellspacing="0" cellpadding="4" class="list" name="table" id="table">

        <tbody>
            
                                            
            <tr>
                <td class="left">用户名</td>
                <td>
                        {form::getform('username',$form,$field,$data)}                </td>
            </tr>

                            
            <tr>
                <td class="left">密码</td>
                <td>
                        <input type="text" name="passwordnew" id="passwordnew" value=""  />&nbsp;&nbsp;如果不更改密码此处请留空                </td>
            </tr>

                            
            <tr>
                <td class="left">昵称</td>
                <td>
                        {form::getform('nickname',$form,$field,$data)}                </td>
            </tr>
</tr>
                <td class="left">安全问题</td>
                <td>{form::getform('question',$form,$field,$data)}</td>
            </tr> 
            </tr>
                <td class="left">您的答案</td>
                <td>{form::getform('answer',$form,$field,$data)}</td>
            </tr>              
            <tr>
                            
            <tr>
                <td class="left">用户组</td>
                <td>
                        {form::getform('groupid',$form,$field,$data)}                </td>
            </tr>

                            
            <tr>
                <td class="left">QQ号码</td>
                <td>
                        {form::getform('qq',$form,$field,$data)}                </td>
            </tr>

                            
            <tr>
                <td class="left">E-Mail</td>
                <td>
                        {form::getform('e_mail',$form,$field,$data)}                </td>
            </tr>

                            
            <tr>
                <td class="left">电话</td>
                <td>
                        {form::getform('tel',$form,$field,$data)}                </td>
            </tr>

			<tr>
                <td class="left">地址</td>
                <td>
                        {form::getform('address',$form,$field,$data)}                </td>
            </tr>

			<tr>
                <td class="left">介绍</td>
                <td>
                        {form::getform('intro',$form,$field,$data)}                </td>
            </tr>

                                                        
            

                        <tr><th colspan="5">自定义</th></tr>
            {loop $field $f}
            <?php
            $name=$f['name'];
            if(!preg_match('/^my_/',$name)) {
            unset($field[$name]);
            continue;
            }
            if(!isset($data[$name])) $data[$name]='';
            ?>
            <tr>
                <td class="left"><?php echo setting::$var['user'][$name]['cname']; ?></td>
                <td>
                    <?php echo form::getform($name,$form,$field,$data); ?>
                </td>
            </tr>
            {/loop}
            

        </tbody></table>

<div class="blank20"></div>
<input type="submit" name="submit" value="提交" class="button"/>

</form>