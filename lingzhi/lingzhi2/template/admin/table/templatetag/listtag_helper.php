<div class="padding10">
    <img src="{$skin_path}/wj.gif" style="margin-right:10px;" />
    <a href="javascript:;" onclick="$('#listtaghelper').toggle();"><span style="color:green; font-weight:bold">列表助手</span><span style="color:blue;">(全能标签向导)</span></a>
</div>

<div class="padding10" id="listtaghelper" style="display:none;">

    <div id="list_tool">
        <script type="text/javascript">
            $(document).ready(function() {
                $('#list_tool').click(function() {
                    tagcontent=
                        '{\loop archive('+$('#catid').val()
                        +','+$('#typeid').val()
                        +','+$('#spid').val()
                        +','+'\''
                        +$('#province_id').val()
                        +','+$('#city_id').val()
                        +','+$('#section_id').val()
                        +'\''
                        +','+$('#length').val()
                        +','+'\''+$('#ordertype').val()+'\''
                        +','+$('#limit').val()
                        +','+$('#thumb').attr('checked')
                        +','+$('#attr1').val()
                        +') $\archive}'
                    ;
                    tagcontent+="<br />\r\n内容名称：{\$\archive[title]} <br />\r\n 内链接：{\$\archive[url]}<br />\r\n 缩略图地址：{\$\archive[thumb]} <br />\r\n 发布时间：{\$\archive[adddate]}<br />\r\n 浏览册数：{\$\archive[view]} <br />\r\n 内容简介：{\$\archive[introduce]} <br />\r\n 所属栏目名称：{\$\archive[catname]}<br />\r\n 所属栏目链接：{\$\archive[caturl]}<br />\r\n{/\loop}";
                    $('#tagcontentstyle').html(tagcontent);
                });
            });
        </script>
        <?php
        echo '栏目:'.form::select('catid', null, category::option());
        echo "&nbsp;&nbsp;&nbsp;&nbsp;";
        echo '分类:'.form::select('typeid', null, type::option());
        echo "&nbsp;&nbsp;&nbsp;&nbsp;";
        echo '专题:'.form::select('spid', null, special::option());
        echo '<br/><br/>';
        echo '地区:';
        echo form::select('province_id',0,area::province_option());
        echo form::select('city_id',0,area::city_option());
        echo form::select('section_id',0,area::section_option());
        echo '<br/><br/>';
        echo '标题截取字数:';
        echo form::input('length',20,'size=5');
        echo "&nbsp;&nbsp;&nbsp;&nbsp;";
        echo '排序方式:';
        echo form::select('ordertype','aid-desc',array(
        'aid-desc'=>'最新(按发布先后、按aid倒序)',
		'aid-asc'=>'最早(按发布先后、按aid顺序)',
        'view-desc'=>'最热(按view倒序)',
        'comment_num-desc'=>'热评(按comment_num倒序)',
        'rand()'=>'随机',
        ));
        echo '<br/><br/>';
        echo '调用记录条数:';
        echo form::input('limit',10,'size=5');
        echo "&nbsp;&nbsp;&nbsp;&nbsp;";
        echo '缩略图:';
        echo form::checkbox('thumb',0,array(1=>'有'));
        echo "&nbsp;&nbsp;&nbsp;&nbsp;";
        echo '推荐位:';
        echo form::select('attr1',0,array(0=>'请选择...',1=>'首页推荐',2=>'首页焦点',3=>'首页头条',4=>'列表页推荐',5=>'内容页推荐'));
        echo '<br/><br/>';
        echo '代码样式:<br/>';

        echo form::textarea('tagcontentstyle',null,'cols="70" rows="20"');


		echo '<br/><font style="color:red;">注：复制上面代码至【标签代码内容】框内进行编辑</font>';
        ?>
    </div>

</div>