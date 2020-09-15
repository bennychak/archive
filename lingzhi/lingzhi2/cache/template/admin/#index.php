<?php defined('ROOT') or exit('Can\'t Access !'); ?>
<?php if (!defined('ADMIN')) exit('Can\'t Access !'); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN" style="overflow-x:hidden;">
<head>
<meta name="Generator" content="CmsEasy 3_1_100908_UTF8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="zh-CN" />
<meta content="all" name="robots" />
<meta name="author" content="CmsEasy Team" />
<meta name="Copyright" content="2008-2010 CmsEasy Inc" />
<meta name="description" content="" />
<meta content="" name="keywords" />
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" /> 
<title><?php echo get('sitename');?>-管理中心</title>
<script src="<?php echo $base_url;?>/common/js/jquery/jquery-latest.js"></script>
<script type="text/javascript" src="<?php echo $base_url;?>/common/js/jquery-1.2.6.min.js"></script>
<script type="text/javascript" src="<?php echo $skin_path;?>/system.js"></script>
<style language="text/css">
/*第一种颜色*/
#table tr.color1{
background-color:#FFFFFF;
}
/*第二种颜色*/
#table tr.color2{
background-color:#F8F8F8;
}
</style>
     <script type="text/javascript">
            //省市区
            $(document).ready(function() {
                $('#search_province_id').change(function(){
                    $.ajax({
                        url: '<?php echo url('area/city_option_search',false);?>',
                        data:'province_id='+$(this).val(),
                        type: 'POST',
                        dataType: 'html',
                        timeout: 1000,
                        success: function(data){
                            $('#search_city_id').html(data);
                        }
                    });
                });
                $('#search_city_id').change(function(){
                    $.ajax({
                        url: '<?php echo url('area/section_option_search',false);?>',
                        data:'city_id='+$(this).val(),
                        type: 'POST',
                        dataType: 'html',
                        timeout: 1000,
                        success: function(data){
                            $('#search_section_id').html(data);
                        }
                    });
                });
                $(document).ready(function() {
                    $('#province_id').change(function(){
                        $.ajax({
                            url: '<?php echo url('area/city_option',false);?>',
                            data:'province_id='+$(this).val(),
                            type: 'POST',
                            dataType: 'html',
                            timeout: 1000,
                            success: function(data){
                                $('#city_id').html(data);
                            }
                        });
                    });
                    $('#city_id').change(function(){
                        $.ajax({
                            url: '<?php echo url('area/section_option',false);?>',
                            data:'city_id='+$(this).val(),
                            type: 'POST',
                            dataType: 'html',
                            timeout: 1000,
                            success: function(data){
                                $('#section_id').html(data);
                            }
                        });
                    });
                });
            });
        </script>
<style>
#logo {background:url(<?php echo $skin_path;?>/logo.png) no-repeat 10px 8px !important; 
/*For Firefox*/
*background:none;
/*For IE7 & IE6*/
_filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='<?php echo $skin_path;?>/logo.png',sizingMethod='crop');}
</style>
<!--[if IE 6]>
<style type="text/css">
/*ie6 fix顶端元素*/
    #top {
    top:expression(eval(document.documentElement.scrollTop));
}
/*ie6 fix底端元素*/
#footer {
top: expression(eval((document.compatMode&&document.compatMode=="CSS1Compat")?documentElement.scrollTop+documentElement.clientHeight-this.clientHeight-1:document.body.scrollTop+document.body.clientHeight-this.clientHeight-1));
}
</style>
<![endif]-->
<!-- 调用样式表 -->
<link rel="stylesheet" href="<?php echo $skin_path;?>/admin.css" type="text/css" media="all"  />
</head>

<body>
<div id="top">
<div id="top_left">
<div id="top_right">
<div id="logo"><a href="<?php echo $base_url;?>/index.php?case=index&act=index&=&admin_dir=admin" title="后台首页"><span>后台首页</span></a></div>
<div class="top">
<span class="floatright"><a href="<?php echo $base_url;?>/" target="_blank">网站首页</a>	| <a href="http://www.cmseasy.org" target="_blank">论坛</a>	| <a href="http://www.cmseasy.org/forum-10-1.html" target="_blank">报错</a> | <a href="http://www.cmseasy.org/forum-9-1.html" target="_blank">在线教程</a></span>	
<span class="floatleft">欢迎您，<?php echo $user['username'];?></span>	 <a href="<?php echo $base_url;?>/index.php?case=index&act=logout&admin_dir=<?php echo config::get('admin_dir');?>" class="logout">退出</a>
<div id="nav">
<ul>
<?php $menu=admin_menu::top(); ?>
<?php foreach($menu as $n => $m) { ?>
<?php
preg_match('/mod=(\w+)&/is',$m,$m1);
$class = $m1['1'] == session::get('mod')?'on':'no';
?>
<li><a href="<?php echo $m;?>" class="<?php echo $class;?>"><?php echo $n;?></a></li>
<?php } ?>
<?php $mod_menu=admin_menu::mod_top(); ?>
<?php foreach($mod_menu as $n => $m) { ?>
<?php
preg_match('/mod=(\w+)&/is',$m,$m1);
$class = $m1['1'] == session::get('mod')?'on':'no';
?>
<li><a href="<?php echo $m;?>" class="<?php echo $class;?>"><?php echo $n;?></a></li>
<?php } ?>
</ul>
</div>
</div>
</div>
</div>
</div>
</div>


<div id="main">
<div id="left">

<?php $menu=admin_menu::get(); ?>

<div id="menu" class="sdmenu">
<?php foreach($menu as $ns => $ms) { ?>
<div class="collapsed">
<?php if($ns != '系统信息') { ?>
<span><?php echo $ns;?></span>
<?php foreach($ms as $n => $m) { ?><a href="<?php echo $m;?>"><?php echo $n;?></a><?php } ?>
<?php } ?>
</div>
<?php } ?>
</div>


</div>


<div id="right">
<?php if(hasflash()) { ?>
<div id='message'><span style="float:left"><?php echo showflash(); ?></span>
<span style="color:blue;float:right"><a href="#" onClick="javascript:turnoff('message')">(×)</a></span></div><div class="blank20"></div><?php } ?>

<div style="_margin-right:220px;padding-bottom:50px;">
<?php
$this->render();
?>
<div class="blank30"></div>
</div>

<div class="blank30"></div>
<a href="#"><img src="<?php echo $skin_path;?>/gotop.gif" style="float:right;padding-right:30px;" /></a>
</div>
</div>
</div>
</div>

<!--请勿修改或者删除-->
<div class="box" style="display:none">
<h3>官方信息</h3>
<ul id="officialinf">
</ul>
<ul><li>授权信息: <span id="__buy"><a href="http://www.cmseasy.cn"><span style="color:green;">自助查询</span></a></span></li></ul>
<div class="blank10"></div>
</div>

<div id="footer">
<div class="copy">Copyright &copy; 2010 CmsEasy.CN, All rights reserved. <A href="http://www.cmseasy.cn" target=_blank>Powered&nbsp;by&nbsp;<STRONG><SPAN style="COLOR:#F93">CmsEasy</SPAN></STRONG></A></div>
</div>

<script src="/lingzhi2/js/common.js" language="javascript" type="text/javascript"></script>
</body>
</html>
