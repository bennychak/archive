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
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8" />
<META NAME="copyright" CONTENT="Copyright 2004-2008 - NWEB.CN-STUDIO" />
<META NAME="Author" CONTENT="万博网络技术工作室,www.Nweb.cn" />
<META NAME="Keywords" CONTENT="" />
<META NAME="Description" CONTENT="" />
<TITLE>导航栏目列表</TITLE>
<link rel="stylesheet" href="Images/CssAdmin.css">
<script language="javascript" src="../Script/Admin.js"></script></HEAD>
<!--#include file="../Include/Const.asp" -->
<!--#include file="../Include/ConnSiteData.asp" -->
<!--#include file="CheckAdmin.asp"-->
<%
if Instr(session("AdminPurview"),"|113,")=0 then 
  response.write ("<font color='red')>你不具有该管理模块的操作权限，请返回！</font>")
  response.end
end if
'========判断是否具有管理权限
%>
<BODY>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>导航栏目：添加，修改导航栏目相关的内容，注意网站内链接是相对系统目录的。</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9"><a href="NavigationEdit.asp?Result=Add" onClick='changeAdminFlag("添加导航栏目")'>添加导航栏目</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="NavigationList.asp" onClick='changeAdminFlag("导航栏目列表")'>查看导航栏目</a></td>    
  </tr>
</table>
<br>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <form action="DelContent.asp?Result=Navigation" method="post" name="formDel" >
    <tr>
      <td width="18" nowrap bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>ID</strong></font></td>
      <td width="28" height="24" nowrap bgcolor="#8DB5E9"><strong><font color="#FFFFFF">发布</font></strong></td>
      <td width="120" nowrap bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>导航名称</strong></font></td>
      <td nowrap bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>链接地址</strong></font></td>
      <td width="30" bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>状态</strong></font></td>
      <td width="52" nowrap bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>显示顺序</strong></font></td>
      <td width="118" nowrap bgcolor="#8DB5E9"><strong><font color="#FFFFFF"><strong>更新时间</strong></font></strong></td>
      <td colspan="2" width="76" nowrap bgcolor="#8DB5E9"><strong><font color="#FFFFFF">操作</font></strong>
      <input onClick="CheckAll(this.form)" name="buttonAllSelect" type="button" class="button"  id="submitAllSearch" value="全" style="HEIGHT: 18px;WIDTH: 16px;">
      <input onClick="CheckOthers(this.form)" name="buttonOtherSelect" type="button" class="button"  id="submitOtherSelect" value="反" style="HEIGHT: 18px;WIDTH: 16px;"></td>
    </tr>
	<%
	call NavigationList(0)
	if conn.execute("select * from NwebCn_Navigation where ParentID=0").eof then
      response.write "<tr><td height='50' align='center' colspan='9' nowrap  bgcolor='#EBF2F9'>暂无导航栏目</td></tr>"
	else
	  Response.Write "<tr>" & vbCrLf
      Response.Write "<td colspan='7' nowrap  bgcolor='#EBF2F9'>&nbsp;</td>" & vbCrLf
      Response.Write "<td colspan='2' nowrap  bgcolor='#EBF2F9'><input name='submitDelSelect' type='button' class='button'  id='submitDelSelect' value='删除所选' onClick='ConfirmDel(""您真的要删除这个导航栏目及其下属导航栏目吗？"");'></td>" & vbCrLf
      Response.Write "</tr>" & vbCrLf
	end if
	%>
  </form>
</table>
<% if request.QueryString("Result")="ModifySequence" then call ModifySequence() %>
<% if request.QueryString("Result")="SaveSequence" then call SaveSequence() %>
</body>
</html>
<%
'-----------------------------------------------------------
function NavigationList(ParentID)
  dim sql,rs
  sql="select * from NwebCn_Navigation where ParentID="&ParentID&" order by Sequence asc"
  set rs=server.createobject("adodb.recordset")
  rs.open sql,conn,0,1
  while(not rs.eof)'填充数据到表格
	  Response.Write "<tr bgcolor='#EBF2F9' onMouseOver = ""this.style.backgroundColor = '#FFFFFF'"" onMouseOut = ""this.style.backgroundColor = ''"" style='cursor:hand'>" & vbCrLf
      Response.Write "<td nowrap>"&rs("ID")&"</td>" & vbCrLf
      if rs("ViewFlag") then
        Response.Write "<td nowrap><font color='blue'>√</font></td>" & vbCrLf
      else
        Response.Write "<td nowrap><font color='red'>×</font></td>" & vbCrLf
	  end if
	  if rs("ParentID")<>0 then
        Response.Write "<td nowrap>&nbsp;&nbsp;<a href="""&rs("NavUrl")&""" target=""_blank"" title="""&rs("NavFullName")&"""><font color="""&rs("Color")&""">"&rs("NavName")&"</font></td>" & vbCrLf
	  else 
        Response.Write "<td nowrap><a href="""&rs("NavUrl")&""" target=""_blank"" title="""&rs("NavFullName")&"""><font color="""&rs("Color")&""">"&rs("NavName")&"</font></td>" & vbCrLf
      end if
	  if StrLen(rs("NavUrl"))>49 then
        Response.Write "<td title="&rs("NavUrl")&" nowrap>"&StrLeft(rs("NavUrl"),46)&"</td>" & vbCrLf
      else
        Response.Write "<td title="&rs("NavUrl")&" nowrap>"&rs("NavUrl")&"</td>" & vbCrLf
      end if
	  Response.Write "<td nowrap>"
	  if rs("OutFlag") then
        Response.Write "<font color='blue'>外</font>"
	  end if
      Response.Write "</td>" & vbCrLf
	  if rs("ParentID")<>0 then
        Response.Write "<td nowrap>&nbsp;<font color='blue'>"&rs("Sequence")&"</font></td>"
	  else 
        Response.Write "<td nowrap><font color='blue'>"&rs("Sequence")&"</font></td>"
      end if
      Response.Write "<td nowrap>"&rs("AddTime")&"</td>" & vbCrLf
      Response.Write "<td width='48' nowrap><a href='NavigationEdit.asp?Result=Modify&ID="&rs("ID")&"' onClick='changeAdminFlag(""修改导航栏目"")'><font color='#330099'>改</font></a>.<a href='NavigationList.asp?Result=ModifySequence&ID="&rs("ID")&"' onClick='changeAdminFlag(""排序导航栏目"")'><font color='#330099'>排序</font></a></td>" & vbCrLf
 	  Response.Write "<td width='14' nowrap><input name='selectID' type='radio' value='"&rs("ID")&"' style='HEIGHT: 13px;WIDTH: 13px;'></td>" & vbCrLf
      Response.Write "</tr>" & vbCrLf
	  call NavigationList(rs("ID"))
	  rs.movenext
  wend
end function 

sub ModifySequence()
  dim rs,sql,ID,NavName,Sequence
  ID=request.QueryString("ID")
  set rs = server.createobject("adodb.recordset")
  sql="select * from NwebCn_Navigation where ID="& ID
  rs.open sql,conn,1,1
  NavName=rs("NavName")
  Sequence=rs("Sequence")
  rs.close
  set rs=nothing
  response.write "<br>"
  response.write "<table width='100%' border='0' cellpadding='3' cellspacing='1' bgcolor='#6298E1'>"
  response.write "<form action='NavigationList.asp?Result=SaveSequence' method='post' name='formSequence'>"
  response.write "<tr>"
  response.write "<td height='24' align='center' nowrap  bgcolor='#EBF2F9'>ID：<input name='ID' type='text' class='textfield'  style='WIDTH: 30;' value='"&ID&"' maxlength='4' readonly>&nbsp;导航栏目名称：<input name='NavName' type='text' class='textfield' id='NavName' style='WIDTH: 180;' value='"&NavName&"' maxlength='36' readonly>&nbsp;排序号：<input name='Sequence' type='text' class='textfield' style='WIDTH: 60;' value='"&Sequence&"' maxlength='3'  onKeyDown='if(event.keyCode==13)event.returnValue=false' onchange=""if(/\D/.test(this.value)){alert('只能在排序号内输入整数！');this.value='"&Sequence&"';}"">&nbsp;&nbsp;<input name='submitSequence' type='submit' class='button' value='保存' style='WIDTH: 60;' ></td>"
  response.write "</tr>"
  response.write "</form>"
  response.write "</table>"
end sub

sub SaveSequence()
  if request.form("Sequence")=0 then
    response.write ("<script language=javascript> alert('导航栏目的排序号不能为“0”！');history.back(-1);</script>")
    response.end
  end if
  dim rs,sql
  set rs = server.createobject("adodb.recordset")
  sql="select * from NwebCn_Navigation where ID="& request.form("ID")
  rs.open sql,conn,1,3
  if rs("ParentID")=0 then
    conn.execute("update NwebCn_Navigation set Sequence="&request.form("Sequence")&"&right(Sequence,len(Sequence)-"&len(rs("Sequence"))&") where ParentID="&rs("ID")&"")
  end if
  rs("Sequence")=request.form("Sequence")
  rs.update
  rs.close
  set rs=nothing
  response.redirect "NavigationList.asp"
end sub
%>