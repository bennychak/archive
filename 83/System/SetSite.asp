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
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8" />
<META NAME="copyright" CONTENT="Copyright 2004-2008 - NWEB.CN-STUDIO" />
<META NAME="Author" CONTENT="万博网络技术工作室,www.Nweb.cn" />
<META NAME="Keywords" CONTENT="" />
<META NAME="Description" CONTENT="" />
<TITLE>网站信息设置</TITLE>
<link rel="stylesheet" href="Images/CssAdmin.css">
<script language="javascript" src="../Script/Admin.js"></script>
</HEAD>
<!--#include file="../Include/Const.asp" -->
<!--#include file="../Include/ConnSiteData.asp" -->
<!--#include file="CheckAdmin.asp"-->
<%
if Instr(session("AdminPurview"),"|112,")=0 then 
  response.write ("<font color='red')>你不具有该管理模块的操作权限，请返回！</font>")
  response.end
end if
'========判断是否具有管理权限
%>
<body>
<%
select case request.QueryString("Action")
  case "Save"
    SaveSiteInfo
  case else
    ViewSiteInfo
end select
%>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>系统管理：添加，修改站点的相关信息</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap bgcolor="#EBF2F9">
	<a href="PassUpdate.asp" target="mainFrame" onClick='changeAdminFlag("修改密码")'>修改密码</a>	<font color="#0000FF">&nbsp;|&nbsp;</font>	<a href="SetSite.asp" target="mainFrame" onClick='changeAdminFlag("网站信息设置")'>网站信息设置</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="NavigationList.asp" target="mainFrame" onClick='changeAdminFlag("栏目导航设置")'>栏目导航设置</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="SetConst.asp" target="mainFrame" onClick='changeAdminFlag("常量设置")'>常量设置</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="DataManage.asp" target="mainFrame" onClick='changeAdminFlag("数据库操作")'>数据库操作</a>
<font color="#0000FF">&nbsp;|&nbsp;</font><a href="ADsEdit.asp?Result=Add" target="mainFrame" onClick='changeAdminFlag("弹窗广告列表")'>弹窗广告</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="SpaceStat.asp" target="mainFrame" onClick='changeAdminFlag("空间统计")'>空间统计</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="../Count/InfoList.asp" target="mainFrame" onClick='changeAdminFlag("访问统计")'>访问统计</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="FriendSiteList.asp" target="mainFrame" onClick='changeAdminFlag("友情链接")'>友情链接</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="HackSql.asp" target="mainFrame" onClick='changeAdminFlag("阻止SQL注入记录")'>阻止SQL注入记录</a>    </td>
  </tr>
</table>
<br>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <form name="editForm" method="post" action="SetSite.asp?Action=Save" >
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id=editProduct idth="100%">

      <tr>
        <td width="160" height="20" align="right">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="20" align="right">网站标题：</td>
        <td><input name="SiteTitle" type="text" class="textfield" id="SiteTitle" style="WIDTH: 400;" value="<%=SiteTitle%>" >&nbsp;*</td>
      </tr>
      <tr>
        <td height="20" align="right">网　　址：</td>
        <td><input name="SiteUrl" type="text" class="textfield" id="SiteUrl" style="WIDTH: 400;" value="<%=SiteUrl%>">&nbsp;*</td>
      </tr>
      <tr>
        <td height="20" align="right">公司名称：</td>
        <td><input name="ComName" type="text" class="textfield" id="ComName" style="WIDTH: 400;" value="<%=ComName%>" >&nbsp;*</td>
      </tr>
      <tr>
        <td height="20" align="right">地　　址：</td>
        <td><input name="Address" type="text" class="textfield" id="Address" style="WIDTH: 400;" value="<%=Address%>" >&nbsp;*</td>
      </tr>
      <tr>
        <td height="20" align="right">邮　　编：</td>
        <td><input name="ZipCode" type="text" class="textfield" id="ZipCode" style="WIDTH: 200;" value="<%=ZipCode%>" maxlength="20">&nbsp;*</td>
      </tr>
      <tr>
        <td height="20" align="right">电　　话：</td>
        <td><input name="Telephone" type="text" class="textfield" id="Telephone" style="WIDTH: 200;" value="<%=Telephone%>">&nbsp;*</td>
      </tr>
      <tr>
        <td height="20" align="right">传　　真：</td>
        <td><input name="Fax" type="text" class="textfield" id="Fax" style="WIDTH: 200;" value="<%=Fax%>" >&nbsp;*</td>
      </tr>
      <tr>
        <td height="20" align="right">电子邮箱：</td>
        <td><input name="Email" type="text" class="textfield" id="Email" style="WIDTH: 200;" value="<%=Email%>">&nbsp;*&nbsp;</td>
      </tr>
      <tr>
        <td height="20" align="right" valign="top">关 键 字：</td>
        <td><textarea name="Keywords" rows="6"  class="textfield" id="Keywords" style="WIDTH: 400;"><%=Keywords%></textarea>&nbsp;关键字设置有利于网站的搜索</td>
      </tr>
      <tr>
        <td height="20" align="right" valign="top">网站描述：</td>
        <td><textarea name="Descriptions" rows="6" class="textfield" id="Descriptions" style="WIDTH: 400;"><%=Descriptions%></textarea>&nbsp;网站描述设置有利于网站的搜索</td>
      </tr>
      <tr>
        <td height="20" align="right">ICP&nbsp;备案：</td>
        <td><input name="IcpNumber" type="text" class="textfield" id="IcpNumber" style="WIDTH: 200;" value="<%=IcpNumber%>"></td>
      </tr>

      <tr>
        <td height="20" align="right"><a name="Message"></a>留&nbsp;言&nbsp;簿：</td>
        <td><input name="MesViewFlag" type="checkbox" id="MesViewFlag" value="1" style="HEIGHT: 13px;WIDTH: 13px;" <%if MesViewFlag then response.write ("checked")%>>&nbsp;自动通过审核</td>
      </tr>
      <tr>
        <td height="30" align="right">&nbsp;</td>
        <td valign="bottom"><input name="submitSaveEdit" type="submit" class="button"  id="submitSaveEdit" value="保存" style="WIDTH: 60;" ></td>
      </tr>
      <tr>
        <td height="20" align="right">&nbsp;</td>
        <td valign="bottom">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  </form>
</table>
</body>
</html>
<%
function SaveSiteInfo()
  if len(trim(request.Form("SiteTitle")))<3 then
    response.write ("<script language=javascript> alert('网站标题必填且不能少于3个字符！');history.back(-1);</script>")
    response.end
  end if
   if len(trim(request.Form("SiteUrl")))<10 then
    response.write ("<script language=javascript> alert('网站网址不能为空，且不少于10个字符！');history.back(-1);</script>")
    response.end
  end if 
  if left(trim(request.Form("SiteUrl")),7)<>"http://" then
    response.write ("<script language=javascript> alert('网站网址请加上""http://""！');history.back(-1);</script>")
    response.end
  end if
  if len(trim(request.Form("ComName")))<3 then
    response.write ("<script language=javascript> alert('公司名称必填且不能少于3个字符！');history.back(-1);</script>")
    response.end
  end if 
  if len(trim(request.Form("Address")))<3 then
    response.write ("<script language=javascript> alert('公司地址必填且不能少于3个字符！');history.back(-1);</script>")
    response.end
  end if
  if len(trim(request.Form("ZipCode")))<6 then
    response.write ("<script language=javascript> alert('邮政编码必填且不能少于6个字符！');history.back(-1);</script>")
    response.end
  end if
  if len(trim(request.Form("Telephone")))<11 then
    response.write ("<script language=javascript> alert('电话号码必填且不能少于11个字符！');history.back(-1);</script>")
    response.end
  end if
  if len(trim(request.Form("Fax")))<11 then
    response.write ("<script language=javascript> alert('传真号码必填且不能少于11个字符！');history.back(-1);</script>")
    response.end
  end if
  if len(trim(request.Form("Email")))<6 then
    response.write ("<script language=javascript> alert('电子邮箱必填具不能少于6个字符！');history.back(-1);</script>")
    response.end
  end if
  dim rs,sql
  set rs = server.createobject("adodb.recordset")
  sql="select top 1 * from NwebCn_Site"
  rs.open sql,conn,1,3
  rs("SiteTitle")=trim(Request.Form("SiteTitle"))
  rs("SiteUrl")=trim(Request.Form("SiteUrl"))
  rs("ComName")=trim(Request.Form("ComName"))
  rs("Address")=trim(Request.Form("Address"))
  rs("ZipCode")=trim(Request.Form("ZipCode"))
  rs("Telephone")=trim(Request.Form("Telephone"))
  rs("Fax")=trim(Request.Form("Fax"))
  rs("Email")=trim(Request.Form("Email"))
  rs("Keywords")=trim(Request.Form("Keywords"))
  rs("Descriptions")=trim(Request.Form("Descriptions"))
  rs("IcpNumber")=trim(Request.Form("IcpNumber"))
  if Request.Form("MesViewFlag")=1 then
    rs("MesViewFlag")=Request.Form("MesViewFlag")
    Conn.execute "ALTER TABLE NwebCn_Message ALTER COLUMN  ViewFlag bit default 1"
  else
    rs("MesViewFlag")=0
    Conn.execute "ALTER TABLE NwebCn_Message ALTER COLUMN  ViewFlag bit default 0"
  end if
  rs.update
  rs.close
  set rs=nothing 
  response.write "<script language=javascript> alert('成功编辑网站信息！');changeAdminFlag('网站信息设置');location.replace('SetSite.asp');</script>"
end function

function ViewSiteInfo()
  dim rs,sql 
  set rs = server.createobject("adodb.recordset")
  sql="select top 1 * from NwebCn_Site"
  rs.open sql,conn,1,1
  if rs.bof and rs.eof then
    response.write "读取数据库记录出错！"
    response.end
  else
    SiteTitle=rs("SiteTitle")
    SiteUrl=rs("SiteUrl")
    ComName=rs("ComName")
    Address=rs("Address")
    ZipCode=rs("ZipCode")
    Telephone=rs("Telephone")
    Fax=rs("Fax")
    Email=rs("Email")
    Keywords=rs("Keywords")
    Descriptions=rs("Descriptions")
    IcpNumber=rs("IcpNumber")
	MesViewFlag=rs("MesViewFlag")
    rs.close
    set rs=nothing 
  end if
end function
%>
