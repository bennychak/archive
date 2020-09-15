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
dim mOrderName,mRemark
dim mMemID,mRealName,mSex,mCompany,mAddress,mZipCode,mTelephone,mFax,mMobile,mEmail,VerifyCode
dim rs,sql
mOrderName=trim(request.form("OrderName"))
mRemark="订购如下产品：<br>"&request.form("Products")&"补充说明：<br>"&request.form("Remark")
mMemID=request.QueryString("MemberID")
mRealName=trim(request.form("RealName"))
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
  ErrMsg(0)="·标题必填，长度不能超过100个字符"
  ErrMsg(1)="·姓名必填，长度不能超过50个字符"
  ErrMsg(2)="·单位名称、地址必填，长度为8-100个字符"
  ErrMsg(3)="·邮编必填长度为6-20个字符"
  ErrMsg(4)="·电话必填长度为11-50个字符"
  ErrMsg(5)="·传真、移动电话长度不能超过50个字符"
  ErrMsg(6)="·电子邮箱格式不正确"
  ErrMsg(7)="·验证码错误或已失效"
if len(mOrderName)>100 or len(mOrderName)=0 then
  FindErr(0)=true
end if  
if len(mRealName)>50 or len(mRealName)=0 then
  FindErr(1)=true
end if
if len(mCompany)>100 or len(Address)>100 or len(mCompany)=0 then
  FindErr(2)=true
end if
if len(mZipCode)>20 or len(mZipCode)<6 then
  FindErr(3)=true
end if
if len(mTelephone)>50 or len(mTelephone)<11 then
  FindErr(4)=true
end if
if len(mFax)>50 or len(mMobile)>50 then
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
sql="select * from NwebCn_Order"
rs.open sql,conn,1,3
rs.addnew
rs("OrderName")=StrReplace(mOrderName)
rs("Remark")=StrReplace(mRemark)
rs("MemID")=mMemID
rs("Linkman")=StrReplace(mRealName)
rs("Sex")=mSex
rs("Company")=StrReplace(mCompany)
rs("Address")=StrReplace(mAddress)
rs("ZipCode")=StrReplace(mZipCode)
rs("Telephone")=StrReplace(mTelephone)
rs("Fax")=StrReplace(mFax)
rs("Mobile")=StrReplace(mMobile)
rs("Email")=mEmail
rs("AddTime")=now()
rs.update
rs.close
set rs=nothing
Session("NoList")="" '清空订购车中产品
WriteMsg("·订单提交成功，同时订购车列表已被清空，订单状态查看请进入帐户管理。<br />&nbsp;&nbsp;5秒后自动跳转到网站首页"&"<meta http-equiv=""REFRESH"" content=""5; url=../index.asp"">")
%>