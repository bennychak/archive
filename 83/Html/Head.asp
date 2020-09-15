<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% Option Explicit %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%
'this site was build by bienfantaisie
%>
<% response.charset="utf-8" %>
<!--#include file="../Include/NoSqlHack.asp" -->
<!--#include file="../Include/Const.asp" -->
<!--#include file="../Include/ConnSiteData.asp" -->
<% call SiteInfo %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="Copyright 2005-2008 - NWEB.CN-STUDIO" />
<meta name="Author" content="bienfantaisie, bennychia" />
<meta name="Keywords" content="<% =Keywords %>" />
<meta name="Description" content="<% =Descriptions %>" />
<title><% =SiteTitle %></title>
<script language="javascript" src="../Script/Html.js"></script>
<script language="javascript" src="../Script/jquery-1.4.2.min.js"></script>
<script language="javascript" src="../Script/base.js"></script>
<link href="../Css/Style.css" rel="stylesheet" type="text/css">
<link href="../Css/base.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="Container">
    <div class="top">
    	<div class="logo">
        	<a href="/html/main.asp"></a>
        </div>
        <div class="topmenu">
            <div class="left">
                <div class="t1"><span>About Us</span></div>
                <div class="t2"><span>Art Class</span></div>
                <div class="clear"></div>
            </div>
            <div class="right">
                <div class="t3"><span>Art Zone</span></div>
                <div class="t4"><span>Contact</span></div>
                <div class="clear"></div>
            </div>
        </div>
        <div class="menu">
            <div class="left">
                <div class="m1"><a href="About.asp" title="关于画室"></a></div>
                <div class="m2"><a href="NewsList.asp?SortID=7" title="艺术课程"></a></div>
            </div>
            <div class="right">
                <div class="m3"><a href="NewsList.asp?SortID=8" title="艺术空间"></a></div>
                <div class="m4"><a href="About.asp?ID=12" title="联系我们"></a></div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
  <!--<div id="Header">
    <div id="mainMenu"><%=MainMenu()%></div>
    <div id="Header_search"><%=Search()%></div>
  </div>-->
<%
function MainMenu()
  dim rs,sql
  set rs = server.createobject("adodb.recordset")
  sql="select * from NwebCn_Navigation where ViewFlag and ParentID=0 order by Sequence asc"
  rs.open sql,conn,1,1
  response.write ("<ul>")
  if rs.eof then
    response.write "<li>暂无导航链接</li>"
  else
	do
	  response.write "<li id=""mainMenu"&rs("ID")&""">"
	  if rs("Color")="NoColor" then
	    response.write "<a  href="""&rs("NavUrl")&""">"&rs("NavName")&"</a>"
	  else
	    response.write "<a  href="""&rs("NavUrl")&""" style=""color:"&rs("Color")&""">"&rs("NavName")&"</a>"
	  end if
      response.write "</li>"
	  rs.movenext
	loop until rs.eof
  end if
  response.write ("</ul>")
  rs.close
  set rs=nothing
end function

function Login() 
  if session("MemName")="" or session("GroupID")="" or session("MemLogin")<>"Succeed" then
    response.write "<form name=""formLogin"" method=""post"" action=""MemberLogin.asp"">" &_
                   "  用户名：&nbsp;<input name=""LoginName"" type=""text"" class=""Login_text"" />" &_
                   "  <br />" &_
                   "  密　码：&nbsp;<input name=""LoginPassword"" type=""password"" class=""Login_text"" />" &_
                   "  <br /><br />" &_
                   "  <input name=""GoLogin"" type=""image"" src=""../Images/Login.gif"" width=""48"" height=""20"" align=""absmiddle"" />&nbsp;&nbsp;" &_
                   "  <a href=""MemberRegister.asp"" title=""新用户注册""><image src=""../Images/Register.gif"" width=""48"" height=""20"" align=""absmiddle"" /></a>" &_
                   "  <br /><br />" &_
                   "  <a href=""MemberGetPass.asp"" title=""忘记密码"">忘记密码了</a>" &_
 				   "  &nbsp;|&nbsp;" &_
	               "  <a href=""ProductBuy.asp"" title=""查看订购车"">查看订购车</a>" &_
                   "</form>" 
  else
    response.write "<br /><br />" &_
	               "您好，" &_
	               "<font style=""color:#1874cd;font-weight: bold;"">"&session("MemName")&"</font>" &_
	               "&nbsp;-&nbsp;"&MemGroup(session("GroupID"))&"<br /><br />" &_
	               "<a href=""MemberInfo.asp"">帐户管理</a>" &_
 				   "&nbsp;|&nbsp;" &_
	               "<a href=""MemberLogin.asp?Action=Out"">退出登录</a>" &_
 				   "&nbsp;|&nbsp;" &_
	               "<a href=""ProductBuy.asp"">订购车</a>"
  end if
end function

function Search()
 response.write "<form action=""Search.asp"" method=""post"" name=""Search"">" &_
 		 	    "<input name=""Keyword"" type=""text"" class=""Search_text"" />" &_
      			"<select name=""Range"" class=""Search_sel"">" &_
			    "    <option value=""Void"" selected=""selected"">-请选择-</option>" &_
			    "    <option value=""Product"">产品</option>" &_
			    "    <option value=""News"">新闻</option>" &_
			    "    <option value=""Down"">下载</option>" &_
			    "    <option value=""Others"">其他</option>" &_
			    "  </select>&nbsp;<input class=""Search_button"" type=""submit"" name=""Submit"" value=""搜索"" />" &_
                "</form>"
end function

function MemGroup(GroupID)
  dim rs,sql
  set rs = server.createobject("adodb.recordset")
  sql="select * from NwebCn_MemGroup where GroupID='"&GroupID&"'"
  rs.open sql,conn,1,1
  MemGroup=rs("GroupName")
  rs.close
  set rs=nothing
end function
%>