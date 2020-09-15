<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
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
          <td width="250" align="center"><img src="images/login_title.gif" width="220" height="52"></td>
          <td class="limap"><!--#include file="link_bar.asp"-->            <a href="#"></A></td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="200" bgcolor="#F7F7F7"><form name="form2" method="post" action="operation.asp">
      <table width="100%" border="0" cellpadding="5" cellspacing="5">
        <tr>
          <td align="center"><table border="0" align="center" cellpadding="2" cellspacing="2" bgcolor="#f7f7f7">
            <tr>
              <td align="right">Amay! ID: </td>
              <td><input name="LoginId" type="text" style=" width: 85px; padding: 2px; height: 22px; color: #990000 " onFocus="this.value=''"></td>
              <td rowspan="2"><input name="image" type="image" src="images/login_btn.gif"></td>
            </tr>
            <tr>
              <td align="right">Password:</td>
              <td><input type="password" name="UserPassword" style=" width: 85px; padding: 2px; height: 22px; color: #990000 " onFocus="this.value=''"></td>
            </tr>
            <tr align="left">
              <td colspan="3"><div style=" padding: 8px 0 3px 10px "><img src="images/id_text.gif" width="10" height="14" align="absmiddle"> <a href="register.asp" class="style1">Join Us </a><span class="td center">
                  <input name="action" type="hidden" id="action" value="memberLogin">
                </span><span class="td center">
                <input name="hreferer" type="hidden" id="hreferer" value="<%=request("urlPara")%>">
                </span></div>
                  <div style=" padding: 5px 0 3px 10px "><img src="images/id_text.gif" width="10" height="14" align="absmiddle"> <a href="forget_password.asp" class="style1">Forgot your password?</a></div></td>
            </tr>
            <tr align="left">
              <td height="5" colspan="3"></td>
            </tr>
          </table>            </td>
          </tr>
        <tr>
          <td align="center"><table width="400" border="0" align="center">
            <tr>
              <td><p><strong>If you are AMAY member, you can enjoy that</strong></p>
                <ul>
                  <li>You can find more new designs .</li>
                  <li>You can make order on line.</li>
                  <li>You can get the detailed quotation of all products.</li>
                </ul>
                <p>So you must fill in your really individual name、company name、Email address and Tel Numble. And after our validation you can start enjoying the benefits and services we provide. </p></td>
            </tr>
          </table>          <p>&nbsp;</p>
            </td>
          </tr>
      </table>
    </form>
    </td>
  </tr>
</table>
<!--#include file="footer.asp"-->
</body>
</html>
