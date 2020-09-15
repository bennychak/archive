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
<TITLE>编辑会员</TITLE>
<link rel="stylesheet" href="Images/CssAdmin.css">
<script language="javascript" src="../Script/Admin.js"></script>
</HEAD>
<!--#include file="../Include/Const.asp" -->
<!--#include file="../Include/ConnSiteData.asp" -->
<!--#include file="../Include/Md5.asp"-->
<!--#include file="CheckAdmin.asp"-->
<%
if Instr(session("AdminPurview"),"|104,")=0 then 
  response.write ("<font color='red')>你不具有该管理模块的操作权限，请返回！</font>")
  response.end
end if
'========判断是否具有管理权限
%>
<BODY>
<% 
dim Result
Result=request.QueryString("Result")
dim ID,mMemName,mRealName,mPassword,vPassword,mSex,mGroupID,mGroupName,mGroupIdName
dim mCompany,mAddress,mZipCode,mTelephone,mFax,mMobile,mEmail,mHomepage,mWorking
ID=request.QueryString("ID")
call MemEdit() 
%>

<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>网站会员：添加，修改会员信息</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9"><a href="MemEdit.asp?Result=Add" onClick='changeAdminFlag("添加新会员")'>添加新会员</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="MemList.asp" onClick='changeAdminFlag("查看所有会员")'>查看所有会员</a></td>    
  </tr>
</table>
<br>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <form name="editMemForm" method="post" action="MemEdit.asp?Action=SaveEdit&Result=<%=Result%>&ID=<%=ID%>" onSubmit="return CheckMemEdit()">
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id=editProduct idth="100%">

      <tr>
        <td width="160" height="20" align="right">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="20" align="right">登&nbsp;录&nbsp;名：</td>
        <td><input name="MemName" type="text" class="textfield" id="MemName" style="WIDTH: 120;" value="<%=mMemName%>" maxlength="16" <%if Result="Modify" then response.write ("readonly")%>>&nbsp;*&nbsp;3-16位字符，不可修改</td>
      </tr>
      <tr>
        <td height="20" align="right">真实姓名：</td>
        <td><input name="RealName" type="text" class="textfield" id="RealName" style="WIDTH: 120;" value="<%=mRealName%>" maxlength="16"></td>
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
        <td height="20" align="right">性　　别：</td>
        <td><input type="radio" name="sex" value="先生" <%if mSex="先生" then response.write ("checked")%>>&nbsp;先生&nbsp;<input type="radio" name="sex" value="女士" <%if mSex="女士" then response.write ("checked")%>>&nbsp;女士</td>
      </tr>
      <tr>
        <td height="20" align="right">会员组别：</td>
        <td>
		<select name="GroupID" class="textfield"><% call SelectGroup() %>
        </select></td>
      </tr>
      <tr>
        <td height="20" align="right">单位名称：</td>
        <td><input name="Company" type="text" class="textfield" id="Company" style="WIDTH: 240;" value="<%=mCompany%>" maxlength="100"></td>
      </tr>
      <tr>
        <td height="20" align="right">地　　址：</td>
        <td><input name="Address" type="text" class="textfield" id="Address" style="WIDTH: 240;" value="<%=mAddress%>" maxlength="100"></td>
      </tr>
      <tr>
        <td height="20" align="right">邮　　编：</td>
        <td><input name="ZipCode" type="text" class="textfield" id="ZipCode" style="WIDTH: 120;" value="<%=mZipCode%>" maxlength="16"></td>
      </tr>
      <tr>
        <td height="20" align="right">电　　话：</td>
        <td><input name="Telephone" type="text" class="textfield" id="Telephone" style="WIDTH: 240;" value="<%=mTelephone%>" maxlength="50"></td>
      </tr>
      <tr>
        <td height="20" align="right">传　　真：</td>
        <td><input name="Fax" type="text" class="textfield" id="Fax" style="WIDTH: 120;" value="<%=mFax%>" maxlength="16"></td>
      </tr>
      <tr>
        <td height="20" align="right">移动电话：</td>
        <td><input name="Mobile" type="text" class="textfield" id="Mobile" style="WIDTH: 120;" value="<%=mMobile%>" maxlength="16"></td>
      </tr>
      <tr>
        <td height="20" align="right">电子邮箱：</td>
        <td><input name="Email" type="text" class="textfield" id="Email" style="WIDTH: 240;" value="<%=mEmail%>" maxlength="50"></td>
      </tr>
      <tr>
        <td height="20" align="right">网　　址：</td>
        <td><input name="HomePage" type="text" class="textfield" id="HomePage" style="WIDTH: 240;" value="<%=mHomePage%>" maxlength="50"></td>
      </tr>
      <tr>
        <td height="20" align="right">生　　效：</td>
        <td><input name="Working" type="checkbox"  value="1" style="HEIGHT: 13px;WIDTH: 13px;" <%if mWorking then response.write ("checked")%>></td>
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
sub MemEdit()
  dim Action,rs,sql
  Action=request.QueryString("Action")
  if Action="SaveEdit" then '保存编辑管理员信息
    set rs = server.createobject("adodb.recordset")
    if Result="Add" then '创建网站管理员
      if not conn.execute("select MemName from NwebCn_Members where MemName='" & trim(Request.Form("MemName")) & "'").eof then
        response.write "<script language=javascript> alert('" & trim(Request.Form("MemName")) & "此会员名已经存在，请换一个登录名再试试！');history.back(-1);</script>"
        response.end
      end if 
	  sql="select * from NwebCn_Members"
      rs.open sql,conn,1,3
      rs.addnew
      rs("MemName")=trim(Request.Form("MemName"))
      rs("RealName")=StrReplace(trim(Request.Form("RealName")))
      if len(trim(Request.Form("Password")))<6 or len(trim(Request.Form("Password")))>16  then
        response.write "<script language=javascript> alert('会员密码必填，且字符数为6-16位！');history.back(-1);</script>"
        response.end
      end if
	  if Request.Form("Password")<>Request.Form("vPassword") then 
        response.write "<script language=javascript> alert('两次输入的密码不一样！');history.back(-1);</script>"
        response.end
	  end if
	  rs("Password")=Md5(Request.Form("Password"))
	  rs("Sex")=Request.Form("Sex")
      mGroupIdName=split(Request.Form("GroupID"),"┎╂┚")
	  rs("GroupID")=mGroupIdName(0)
	  rs("GroupName")=mGroupIdName(1)
	  rs("Company")=StrReplace(trim(Request.Form("Company")))
	  rs("Address")=StrReplace(trim(Request.Form("Address")))
	  rs("ZipCode")=StrReplace(trim(Request.Form("ZipCode")))
	  rs("Telephone")=StrReplace(trim(Request.Form("Telephone")))
	  rs("Fax")=StrReplace(trim(Request.Form("Fax")))
	  rs("Mobile")=StrReplace(trim(Request.Form("Mobile")))
	  rs("Email")=trim(Request.Form("Email"))
	  rs("HomePage")=StrReplace(trim(Request.Form("HomePage")))
	  if Request.Form("Working")=1 then
        rs("Working")=Request.Form("Working")
	  else
        rs("Working")=0
	  end if
	  rs("AddTime")=now()
	end if  
	if Result="Modify" then '修改网站管理员
      sql="select * from NwebCn_Members where ID="&ID
      rs.open sql,conn,1,3
      rs("MemName")=trim(Request.Form("MemName"))
      rs("RealName")=StrReplace(trim(Request.Form("RealName")))
      if trim(Request.Form("Password"))<>"" then
	    if len(trim(Request.Form("Password")))<6 or len(trim(Request.Form("Password")))>16  then
          response.write "<script language=javascript> alert('会员密码必填，且字符数为6-16位！');history.back(-1);</script>"
          response.end
        end if
	    if Request.Form("Password")<>Request.Form("vPassword") then 
          response.write "<script language=javascript> alert('两次输入的密码不一样！');history.back(-1);</script>"
          response.end
	    end if
	    rs("Password")=Md5(Request.Form("Password"))
	  end if
	  rs("Sex")=Request.Form("Sex")
      mGroupIdName=split(Request.Form("GroupID"),"┎╂┚")
	  rs("GroupID")=mGroupIdName(0)
	  rs("GroupName")=mGroupIdName(1)
	  rs("Company")=StrReplace(trim(Request.Form("Company")))
	  rs("Address")=StrReplace(trim(Request.Form("Address")))
	  rs("ZipCode")=StrReplace(trim(Request.Form("ZipCode")))
	  rs("Telephone")=StrReplace(trim(Request.Form("Telephone")))
	  rs("Fax")=StrReplace(trim(Request.Form("Fax")))
	  rs("Mobile")=StrReplace(trim(Request.Form("Mobile")))
	  rs("Email")=StrReplace(trim(Request.Form("Email")))
	  rs("HomePage")=StrReplace(trim(Request.Form("HomePage")))
	  if Request.Form("Working")=1 then
        rs("Working")=Request.Form("Working")
	  else
        rs("Working")=0
	  end if
	end if
	rs.update
	rs.close
    set rs=nothing 
    response.write "<script language=javascript> alert('成功编辑网站会员！');changeAdminFlag('所有会员');location.replace('MemList.asp');</script>"
  else '提取管理员信息
	if Result="Modify" then
      set rs = server.createobject("adodb.recordset")
      sql="select * from NwebCn_Members where ID="& ID
      rs.open sql,conn,1,1
	  mMemName=rs("MemName")
	  mRealName=rs("RealName")
	  mSex=rs("Sex")
	  mGroupID=rs("GroupID")
	  mGroupName=rs("GroupName")
	  mCompany=rs("Company")
	  mAddress=rs("Address")
	  mZipCode=rs("ZipCode")
	  mTelephone=rs("Telephone")
	  mFax=rs("Fax")
	  mMobile=rs("Mobile")
	  mEmail=rs("Email")
	  mHomepage=rs("Homepage")
	  mWorking=rs("Working")
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
    if mGroupID=rs("GroupID") then response.write ("selected")
    response.write(">"&rs("GroupName")&"</option>")
    rs.movenext
  wend
  rs.close
  set rs=nothing
end sub
%>
