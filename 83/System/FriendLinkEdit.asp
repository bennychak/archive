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
<TITLE>编辑友情链接</TITLE>
<link rel="stylesheet" href="Images/CssAdmin.css">
<script language="javascript" src="../Script/Admin.js"></script>
</HEAD>
<!--#include file="../Include/Const.asp" -->
<!--#include file="../Include/ConnSiteData.asp" -->
<!--#include file="CheckAdmin.asp"-->
<%
if Instr(session("AdminPurview"),"|119,")=0 then 
  response.write ("<font color='red')>你不具有该管理模块的操作权限，请返回！</font>")
  response.end
end if
'========判断是否具有管理权限
%>
<BODY>
<% 
dim Result
Result=request.QueryString("Result")
dim ID,LinkName,ViewFlag,LinkType,LinkFace,LinkUrl,Remark
ID=request.QueryString("ID")
call FriendLinkEdit() 
%>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>友情链接：添加，修改友情链接相关的内容</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9"><a href="FriendLinkEdit.asp?Result=Add" onClick='changeAdminFlag("添加友情链接")'>添加友情链接</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="FriendLinkList.asp" onClick='changeAdminFlag("友情链接列表")'>查看友情链接</a></td>
  </tr>
</table>
<br>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <form name="editForm" method="post" action="FriendLinkEdit.asp?Action=SaveEdit&Result=<%=Result%>&ID=<%=ID%>">
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id=editProduct idth="100%">

      <tr>
        <td width="160" height="20" align="right">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="20" align="right">站点名称：</td>
        <td><input name="LinkName" type="text" class="textfield" id="LinkName" style="WIDTH: 240;" value="<%=LinkName%>">&nbsp;*&nbsp;不少于3个字符</td>
      </tr>
      <tr>
        <td height="20" align="right">发　　布：</td>
        <td><input name="ViewFlag" type="checkbox" style='HEIGHT: 13px;WIDTH: 13px;' value="1" <%if ViewFlag then response.write ("checked")%>></td>
      </tr>
      <tr>
        <td height="20" align="right">链接类型：</td>
        <td><input name="LinkType" type="radio" value="1" <%if LinkType then response.write ("checked=checked")%>/>图片&nbsp;<input name="LinkType" type="radio" value="0" <%if not LinkType then response.write ("checked=checked")%>/>文字</td>
      </tr>
      <tr>
        <td height="20" align="right">前台显示：</td>
        <td><input name="LinkFace" type="text" class="textfield" id="LinkFace" style="WIDTH: 240;" value="<%=LinkFace%>">&nbsp;*&nbsp;<a href="javaScript:OpenScript('UpFileForm.asp?Result=LinkFace',460,180)"><img src="Images/Upload.gif" width="30" height="16" border="0" align="absmiddle"></a>&nbsp;&nbsp;图片尺寸、文字长度根据版面而定</td>
      </tr>
      <tr>
        <td height="20" align="right">链接网址：</td>
        <td><input name="LinkUrl" type="text" class="textfield" id="LinkUrl" style="WIDTH: 490;" value="<%=LinkUrl%>">&nbsp;*</td>
      </tr>
      <tr>
        <td height="20" align="right" valign="top">备注说明：
        <td><textarea name="Remark" rows="6" class="textfield" id="Remark" style="WIDTH: 490;"><%=Remark%></textarea></td>
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
sub FriendLinkEdit()
  dim Action,rsCheckAdd,rs,sql
  Action=request.QueryString("Action")
  if Action="SaveEdit" then '保存编辑管理员信息
    set rs = server.createobject("adodb.recordset")
    if len(trim(request.Form("LinkName")))<2 then
      response.write ("<script language=javascript> alert('网站名称为必填项目且不少于2个字符！');history.back(-1);</script>")
      response.end
    end if
    if trim(request.Form("LinkFace"))="" then
      response.write ("<script language=javascript> alert('前台显示为必填项目！');history.back(-1);</script>")
      response.end
    end if
    if request.Form("LinkType")=0 then
      if StrLen(trim(request.Form("LinkFace")))>16 then
      response.write ("<script language=javascript> alert('您选择的""文字""链接，因此前台显示不得超过8个汉字！');history.back(-1);</script>")
      response.end
      end if
    end if
    if len(trim(request.Form("LinkUrl")))<6 then
      response.write ("<script language=javascript> alert('链接网址为必填项目且不少于6个字符！');history.back(-1);</script>")
      response.end
    end if
    if Result="Add" then '创建网站管理员
	  sql="select * from NwebCn_FriendLink"
      rs.open sql,conn,1,3
      rs.addnew
      rs("LinkName")=trim(Request.Form("LinkName"))
	  if Request.Form("ViewFlag")=1 then
        rs("ViewFlag")=Request.Form("ViewFlag")
	  else
        rs("ViewFlag")=0
	  end if
      rs("LinkFace")=trim(Request.Form("LinkFace"))
      rs("LinkUrl")=trim(Request.Form("LinkUrl"))
	  if Request.Form("LinkType")=1 then
        rs("LinkType")=Request.Form("LinkType")
	  else
        rs("LinkType")=0
	  end if	  
	  rs("Remark")=trim(Request.Form("Remark"))
	  rs("AddTime")=now()
	end if  
	if Result="Modify" then '修改网站管理员
      sql="select * from NwebCn_FriendLink where ID="&ID
      rs.open sql,conn,1,3
      rs("LinkName")=trim(Request.Form("LinkName"))
	  if Request.Form("ViewFlag")=1 then
        rs("ViewFlag")=Request.Form("ViewFlag")
	  else
        rs("ViewFlag")=0
	  end if
      rs("LinkFace")=trim(Request.Form("LinkFace"))
      rs("LinkUrl")=trim(Request.Form("LinkUrl"))
	  if Request.Form("LinkType")=1 then
        rs("LinkType")=Request.Form("LinkType")
	  else
        rs("LinkType")=0
	  end if	  
	  rs("Remark")=trim(Request.Form("Remark"))
	end if
	rs.update
	rs.close
    set rs=nothing 
    response.write "<script language=javascript> alert('成功编辑友情链接！');changeAdminFlag('友情链接列表');location.replace('FriendLinkList.asp');</script>"
  else '提取信息
	if Result="Modify" then
      set rs = server.createobject("adodb.recordset")
      sql="select * from NwebCn_FriendLink where ID="& ID
      rs.open sql,conn,1,1
	  LinkName=rs("LinkName")
	  ViewFlag=rs("ViewFlag")
	  LinkType=rs("LinkType")
	  LinkFace=rs("LinkFace")
      LinkUrl=rs("LinkUrl")
      Remark=rs("Remark")
	  rs.close
      set rs=nothing 
	end if
  end if
end sub
%>