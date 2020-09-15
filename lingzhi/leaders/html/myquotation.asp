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
<%call memberIsLogin%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta content="all" name="robots">
<meta name="author" content="amay@amay-jewelry.com,Amay">
<meta name="Copyright" content="AMAY JEWELRY">
<title>AMAY JEWELRY</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<!--#include file="head.asp"-->
<table width="100%" border="0" cellpadding="0" cellspacing="0" id="page_toper">
  <tr>
    <td><table width="100%" height="50" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="250"><img src="images/myorders_title.gif" width="172" height="52"></td>
          <td class="limap"><!--#include file="link_bar.asp"--></td>
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
              <td width="150" height="30" bgcolor="#f7f7f7" class="menu_off" onClick="window.location='mycart.asp'">MY CART </td>
              <td width="150" bgcolor="#f7f7f7" class="menu_off" onClick="window.location='myorders.asp'">MY ORDERS </td>
              <td width="150" bgcolor="#f7f7f7" class="menu_off" onClick="window.location='edit_profile.asp'">MY AMAY </td>
              <td bgcolor="#f7f7f7" class="menu_on" onClick="window.location='myquotation.asp'">MY QUOTATION </td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="1" bgcolor="#cccccc"></td>
      </tr>
      <tr>
        <td bgcolor="#cccccc"><form name="form1" method="post" action="">
            <table width="100%" border="0" cellpadding="5" cellspacing="1">
              <tr>
                <td bgcolor="#f7f7f7" class="menu_on">&gt;&gt;Quotation Name </td>
                <td bgcolor="#f7f7f7" class="menu_on">&gt;&gt; Valid Date </td>
                <td bgcolor="#f7f7f7" class="menu_on">&gt;&gt; Date </td>
                </tr>
                 <%
dim sql,rs

sql="select * from QuotationLevel,Quotation where Quotation.ID=QuotationLevel.QuotationID and Quotation.Status=1 and QuotationLevel.Status=1 and MemberID ="&session("userID")&" order by QuotationID desc"

'response.write sql
'response.end
set rs=conn_access.Execute (sql)
While(not rs.eof)
%>			  
              <tr onClick="window.open('quotation.asp?hash=<%=rs("Hash")%>')">
                <td bgcolor="#f7f7f7" class="menu_off"><%=rs("QName")%></td>
                <td bgcolor="#f7f7f7" class="menu_off"><%=rs("ValidDate")%></td>
                <td bgcolor="#f7f7f7" class="menu_off"><%=rs("InDate")%></td>
                </tr>
                 <%
rs.MoveNext
Wend
set rs=nothing
%>			  
              <tr>
                <td height="30" colspan="3" bgcolor="#f7f7f7">&nbsp;</td>
              </tr>
            </table>
        </form></td>
      </tr>
    </table></td>
  </tr>
</table>
<!--#include file="footer.asp"-->
</body>
</html>
