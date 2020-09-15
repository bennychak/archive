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
<TITLE>编辑管理员</TITLE>
<link rel="stylesheet" href="Images/CssAdmin.css">
<script language="javascript" src="../Script/Admin.js"></script>
</HEAD>
<!--#include file="../Include/Const.asp" -->
<!--#include file="../Include/ConnSiteData.asp" -->
<!--#include file="../Include/Md5.asp"-->
<!--#include file="CheckAdmin.asp"-->
<%
if Instr(session("AdminPurview"),"|102,")=0 then 
  response.write ("<font color='red')>你不具有该管理模块的操作权限，请返回！</font>")
  response.end
end if
'========判断是否具有管理权限
%>
<BODY>
<% 
dim Result
Result=request.QueryString("Result")
dim ID,AdminName,Working,Password,vPassword,UserName,Purview,Explain,AddTime
ID=request.QueryString("ID")
if ID="" then ID=0
call AdminEdit() 
%>

<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>网站管理员：添加，修改管理员信息</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9"><a href="AdminEdit.asp?Result=Add" onClick='changeAdminFlag("添加管理员")'>添加管理员</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="AdminList.asp" onClick='changeAdminFlag("网站管理员")'>查看所有管理员</a></td>    
  </tr>
</table>
<br>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <form name="editForm" method="post" action="AdminEdit.asp?Action=SaveEdit&Result=<%=Result%>&ID=<%=ID%>" onSubmit="return CheckAdminEdit()">
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id=editProduct idth="100%">

      <tr>
        <td width="120" height="20" align="right">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="20" align="right">登&nbsp;录&nbsp;名：</td>
        <td><input name="AdminName" type="text" class="textfield" id="AdminName" style="WIDTH: 120;" value="<%=AdminName%>" maxlength="16" <%if Result="Modify" then response.write ("readonly")%>>&nbsp;*&nbsp;3-10位字符，不可修改</td>
      </tr>
      <tr>
        <td height="20" align="right">生　　效：</td>
        <td><input name="Working" type="checkbox" value="1" style="HEIGHT: 13px;WIDTH: 13px;" <%if Working then response.write ("checked")%>></td>
      </tr>
      <tr>
        <td height="20" align="right">密　　码：</td>
        <td><input name="Password" type="password" class="textfield" id="Password" maxlength="20" style="WIDTH: 120;">&nbsp;*&nbsp;6-16位字符，不填表未修改密码</td>
      </tr>
      <tr>
        <td height="20" align="right">确认密码：</td>
        <td><input name="vPassword" type="password" class="textfield" id="vPassword" maxlength="20" style="WIDTH: 120;">&nbsp;*</td>
      </tr>
      <tr>
        <td height="20" align="right">管理员名：</td>
        <td><input name="UserName" type="text" class="textfield" id="UserName" style="WIDTH: 120;" value="<%=UserName%>"></td>
      </tr>
      <tr <%if ID=1 then response.write ("style=display:none")%>>
        <td height="20" align="right">操作权限：</td>
        <td nowrap>
		  <input name="Purview11" type="checkbox" value="|11," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|11,")>0 then response.write ("checked")%>>&nbsp;编辑企业
          <input name="Purview12" type="checkbox" value="|12," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|12,")>0 then response.write ("checked")%>>&nbsp;企业列表
		  <input name="Purview21" type="checkbox" value="|21," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|21,")>0 then response.write ("checked")%>>&nbsp;新闻类别
		  <input name="Purview22" type="checkbox" value="|22," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|22,")>0 then response.write ("checked")%>>&nbsp;新闻列表
          <input name="Purview23" type="checkbox" value="|23," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|23,")>0 then response.write ("checked")%>>&nbsp;编辑新闻
		  <input name="Purview31" type="checkbox" value="|31," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|31,")>0 then response.write ("checked")%>>&nbsp;产品类别
		  <input name="Purview32" type="checkbox" value="|32," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|32,")>0 then response.write ("checked")%>>&nbsp;产品列表
          <input name="Purview33" type="checkbox" value="|33," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|33,")>0 then response.write ("checked")%>>&nbsp;编辑产品</td>
      </tr>
      <tr <%if ID=1 then response.write ("style=display:none")%>>
        <td height="20" align="right">&nbsp;</td>
        <td>
		  <input name="Purview51" type="checkbox" value="|51," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|51,")>0 then response.write ("checked")%>>&nbsp;下载类别
		  <input name="Purview52" type="checkbox" value="|52," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|52,")>0 then response.write ("checked")%>>&nbsp;下载列表
          <input name="Purview53" type="checkbox" value="|53," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|53,")>0 then response.write ("checked")%>>&nbsp;编辑下载
		  <input name="Purview61" type="checkbox" value="|61," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|61,")>0 then response.write ("checked")%>>&nbsp;招聘列表
		  <input name="Purview62" type="checkbox" value="|62," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|62,")>0 then response.write ("checked")%>>&nbsp;编辑招聘</td>
      </tr>
      <tr <%if ID=1 then response.write ("style=display:none")%>>
        <td height="20" align="right">&nbsp;</td>
        <td>
		  <input name="Purview71" type="checkbox" value="|71," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|71,")>0 then response.write ("checked")%>>&nbsp;其他类别
		  <input name="Purview72" type="checkbox" value="|72," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|72,")>0 then response.write ("checked")%>>&nbsp;其他列表
          <input name="Purview73" type="checkbox" value="|73," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|73,")>0 then response.write ("checked")%>>&nbsp;编辑其他
		  <input name="Purview81" type="checkbox" value="|81," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|81,")>0 then response.write ("checked")%>>&nbsp;广告列表
		  <input name="Purview82" type="checkbox" value="|82," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|82,")>0 then response.write ("checked")%>>&nbsp;编辑广告
		  <input name="Purview91" type="checkbox" value="|91," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|91,")>0 then response.write ("checked")%>>&nbsp;留言列表
		  <input name="Purview92" type="checkbox" value="|92," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|92,")>0 then response.write ("checked")%>>&nbsp;编辑留言
          <input name="Purview93" type="checkbox" value="|93," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|93,")>0 then response.write ("checked")%>>&nbsp;订单列表</td>
      </tr>
      <tr <%if ID=1 then response.write ("style=display:none")%>>
        <td height="20" align="right">&nbsp;</td>
        <td>
		  <input name="Purview94" type="checkbox" value="|94," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|94,")>0 then response.write ("checked")%>>&nbsp;订单回复
		  <input name="Purview95" type="checkbox" value="|95," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|95,")>0 then response.write ("checked")%>>&nbsp;人才列表
		  <input name="Purview96" type="checkbox" value="|96," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|96,")>0 then response.write ("checked")%>>&nbsp;回复人才		  		  
		  <input name="Purview101" type="checkbox" value="|101," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|101,")>0 then response.write ("checked")%>>&nbsp;管理员列表
		  <input name="Purview102" type="checkbox" value="|102," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|102,")>0 then response.write ("checked")%>>&nbsp;编辑管理员
          <input name="Purview103" type="checkbox" value="|103," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|103,")>0 then response.write ("checked")%>>&nbsp;会员列表</td>
      </tr>
      <tr <%if ID=1 then response.write ("style=display:none")%>>
        <td height="20" align="right">&nbsp;</td>
        <td>
		  <input name="Purview104" type="checkbox" value="|104," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|104,")>0 then response.write ("checked")%>>&nbsp;编辑会员
		  <input name="Purview105" type="checkbox" value="|105," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|105,")>0 then response.write ("checked")%>>&nbsp;会员组别
		  <input name="Purview111" type="checkbox" value="|111," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|111,")>0 then response.write ("checked")%>>&nbsp;修改密码
		  <input name="Purview112" type="checkbox" value="|112," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|112,")>0 then response.write ("checked")%>>&nbsp;网站信息设置
		  <input name="Purview113" type="checkbox" value="|113," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|113,")>0 then response.write ("checked")%>>&nbsp;导航栏目		  		  
		  <input name="Purview114" type="checkbox" value="|114," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|114,")>0 then response.write ("checked")%>>&nbsp;常量设置
		  <input name="Purview115" type="checkbox" value="|115," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|115,")>0 then response.write ("checked")%>>&nbsp;数据库操作
          <input name="Purview116" type="checkbox" value="|116," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|116,")>0 then response.write ("checked")%>>&nbsp;空间统计</td>
      </tr>
      <tr <%if ID=1 then response.write ("style=display:none")%>>
        <td height="20" align="right">&nbsp;</td>
        <td>
		  <input name="Purview117" type="checkbox" value="|117," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|117,")>0 then response.write ("checked")%>>&nbsp;访问统计查看
		  <input name="Purview118" type="checkbox" value="|118," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|118,")>0 then response.write ("checked")%>>&nbsp;访问统计修改
		  <input name="Purview119" type="checkbox" value="|119," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|119,")>0 then response.write ("checked")%>>&nbsp;友情链接
		  <input name="Purview120" type="checkbox" value="|120," style="HEIGHT: 13px;WIDTH: 13px;"
		  <%if Instr(Purview,"|120,")>0 then response.write ("checked")%>>&nbsp;查看阻止SQL注入记录</td>
      </tr>
      <tr <%if ID<>1 then response.write ("style=display:none")%>>
        <td height="20" align="right">操作权限：</td>
        <td nowrap><font color="#FF0000">内置超级管理员帐号，不可修改！</font></td>
      </tr>
      <tr>
        <td height="20" align="right" valign="top">备注说明：</td>
        <td><textarea name="Explain" cols="88" rows="3" class="textfield" id="Explain" style="WIDTH: 580;" ><%=Explain%></textarea></td>
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
</BODY>
</HTML>
<%
sub AdminEdit()
  dim Action,rsCheckAdd,rs,sql
  Action=request.QueryString("Action")
  if Action="SaveEdit" then '保存编辑管理员信息
    set rs = server.createobject("adodb.recordset")
    if Result="Add" then '创建网站管理员
      set rsCheckAdd = conn.execute("select AdminName from NwebCn_Admin where AdminName='" & trim(Request.Form("AdminName")) & "'")
      if not (rsCheckAdd.bof and rsCheckAdd.eof) then '判断此管理员名是否存在
        response.write "<script language=javascript> alert('" & trim(Request.Form("AdminName")) & "管理员已经存在，请换一个登录名再试试！');history.back(-1);</script>"
        response.end
      end if  
	  sql="select * from NwebCn_Admin"
      rs.open sql,conn,1,3
      rs.addnew
      if len(trim(Request.Form("AdminName")))<3 or len(trim(Request.Form("AdminName")))>10  then
        response.write "<script language=javascript> alert('管理员登录名必填，且字符数为3-10位！');history.back(-1);</script>"
        response.end
      end if	  
      if len(trim(Request.Form("Password")))<6 or len(trim(Request.Form("Password")))>16  then
        response.write "<script language=javascript> alert('管理员密码必填，且字符数为6-16位！');history.back(-1);</script>"
        response.end
      end if
	  if Request.Form("Password")<>Request.Form("vPassword") then 
        response.write "<script language=javascript> alert('两次输入的密码不一样！');history.back(-1);</script>"
        response.end
	  end if
      rs("AdminName")=trim(Request.Form("AdminName"))
	  if Request.Form("Working")=1 then
        rs("Working")=Request.Form("Working")
	  else
        rs("Working")=0
	  end if
	  rs("Password")=Md5(Request.Form("Password"))
	  rs("UserName")=trim(Request.Form("UserName"))
	  rs("AdminPurview")=Request.Form("Purview11") & Request.Form("Purview12") &_
	                     Request.Form("Purview21") & Request.Form("Purview22") & Request.Form("Purview23") &_
	                     Request.Form("Purview31") & Request.Form("Purview32") & Request.Form("Purview33") &_
	                     Request.Form("Purview51") & Request.Form("Purview52") & Request.Form("Purview53") &_
	                     Request.Form("Purview61") & Request.Form("Purview62") &_
	                     Request.Form("Purview71") & Request.Form("Purview72") & Request.Form("Purview73") &_
	                     Request.Form("Purview81") & Request.Form("Purview82") 
	  rs("Explain")=trim(Request.Form("Explain"))
	  rs("AddTime")=now()
	  rs.update
	  rs.close
      set rs=nothing 
	end if  
	if Result="Modify" then '修改网站管理员
	  if id=1 then
      sql="select * from NwebCn_Admin where ID="&ID
      rs.open sql,conn,1,3
      if trim(Request.Form("Password"))<>"" then
	    if len(trim(Request.Form("Password")))<6 or len(trim(Request.Form("Password")))>16  then
          response.write "<script language=javascript> alert('管理员密码必填，且字符数为6-16位！');history.back(-1);</script>"
          response.end
        end if
	    if Request.Form("Password")<>Request.Form("vPassword") then 
          response.write "<script language=javascript> alert('两次输入的密码不一样！');history.back(-1);</script>"
          response.end
	    end if
	    rs("Password")=Md5(Request.Form("Password"))
	  end if
	  rs("UserName")=trim(Request.Form("UserName"))
	  rs.update
	  rs.close
      set rs=nothing 
	else
	  response.Redirect("Error.asp")
      response.end
	end if
	end if
    response.write "<script language=javascript> alert('成功编辑网站管理员！');changeAdminFlag('网站管理员');location.replace('AdminList.asp');</script>"
  else '提取管理员信息
	if Result="Modify" then
      set rs = server.createobject("adodb.recordset")
      sql="select * from NwebCn_Admin where ID="& ID
      rs.open sql,conn,1,1
	  AdminName=rs("AdminName")
	  Working=rs("Working")
	  UserName=rs("UserName")
	  Purview=rs("AdminPurview")
	  Explain=rs("Explain")
	  rs.close
      set rs=nothing 
	end if
  end if
end sub
  
%>
