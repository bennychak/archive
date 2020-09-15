<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% Option Explicit %>
<%Response.Charset="utf-8"%>
<!--#include file="../Include/Const.asp"-->
<!--#include file="../Include/ConnSiteData.asp"-->
<!--#include file="../Include/Md5.asp"-->
<%
if DateDiff("s",session("time"),now())<5 then  
   WriteMsg("·错误：不能在5秒内重新打开此页。")
   response.end
else  
   session("time")=now()
end if
dim mMemName,mRealName,mSex,mPassword,mQuestion,mAnswer,mCompany,mAddress,mZipCode,mTelephone,mFax,mMobile,mEmail,mHomePage
dim vPassword,VerifyCode
dim rs,sql
mMemName=trim(request.form("MemName"))
mRealName=trim(request.form("RealName"))
mSex=trim(request.form("Sex"))
mPassword=trim(request.form("Password"))
vPassword=trim(request.form("vPassword"))
mQuestion=trim(request.form("Question"))
mAnswer=trim(request.form("Answer"))
mCompany=trim(request.form("Company"))
mAddress=trim(request.form("Address"))
mZipCode=trim(request.form("ZipCode"))
mTelephone=trim(request.form("Telephone"))
mFax=trim(request.form("Fax"))
mMobile=trim(request.form("Mobile"))
mEmail=trim(request.form("Email"))
mHomePage=trim(request.form("HomePage"))
VerifyCode=trim(request.form("VerifyCode"))
dim ErrMessage,ErrMsg(12),FindErr(12),i
  ErrMsg(0)="·登录名错误，由0-9,a-z,-_任意组合3-16个的字符串"
  ErrMsg(1)="·登录名重复，请换一个试试"
  ErrMsg(2)="·设置密码长度应为6-16个任意字符串"
  ErrMsg(3)="·设置密码和确定密码不一致"
  ErrMsg(4)="·密码提示问题长度应为3-100个任意字符串"
  ErrMsg(5)="·密码提示答案长度应为3-100个任意字符串"
  ErrMsg(6)="·单位名称、地址长度不能超过100个字符"
  ErrMsg(7)="·邮编长度不能超过20个字符"
  ErrMsg(8)="·真实姓名、电话、传真、移动电话、网址不能超过50个字符"
  ErrMsg(9)="·电子邮箱格式不正确"
  ErrMsg(10)="·电子邮箱已经被注册过"
  ErrMsg(11)="·验证码错误或已失效"
if not IsValidMemName(mMemName) then FindErr(0)=true
if not conn.execute("select MemName from NwebCn_Members where MemName='" & mMemName & "'").eof then FindErr(1)=true
if not (6<=len(mPassword) and len(mPassword)<=16) then FindErr(2)=true
if mPassword<>vPassword then FindErr(3)=true
if not (3<=len(mQuestion) and len(mQuestion)<=100) then FindErr(4)=true
if not (3<=len(mAnswer) and len(mAnswer)<=100) then FindErr(5)=true
if len(mCompany)>100 or len(mAddress)>100 then FindErr(6)=true
if len(mZipCode)>20 then FindErr(7)=true
if len(mRealName)>50 or len(mTelephone)>50 or len(mFax)>50 or len(mMobile)>50 or len(mHomePage)>50 then FindErr(8)=true
if not IsValidEmail(mEmail) then FindErr(9)=true
if not conn.execute("select MemName from NwebCn_Members where Email='" & Email & "'").eof then FindErr(10)=true
if session("VerifyCode")<>VerifyCode then
  FindErr(11)=true
else
  session("VerifyCode")=""
end if
for i = 0 to UBound(FindErr)
  if FindErr(i)=true then
    ErrMessage=ErrMessage+ErrMsg(i)+"<br>"
  end if
next
if not (ErrMessage="" or isnull(ErrMessage)) then
  WriteMsg(ErrMessage)
  response.end
end if
set rs = server.createobject("adodb.recordset")
sql="select * from NwebCn_Members"
rs.open sql,conn,1,3
rs.addnew
rs("MemName")=mMemName
rs("RealName")=StrReplace(mRealName)
rs("Sex")=mSex
rs("Password")=Md5(mPassword)
rs("Question")=StrReplace(mQuestion)
rs("Answer")=Md5(mAnswer)
rs("Company")=StrReplace(mCompany)
rs("Address")=StrReplace(mAddress)
rs("ZipCode")=StrReplace(mZipCode)
rs("Telephone")=StrReplace(mTelephone)
rs("Fax")=StrReplace(mFax)
rs("Mobile")=StrReplace(mMobile)
rs("Email")=mEmail
rs("HomePage")=StrReplace(mHomePage)
rs("GroupID")="200709088888888888"
rs("GroupName")=GroupName("200709088888888888")
rs("AddTime")=now()
rs.update
rs.close
set rs=nothing
WriteMsg("·注册成功，5秒后自动跳转到帐户中心。"&"<meta http-equiv=""REFRESH"" content=""5; url=MemberCenter.asp"">")
  
function GroupName(GroupID)
  dim rs,sql
  set rs = server.createobject("adodb.recordset")
  sql="select * from NwebCn_MemGroup where GroupID='"&GroupID&"'"
  rs.open sql,conn,1,1
  GroupName=rs("GroupName")
  rs.close
  set rs=nothing
end function
%>