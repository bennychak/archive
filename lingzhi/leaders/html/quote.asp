<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
'┎────────────────────────────┒
'┃　　　　 ※EASY CMS企业网站管理系统V1.0 final   　　　　┃
'┣━━━━━━┯━━━━━━━━━━━━━━━━━━━━━┫
'┃　作    者　│陈文杰　　　　　　　　　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　最后修改　│2004年12月26日10:51:59　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　        　│EMAIL:chenwenj@gmail.com　　　　　　　　　┃
'┃　联系方式　│MSN  :oking@live.com  　　　　　　　　　　┃
'┃　　　　　　│QQ   :168909　ICQ:45318946　　　　　　　　┃
'┃　　　　　　│http://kingchan.net       　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　　　　　　│　　　　　　　　　　　　　　　　　　　　　┃
'┃　记    事　│　　　　　　　　　　　　　　　　　　　　　┃
'┃　　　　　　│　　　　　　　　　　　　　　　　　　　　　┃
'┣━━━━━━┷━━━━━━━━━━━━━━━━━━━━━┫
'┃南京江东北路联通新时空大厦网管中心2004年12月27日10:24:11┃
'┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
%>
<!--#include file="../admin/includes/config.asp"-->
<%
dim sql,rs,noList,simage
noList="SB-135S,SB-121SM,SB-119SG,SB-038GM,SB-001S,SN-001,SN-002"

sql="select top 20 * from Products "

set rs=conn_access.Execute (sql)
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta content="all" name="robots">
<meta name="author" content="amay@amay-jewelry.com,Amay">
<meta name="Copyright" content="AMAY JEWELRY">
<title>AMAY JEWELRY</title>
<link href="css/style.css" rel="stylesheet" type="text/css"></head>
<body>
<!--#include file="head.asp"-->
<table width="100%" border="0" cellpadding="0" cellspacing="0" id="page_toper">
  <tr>
    <td><table width="100%" height="50" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="250"><img src="images/quotation_title.gif" width="220" height="52"></td>
          <td class="limap"></td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="100%" height="100%" cellpadding="0" cellspacing="0">
  <tr>
    <td align="left" valign="top" style="padding:10px 0 0 20px  "><table width="90%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="5" bgcolor="#CC0066"></td>
      </tr>
      <tr>
        <td bgcolor="#cccccc"><table width="100%" border="0" cellpadding="5" cellspacing="1">
          <tr>
            <td bgcolor="#f7f7f7" ><p><strong>Please select the quotation</strong></p>
            
<%
dim gi,gj,gk,categoryRs,categoryPageURL
dim level_1,level_2,level_3
categoryPageURL="products.asp"
set categoryRs=server.createobject("ADODB.Recordset")
%>

<%
sql="select ID,Name from Category where ParentID=0"
categoryRs.open sql,conn_access,1,1
If not (categoryRs.bof and categoryRs.eof) Then
	level_1=categoryRs.GetRows()
	categoryRs.Close
	For gi=0 to ubound(level_1,2)
%>              
<br><b><%=level_1(1,gi)%> Quotation</b><br>
<%
		sql="select ID,Name from Category where ParentID="&level_1(0,gi)
		categoryRs.open sql,conn_access,1,1
		If not (categoryRs.bof and categoryRs.eof) Then
			level_2=categoryRs.GetRows()
			categoryRs.Close
			For gj=0 to ubound(level_2,2)
%>			  
&nbsp;&nbsp;<a href="quotation.asp?hash=4f53a75c6df2415e&categoryKey=<%=level_2(0,gj)%>" target="_blank"><%=level_1(1,gi)%>&nbsp;<%=level_2(1,gj)%></a><br>
<%
			Next
		Else
			categoryRs.Close
		End if
%>

<%
	Next
Else
	categoryRs.Close
End if

set categoryRs=nothing

%>
			  
			</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="1" bgcolor="#cccccc"></td>
      </tr>
    </table></td>
  </tr>
</table>
<br>
<!--#include file="footer.asp"-->
</body>
</html>
