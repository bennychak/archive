 <script language="javascript" src="{$base_url}/common/js/common.js"></script>
<div id="position">
<a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="{$skin_path}/undo.gif" style="float:right;" /></a>当前位置：添加友情链接
</div>

<div class="padding10">
<img src="{$skin_path}/wj.gif" style="margin-right:10px;" />欢迎来到添加友情链接页面。您可以添加与您合作的站点链接，以便获得良好的外链支持，从而使网站得到良好的推广效果。
</div>

<div class="blank10"></div>


<form method="post" name="form1" action="<?php if(front::$act=='edit') $id="/id/".$data[$primary_key]; else $id=''; echo modify("/act/".front::$act."/table/".$table.$id);?>"  onsubmit="return checkform();">
      <input type="hidden" name="onlymodify" value=""/>
      <table width="100%" border="0" cellspacing="1" cellpadding="4" class="list" name="table" id="table">
        <tbody>
                                     
            <tr>
                <td class="left">链接类型</td>
                <td>
                        {form::getform('linktype',$form,$field,$data)}       </td>
            </tr>

                            
            <tr>
                <td class="left">所属类别</td>
                <td>
                        {form::getform('typeid',$form,$field,$data)}               </td>
            </tr>

                            
            <tr>
                <td class="left">名称</td>
                <td>
                        {form::getform('name',$form,$field,$data)}           </td>
            </tr>

                            
            <tr>
                <td class="left">排序号</td>
                <td>
                        {form::getform('listorder',$form,$field,$data)}    </td>
            </tr>

                            
            <tr>
                <td class="left">链接</td>
                <td>
                        {form::getform('url',$form,$field,$data)}      </td>
            </tr>

                            
            <tr>
                <td class="left">LOGO</td>
                <td>
                        {form::getform('logo',$form,$field,$data)}                </td>
            </tr>

                            
            <tr>
                <td class="left">简介</td>
                <td>
                        {form::getform('introduce',$form,$field,$data)}                </td>
            </tr>

                            
            <tr>
                <td class="left">用户名</td>
                <td>
                        {form::getform('username',$form,$field,$data)}                </td>
            </tr>

                            
            <tr>
                <td class="left">状态</td>
                <td>
                        {form::getform('state',$form,$field,$data)}      <font color="red">*</font>          </td>
            </tr>
            
            <input type="hidden" name="hits" id="hits" value="0"   />

                        
            

            

        </tbody></table>

<div class="blank10"></div>
<div class="blank10"></div>
<input type="submit" name="submit" value=" 提交 " class="button"/>
    </form>