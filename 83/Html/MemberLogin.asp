<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% Option Explicit %>
<%Response.Charset="utf-8"%>
<!--#include file="../Include/Const.asp"-->
<!--#include file="../Include/ConnSiteData.asp"-->
<!--#include file="../Include/Md5.asp"-->
<%
if request.QueryString("Action")="Out" then
   session.contents.remove "MemName"
   session.contents.remove "GroupID"
   session.contents.remove "GroupLevel"
   session.contents.remove "MemLogin"
   response.redirect Cstr(request.ServerVariables("HTTP_REFERER"))
   response.end
end if

Public ErrMsg(3)
   ErrMsg(0)="·登录名不正确，请返回。"
   ErrMsg(1)="·登录密码不正确，请返回。"
   ErrMsg(2)="·帐号非使用状态，请返回。"

dim LoginName,LoginPassword,VerifyCode,MemName,Password,GroupID,GroupName,Working,rs,sql
LoginName=trim(request.form("LoginName"))
LoginPassword=Md5(request.form("LoginPassword"))
set rs = server.createobject("adodb.recordset")
sql="select * from NwebCn_Members where MemName='"&LoginName&"'"
rs.open sql,conn,1,3
if rs.bof and rs.eof then
   WriteMsg(ErrMsg(0))
   response.end
else
   MemName=rs("MemName")
   Password=rs("Password")
   GroupID=rs("GroupID")
   GroupName=rs("GroupName")
   Working=rs("Working")
end if

if LoginPassword<>Password then
   WriteMsg(ErrMsg(1))
   response.end
end if 

if not Working then
   WriteMsg(ErrMsg(2))
   response.end
end if 
 
if UCase(LoginName)=UCase(MemName) and LoginPassword=Password then
   rs("LastLoginTime")=now()
   rs("LastLoginIP")=Request.ServerVariables("Remote_Addr")
   rs("LoginTimes")=rs("LoginTimes")+1
   rs.update
   rs.close
   set rs=nothing
   session("MemName")=MemName
   session("GroupID")=GroupID
   '===========
   set rs = server.createobject("adodb.recordset")
   sql="select * from NwebCn_MemGroup where GroupID='"&GroupID&"'"
   rs.open sql,conn,1,1
   session("GroupLevel")=rs("GroupLevel")
   rs.close
   set rs=nothing
  '===========
   session("MemLogin")="Succeed"
   session.timeout=60
   response.redirect Cstr(request.ServerVariables("HTTP_REFERER"))
   response.end
end if
%>