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
<TITLE>编辑招聘</TITLE>
<link rel="stylesheet" href="Images/CssAdmin.css">
<script language="javascript" src="../Script/Admin.js"></script>
</HEAD>
<!--#include file="../Include/Const.asp" -->
<!--#include file="../Include/ConnSiteData.asp" -->
<!--#include file="CheckAdmin.asp"-->
<%
if Instr(session("AdminPurview"),"|62,")=0 then 
  response.write ("<font color='red')>你不具有该管理模块的操作权限，请返回！</font>")
  response.end
end if
'========判断是否具有管理权限
%>
<BODY>
<% 
dim Result
Result=request.QueryString("Result")
dim ID,JobName,ViewFlag,JobAddress,JobNumber,Emolument,StartDate,EndDate,Responsibility,Requirement
dim eEmployer,eContact,eTel,eAddress,ePostCode,eEmail
ID=request.QueryString("ID")
call JobsEdit() 
%>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>招聘信息：添加，修改招聘信相关的内容</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9"><a href="JobsEdit.asp?Result=Add" onClick='changeAdminFlag("添加招聘信息")'>添加招聘信息</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="JobsList.asp" onClick='changeAdminFlag("招聘信息列表")'>查看招聘信息</a></td>
  </tr>
</table>
<br>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <form name="editForm" method="post" action="JobsEdit.asp?Action=SaveEdit&Result=<%=Result%>&ID=<%=ID%>">
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id=editProduct idth="100%">

      <tr>
        <td width="120" height="20" align="right">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="20" align="right">职位名称：</td>
        <td><input name="JobName" type="text" class="textfield" id="JobName" style="WIDTH: 240;" value="<%=JobName%>">&nbsp;发布：<input name="ViewFlag" type="checkbox" style='HEIGHT: 13px;WIDTH: 13px;' value="1" <%if ViewFlag then response.write ("checked")%>>&nbsp;*&nbsp;不少于1个字符</td>
      </tr>
      <tr>
        <td height="20" align="right">工作地区：</td>
        <td><input name="JobAddress" type="text" class="textfield" id="JobAddress" style="WIDTH: 240;" value="<%=JobAddress%>">&nbsp;*</td>
      </tr>
      <tr>
        <td height="20" align="right">招聘人数：</td>
        <td><input name="JobNumber" type="text" class="textfield" id="JobNumber" style="WIDTH: 240" value="<%=JobNumber%>">&nbsp;*&nbsp;人</td>
      </tr>
      <tr>
        <td height="20" align="right">月&nbsp;薪&nbsp;水：</td>
        <td><input name="Emolument" type="text" class="textfield" id="Emolument" style="WIDTH: 240;" value="<%=Emolument%>">&nbsp;*</td>
      </tr>
      <tr>
        <td height="20" align="right">开始日期：</td>
        <td><input name="StartDate" type="text" class="textfield" id="StartDate" style="WIDTH: 240;" value="<% if StartDate="" then response.write now() else response.write (StartDate) end if%>" maxlength="14">&nbsp;*&nbsp;默认为当前时间，可手动输入日期格式</td>
      </tr>
      <tr>
        <td height="20" align="right">结束日期：</td>
        <td><input name="EndDate" type="text" class="textfield" id="EndDate" style="WIDTH: 240;" value="<% if EndDate="" then response.write (DateAdd("m",3,now())) else response.write (EndDate) end if%>" maxlength="14">&nbsp;*&nbsp;默认为3个月，可手动输入日期格式</td>
      </tr>
      <tr>
        <td height="20" align="right" valign="top">工作职责：</td>
        <td><textarea name="Responsibility" rows="8" class="textfield" id="Responsibility" style="WIDTH: 86%;"><%=Responsibility%></textarea></td>
      </tr>
      <tr>
        <td height="20" align="right" valign="top">职位要求：</td>
        <td><textarea name="Requirement" rows="8" class="textfield" id="Requirement" style="WIDTH: 86%;"><%=Requirement%></textarea></td>
      </tr>
      <tr>
        <td height="20" align="right">用人单位：</td>
        <td><input name="eEmployer" type="text" class="textfield" id="eEmployer" style="WIDTH: 300;" value="<%=eEmployer%>"></td>
      </tr>
      <tr>
        <td height="20" align="right">联 系 人：</td>
        <td><input name="eContact" type="text" class="textfield" id="eContact" style="WIDTH: 300;" value="<%=eContact%>"></td>
      </tr>
      <tr>
        <td height="20" align="right">联系电话：</td>
        <td><input name="eTel" type="text" class="textfield" id="eTel" style="WIDTH: 300;" value="<%=eTel%>"></td>
      </tr>
      <tr>
        <td height="20" align="right">联系地址：</td>
        <td><input name="eAddress" type="text" class="textfield" id="eAddress" style="WIDTH: 300;" value="<%=eAddress%>">&nbsp;邮编：<input name="ePostCode" type="text" class="textfield" id="ePostCode" style="WIDTH: 88;" value="<%=ePostCode%>" maxlength="10"></td>
      </tr>
      <tr>
        <td height="20" align="right">联系邮箱：</td>
        <td><input name="eEmail" type="text" class="textfield" id="eEmail" style="WIDTH: 300;" value="<%=eEmail%>"></td>
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
sub JobsEdit()
  dim Action,rsCheckAdd,rs,sql
  Action=request.QueryString("Action")
  if Action="SaveEdit" then '保存编辑管理员信息
    set rs = server.createobject("adodb.recordset")
    if len(trim(request.Form("JobName")))<1 then
      response.write ("<script language=javascript> alert('职位名称为必填项目！');history.back(-1);</script>")
      response.end
    end if
    if len(trim(request.Form("JobAddress")))<1 or len(trim(request.Form("Emolument")))<1 then
      response.write ("<script language=javascript> alert('""工作地点、月薪水""为必填项目！');history.back(-1);</script>")
      response.end
    end if
    if not IsNumeric(trim(request.Form("JobNumber"))) then
      response.write ("<script language=javascript> alert('""职位数量""请输入数字！');history.back(-1);</script>")
      response.end
    end if
    if not (IsDate(trim(request.Form("StartDate"))) or IsDate(trim(request.Form("EndDate")))) then
      response.write ("<script language=javascript> alert('""开始日期、结束日期""为必填项目，且为日期格式！');history.back(-1);</script>")
      response.end
    end if
    if Result="Add" then '创建网站管理员
	  sql="select * from NwebCn_Jobs"
      rs.open sql,conn,1,3
      rs.addnew
      rs("JobName")=trim(Request.Form("JobName"))
	  if Request.Form("ViewFlag")=1 then
        rs("ViewFlag")=Request.Form("ViewFlag")
	  else
        rs("ViewFlag")=0
	  end if
	  rs("JobAddress")=trim(Request.Form("JobAddress"))
	  rs("JobNumber")=trim(Request.Form("JobNumber"))
	  rs("Emolument")=trim(Request.Form("Emolument"))
	  rs("StartDate")=trim(Request.Form("StartDate"))
	  rs("EndDate")=trim(Request.Form("EndDate"))
	  rs("Responsibility")=StrReplace(Request.Form("Responsibility"))
	  rs("Requirement")=StrReplace(Request.Form("Requirement"))
	  rs("AddTime")=now()
	  rs("UpdateTime")=rs("AddTime")
	  rs("eEmployer")=trim(Request.Form("eEmployer"))
	  rs("eContact")=trim(Request.Form("eContact"))
	  rs("eTel")=trim(Request.Form("eTel"))
	  rs("eAddress")=trim(Request.Form("eAddress"))
	  rs("ePostcode")=trim(Request.Form("ePostcode"))
	  rs("eEmail")=trim(Request.Form("eEmail"))
	end if  
	if Result="Modify" then '修改网站管理员
      sql="select * from NwebCn_Jobs where ID="&ID
      rs.open sql,conn,1,3
      rs("JobName")=trim(Request.Form("JobName"))
	  if Request.Form("ViewFlag")=1 then
        rs("ViewFlag")=Request.Form("ViewFlag")
	  else
        rs("ViewFlag")=0
	  end if
	  rs("JobAddress")=trim(Request.Form("JobAddress"))
	  rs("JobNumber")=trim(Request.Form("JobNumber"))
	  rs("Emolument")=trim(Request.Form("Emolument"))
	  rs("StartDate")=trim(Request.Form("StartDate"))
	  rs("EndDate")=trim(Request.Form("EndDate"))
	  rs("Responsibility")=StrReplace(Request.Form("Responsibility"))
	  rs("Requirement")=StrReplace(Request.Form("Requirement"))
	  rs("UpdateTime")=now()
	  rs("eEmployer")=trim(Request.Form("eEmployer"))
	  rs("eContact")=trim(Request.Form("eContact"))
	  rs("eTel")=trim(Request.Form("eTel"))
	  rs("eAddress")=trim(Request.Form("eAddress"))
	  rs("ePostcode")=trim(Request.Form("ePostcode"))
	  rs("eEmail")=trim(Request.Form("eEmail"))
	end if
	rs.update
	rs.close
    set rs=nothing 
    response.write "<script language=javascript> alert('成功编辑招聘信息！');changeAdminFlag('招聘信息列表');location.replace('JobsList.asp');</script>"
  else '提取管理员信息
	if Result="Modify" then
      set rs = server.createobject("adodb.recordset")
      sql="select * from NwebCn_Jobs where ID="& ID
      rs.open sql,conn,1,1
	  JobName=rs("JobName")
	  ViewFlag=rs("ViewFlag")
	  JobAddress=rs("JobAddress")
	  JobNumber=rs("JobNumber")
	  Emolument=rs("Emolument")
	  StartDate=rs("StartDate")	  
	  EndDate=rs("EndDate")
      Responsibility=ReStrReplace(rs("Responsibility"))
	  Requirement=ReStrReplace(rs("Requirement"))
	  eEmployer=rs("eEmployer")
	  eContact=rs("eContact")
	  eTel=rs("eTel")
	  eAddress=rs("eAddress")
	  ePostcode=rs("ePostcode")
	  eEmail=rs("eEmail")
	  rs.close
      set rs=nothing 
	end if
  end if
end sub
%>