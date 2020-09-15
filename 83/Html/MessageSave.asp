<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% Option Explicit %>
<%Response.Charset="utf-8"%>
<!--#include file="../Include/Const.asp"-->
<!--#include file="../Include/ConnSiteData.asp"-->
<%
if DateDiff("s",session("time"),now())<5 then  
   WriteMsg("·错误：不能在5秒内重新打开此页。")
   response.end
else  
   session("time")=now()
end if
dim rs,sql
dim MesName,Content,SecretFlag,mMemID,mLinkman,mSex,mCompany,mAddress,mZipCode,mTelephone,mFax,mMobile,mEmail,VerifyCode
MesName=trim(request.form("MesName"))
Content=trim(request.form("Content"))
if trim(request.form("SecretFlag"))="1" then
  SecretFlag=1
else
  SecretFlag=0
end if
mMemID=request.QueryString("MemberID")
mLinkman=trim(request.form("Linkman"))
mSex=trim(request.form("Sex"))
mCompany=trim(request.form("Company"))
mAddress=trim(request.form("Address"))
mZipCode=trim(request.form("ZipCode"))
mTelephone=trim(request.form("Telephone"))
mFax=trim(request.form("Fax"))
mMobile=trim(request.form("Mobile"))
mEmail=trim(request.form("Email"))
VerifyCode=trim(request.form("VerifyCode"))
dim ErrMessage,ErrMsg(8),FindErr(8),i
  ErrMsg(0)="·留言主题必填，长度不能超过100个字符"
  ErrMsg(1)="·留言内容必填，长度不能少于10个字符"
  ErrMsg(2)="·留言人必填，长度不能超过50个字符"
  ErrMsg(3)="·单位名称、地址必填，长度不能超过100个字符"
  ErrMsg(4)="·邮编长度不能超过20个字符"
  ErrMsg(5)="·电话、传真、移动电话长度不能超过50个字符"
  ErrMsg(6)="·电子邮箱格式不正确"
  ErrMsg(7)="·验证码错误或已失效"
if len(MesName)>100 or len(MesName)=0 then
  FindErr(0)=true
end if  
if len(Content)<10 then
  FindErr(1)=true
end if  
if len(mLinkman)>50 or len(mLinkman)=0 then
  FindErr(2)=true
end if
if len(mCompany)>100 or len(mAddress)>100 then
  FindErr(3)=true
end if
if len(mZipCode)>20 then
  FindErr(4)=true
end if
if len(mTelephone)>50 or len(mFax)>50 or len(mMobile)>50 then
  FindErr(5)=true
end if
if not IsValidEmail(mEmail) then
  FindErr(6)=true
end if
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
sql="select * from NwebCn_Message"
rs.open sql,conn,1,3
rs.addnew
rs("MesName")=StrReplace(MesName)
rs("Content")=StrReplace(Content)
rs("MemID")=mMemID
rs("Linkman")=StrReplace(mLinkman)
rs("Sex")=mSex
rs("Company")=StrReplace(mCompany)
rs("Address")=StrReplace(mAddress)
rs("ZipCode")=StrReplace(mZipCode)
rs("Telephone")=StrReplace(mTelephone)
rs("Fax")=StrReplace(mFax)
rs("Mobile")=StrReplace(mMobile)
rs("Email")=mEmail
rs("SecretFlag")=SecretFlag
rs("AddTime")=now()
rs.update
rs.close
set rs=nothing
WriteMsg("·留言提交成功，如果您的留言未显示出来说明我们在网站后台设置了人工审核。<br />　5秒后自动跳转到留言簿。"&"<meta http-equiv=""REFRESH"" content=""5; url=messagelist.asp"">")
%>