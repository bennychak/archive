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
<!--#include file="../admin/includes/cart.asp"-->
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
          <td width="250"><img src="images/mycart_title.gif" width="172" height="52"></td>
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
            <td width="150" height="30" bgcolor="#f7f7f7" class="menu_on" onClick="window.location='mycart.asp'">MY CART </td>
            <td width="150" bgcolor="#f7f7f7" class="menu_off" onClick="window.location='myorders.asp'">MY ORDERS </td>
            <td width="150" bgcolor="#f7f7f7" class="menu_off" onClick="window.location='edit_profile.asp'">MY AMAY </td>
			<td bgcolor="#f7f7f7" class="menu_off" onClick="window.location='myquotation.asp'">MY QUOTATION </td>
            <td bgcolor="#f7f7f7" class="menu_off">&nbsp;</td>
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
        <td bgcolor="#cccccc"><form name="form1" method="post" action="operation.asp?action=modifyOrderNumber">
            <table width="100%" border="0" cellpadding="5" cellspacing="1">
              <tr>
                <td width="150" bgcolor="#f7f7f7" class="menu_on">&gt;&gt; Product Image</td>
                <td bgcolor="#f7f7f7" class="menu_on">&gt;&gt; Product Name / Item NO.</td>
                <td bgcolor="#f7f7f7" class="menu_on">&gt;&gt; Product Description</td>
                <td width="80" bgcolor="#f7f7f7" class="menu_on">&gt;&gt; Quantity </td>
                <td width="80" bgcolor="#f7f7f7" class="menu_on">&gt;&gt; Operation </td>
              </tr>
                   <%
dim sql,rs,i
dim cartKit,itemList,itemArray
set cartKit=new Cart

'cartKit.listItem()
'response.End()
'cartKit.delAllItem()

itemArray=cartKit.getKey()
dim orderPara,simage,formatItem

'产品ID|有没有磁性|有没有电镀|大小
For i=0 to ubound(itemArray)
formatItem=Server.URLEncode(itemArray(i))
orderPara=split(itemArray(i),"|")
sql="select ID,[NO],Name,Simage from Products where ID in ("&orderPara(0)&")"
set rs=conn_access.Execute (sql)
simage=rs("Simage")
If isNE(simage) Then simage="snone.gif"

%>			  
              <tr>
                <td align="center" bgcolor="#FFFFFF"><a href="product_view.asp?id=<%=rs("ID")%>" target="_blank" ><img src="<%="../"&productImagePath&simage%>" border="0" ></a></td>
                <td bgcolor="#f7f7f7" class="menu_off">
				<p><%=rs("Name")%></p>
				<p><%=rs("NO")%></p>
				</td>
                <td bgcolor="#f7f7f7" class="menu_off">
				<p class="order_p"><%=orderPara(3)%></p>
				<p class="order_p"><%=orderPara(1)%></p>
				<p class="order_p"><%=orderPara(2)%></p>
				</td>
                <td bgcolor="#f7f7f7" class="menu_off">
				<input name="itemNumberList" type="text" id="itemNumberList" size="10" value="<%=cartKit.getItemNumber(itemArray(i))%>">
                  <input type="hidden" name="itemIDList" id="itemIDList" value="<%=itemArray(i)%>">
				  </td>
                <td bgcolor="#f7f7f7" class="menu_off"><a href="operation.asp?action=delOrderProduct&delOrderProductID=<%=formatItem%>">Delete</a></td>
              </tr>
                   <%
rs.Close
Next
set rs=nothing
set cartKit=nothing
%>			  
              <tr>
                <td height="30" colspan="5" bgcolor="#f7f7f7"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td>* Please the confirmation an information for filling whether exactitude</td>
                      <td align="right"><input type="button" name="Submit" value="Inquire Now" onClick="location='operation.asp?action=inquireNow'">
                        <input type="submit" name="Submit2" value="Modify">
                        <input name="continue" type="button" id="continue" value="Continue Shopping" onClick="javascript:history.back()"></td>
                    </tr>
                </table></td>
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
