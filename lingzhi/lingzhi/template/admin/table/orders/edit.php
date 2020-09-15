<div id="position">
<a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="{$skin_path}/undo.gif" style="float:right;" /></a>当前位置：处理订单
</div>


<div class="padding10">
<img src="{$skin_path}/wj.gif" style="margin-right:10px;" />欢迎来到处理订单页面。您可以处理客户提交的订单，及时让客户了解订单状态。
</div>

<div class="blank10"></div>

<script language="javascript" src="{$base_url}/common/js/common.js"></script>


<form method="post" name="form1" action="<?php if(front::$act=='edit') $id="/id/".$data[$primary_key]; else $id=''; echo modify("/act/".front::$act."/table/".$table.$id);?>"  onsubmit="return checkform();">

<div class="hid_box">
<strong>订单信息</strong>
<div class="hbox" style="border:1px #999 solid;">
<?php
if($data['status']==1){
	$data['status']='完成';
}elseif($data['status']==0){
	$data['status']='新订单';
}elseif($data['status']==2){
	$data['status']='处理中';
} 
if($data['mid']==0){
	$data['mid']='游客';
}else{
	$data['mid']='注册会员';
}
$_archive=archive::getInstance()->getrow($data['aid']);
$data['aid']=$_archive['title'];
?>
<table width="100%" border="1" cellspacing="1" cellpadding="0"> 
      <tr> 
        <td width="20%" align="right">订单号：</td> 
        <td width="80%"><font color="red">{$data[oid]}</font></td> 
      </tr>  
      <tr> 
        <td width="20%" align="right">下单时间：</td> 
        <td width="80%">{date('Y-m-d H:i:s',$data[adddate])}</td> 
      </tr> 
      <tr> 
        <td align="right">客户IP：</td> 
        <td>{$data[ip]}</td> 
      </tr>
      <tr> 
      <tr> 
        <td align="right">订购产品：</td> 
        <td><a href="{url('archive/show/aid/'.$_archive[aid], false)}" target="_blank">{$data[aid]}</a>&nbsp;&nbsp;(订购量：{$data[pnums]})&nbsp;&nbsp;(产品价格：{$_archive[attr2]})</td> 
      </tr>
      <tr>       
        <td align="right">单位名称：</td> 
        <td>{$data[pname]}({$data[mid]})</td> 
      </tr> 
      <tr> 
        <td align="right">联系电话：</td> 
        <td>{$data[telphone]}</td> 
      </tr> 
      <tr> 
        <td align="right">详细地址：</td> 
        <td>{$data[address]}</td> 
      </tr> 
            <tr> 
        <td align="right">邮政编码：</td> 
        <td>{$data[postcode]}</td> 
      </tr> 
            <tr> 
        <td align="right">订单留言：</td> 
        <td>{$data[content]}</td> 
      </tr> 
      <tr> 
        <td align="right">订单状态：</td> 
        <td><font color="red">{$data[status]}</font></td> 
      </tr> 
    </table>


</div>
</div>

<div class="blank10"></div>
<form method="post" name="form1" action="<?php if(front::$act=='edit') $id="/id/".$data[$primary_key]; else $id=''; echo modify("/act/".front::$act."/table/".$table.$id);?>"  onsubmit="return checkform();">
<div class="hid_box">
<strong>处理订单</strong>
<div class="hbox">
更改状态：<select id=status name=status >
<option value="0" selected>新订单</option>
<option value="2" >处理中</option>
<option value="1" >完成（已经处理）</option>
</select>
</div>
</div>
<div class="blank30"></div>
<input type="submit" name="submit" value="提交" class="button"/>

</form>