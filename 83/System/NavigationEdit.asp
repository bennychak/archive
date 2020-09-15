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
<TITLE>编辑导航</TITLE>
<link rel="stylesheet" href="Images/CssAdmin.css">
<script language="javascript" src="../Script/Admin.js"></script>
</HEAD>
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
<iframe width="260" height="166" id="colourPalette" src="../Include/SelColor.htm" style="visibility:hidden;position:absolute; left:0px;top:0px;border:1px gray solid #000000" frameborder="0" scrolling="no" ></iframe>
<% 
dim Result
Result=request.QueryString("Result")
dim ID,NavName,NavFullName,NavUrl,ParentID,SortPath,ViewFlag,OutFlag,Color
Color="NoColor"
ID=request.QueryString("ID")
call NavEdit() 
%>
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
  <form name="editForm" method="post" action="NavigationEdit.asp?Action=SaveEdit&Result=<%=Result%>&ID=<%=ID%>">
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id=editProduct idth="100%">

      <tr>
        <td width="160" height="20" align="right">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="20" align="right">导航简称：</td>
        <td><input name="NavName" type="text" class="textfield" id="NavName" style="WIDTH: 240;" value="<%=NavName%>" maxlength="100">&nbsp;发布：<input name="ViewFlag" type="checkbox" style='HEIGHT: 13px;WIDTH: 13px;' value="1" <%if ViewFlag then response.write ("checked")%>>&nbsp;*&nbsp;</td>
      </tr>
      <tr>
        <td height="20" align="right">显示颜色：</td>
        <td><input name="Color" type="text" class="textfield" style="color:<%=Color%>;WIDTH:80;" onClick="Getcolor(this);" value="<%=Color%>" size="7" maxlength="7">&nbsp;&nbsp;<img src="Images/NoColor.gif" id="NoColor" style="cursor:pointer;" onClick="document.getElementById('Color').value = document.getElementById('NoColor').id;"></td>
      </tr>
      
      <tr>
        <td height="20" align="right">链接网址：</td>
        <td><input name="NavUrl" type="text" class="textfield" id="NavUrl" style="WIDTH: 480;" value="<%=NavUrl%>">&nbsp;*</td>
      </tr>
      <tr>
        <td height="20" align="right">状　　态：</td>
        <td><input name="OutFlag" type="checkbox" style='HEIGHT: 13px;WIDTH: 13px;' value="1" <%if OutFlag then response.write ("checked")%>>&nbsp;外链</td>
      </tr>
      <tr>
        <td height="20" align="right">导航全称：</td>
        <td><input name="NavFullName" type="text" class="textfield" id="NavFullName" style="WIDTH: 480;" value="<%=NavFullName%>"></td>
      </tr>
      <tr>
        <td height="30" align="right">&nbsp;</td>
        <td valign="bottom"><input name="submitSaveEdit" type="submit" class="button"  id="submitSaveEdit" value="保存" style="WIDTH: 80;" ></td>
      </tr>
      <tr>
        <td height="20" align="right">&nbsp;</td>
        <td valign="bottom">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  </form>
</table>
</BODY>
</HTML>
<%
sub NavEdit()
  dim Action,rsCheckAdd,rs,sql
  Action=request.QueryString("Action")
  if Action="SaveEdit" then '保存编辑信息
    set rs = server.createobject("adodb.recordset")
    if len(trim(request.Form("NavName")))<1 then
      response.write ("<script language=javascript> alert('导航名称为必填项目，不得少于1个字符！');history.back(-1);</script>")
      response.end
    end if
    if len(trim(request.Form("NavUrl")))<1 then
      response.write ("<script language=javascript> alert('链接网址为必填项目，不得少于1个字符！');history.back(-1);</script>")
      response.end
    end if
    if Result="Add" then '创建信息
	  sql="select * from NwebCn_Navigation"
      rs.open sql,conn,1,3
      rs.addnew
      rs("NavName")=trim(Request.Form("NavName"))
      rs("NavUrl")=trim(Request.Form("NavUrl"))
	  if Request.Form("ViewFlag")=1 then
        rs("ViewFlag")=Request.Form("ViewFlag")
	  else
        rs("ViewFlag")=0
	  end if
	  if Request.Form("OutFlag")=1 then
        rs("OutFlag")=Request.Form("OutFlag")
	  else
        rs("OutFlag")=0
	  end if
      rs("Color")=Request.Form("Color")
	  rs("NavFullName")=trim(Request.Form("NavFullName"))
	  rs("SortPath")="0,"&rs("ID")&","
	  rs("Sequence")=99
	  rs("AddTime")=now()
	end if  
	if Result="Modify" then '修改信息
      sql="select * from NwebCn_Navigation where ID="&ID
      rs.open sql,conn,1,3
      rs("NavName")=trim(Request.Form("NavName"))
      rs("NavUrl")=trim(Request.Form("NavUrl"))
	  if Request.Form("ViewFlag")=1 then
        rs("ViewFlag")=Request.Form("ViewFlag")
	  else
        rs("ViewFlag")=0
	  end if
	  if Request.Form("OutFlag")=1 then
        rs("OutFlag")=Request.Form("OutFlag")
	  else
        rs("OutFlag")=0
	  end if
      rs("Color")=Request.Form("Color")
	  rs("NavFullName")=trim(Request.Form("NavFullName"))
	  rs("SortPath")="0,"&rs("ID")&","
	end if
	rs.update
	rs.close
    set rs=nothing 
    response.write "<script language=javascript> alert('成功编辑导航栏目！');changeAdminFlag('导航栏目列表');location.replace('NavigationList.asp');</script>"
  else '提取信息
	if Result="Modify" then
      set rs = server.createobject("adodb.recordset")
      sql="select * from NwebCn_Navigation where ID="& ID
      rs.open sql,conn,1,1
	  NavName=rs("NavName")
	  NavFullName=rs("NavFullName")
      NavUrl=rs("NavUrl")
	  ParentID=rs("ParentID")
	  SortPath=rs("SortPath")
	  ViewFlag=rs("ViewFlag")
	  OutFlag=rs("OutFlag")
	  Color=rs("Color")
	  rs.close
      set rs=nothing 
	end if
  end if
end sub
%>