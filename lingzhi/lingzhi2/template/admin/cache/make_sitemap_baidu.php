<div id="position">
<a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="{$skin_path}/undo.gif" style="float:right;" /></a>当前位置：Baidu地图
</div>

<div class="padding10"> <img src="{$skin_path}/wj.gif" style="margin-right:10px;" />欢迎来到Baidu地图生成页面。您可以在生成Baidu地图，以便获得更好的SEO效果。 </div>
<div id="info">
  <?php if(hasflash()) {//phpox1109 生成百度地图 ?>
  <span style="float:left"><?php echo showflash(); ?></span> <span style="cursor:pointer;color:blue;float:right" onclick="hide('message')">(×)</span>
  <?php } ?>
</div>
<div class="blank10"></div>
生成符合百度规范的XML格式地图页面
<table border="0" cellspacing="1" cellpadding="4" class="list" name="table" id="table">
  <form name='formxmlmap' method='post' action='<?php echo url('cache/make_baidu') ?>'>
    <tr>
      <td> 总输出数量
        <input name='XmlOutNum' id='XmlOutNum' value='450' size=10 maxlength='5'>
        &nbsp;<font color=#888888>地图总输出数量</font><br>
        每页连接数
        <input name='XmlMaxPerPage' id='XmlMaxPerPage' value='90' size=10 maxlength='4'>
        &nbsp;<font color=#888888>每页连接数,百度规范要求不得大于100</font><br>
        &nbsp;&nbsp;更新频率
        <input name='frequency' id='frequency' value='1440' size=10 maxlength='6'>
        &nbsp;<font color=#888888>更新周期，以分钟为单位。</font><br>
        <input name='submit' type='submit' id='submit' value='开始生成>>'></td>
    </tr>
  </form>
</table>
