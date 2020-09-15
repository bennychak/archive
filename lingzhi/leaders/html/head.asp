<script src="http://www.google-analytics.com/urchin.js" type="text/javascript">
</script>
<script type="text/javascript">
_uacct = "UA-97989-5";
urchinTracker();
</script>

<table width="100%" height="80" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="160" align="center"><img src="images/logo.gif" width="65" height="65"></td>
  <td height="39" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" >
    <tr>
      <td background="images/top_menu_back.gif"><table border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td><img src="images/top_menu_back0.gif" width="51" height="39" /></td>
          <td width="60" align="center"><a href="default.asp"><img src="images/menu_home.gif" width="38" height="38" border="0"></a></td>
          <td width="110" align="center"><a href="about_us.asp"><img src="images/menu_about_us.gif" width="66" height="38" border="0" /></a></td>
          <td width="110" align="center"><a href="contact_us.asp"><img src="images/menu_contact_us.gif" width="83" height="38" border="0" /></a></td>
          <td width="110" align="center"><a href="products.asp?isNew=1"><img src="images/menu_whatsnew.gif" width="89" height="38" border="0" /></a></td>
		  <td width="110" align="center"><a href="products.asp"><img src="images/menu_products.gif" width="71" height="38" border="0" /></a></td>
          <td width="130" align="center"><a href="product_order.asp"><img src="images/menu_product_order.gif" width="108" height="38" border="0" /></a></td>
          <td width="50" align="center"><a href="why_choose.asp"><img src="images/menu_faq.gif" width="27" height="38" border="0"></a></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td height="50" align="right" valign="middle"><form name="form1" method="post" action="products.asp">
        <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="250" align="left"><img src="images/logo_text.gif" /></td>
            <td width="250" align="right"><table border="0" cellpadding="0" cellspacing="0" id="index_top_text_menu">
              <tr align="center">
                <td><a href="register.asp">JOIN US </a> </td>
                <td><img src="images/top_menu_bar.gif" width="15" height="17" /></td>
                <td>SEARCH</td>
              </tr>
            </table></td>
            <td width="120" align="right" valign="middle"><input name="searchKey" type="text" id="searchKey" style="BORDER-RIGHT: #b8b8b8 1px solid; BORDER-TOP: #b8b8b8 1px solid; BORDER-LEFT: #b8b8b8 1px solid; WIDTH: 115px; BORDER-BOTTOM: #b8b8b8 1px solid; HEIGHT: 17px" ></td>
            <td align="left" valign="middle"><input type="image" src="images/top_ico_search.gif"></td>
          </tr>
        </table>
      </form></td>
    </tr>
  </table></td>
  </tr>
     <%
	  If instr(Request.ServerVariables("URL"),"default.asp")=0 Then
	  %>
  <tr bgcolor="#D5D6D5">
    <td height="25" colspan="2">
	<table border="0" cellspacing="0" cellpadding="0">

	  <tr>
        
		<%If not session("memberlogined") Then%>
		<td width="450" style="padding-left:28px ">Welcome Guest</td>
        <td width="30" align="right"><img src="images/shop_option_icon_login.gif"/></td>
        <td align="right"><a href="login.asp">LOGIN</a></td>		
		<%Else%>
		<td width="450" style="padding-left:28px ">Welcome <%=session("userCode")%></td>
        <td width="30" align="right"><img src="images/shop_option_logout.gif" width="24" height="23" /></td>
        <td align="right"><a href="operation.asp?action=memberLogout">LOGOUT</a></td>
		<%End if%>
        <td width="30" align="right"><img src="images/shop_option_icon_order.gif" width="18" height="23"></td>
        <td style="padding-left:3px "><a href="myorders.asp">MY ORDERS</a> </td>
        <td width="30" align="right"><img src="images/shop_option_icon_cart.gif" width="16" height="23" /></td>
        <td style="padding-left:3px "><a href="edit_profile.asp"></a> <a href="mycart.asp">MY CART</a></td>
        <td width="30" align="right"><img src="images/shop_option_icon_mylg.gif" width="15" height="23" /></td>
        <td style="padding-left:3px "><a href="mycart.asp"></a> <a href="edit_profile.asp">MY AMAY</a></td>
        <td width="30" align="right"><img src="images/shop_option_icon_mylg.gif" width="15" height="23" /></td>
        <td style="padding-left:3px "><a href="myquotation.asp"></a> <a href="edit_profile.asp">MY QUOTATION</a></td>		
      </tr>
    </table>
	</td>
  </tr>
    <%End if%>
</table>
