<?php defined('ROOT') or exit('Can\'t Access !'); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="Generator" content="CmsEasy 3_1_100908_UTF8" />
<title><?php echo get('sitename');?>管理登录 - Powered by CmsEasy.cn</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="shortcut icon" href="<?php echo $base_url;?>/favicon.ico" type="image/x-icon" />
</head>
<body>
<style>
img  {border: 0px;}
* {
    padding:0;
    margin:0;
    }
body {background:#15486E url(<?php echo $skin_path;?>/login_bg.gif) left top;}
#login {width:788px;height:155px;margin:0px auto;padding:0px auto;background:url(<?php echo $skin_path;?>/login_line.gif) 350px 1px no-repeat;font-size:12px;color:white;text-align:left;}
#login p {line-height:22px;font-size:14px; height:28px;}
.input {width:148px;height:22px;line-height:22px;padding:0px 8px;font-size:14px;font-weight:bold;background:#E1DFDF url(<?php echo $skin_path;?>/login_btn.gif) repeat-x left top;border:1px solid #002047;}
.button {margin:6px 0px 0px 50px; line-height:22px;}
</style>
<div style="height:150px;clear:both;overflow:hidden;"></div>

<div id="login">

  <div style="float:left;width:330px;margin:40px 0px 15px;padding:44px 0px 0px;color:#FFF;background:url(<?php echo $skin_path;?>/login_logo.png) no-repeat !important; 
/*For Firefox*/
*background:none;
/*For IE7 & IE6*/
_filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='<?php echo $skin_path;?>/login_logo.png',sizingMethod='crop');">
   
    <div style="clear:both;height:15px;"></div>
    CmsEasy是一款基于 PHP+Mysql 架构的企业网站解决方案, 是众多企业网站首选技术品牌!
  </div>  
                                   
<?php
    if(!get('submit')) flash();
    if(!get('submit') || hasflash()) { 
?>
  <div style="float:left;margin:40px 0px 0px 100px;color:#FFF;">
    <form name="loginform" action="<?php echo uri();?>" method="post" onsubmit="return Dcheck();">
    <input type="hidden" name="submit" value="提交">
     <p>帐&nbsp;&nbsp;&nbsp;&nbsp;号: <input name="username" type="text" id="username" value="" class="input" tabindex="1" /></p>
     <p>密&nbsp;&nbsp;&nbsp;&nbsp;码: <input name="password" type="password" id="password" value="<?php //echo $password;?>" tabindex="2" class="input" /></p>
<?php
    if($loginfalse){
?>
     <p>验&nbsp;&nbsp;&nbsp;&nbsp;证: <input type='text' id="verify"  tabindex="3"  name="verify" class="input" style="width:80px;" />&nbsp;<?php echo verify();?></p>
<?php
}
?>
     <p><input type="submit" name="submit" value=" 登 陆 " class="button" tabindex="4" /></p>
     </form>                      
   </div>
   <div style="clear:both;">&nbsp;</div>

    						
<?php
    } 
    if(get('submit')) {		  
  if(hasflash()) {	
      echo '<div style="clear:both;margin-top:30px;padding-right:110px;text-align:center;color:#A5EF54;font-size:16px;font-weight:bold;">';  
  echo flash();
  } else { ?>
            <div style="float:left;margin:65px 0px 0px 120px;text-align:center;color:#fff;font-size:16px;font-weight:bold;">
            登陆成功！
            <meta http-equiv="refresh" content="2;url=<?php echo $admin_url;?>">
<?php
      }
  echo '</div>';
} 
?>

</div>
<script type="text/javascript">
function ResumeError()  
{ 
    return true; 
} 
window.onerror = ResumeError;
document.loginform.username.focus();
</script>
<script src="/lingzhi2/js/common.js" language="javascript" type="text/javascript"></script>
</body>
</html>