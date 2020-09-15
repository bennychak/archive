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
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8" />
<META NAME="copyright" CONTENT="Copyright 2004-2008 - NWEB.CN-STUDIO" />
<META NAME="Author" CONTENT="万博网络技术工作室,www.Nweb.cn" />
<META NAME="Keywords" CONTENT="" />
<META NAME="Description" CONTENT="" />
<TITLE>查看、修改、回复人才信息</TITLE>
<link rel="stylesheet" href="Images/CssAdmin.css">
<script language="javascript" src="../Script/Admin.js"></script>
</HEAD>
<!--#include file="../Include/Const.asp" -->
<!--#include file="../Include/ConnSiteData.asp" -->
<!--#include file="CheckAdmin.asp"-->
<%
if Instr(session("AdminPurview"),"|96,")=0 then 
  response.write ("<font color='red')>你不具有该管理模块的操作权限，请返回！</font>")
  response.end
end if
'========判断是否具有管理权限
%>
<BODY>
<% 
dim Result
Result=request.QueryString("Result")
dim ReplyContent,ReplyTime,ID,JobID,TalentsName
dim mLinkman,mBirthDate,mStature,mMarriage,mRegResidence,mEduResume,mJobResume,mAddress,mZipCode,mTelephone,mMobile,mEmail,AddTime
ID=request.QueryString("ID")
call TalentsEdit() 
%>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>人才信息：查看，回复，删除人才信息相关的内容</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9"><a href="TalentsList.asp" onClick='changeAdminFlag("人才信息列表")'>查看人才信息</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="SetSite.asp" target="mainFrame" onClick='changeAdminFlag("网站信息设置")'>网站信息设置</a></td>
  </tr>
</table>
<br>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <form name="editForm" method="post" action="TalentsEdit.asp?Action=SaveEdit&Result=<%=Result%>&ID=<%=ID%>">
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id=editProduct idth="100%">

      <tr>
        <td width="100" height="20" align="right">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="20" align="right">应聘职位：</td>
        <td><input name="TalentsName" type="text" class="textfield" id="TalentsName" style="WIDTH: 240;" value="<%=TalentsName%>" readonly>&nbsp;<a href=JobsEdit.asp?Result=Modify&ID=<%=JobID%> target="mainFrame" onClick='changeAdminFlag("查看招聘信息")'>查看招聘</a></td>
      </tr>
      <tr>
        <td height="20" align="right">应&nbsp;聘&nbsp;者：</td>
        <td><%=mLinkman%></td>
      </tr>
      <tr>
        <td height="20" align="right">出生日期：</td>
        <td><input name="BirthDate" type="text" class="textfield" id="BirthDate" style="WIDTH: 240;" value="<%=mBirthDate%>" readonly></td>
      </tr>
      <tr>
        <td height="20" align="right">身　　高：</td>
        <td><input name="Stature" type="text" class="textfield" id="Stature" style="WIDTH: 240;" value="<%=mStature%>" readonly></td>
      </tr>
      <tr>
        <td height="20" align="right">婚姻状况：</td>
        <td><input name="Marriage" type="text" class="textfield" id="Marriage" style="WIDTH: 240;" value="<%=mMarriage%>" readonly></td>
      </tr>
      <tr>
        <td height="20" align="right">户口地址：</td>
        <td><input name="RegResidence" type="text" class="textfield" id="RegResidence" style="WIDTH: 240;" value="<%=mRegResidence%>" readonly></td>
      </tr>
      <tr>
        <td height="20" align="right" valign="top">教育经历：</td>
        <td><textarea name="EduResume" rows="10" class="textfield" id="EduResume" style="WIDTH: 620;" readonly><%=mEduResume%></textarea></td>
      </tr>
      <tr>
        <td height="20" align="right" valign="top">工作经历：</td>
        <td><textarea name="JobResume" rows="10" class="textfield" id="JobResume" style="WIDTH: 620;" readonly><%=mJobResume%></textarea></td>
      </tr>
      <tr>
        <td height="20" align="right">通信地址：</td>
        <td><input name="Address" type="text" class="textfield" id="Address" style="WIDTH: 240;" value="<%=mAddress%>" readonly></td>
      </tr>
      <tr>
        <td height="20" align="right">邮　　编：</td>
        <td><input name="ZipCode" type="text" class="textfield" id="ZipCode" style="WIDTH: 120" value="<%=mZipCode%>" readonly></td>
      </tr>
      <tr>
        <td height="20" align="right">电　　话：</td>
        <td><input name="Telephone" type="text" class="textfield" id="Telephone" style="WIDTH: 240;" value="<%=mTelephone%>" readonly></td>
      </tr>
      <tr>
        <td height="20" align="right">移动电话：</td>
        <td><input name="Mobile" type="text" class="textfield" id="Mobile" style="WIDTH: 120" value="<%=mMobile%>" readonly></td>
      </tr>
      <tr>
        <td height="20" align="right">电子邮箱：</td>
        <td><input name="Email" type="text" class="textfield" id="Email" style="WIDTH: 240" value="<%=mEmail%>" readonly></td>
      </tr>
      <tr>
        <td height="20" align="right">提交时间：</td>
        <td><input name="AddTime" type="text" class="textfield" id="AddTime" style="WIDTH: 240" value="<%=AddTime%>" readonly></td>
      </tr>
      <tr>
        <td height="20" align="right">回复时间：</td>
        <td><input name="ReplyTime" type="text" class="textfield" id="ReplyTime" style="WIDTH: 240" value="<%=ReplyTime%>" readonly></td>
      </tr>
      <tr>
        <td height="20" align="right" valign="top">回复内容：</td>
        <td><textarea name="ReplyContent" rows="6" class="textfield" id="ReplyContent" style="WIDTH: 620;"><%=ReplyContent%></textarea></td>
      </tr>
      <tr>
        <td height="30" align="right">&nbsp;</td>
        <td valign="bottom"><input name="submitSaveEdit" type="submit" class="button"  id="submitSaveEdit" value="保存" style="WIDTH: 80;" ></td>
      </tr>
      <tr>
        <td height="20" align="right">&nbsp;</td>
        <td valign="bottom"></td>
      </tr>
    </table></td>
  </tr>
  </form>
</table>
</BODY>
</HTML>
<%
sub TalentsEdit()
  dim Action,rsCheckAdd,rs,sql
  Action=request.QueryString("Action")
  if Action="SaveEdit" then '保存编辑人才信息
    set rs = server.createobject("adodb.recordset")
	if Result="Modify" then '修改人才信息
      sql="select * from NwebCn_Talents where ID="&ID
      rs.open sql,conn,1,3
	  rs("ReplyContent")=StrReplace(Request.Form("ReplyContent"))
	  if not (trim(request.Form("ReplyContent"))="" or trim(request.Form("ReplyTime"))<>"") then
	    rs("ReplyTime")=now()
      end if
	end if
	rs.update
	rs.close
    set rs=nothing 
    response.write "<script language=javascript> alert('成功编辑、回复人才信息！');changeAdminFlag('人才信息列表');location.replace('TalentsList.asp');</script>"
  else '提取信息
	if Result="Modify" then
      set rs = server.createobject("adodb.recordset")
      sql="select * from NwebCn_Talents where ID="& ID
      rs.open sql,conn,1,1
	  JobID=rs("JobID")
	  TalentsName=rs("TalentsName")
	  mLinkman=GuestInfo(rs("MemID"),rs("Linkman"),rs("Sex"))
	  mBirthDate=rs("BirthDate")
	  mStature=rs("Stature")
	  mMarriage=rs("Marriage")
	  mRegResidence=rs("RegResidence")
	  mEduResume=ReStrReplace(rs("EduResume"))
	  mJobResume=ReStrReplace(rs("JobResume"))
	  mAddress=rs("Address")
	  mZipCode=rs("ZipCode")
	  mTelephone=rs("Telephone")
	  mMobile=rs("Mobile")
	  mEmail=rs("Email")
	  AddTime=rs("AddTime")
	  ReplyContent=ReStrReplace(rs("ReplyContent"))
	  ReplyTime=rs("ReplyTime")
	  rs.close
      set rs=nothing 
	end if
  end if
end sub

function GuestInfo(ID,Guest,Sex)
  Dim rs,sql
  Set rs=server.CreateObject("adodb.recordset")
  sql="Select * From NwebCn_Members where ID="&ID
  rs.open sql,conn,1,1
  if rs.eof then
    GuestInfo=Guest & "&nbsp;" & Sex
  else
    GuestInfo="<font color='green'>会员&nbsp;</font><a href='MemEdit.asp?Result=Modify&ID="&ID&"' onClick='changeAdminFlag(""前台会员资料"")'>"&Guest&"</a>"&Sex
  end if
  rs.close
  set rs=nothing
end function 
%>