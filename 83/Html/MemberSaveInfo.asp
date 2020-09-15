<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% Option Explicit %>
<%Response.Charset="utf-8"%>
<!--#include file="../Include/Const.asp"-->
<!--#include file="../Include/ConnSiteData.asp"-->
<!--#include file="../Include/Md5.asp"-->
<%
dim ID,mRealName,mSex,mPassword,vPassword,mCompany,mAddress,mZipCode,mTelephone,mFax,mMobile,mEmail,mHomePage
dim VerifyCode
dim rs,sql
ID=request.QueryString("ID")
mRealName=trim(request.form("RealName"))
mSex=trim(request.form("Sex"))
mPassword=trim(request.form("Password"))
vPassword=trim(request.form("vPassword"))
mCompany=trim(request.form("Company"))
mAddress=trim(request.form("Address"))
mZipCode=trim(request.form("ZipCode"))
mTelephone=trim(request.form("Telephone"))
mFax=trim(request.form("Fax"))
mMobile=trim(request.form("Mobile"))
mEmail=trim(request.form("Email"))
mHomePage=trim(request.form("HomePage"))
VerifyCode=trim(request.form("VerifyCode"))
dim ErrMessage,ErrMsg(8),FindErr(8),i
  ErrMsg(0)="·设置密码长度应为6-16个任意字符串"
  ErrMsg(1)="·设置密码和确定密码不一致"
  ErrMsg(2)="·单位名称、地址长度不能超过100个字符"
  ErrMsg(3)="·邮编长度不能超过20个字符"
  ErrMsg(4)="·真实姓名、电话、传真、移动电话、网址不能超过50个字符"
  ErrMsg(5)="·电子邮箱格式不正确"
  ErrMsg(6)="·电子邮箱已经被注册过"
  ErrMsg(7)="·验证码错误或已失效"
if len(mPassword)>0 then
   if not (6<=len(mPassword) and len(mPassword)<=16) then FindErr(0)=true
   if mPassword<>vPassword then FindErr(1)=true
end if
if len(mCompany)>100 or len(mAddress)>100 then FindErr(2)=true
if len(mZipCode)>20 then FindErr(3)=true
if len(mRealName)>50 or len(mTelephone)>50 or len(mFax)>50 or len(mMobile)>50 or len(mHomePage)>50 then FindErr(4)=true
if not IsValidEmail(mEmail) then FindErr(5)=true
if not conn.execute("select MemName from NwebCn_Members where ID<>"&ID&" and Email='" & mEmail & "'").eof then FindErr(6)=true
if session("VerifyCode")<>VerifyCode then
  FindErr(7)=true
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
sql="select * from NwebCn_Members where ID="&ID
rs.open sql,conn,1,3
rs("RealName")=StrReplace(mRealName)
rs("Sex")=mSex
if len(mPassword)>0 then rs("Password")=Md5(mPassword)
rs("Company")=StrReplace(mCompany)
rs("Address")=StrReplace(mAddress)
rs("ZipCode")=StrReplace(mZipCode)
rs("Telephone")=StrReplace(mTelephone)
rs("Fax")=StrReplace(mFax)
rs("Mobile")=StrReplace(mMobile)
rs("Email")=mEmail
rs("HomePage")=StrReplace(mHomePage)
rs.update
rs.close
set rs=nothing
WriteMsg("·注册信息修改成功，5秒后自动跳转到用户资料。"&"<meta http-equiv=""REFRESH"" content=""5; url=memberinfo.asp"">")
%>
