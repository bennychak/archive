﻿<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
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
<TITLE>编辑下载</TITLE>
<link rel="stylesheet" href="Images/CssAdmin.css">
<script language="javascript" src="../Script/Admin.js"></script>
</HEAD>
<!--#include file="../Include/Const.asp" -->
<!--#include file="../Include/ConnSiteData.asp" -->
<!--#include file="CheckAdmin.asp"-->
<%
if Instr(session("AdminPurview"),"|53,")=0 then 
  response.write ("<font color='red')>你不具有该管理模块的操作权限，请返回！</font>")
  response.end
end if
'========判断是否具有管理权限
%>
<BODY>
<% 
dim Result
Result=request.QueryString("Result")
dim ID,DownName,ViewFlag,SortName,SortID,SortPath
dim FileSize,FileUrl,CommendFlag,GroupID,GroupIdName,Exclusive,Content
ID=request.QueryString("ID")
call DownEdit() 
%>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>下载检索及分类查看：添加，修改，删除下载信息</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9"><a href="DownEdit.asp?Result=Add" onClick='changeAdminFlag("添加产品信息")'>添加下载信息</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="DownList.asp" onClick='changeAdminFlag("产品列表")'>查看所有下载信息</a></td>
  </tr>
</table>
<br>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <form name="editForm" method="post" action="DownEdit.asp?Action=SaveEdit&Result=<%=Result%>&ID=<%=ID%>">
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id=editDown idth="100%">

      <tr>
        <td width="120" height="20" align="right">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="20" align="right">下载名称：</td>
        <td><input name="DownName" type="text" class="textfield" id="DownName" style="WIDTH: 240;" value="<%=DownName%>" maxlength="100">&nbsp;发布：
		    <input name="ViewFlag" type="checkbox" style='HEIGHT: 13px;WIDTH: 13px;' value="1" <%if ViewFlag then response.write ("checked")%>>&nbsp;*&nbsp;不少于3个字符</td>
      </tr>
      <tr>
        <td height="20" align="right">所属类别：</td>
        <td><input name="SortName" type="text" class="textfield" id="SortName" value="<%=SortName%>" style="WIDTH: 240;background-color:#EBF2F9;" readonly>&nbsp;<a href="javaScript:OpenScript('SelectSort.asp?Result=Download',500,500,'')"><img src="Images/Select.gif" width="30" height="16" border="0" align="absmiddle"></a></td>
      </tr>
      <tr>
        <td height="20" align="right">类别数字：</td>
        <td><input name="SortID" type="text" class="textfield" id="SortID" style="WIDTH: 40;background-color:#EBF2F9;" value="<%=SortID%>" readonly><input name="SortPath" type="text" class="textfield" id="SortPath" style="WIDTH: 200;background-color:#EBF2F9;" value="<%=SortPath%>" readonly>&nbsp;*</td>
      </tr>
      <tr>
        <td height="20" align="right">查看权限：</td>
        <td><select name="GroupID" class="textfield">
            <% call SelectGroup() %>
          </select>
            <input name="Exclusive" type="radio" value="&gt;="  <%if Exclusive="" or Exclusive=">=" then response.write ("checked")%>>
          隶属
          <input type="radio"  <%if Exclusive="=" then response.write ("checked")%> name="Exclusive" value="=">
          专属（隶属：权限值≥可查看，专属：权限值＝可查看）</td>
      </tr>
      <tr>
        <td height="20" align="right">状　　态：</td>
        <td><input name="CommendFlag" type="checkbox" style="HEIGHT: 13px;WIDTH: 13px;" value="1" <%if CommendFlag then response.write ("checked")%>>
          &nbsp;推荐</td>
      </tr>
      <tr>
        <td height="20" align="right">下载地址：</td>
        <td><input name="FileUrl" type="text" class="textfield" style="WIDTH: 240;" value="<%=FileUrl%>" maxlength="100">&nbsp;<a href="javaScript:OpenScript('UpFileForm.asp?Result=FileUrl',460,180)"><img src="Images/Upload.gif" width="30" height="16" border="0" align="absmiddle"></a></td>
      </tr>
      <tr>
        <td height="20" align="right">文件大小：</td>
        <td><input name="FileSize" type="text" class="textfield" id="FileSize" style="WIDTH: 240;" value="<%=FileSize%>" maxlength="100"></td>
      </tr>
      <tr>
        <td height="20" align="right" valign="top">信息内容：<br>
		  <img title="点击进入可视化查看、编辑环境..." src="Images/Edit.gif" width="51" height="20" style="cursor:hand" onClick="OpenDialog('../Editor/EditorDialog.html?lnk=Content&file=Editor_1.html',800,520);">
        <td><textarea name="Content" rows="12" class="textfield" id="Content" style="WIDTH: 86%;" readonly><%=Content%></textarea></td>
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
sub DownEdit()
  dim Action,rsRepeat,rs,sql
  Action=request.QueryString("Action")
  if Action="SaveEdit" then '保存编辑下载信息
    set rs = server.createobject("adodb.recordset")
    if len(trim(request.Form("DownName")))<3 then
      response.write ("<script language=javascript> alert('下载名称为必填项目！');history.back(-1);</script>")
      response.end
    end if
    if Result="Add" then '创建下载信息
	  sql="select * from NwebCn_Download"
      rs.open sql,conn,1,3
      rs.addnew
      rs("DownName")=trim(Request.Form("DownName"))
	  if Request.Form("ViewFlag")=1 then
        rs("ViewFlag")=Request.Form("ViewFlag")
	  else
        rs("ViewFlag")=0
	  end if
	  if Request.Form("SortID")="" and Request.Form("SortPath")="" then
        response.write ("<script language=javascript> alert('请选择所属分类！');history.back(-1);</script>")
        response.end
	  else
	    rs("SortID")=Request.Form("SortID")
		rs("SortPath")=Request.Form("SortPath")
	  end if
	  if Request.Form("CommendFlag")=1 then
        rs("CommendFlag")=Request.Form("CommendFlag")
	  else
        rs("CommendFlag")=0
	  end if
      GroupIdName=split(Request.Form("GroupID"),"┎╂┚")
	  rs("GroupID")=GroupIdName(0)
	  rs("Exclusive")=trim(Request.Form("Exclusive"))
	  rs("FileSize")=trim(Request.Form("FileSize"))
	  rs("FileUrl")=trim(Request.Form("FileUrl"))
	  rs("Content")=rtrim(Request.Form("Content"))
	  rs("AddTime")=now()
	  rs("UpdateTime")=now()
	end if  
	if Result="Modify" then '修改下载信息
      sql="select * from NwebCn_Download where ID="&ID
      rs.open sql,conn,1,3
      rs("DownName")=trim(Request.Form("DownName"))
	  if Request.Form("ViewFlag")=1 then
        rs("ViewFlag")=Request.Form("ViewFlag")
	  else
        rs("ViewFlag")=0
	  end if
	  if Request.Form("SortID")<>"" and Request.Form("SortPath")<>"" then
	    rs("SortID")=Request.Form("SortID")
		rs("SortPath")=Request.Form("SortPath")
	  else
        response.write ("<script language=javascript> alert('请选择所属分类！');history.back(-1);</script>")
        response.end
	  end if
	  if Request.Form("CommendFlag")=1 then
        rs("CommendFlag")=Request.Form("CommendFlag")
	  else
        rs("CommendFlag")=0
	  end if
      GroupIdName=split(Request.Form("GroupID"),"┎╂┚")
	  rs("GroupID")=GroupIdName(0)
	  rs("Exclusive")=trim(Request.Form("Exclusive"))
	  rs("FileSize")=trim(Request.Form("FileSize"))
	  rs("FileUrl")=trim(Request.Form("FileUrl"))
	  rs("Content")=rtrim(Request.Form("Content"))
	  rs("UpdateTime")=now()
	end if
	rs.update
	rs.close
    set rs=nothing 
    response.write "<script language=javascript> alert('成功编辑下载信息！');changeAdminFlag('下载列表');location.replace('DownList.asp');</script>"
  else '提取产品信息
	if Result="Modify" then
      set rs = server.createobject("adodb.recordset")
      sql="select * from NwebCn_Download where ID="& ID
      rs.open sql,conn,1,1
      if rs.bof and rs.eof then
        response.write ("数据库读取记录出错！")
        response.end
      end if
	  DownName=rs("DownName")
	  ViewFlag=rs("ViewFlag")
	  SortName=SortText(rs("SortID"))
	  SortID=rs("SortID")
	  SortPath=rs("SortPath")
	  CommendFlag=rs("CommendFlag")
	  GroupID=rs("GroupID")
	  Exclusive=rs("Exclusive")
	  FileSize=rs("FileSize")
	  FileUrl=rs("FileUrl")
      Content=rs("Content")
	  rs.close
      set rs=nothing 
    end if
  end if
end sub
%>
<% 
sub SelectGroup()
  dim rs,sql
  set rs = server.createobject("adodb.recordset")
  sql="select GroupID,GroupName from NwebCn_MemGroup"
  rs.open sql,conn,1,1
  if rs.bof and rs.eof then
    response.write("未设组别")
  end if
  while not rs.eof
    response.write("<option value='"&rs("GroupID")&"┎╂┚"&rs("GroupName")&"'")
    if GroupID=rs("GroupID") then response.write ("selected")
    response.write(">"&rs("GroupName")&"</option>")
    rs.movenext
  wend
  rs.close
  set rs=nothing
end sub
%>
<%
'生成所属类别--------------------------
Function SortText(ID)
  Dim rs,sql
  Set rs=server.CreateObject("adodb.recordset")
  sql="Select * From NwebCn_DownSort where ID="&ID
  rs.open sql,conn,1,1
  SortText=rs("SortName")
  rs.close
  set rs=nothing
End Function
%>