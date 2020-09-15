<div id="position">
<a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="{$skin_path}/undo.gif" style="float:right;" /></a>当前位置：网站管理首页
</div>

<div class="padding5">
<img src="{$skin_path}/wj.gif" style="margin-right:10px;" />欢迎来到管理区。您可以在这里控制您站点的所有功能。
</div>

<style type="text/css">
.box {
  float:left;
  width:35%;
  margin:5px 10px;
  font-size:12px;
}

.box ul {
  margin-top:0px;
}

.box ul li {
  height:24px;
  line-height:24px;
  padding-left:40px;
  background: url(icon3.gif) left top no-repeat;
}

.box h3,#center .box h3 a {
  line-height:14px;
  font-size:14px;
  padding-left:25px;
  background:url(rank_2.gif) left 10px no-repeat;
}
.box h3 {
	height:32px;overflow:hidden;
 line-height:32px;}
.box h4 {
  font-size:12px;
  color:#ccc;
  
}
</style>

<div id="info">
<?php if(hasflash()) { ?>
<span style="float:left"><?php echo showflash(); ?></span>
<span style="cursor:pointer;color:blue;float:right" onclick="hide('message')">(×)</span>
<?php } ?>
</div>
<div class="blank10"></div>

<?php if (!defined('ADMIN')) exit('Can\'t Access !'); ?>
<?php $menu=admin_menu::get(); ?>
{php $i=0;}
{loop $menu $ns $ms}{php $k=$i+1;}
<div class="box">
<h3>{$ns}</h3>

<ul>
{loop $ms $n $m}
<li>{if $m}<a href="{$m}">{$n}</a>{else}{$n}{/if}</li>
{/loop}
</ul>
<div class="blank10"></div>
</div>
{if $k%2==0}<div class="clear"></div>{/if}
{php  $i++; }

{/loop}

<!--请勿修改或者删除-->
<div class="box">
<h3>官方信息</h3>
<ul id="officialinf">
</ul>
<ul><li>授权信息: <span id="__buy"><a href="http://www.cmseasy.cn"><span style="color:green;">自助查询</span></a></span></li></ul>
<div class="blank10"></div>
</div>

<div class="blank10"></div>