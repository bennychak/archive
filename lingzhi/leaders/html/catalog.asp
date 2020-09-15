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
            <td bgcolor="#f7f7f7" >
			<b>AMAY JEWELRY CORPORATION</b><br>
			Room 704, 7st Floor, NO.145,DingTou village,Nanshan district,ShenZhen,GuangDong province,China 518000<br>
			Tel: +86 - 755 - 26465791, Fax: +86 - 755 - 26465791<br>
			Contact people: Mr.Kevin Lee<br>
			Email: amay@amay-jewelry.com<br>
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
      <tr>
        <td bgcolor="#cccccc"><form name="form1" method="post" action="operation.asp?action=modifyOrderNumber">
            <table width="100%" border="0" cellpadding="5" cellspacing="1">
              <tr>
                <td width="150" bgcolor="#f7f7f7" class="menu_on">&gt;&gt; Product Image</td>
                <td bgcolor="#f7f7f7" class="menu_on">&gt;&gt; Product Name / Item NO.</td>
                <td bgcolor="#f7f7f7" class="menu_on">&gt;&gt; Description of the goods</td>
                <td bgcolor="#f7f7f7" class="menu_on">&gt;&gt; Quantity </td>
                <td width="110" bgcolor="#f7f7f7" class="menu_on">&gt;&gt; UNIT Price USD</td>
              </tr>
                   <%

while not rs.eof
simage=rs("Simage")
If isNE(simage) Then simage="snone.gif"
%>			  
              <tr>
                <td align="center" bgcolor="#FFFFFF"><a href="product_view.asp?id=<%=rs("ID")%>" target="_blank" ><img src="<%="../"&productImagePath&simage%>" border="0" ></a></td>
                <td bgcolor="#f7f7f7" class="menu_off">
				<p><%=rs("Name")%></p>
				<p><%=rs("NO")%></p>
				</td>
                <td bgcolor="#f7f7f7" >
				<p class="order_p"><b>Material</b>: <%=rs("Material")%></p>
				<p class="order_p">
				<b>Plating</b>: 
				<%
				If isNE(rs("Plating")) Then
				  	response.Write "No plating"
				Else
				 	response.Write rs("Plating")
				End if				
				%>
				</p>
				<p class="order_p"><b>Magnetic</b>: 
				<%

				If isNE(rs("Magnetic")) Then
					response.Write "No magnetic"
				Else
					response.Write rs("Magnetic")									
				End if
				
				%></p>

				<p class="order_p"><b>Size</b>: 
				<%

				If isNE(rs("Size")) Then
					response.Write "As sample"
				Else
					response.Write rs("Size")									
				End if
				
				%></p>

				<p class="order_p"><b>Stone</b>: 
				<%

				If isNE(rs("Stone")) Then
					response.Write "No stone"
				Else
					response.Write rs("Stone")									
				End if
				
				%></p>
				<p class="order_p"><b>Mini QQ</b>: <%=rs("Qqmini")%></p>
				
				</td>
                <td bgcolor="#f7f7f7"></td>
                <td bgcolor="#f7f7f7"></td>
              </tr>
                   <%
rs.movenext
Wend
rs.Close
set rs=nothing
%>			  
              <tr>
                <td height="30" colspan="5" bgcolor="#f7f7f7">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td></td>
                      <td align="right"></td>
                    </tr>
                </table>
				</td>
              </tr>
            </table>
        </form></td>
      </tr>
    </table></td>
  </tr>
</table>
<br>
<!--#include file="footer.asp"-->
</body>
</html>
