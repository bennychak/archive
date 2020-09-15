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
<TITLE>欢迎进入系统后台</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8" />
<META NAME="copyright" CONTENT="Copyright 2004-2008 - NWEB.CN-STUDIO" />
<META NAME="Author" CONTENT="万博网络技术工作室,www.Nweb.cn" />
<META NAME="Keywords" CONTENT="" />
<META NAME="Description" CONTENT="" />
<link rel="stylesheet" href="Images/CssAdmin.css">
</HEAD>
<!--#include file="CheckAdmin.asp"-->
<BODY>
<div align="center">
<font color="#FF0000"><strong>欢迎使用刘小雨儿童艺术画室网站管理系统<br>
<br></strong></font>
<table width="720" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" colspan="2"><font color="#FFFFFF"><img src="Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>服务器信息</strong></font></td>
    </tr>
  <tr>
    <td width="50%" height="24" bgcolor="#EBF2F9">服务器操作系统：<%=Request.ServerVariables("OS")%></td>
    <td width="50%" height="24" bgcolor="#EBF2F9">网站信息服务软件和版本：<%=Request.ServerVariables("SERVER_SOFTWARE")%></td>
  </tr>
  <tr>
    <td width="50%" height="24" bgcolor="#EBF2F9">脚本解释引擎：<%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></td>
    <td width="50%" height="24" bgcolor="#EBF2F9">脚本超时时间：<%=Server.ScriptTimeout%>秒</td>
  </tr>
  <tr>
    <td height="24" bgcolor="#EBF2F9">CDONTS组件支持：<%
	  On Error Resume Next
	  Server.CreateObject("CDONTS.NewMail")
	  if err=0 then 
		 response.write("<font color=red>√</font>")
	  else
         response.write("<font color=red>×</font>")
	  end if
	  err=0
    %></td>
    <td height="24" bgcolor="#EBF2F9">Jmail邮箱组件支持：<%
	  If Not IsObjInstalled(theInstalledObjects(13)) Then
         response.write("<font color=red>×</font>") 
      else
         response.write("<font color=red>√</font>") 
      end if
    %></td>
  </tr>
  <tr>
    <td height="24" bgcolor="#EBF2F9">返回服务器处理请求的端口：<%=Request.ServerVariables("SERVER_PORT")%></td>
    <td height="24" bgcolor="#EBF2F9">协议的名称和版本：<%=Request.ServerVariables("SERVER_PROTOCOL")%></td>
  </tr>
  <tr>
    <td height="24" bgcolor="#EBF2F9">服务器 CPU 数量：<%=Request.ServerVariables("NUMBER_OF_PROCESSORS")%></td>
    <td height="24" bgcolor="#EBF2F9">FSO文本文件读写：<%
	On Error Resume Next
	Server.CreateObject("Scripting.FileSystemObject")
	if err=0 then 
	   response.write("<font color=red>√</font>，支持")
	else
       response.write("<font color=red>×</font>，不支持")
	end if 
	err=0
    %></td>
  </tr>
  <tr>
    <td height="24" bgcolor="#EBF2F9">客户端操作系统：<%
      dim thesoft,vOS
      thesoft=Request.ServerVariables("HTTP_USER_AGENT")
      if instr(thesoft,"Windows NT 5.0") then
	     vOS="Windows 2000"
      elseif instr(thesoft,"Windows NT 5.2") then
	     vOs="Windows 2003"
      elseif instr(thesoft,"Windows NT 5.1") then
         vOs="Windows XP"
      elseif instr(thesoft,"Windows NT") then
       	 vOs="Windows NT"
      elseif instr(thesoft,"Windows 9") then
	     vOs="Windows 9x"
      elseif instr(thesoft,"unix") or instr(thesoft,"linux") or instr(thesoft,"SunOS") or instr(thesoft,"BSD") then
	     vOs="类Unix"
      elseif instr(thesoft,"Mac") then
	     vOs="Mac"
      else
     	vOs="Other"
      end if
      response.Write(vOs)
    %></td>
    <td height="24" bgcolor="#EBF2F9">站点物理路径：<%=request.ServerVariables("APPL_PHYSICAL_PATH")%></td>
  </tr>
  <tr>
    <td width="50%" height="24" bgcolor="#EBF2F9">域名IP：http://<%=Request.ServerVariables("SERVER_NAME")%>&nbsp;/&nbsp;<%=Request.ServerVariables("LOCAL_ADDR")%></td>
    <td width="50%" height="24" bgcolor="#EBF2F9">虚拟路径：<%=Request.ServerVariables("SCRIPT_NAME")%></td>
  </tr>
  <tr>
    <td height="24" colspan="2" bgcolor="#D7E4F7">客户端浏览器要求： IE6或以上。</td>
    </tr>
</table>
</div>
</BODY>
</HTML>