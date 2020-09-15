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
dim JobID,TalentsName,BirthDate,Stature,Marriage,RegResidence,EduResume,JobResume
dim mMemID,mLinkman,mSex,mAddress,mZipCode,mTelephone,mMobile,mEmail,VerifyCode

JobID=request.QueryString("JobID")
TalentsName=trim(request.form("TalentsName"))
BirthDate=trim(request.form("BirthDate"))
Stature=trim(request.form("Stature"))
Marriage=trim(request.form("Marriage"))
RegResidence=trim(request.form("RegResidence"))
EduResume=trim(request.form("EduResume"))
JobResume=trim(request.form("JobResume"))
mMemID=request.QueryString("MemberID")
mLinkman=trim(request.form("Linkman"))
mSex=trim(request.form("Sex"))
mAddress=trim(request.form("Address"))
mZipCode=trim(request.form("ZipCode"))
mTelephone=trim(request.form("Telephone"))
mMobile=trim(request.form("Mobile"))
mEmail=trim(request.form("Email"))
VerifyCode=trim(request.form("VerifyCode"))
dim ErrMessage,ErrMsg(13),FindErr(13),i
  ErrMsg(0)="·申请职位必填，长度不能超过100个字符"
  ErrMsg(1)="·出生日期格式不正确"
  ErrMsg(2)="·身高栏请填写数字"
  ErrMsg(3)="·户口所在地必填，长度为不得多于100个字符"
  ErrMsg(4)="·教育经历必填"
  ErrMsg(5)="·工作经历必填"
  ErrMsg(6)="·姓名必填，长度不得超过50个字符"
  ErrMsg(7)="·地址必填，长度不得超过100个字符"
  ErrMsg(8)="·邮编必填长度为6-20个字符"
  ErrMsg(9)="·电话长度不得超过50个字符"
  ErrMsg(10)="·移动电话必填，长度为11-50个字符"
  ErrMsg(11)="·电子邮箱格式不正确"
  ErrMsg(12)="·验证码错误或已失效"
if len(TalentsName)>100 or len(TalentsName)=0 then
  FindErr(0)=true
end if  
if not IsDate(BirthDate) then
  FindErr(1)=true
end if  
if not IsNumeric(Stature) then
  FindErr(2)=true
end if  
if len(RegResidence)>100 or len(RegResidence)=0 then
  FindErr(3)=true
end if  
if len(EduResume)=0 then
  FindErr(4)=true
end if  
if len(JobResume)=0 then
  FindErr(5)=true
end if  
if len(mLinkman)>50 or len(mLinkman)=0 then
  FindErr(6)=true
end if
if len(mAddress)>100 or len(mAddress)=0 then
  FindErr(7)=true
end if
if len(mZipCode)>20 or len(mZipCode)<6 then
  FindErr(8)=true
end if
if len(mTelephone)>50 then
  FindErr(9)=true
end if
if len(mMobile)>50 or len(mMobile)<11 then
  FindErr(10)=true
end if
if not IsValidEmail(mEmail) then
  FindErr(11)=true
end if
if session("VerifyCode")<>VerifyCode then
  FindErr(12)=true
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
sql="select * from NwebCn_Talents"
rs.open sql,conn,1,3
rs.addnew
rs("JobID")=JobID
rs("TalentsName")=StrReplace(TalentsName)
rs("BirthDate")=BirthDate
rs("Stature")=Stature
rs("Marriage")=Marriage
rs("RegResidence")=StrReplace(RegResidence)
rs("EduResume")=StrReplace(EduResume)
rs("JobResume")=StrReplace(JobResume)
rs("MemID")=mMemID
rs("Linkman")=StrReplace(mLinkman)
rs("Sex")=mSex
rs("Address")=StrReplace(mAddress)
rs("ZipCode")=StrReplace(mZipCode)
rs("Telephone")=StrReplace(mTelephone)
rs("Mobile")=StrReplace(mMobile)
rs("Email")=mEmail
rs("AddTime")=now()
rs.update
rs.close
set rs=nothing
conn.execute "UPDATE NwebCn_Jobs SET TalentsNumber = TalentsNumber+1 WHERE ID="&JobID
WriteMsg("·简历提交成功，进入帐户管理可查看提交的简历资料和管理员回复内容。<br />　5秒后自动跳转到帐户管理。"&"<meta http-equiv=""REFRESH"" content=""5; url=MemberCenter.asp"">")
%>
