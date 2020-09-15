<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
'┌┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┐
'┊　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　┊
'┊　　　　　　　刘小雨儿童艺术画室网站管理系统（ＮＷＥＢ）　　　　　　　┊
'┊　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　┊
' 　 版权所有　Nweb.cn
'
'　　程序制作　万博工作室
'　　　　　　　Add:中国四川成都彭州市/611930
'　　　　　　　Tel:0-13348927760 028-88079088
'　　　　　　　Fax:83708850
'　　　　　　　E-m:duolaimi-123@163.com
'　　　　　　　Q Q:59309100
'
'　　官方网址　http://www.Nweb.cn
'┊　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　┊
'└┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┘
%>
<% Option Explicit %>
<HTML>
<HEAD>
<TITLE>后台管理导航</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8" />
<META NAME="copyright" CONTENT="Copyright 2004-2008 - NWEB.CN-STUDIO" />
<META NAME="Author" CONTENT="万博网络技术工作室,www.Nweb.cn" />
<META NAME="Keywords" CONTENT="" />
<META NAME="Description" CONTENT="" />
<link rel="stylesheet" href="Images/CssAdmin.css">
<script language="javascript" src="../Script/Admin.js"></script>
<script>
function closewin() {
   if (opener!=null && !opener.closed) {
      opener.window.newwin=null;
      opener.openbutton.disabled=false;
      opener.closebutton.disabled=true;
   }
}

var count=0;//做计数器
var limit=new Array();//用于记录当前显示的哪几个菜单
var countlimit=1;//同时打开菜单数目，可自定义

function expandIt(el) {
   obj = eval("sub" + el);
   if (obj.style.display == "none") {
      obj.style.display = "block";//显示子菜单
      if (count<countlimit) {//限制2个
         limit[count]=el;//录入数组
         count++;
      }
      else {
         eval("sub" + limit[0]).style.display = "none";
         for (i=0;i<limit.length-1;i++) {limit[i]=limit[i+1];}//数组去掉头一位，后面的往前挪一位
         limit[limit.length-1]=el;
      }
   }
   else {
      obj.style.display = "none";
      var j;
      for (i=0;i<limit.length;i++) {if (limit[i]==el) j=i;}//获取当前点击的菜单在limit数组中的位置
      for (i=j;i<limit.length-1;i++) {limit[i]=limit[i+1];}//j以后的数组全部往前挪一位
      limit[limit.length-1]=null;//删除数组最后一位
      count--;
   }
}
</script>
</HEAD>
<!--#include file="CheckAdmin.asp"-->

<BODY background="Images/SysLeft_bg.gif" onmouseover="self.status='全心全意为您打造!';return true">
<div id="main1" onclick=expandIt(1)>
  <table width="170" height="24" border="0" cellpadding="0" cellspacing="0" background="Images/SysLeft_bg_click.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">关于我们</td>
    </tr>
  </table>
</div>
<div id="sub1" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="AboutList.asp" target="mainFrame" onClick='changeAdminFlag("介绍信息列表")'>介绍信息列表</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="AboutEdit.asp?Result=Add" target="mainFrame" onClick='changeAdminFlag("添加介绍信息")'>添加介绍信息</a></td>
    </tr>
  </table>
</div>

<div id="main2" onclick=expandIt(2)>
  <table width="170" height="24" border="0" cellpadding="0" cellspacing="0" background="Images/SysLeft_bg_click.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">新闻管理</td>
    </tr>
  </table>
</div>
<div id="sub2" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="NewsSort.asp?Action=Add&ParentID=0" target="mainFrame" onClick='changeAdminFlag("新闻类别")'>新闻类别</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="NewsList.asp" target="mainFrame" onClick='changeAdminFlag("新闻列表")'>新闻列表</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="NewsEdit.asp?Result=Add" target="mainFrame" onClick='changeAdminFlag("添加新闻")'>添加新闻</a></td>
    </tr>
  </table>
</div>

<div id="main3" onclick=expandIt(3)>
  <table width="170" height="24" border="0" cellpadding="0" cellspacing="0" background="Images/SysLeft_bg_click.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">图片展示</td>
    </tr>
  </table>
</div>
<div id="sub3" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="ProductSort.asp?Action=Add&ParentID=0" target="mainFrame" onClick='changeAdminFlag("图片类别")'>图片类别</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="ProductList.asp" target="mainFrame" onClick='changeAdminFlag("图片列表")'>图片列表</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="ProductEdit.asp?Result=Add" target="mainFrame" onClick='changeAdminFlag("添加图片")'>添加图片</a></td>
    </tr>
  </table>
</div>
<!--
<div id="main5" onclick=expandIt(5)>
  <table width="170" height="24" border="0" cellpadding="0" cellspacing="0" background="Images/SysLeft_bg_click.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">下载资源</td>
    </tr>
  </table>
</div>
<div id="sub5" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="DownSort.asp?Action=Add&ParentID=0" target="mainFrame" onClick='changeAdminFlag("下载类别")'>下载类别</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="DownList.asp" target="mainFrame" onClick='changeAdminFlag("下载列表")'>下载列表</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="DownEdit.asp?Result=Add" target="mainFrame" onClick='changeAdminFlag("添加下载")'>添加下载</a></td>
    </tr>
  </table>
</div>

<div id="main6" onclick=expandIt(6)>
  <table width="170" height="24" border="0" cellpadding="0" cellspacing="0" background="Images/SysLeft_bg_click.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">人才招聘</td>
    </tr>
  </table>
</div>
<div id="sub6" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="JobsList.asp" target="mainFrame" onClick='changeAdminFlag("招聘信息列表")'>招聘列表</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="JobsEdit.asp?Result=Add" target="mainFrame" onClick='changeAdminFlag("添加招聘信息")'>添加招聘</a></td>
    </tr>	
  </table>
</div>

<div id="main7" onclick=expandIt(7)>
  <table width="170" height="24" border="0" cellpadding="0" cellspacing="0" background="Images/SysLeft_bg_click.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">其他信息</td>
    </tr>
  </table>
</div>
<div id="sub7" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="OthersSort.asp?Action=Add&ParentID=0" target="mainFrame" onClick='changeAdminFlag("其他信息类别")'>信息类别</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="OthersList.asp" target="mainFrame" onClick='changeAdminFlag("其他信息列表")'>信息列表</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="OthersEdit.asp?Result=Add" target="mainFrame" onClick='changeAdminFlag("添加其他信息")'>添加信息</a></td>
    </tr>
  </table>
</div>

<div id="main8" onclick=expandIt(8)>
  <table width="170" height="24" border="0" cellpadding="0" cellspacing="0" background="Images/SysLeft_bg_click.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">弹窗广告</td>
    </tr>
  </table>
</div>
<div id="sub8" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="ADsList.asp" target="mainFrame" onClick='changeAdminFlag("弹窗广告列表")'>弹窗广告列表</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="ADsEdit.asp?Result=Add" target="mainFrame" onClick='changeAdminFlag("添加弹窗广告")'>添加弹窗广告</a></td>
    </tr>
  </table>
</div>

<div id="main9" onclick=expandIt(9)>
  <table width="170" height="24" border="0" cellpadding="0" cellspacing="0" background="Images/SysLeft_bg_click.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">访客反馈</td>
    </tr>
  </table>
</div>
<div id="sub9" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="MessageList.asp" target="mainFrame" onClick='changeAdminFlag("留言信息列表")'>留言信息</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="OrderList.asp" target="mainFrame" onClick='changeAdminFlag("订单信息列表")'>订单信息</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="TalentsList.asp" target="mainFrame" onClick='changeAdminFlag("人才信息列表")'>人才信息</a></td>
    </tr>	
  </table>
</div>

<div id="main10" onclick=expandIt(10)>
  <table width="170" height="24" border="0" cellpadding="0" cellspacing="0" background="Images/SysLeft_bg_click.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">用户管理</td>
    </tr>
  </table>
</div>
<div id="sub10" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="AdminList.asp" target="mainFrame" onClick='changeAdminFlag("网站管理员")'>网站管理员</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="MemList.asp" target="mainFrame" onClick='changeAdminFlag("前台会员")'>前台会员</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="MemGroup.asp" target="mainFrame" onClick='changeAdminFlag("会员组别")'>会员组别</a></td>
    </tr>
  </table>
</div> -->

<div id="main11" onclick=expandIt(11)>
  <table width="170" height="24" border="0" cellpadding="0" cellspacing="0" background="Images/SysLeft_bg_click.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">系统管理</td>
    </tr>
  </table>
</div>
<div id="sub11" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="PassUpdate.asp" target="mainFrame" onClick='changeAdminFlag("修改密码")'>修改密码</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="SetSite.asp" target="mainFrame" onClick='changeAdminFlag("网站信息设置")'>网站信息设置</a></td>
    </tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="NavigationList.asp" target="mainFrame" onClick='changeAdminFlag("导航栏目列表")'>导航栏目</a></td>
    </tr>
	<tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="SetConst.asp" target="mainFrame" onClick='changeAdminFlag("常量设置")'>常量设置</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="DataManage.asp" target="mainFrame" onClick='changeAdminFlag("数据库操作")'>数据库操作</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="SpaceStat.asp" target="mainFrame" onClick='changeAdminFlag("空间统计")'>空间统计</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="../Count/InfoList.asp" target="mainFrame" onClick='changeAdminFlag("访问统计")'>访问统计</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="FriendLinkList.asp" target="mainFrame" onClick='changeAdminFlag("友情链接列表")'>友情链接</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="HackSql.asp" target="mainFrame" onClick='changeAdminFlag("阻止SQL注入记录")'>阻止SQL注入记录</a></td>
    </tr>	
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="Help.asp" target="mainFrame" onClick='changeAdminFlag("使用帮助")'>使用帮助</a></td>
    </tr>
  </table>
</div>

<table width="170" height="24" border="0" cellpadding="0" cellspacing="0" background="Images/SysLeft_bg_click.gif">
  <tr style="cursor: hand;">
    <td width="26"></td>
    <td class="SystemLeft"><a href="javascript:AdminOut()"><font color="#ffffff">退出登录</font></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="SysCome.asp" target="mainFrame" onClick='changeAdminFlag("后台主页")'><font color="#ffffff">后台主页</font></a></td>
  </tr>
</table>
</BODY>
</HTML>