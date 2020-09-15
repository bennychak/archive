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
<%
dim sql,rs,rss,orderID,simage

orderID=Request.QueryString("orderID")

If orderID="" or (not IsNumeric(orderID)) Then response.end

sql="select * from Orders where ID="&orderID&" and UserID="&session("userID")
set rss=conn_access.Execute (sql)

%>



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
              <td height="30" bgcolor="#f7f7f7" class="menu_off" ><table width="100%" border="0">
                <tr>
                  <td>C / I NO.: <%=rss("Code")%></td>
                  <td align="right"><a href="myorders.asp">&lt;&lt;Return</a></td>
                </tr>
              </table></td>
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
              <td width="150" bgcolor="#f7f7f7" class="menu_on">&gt;&gt; Product Image</td>
              <td bgcolor="#f7f7f7" class="menu_on">&gt;&gt; Product Name / NO.</td>
              <td bgcolor="#f7f7f7" class="menu_on">&gt;&gt; Product Parameter</td>
              <td bgcolor="#f7f7f7" class="menu_on">&gt;&gt; Quantity </td>
            </tr>
            <%



sql="select * from OrderProducts,Products where "
sql=sql&"Products.ID=OrderProducts.ProductID and OrderID="&orderID

'response.write sql
'rs.close
'set rs=nothing
set rs=conn_access.Execute (sql)

While(not rs.eof)
simage=rs("Simage")
If isNE(simage) Then simage="snone.gif"
%>
            <tr>
              <td align="center" bgcolor="#FFFFFF"><a href="product_view.asp?id=<%=rs("ProductID")%>" target="_blank" ><img src="<%="../"&productImagePath&simage%>" border="0" ></a></td>
              <td bgcolor="#f7f7f7" class="menu_off"><p><%=rs("Name")%></p>
                  <p><%=rs("NO")%></p></td>
              <td bgcolor="#f7f7f7" class="menu_off"><p class="order_p"><%=rs("Magnetics")%></p>
                  <p class="order_p"><%=rs("Platings")%></p>
                <p class="order_p"><%=rs("Sizes")%></p></td>
              <td bgcolor="#f7f7f7" class="menu_off"><%=rs("Quantity")%></td>
            </tr>
            <%
rs.MoveNext
Wend

%>
            <tr>
              <td height="30" colspan="4" align="right" bgcolor="#f7f7f7">Date: <%=rss("InDate")%> | Amount: <%=rss("Count")%> | Status: <%=orderStatusCN(rss("Status"))%> </td>
            </tr>
          </table>
        </form></td>
      </tr>
    </table>
    </td>
  </tr>
</table>
<%
set rss=nothing
set rs=nothing
%>
<!--#include file="footer.asp"-->
</body>
</html>
