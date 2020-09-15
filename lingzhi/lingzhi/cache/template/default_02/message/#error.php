<?php defined('ROOT') or exit('Can\'t Access !'); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="Generator" content="CmsEasy 3_1_100908_UTF8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title><?php echo lang(tipsinfo);?></title>
<meta name="keywords" content="<?php if(isset($archive['keyword'])) { ?><?php echo $archive['keyword'];?>,<?php } ?><?php if(isset($catid)) { ?><?php echo $type[$catid]['keyword'];?>,<?php } ?><?php echo get('site_keyword');?>" />
<meta name="description" content="<?php if(isset($archive['description'])) { ?><?php echo $archive['description'];?>,<?php } ?><?php if(isset($catid)) { ?><?php echo $type[$catid]['description'];?>,<?php } ?><?php echo get('site_description');?>" />
<meta name="author" content="pown.net[九州易通科技有限公司] & 625569327[qq] & cmseasy@163.com[e-mail]" />
<meta http-equiv=refresh content='1; url=<?php echo $base_url;?>/'>
</head>
<body>

<style type="text/css">
.table{ width:600px; margin:66px auto 7px;text-align:center; font-size:12px; overflow:hidden; border:1px solid #DDD; border-collapse:collapse; background:white;}
.table * td{ padding:3px 6px; border:2px solid #EEE; }
.table thead * th{ background:#F5F5F5; border:1px solid #E3E3E3; padding:0px 6px; color:#999; } 
.table tbody * th{  background:#F5F5F5; border:1px solid #DDD; }
.table tbody * th strong{ line-height:21px; text-indent:10px; color:#999; }
.td1{ text-align:right; color:#666; }
.td2,.td3,.td4,.td5,.td6,.td7,.td8,.td9{ text-align:center; } 
.td5{ background:#F5F5F5; }
.td6,.td7,.td8,.td9{ background:#F5F5F5; }
.abctxt {padding:10px;}


</style>


        <table cellspacing="1" cellpadding="3" border="1" align="center" class="table">

            <tbody>
<th>
<?php echo lang(tipsinfo);?>
</th>
                <tr>
                    <td>
<?php echo lang(noallowview);?>
</td>
                </tr>
            </tbody></table>

<script src="/lingzhi/js/common.js" language="javascript" type="text/javascript"></script>
</body>
</html>