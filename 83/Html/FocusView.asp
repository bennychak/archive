<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
'┌┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┐
'┊　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　┊
'┊　　　　　　　刘小雨儿童艺术画室网站管理系统（ＮＷＥＢ）　　　　　　　┊
'┊　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　┊
' 　版权所有　Nweb.cn
'
'　　程序制作　万博工作室
'　　　　　　　Add:四川省彭州市西大街228号/611930
'　　　　　　　Tel:028-88079088  Fax:83708850
'　　　　　　　E-m:duolaimi-123@163.com
'　　　　　　　Q Q:59309100
'
'　　相关网址　[产品介绍]http://www.Nweb.cn
'　　　　　　　[支持论坛]http://www.Nweb.cn/bbs
'
'　　演示网址　http://www.Nweb.cn
'┊　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　┊
'└┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┘
%>
<% Option Explicit %>
<% response.charset="utf-8" %>
<!--#include file="../Include/Const.asp" -->
<!--#include file="../Include/ConnSiteData.asp" -->
<%
dim rs,ADsName,Content
set rs=server.CreateObject("adodb.recordset")
rs.open "select top 1 * from NwebCn_Ads where ViewFlag order by id desc",conn,1,3
ADsName=rs("ADsName")
Content=rs("Content")
rs("ClickNumber")=rs("ClickNumber")+1
rs.update
rs.close
set rs=nothing  
%> 
<HTML>
<HEAD>
<TITLE><%=ADsName%></TITLE>
<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="../Css/Style.css">
<style type="text/css">
<!--
body{
	margin:0px;
	background:none;
	}
-->
</style>
</HEAD>
<BODY>
<%=Content%>
</BODY>
</html>
