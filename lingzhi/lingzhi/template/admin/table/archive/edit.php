<script language="javascript" src="{$base_url}/common/js/common.js"></script>

<script>

    function checkform() {
        if(!document.form1.title.value) {
            alert('请填写标题');
            return false;
        }
        if(!document.form1.catid.value) {
            alert('请选择栏目');
            return false;
        }
        return true;
    }
</script>


<div id="position">
    <a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="{$skin_path}/undo.gif" style="float:right;" /></a>当前位置：编辑内容
</div>
<div class="padding10">
    <img src="{$skin_path}/wj.gif" style="margin-right:10px;" />123欢迎来到编辑内容页面。您可以编辑修改网站内容，展示网站信息。
</div>

<div class="blank10"></div>


<form method="post" name="form1" action="<?php if(front::$act=='edit') $id="/id/".$data[$primary_key]; else $id='';
      echo modify("/act/".front::$act."/table/".$table.$id);?>" enctype="multipart/form-data" onsubmit="return checkform();">

    <script type="text/javascript" src="{$base_url}/common/js/jquery-1.2.6.min.js"></script>
    <script type="text/javascript" src="{$base_url}/common/js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="{$base_url}/common/js/ThumbAjaxFileUpload.js"></script>
    <link rel="stylesheet" href="{$base_url}/common/js/jquery/ui/ui.datepicker.css" type="text/css" media="screen" title="core css file" charset="utf-8" />
    <script language="javascript" src="{$base_url}/common/js/jquery/ui/ui.datepicker.js"></script>

    <script type="text/javascript" src="{$base_url}/common/swfupload/swfupload.js"></script>
    <script type="text/javascript" src="{$base_url}/common/swfupload/swfupload.queue.js"></script>
    <script type="text/javascript" src="{$base_url}/common/swfupload/fileprogress.js"></script>
    <script type="text/javascript" src="{$base_url}/common/swfupload/handlers.js"></script>


   <script type="text/javascript"> 
        $(document).ready(function(){
            var swfu;
            var settings = {
                flash_url : "{$base_url}/common/swfupload/swfupload.swf",
                upload_url: "{url('tool/uploadimage',false)}",
                post_params: {"PHPSESSID" : "<?php echo session_id(); ?>"},
                file_size_limit : "2MB",
                file_types : "*.jpg;*.gif;*.png;*.bmp",
                file_types_description : "图片", //All Files
                file_upload_limit : 100,
                file_queue_limit : 0,
                custom_settings : {
                    progressTarget : "fsUploadProgress",
                    cancelButtonId : "btnCancel"
                },
                debug: false,

                // Button settings
                //button_image_url: "{$base_url}/common/swfupload/botton.png",
                button_width: "100",
                button_height: "22",
                button_placeholder_id: "spanButtonPlaceHolder",
                button_text: '<span class="theFont">批量上传图片</span>',
                button_text_style: ".theFont{font-size:12px;width:100px;height:22px;line-height:22px;font-weight:bold;}",
                button_text_left_padding: 7,
                button_text_top_padding: 5,
				button_disabled : false,
				button_window_mode: SWFUpload.WINDOW_MODE.TRANSPARENT,
                button_cursor: SWFUpload.CURSOR.HAND,

                // The event handler functions are defined in handlers.js
                file_queued_handler : fileQueued,
                file_queue_error_handler : fileQueueError,
                file_dialog_complete_handler : fileDialogComplete,
                upload_start_handler : uploadStart,
                upload_progress_handler : uploadProgress,
                upload_error_handler : uploadError,
                upload_success_handler : uploadSuccess,
                upload_complete_handler : uploadComplete,
                queue_complete_handler : queueComplete	// Queue plugin event
            };

             swfu = new SWFUpload(settings);
        });
    </script>


    <style type="text/css">
        .progressName {
            margin-top: 5px;
        }
    </style>


    <script>
        $(document).ready(function(){
            $("#catid").change( function(){
                get_field($("#catid").val());
            });
        });
        function attachment_delect(id) {
            $.ajax({
                url: '{url('tool/deleteattachment',false)}&id='+id,
                type: 'GET',
                dataType: 'text',
                timeout: 1000,
                error: function(){
                    //	alert('Error loading XML document');
                },
                success: function(data){
                    document.form1.attachment_id.value=0;
                    get('attachment_path').innerHTML='';
                    get('file_info').innerHTML='';
                }
            });
        }

        function get_field(catid) {
            $.ajax({
                url: '{url('table/getfield/table/archive/',true)}&aid={$data['aid']}&catid='+catid,
                type: 'GET',
                dataType: 'text',
                timeout: 1000,
                error: function(){
                    //alert('Error loading XML document');
                },
                success: function(data){
                    $("#lm7").html(data);
                }
            });
        }
    </script>


    <div class="hid_box">
        <strong>所属栏目</strong>
        <div class="hbox" style="background:none;">
            {form::getform('catid',$form,$field,$data)}
        </div>
    </div>

    <div class="hid_box">
        <strong>所属分类</strong>
        <div class="hbox" style="background:none;">
            {form::getform('typeid',$form,$field,$data)}
        </div>
    </div>

    <div class="hid_box">
        <strong>标题</strong>
        <div class="hbox" style="background:none;">
            {form::getform('title',$form,$field,$data)}
        </div>
    </div>


    <div class="hid_box">
        <strong>正文</strong>
        <div class="hbox" style="background:none;">
            <div style="width:700px;">
                {form::getform('content',$form,$field,$data)}
            </div>
            <div style="width: 680px;margin-top: 10px;">
                <div class="fieldset flash" id="fsUploadProgress">
                    <span class="legend"></span>
                </div>
                <div id="divStatus"></div>
                <div>
                    <span id="spanButtonPlaceHolder"></span>
                    <input id="btnCancel" type="button" value="取消" disabled="disabled" style="display:none;" />
                </div>
            </div>
        </div>
    </div>


    <div class="hid_box">
        <strong>标签</strong>
        <div class="hbox" style="background:none;">
            <div style="width:99%;">
                {form::getform('tag',$form,$field,$data)}
            </div>
        </div>
    </div>


    <strong>内容扩展</strong>

	<style>
.collapseda {
	display: none;
}
</style>
<div id="nava">
    <div class="hid_box">
        <h5><a href="#Menu=ChildMenu1"  onclick="DoMenu('ChildMenu1')">META信息</a></h5>
        <div id="ChildMenu1" class="collapseda" style="padding:20px 50px;">
            网页标题：<br />{form::getform('mtitle',$form,$field,$data)}<br /><br />
            关&nbsp;键&nbsp;&nbsp;词 (keywords)：<br />{form::getform('keyword',$form,$field,$data)}<br /><br />
            页面描述 (description)：<br />{form::getform('description',$form,$field,$data)}<br /><br />
            内容简介字数限制：<br />{form::getform('introduce_len',$form,$field,$data)}<br />
            {form::getform('introduce',$form,$field,$data)}
			</div>
        </div>
    </div>

    <div class="hid_box">
        <h5><a href="#Menu=ChildMenu2"  onclick="DoMenu('ChildMenu2')">缩略图</a></h5>
        <div  id="ChildMenu2" class="collapseda" style="padding:20px 50px;">
            {form::getform('thumb',$form,$field,$data)}
        </div>
    </div>

    <div class="hid_box">
        <h5><a href="#Menu=ChildMenu3"  onclick="DoMenu('ChildMenu3')">审核</a></h5>
       <div  id="ChildMenu3" class="collapseda" style="padding:20px 50px;">
            {form::getform('checked',$form,$field,$data)} <div class="clear"></div>
        </div>
    </div>

    <div class="hid_box">
        <h5><a href="#Menu=ChildMenu4"  onclick="DoMenu('ChildMenu4')">模板</a></h5>
        <div  id="ChildMenu4" class="collapseda" style="padding:20px 50px;">
            选择模板：<br />
            {form::getform('template',$form,$field,$data)}
            <br /><br />
            URL规则：<br />
            {form::getform('htmlrule',$form,$field,$data)}
            <br /><br />
            生成HTML：<br />
            {form::getform('ishtml',$form,$field,$data)}
        </div>
    </div>

    <div class="hid_box">
        <h5><a href="#Menu=ChildMenu5"  onclick="DoMenu('ChildMenu5')">外部链接</a></h5>
        <div  id="ChildMenu5" class="collapseda" style="padding:20px 50px;">
            {form::getform('linkto',$form,$field,$data)}
        </div>
    </div>


<div class="hid_box">
        <h5><a href="#Menu=ChildMenu6"  onclick="DoMenu('ChildMenu6')">推荐位设置</a></h5>
        <div  id="ChildMenu6" class="collapseda" style="padding:20px 50px;">
            {form::getform('attr1',$form,$field,$data)}
        </div>
    </div>



    <div class="hid_box">
        <h5><a href="#Menu=ChildMenu7"  onclick="DoMenu('ChildMenu7')">自定义字段</a></h5>
        <div  id="ChildMenu7" class="collapseda" style="padding:20px 50px;">
            <table>
                {loop $field $f}
                <?php
                $name=$f['name'];
                if(setting::$var['archive'][$name]['catid']) {
                    unset($field[$name]);
                    continue;
                }
                if(!preg_match('/^my_/',$name)) {
                    unset($field[$name]);
                    continue;
                }
                if(!isset($data[$name])) $data[$name]='';
                ?>
                <tr>
                    <td class="left" width="20%"><?php echo setting::$var['archive'][$name]['cname']; ?></td>
                    <td width="80%">
                        <?php echo form::getform($name,$form,$field,$data); ?>
                    </td>
                </tr>
                {/loop}
            </table>
        </div>
    </div>

    <div class="hid_box">
        <h5><a href="#Menu=ChildMenu8"  onclick="DoMenu('ChildMenu8')"">附件</a></h5>
        <div  id="ChildMenu8" class="collapseda" style="padding:20px 50px;">
            <span id="file_info" style="color:red"></span><br>
            <input type="hidden" name="attachment_id"  id="attachment_id" value="{=archive_attachment(@$data['aid'],'id')}" size="50"/>
            描述：<input type="text" name="attachment_intro"  id="attachment_intro" value="{=archive_attachment(@$data['aid'],'intro')}" size="50"/><br><br>
            保存路径：<span id="attachment_path">{=archive_attachment(@$data['aid'],'path')}</span> <input type="button" name="delbutton" value="删除" onclick="attachment_delect(get('attachment_id').value)"><br><br>
            <?php if(front::$act=='edit' && $data['attachment_id']) { ?>
            更改：<?php } ?>

            上传：<input type="file" name="fileupload" id="fileupload" style="width:400px" />
            &nbsp;&nbsp;<input type="button"  name="filebuttonUpload"  id="filebuttonUpload" onclick="return ajaxFileUpload('fileupload','{url("tool/uploadfile",false)}','#uploading');" value="上传" />
                               <img id="uploading" src="{$base_url}/common/js/loading.gif" style="display:none;">
        </div>
    </div>


    <div class="hid_box">
        <h5><a href="#Menu=ChildMenu9"  onclick="DoMenu('ChildMenu9')">投票</a></h5>
        <ul  id="ChildMenu9" class="collapseda" style="padding:20px 50px;">
            <?php for($i=1;$i<=8;$i++) { ?>
            <li>{$i} &nbsp; 标题 {form::input("vote[$i]",vote::title(@$data['aid'],$i))}
                &nbsp; 图片url {form::input("vote_image[$i]",vote::img(@$data['aid'],$i))}
                    <?php } ?>
        </ul>
    </div>


    <div class="hid_box">
        <h5><a href="#Menu=ChildMenu10"  onclick="DoMenu('ChildMenu10')">限权</a></h5>
        <div  id="ChildMenu10" class="collapseda" style="padding:20px 50px;">

            <table width="90%">
                <tr><td width="20%">&nbsp;</td>
                    <td  width="35%">浏览(<font color="Red">×</font>)</td>
                    <td  width="35%">下载附件(<font color="Red">×</font>)</td>
                </tr>
                {loop usergroup::getInstance()->group $group}
                <?php if($group['groupid']=='888') continue; ?>
                <tr><td>{$group.name}</td>
                    <td>{form::checkbox("_ranks[".$group['groupid']."][view]",-1, @$data['_ranks'][$group['groupid']]['view'])}</td>
                    <td>{form::checkbox("_ranks[".$group['groupid']."][down]",-1, @$data['_ranks'][$group['groupid']]['down'])}</td>
                </tr>
                {/loop}
            </table>

        </div>
    </div>

    <div class="hid_box">
        <h5><a href="#Menu=ChildMenu11"  onclick="DoMenu('ChildMenu11')">评分</a></h5>
        <div  id="ChildMenu11" class="collapseda" style="padding:20px 50px;">
            <table width="90%">
                <tr><td width="20%">评分：{form::getform('grade',$form,$field,$data)}</td>
                </tr>
            </table>
        </div>
    </div>
    
    <div class="hid_box">
        <h5><a href="#Menu=ChildMenu12"  onclick="DoMenu('ChildMenu12')">内容页幻灯图片</a> (当模板选择“图片内容页(archive/show_pic.html)”设置)</h5>
        <div  id="ChildMenu12" class="collapseda" style="padding:20px 50px;">
            <div id="uploadarea">
            <?php for($i=0;$i<=10;$i++){ ?>
            <?php $j=$i+1;?>
              <?php if($data[pics.$i]) {?>
              <div id="pics{$i}_up">
                <span id="pics{$i}_preview"><img src="<?=$data[pics.$i]?>" /></span>
                <br>地址：<input name="pics{$i}"  id="pics{$i}" value="<?=$data[pics.$i]?>" size="50"/> <input type="button" id="pics{$i}_del" name="delbutton" value="删除" onclick="pics_delete('{$i}','pics');">
                <br>上传：<input type="file" name="pics{$i}_upload" id="pics{$i}_upload" style="width:400px" onchange="image_preview('pics{$i}',this.value,1)"/>&nbsp;&nbsp;<input type="button" name="pics{$i}upload"  id="pics{$i}upload" onclick="return ajaxFileUpload3('pics{$i}_upload','{url('tool/upload2',false)}','#pics{$i}_loading',{$j});" value="上传" />
              </div>
               <?php }?>
             <?php } ?>  
             <?php
			  if(empty($data[pics0])){
			?>
				  <DIV id="pics0_up">
              <SPAN id="pics0_preview"></SPAN>
              <BR>地址：<INPUT id="pics0" size="50" name="pics0"> <INPUT style="DISPLAY: none" id="pics0_del" onclick="pics_delete('0','pics');" value="删除" type="button" name="delbutton">
              <BR>上传：<INPUT style="WIDTH: 400px" id="pics0_upload" onchange="image_preview('pics0',this.value,1)" type="file" name="pics0_upload">&nbsp;&nbsp;<INPUT id="pics0upload" onclick="return ajaxFileUpload3('pics0_upload','{url('tool/upload2',false)}','#pics0_loading',1);" value="上传" type="button" name="pics0upload">
              </DIV>
             <?php
			  }
             ?>           
            </div>
        </div>
    </div>

    <div class="hid_box">
        <h5><a href="#Menu=ChildMenu13"  onclick="DoMenu('ChildMenu13')">地区</a></h5>
        <div  id="ChildMenu13" class="collapseda" style="padding:20px 50px;">
            <?php echo form::select('province_id',get('province_id')?get('province_id'):0,area::province_option()); ?>
            <?php echo form::select('city_id',get('city_id')?get('scity_id'):0,area::city_option()); ?>
            <?php echo form::select('section_id',get('section_id')?get('section_id'):0,area::section_option()); ?>
        </div>
    </div>


    <div class="hid_box">
        <h5><a href="#Menu=ChildMenu14"  onclick="DoMenu('ChildMenu14')">专题</a></h5>
        <div  id="ChildMenu14" class="collapseda" style="padding:20px 50px;">
            <?php echo form::select('spid',$data['spid'],special::option()); ?>
        </div>
    </div>
    
     <div class="hid_box">
        <h5><a href="#Menu=ChildMenu15"  onclick="DoMenu('ChildMenu15')">发布作者</a></h5>
        <div  id="ChildMenu15" class="collapseda" style="padding:20px 50px;">
        <input type="text" name="author" id="author" value="<?php echo $user['username']?>"   size="40" />
        </div>
    </div>
    
    <div class="hid_box">
        <h5><a href="#Menu=ChildMenu16"  onclick="DoMenu('ChildMenu16')">发布时间</a></h5>
        <div  id="ChildMenu16" class="collapseda" style="padding:20px 50px;">
        <input type="text" name="adddate" id="adddate" value="<?php echo date('Y-m-d H:i:s');?>"   size="40" /> 格式：2010-08-08 08:08:08
        </div>
    </div>
    
    <div class="hid_box">
        <h5><a href="#Menu=ChildMenu17"  onclick="DoMenu('ChildMenu17')">来源</a></h5>
        <div  id="ChildMenu17" class="collapseda" style="padding:20px 50px;">
        {form::getform('attr3',$form,$field,$data)}
        </div>
    </div>
    
     <div class="hid_box">
        <h5><a href="#Menu=ChildMenu18"  onclick="DoMenu('ChildMenu18')">产品单价</a></h5>
        <div  id="ChildMenu18" class="collapseda" style="padding:20px 50px;">
        {form::getform('attr2',$form,$field,$data)} 建议格式：￥1000/件
        </div>
    </div>

    <div class="blank10"></div>
    <div class="blank10"></div>
    <input type="submit" name="submit" value=" 提交 " class="button" />
</div>
</form>
   <div class="blank10"></div>
<script type=text/javascript><!--
var LastLeftID = "";
function menuFix() {
	var obj = document.getElementById("nava").getElementsByTagName("li");	
	for (var i=0; i<obj.length; i++) {
		obj[i].onmouseover=function() {
			this.className+=(this.className.length>0? " ": "") + "sfhover";
		}
		obj[i].onMouseDown=function() {
			this.className+=(this.className.length>0? " ": "") + "sfhover";
		}
		obj[i].onMouseUp=function() {
			this.className+=(this.className.length>0? " ": "") + "sfhover";
		}
		obj[i].onmouseout=function() {
			this.className=this.className.replace(new RegExp("( ?|^)sfhover\\b"), "");
		}
	}
}
function DoMenu(emid)
{
	var obj = document.getElementById(emid);	
	obj.className = (obj.className.toLowerCase() == "expanded"?"collapseda":"expanded");
	if((LastLeftID!="")&&(emid!=LastLeftID))	//关闭上一个Menu
	{
		document.getElementById(LastLeftID).className = "collapseda";
	}
	LastLeftID = emid;
}
function GetMenuID()
{
	var MenuID="";//默认开启
	var _paramStr = new String(window.location.href);
	var _sharpPos = _paramStr.indexOf("#");	
	if (_sharpPos >= 0 && _sharpPos < _paramStr.length - 1)
	{
		_paramStr = _paramStr.substring(_sharpPos + 1, _paramStr.length);
	}
	else
	{
		_paramStr = "";
	}
	
	if (_paramStr.length > 0)
	{
		var _paramArr = _paramStr.split("&");
		if (_paramArr.length>0)
		{
			var _paramKeyVal = _paramArr[0].split("=");
			if (_paramKeyVal.length>0)
			{
				MenuID = _paramKeyVal[1];
			}
		}
		
		if (_paramArr.length>0)
		{
			var _arr = new Array(_paramArr.length);
		}
		
		//取所有#后面的，菜单只需用到Menu
		for (var i = 0; i < _paramArr.length; i++)
		{
			var _paramKeyVal = _paramArr[i].split('=');
			
			if (_paramKeyVal.length>0)
			{
				_arr[_paramKeyVal[0]] = _paramKeyVal[1];
			}		
		}
		
	}
	
	if(MenuID!="")
	{
		DoMenu(MenuID)
	}
}

GetMenuID();	//*这两个function的顺序要注意一下，不然在Firefox里GetMenuID()不起效果
menuFix();
--></script>
