<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
'┎────────────────────────────┒
'┃　　　　 ※EASY CMS企业网站管理系统V1.0 final   　　　　┃
'┣━━━━━━┯━━━━━━━━━━━━━━━━━━━━━┫
'┃　作    者　│陈文杰　　　　　　　　　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　最后修改　│2005年1月25日21:01:19 　　　　　　　　　　┃
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
'┃广州中山大道上社棠雅苑    		 2005年1月25日21:01:13 ┃
'┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
%>
<!--#include file="../admin/includes/config.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta content="all" name="robots">
<meta name="author" content="amay@amay-jewelry.com,Amay">
<meta name="Copyright" content="AMAY JEWELRY">
<title>AMAY JEWELRY</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/check_form.js"></script>

</head>
<body>
<div id="cwj"></div>
<!--#include file="head.asp"-->
<table width="100%" border="0" cellpadding="0" cellspacing="0" id="page_toper">
  <tr>
    <td><table width="100%" height="50" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="250"><img src="images/register_title.gif" width="172" height="52"></td>
          <td class="limap"><!--#include file="link_bar.asp"--></td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="100%" height="100%" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="100" style="padding:10px 0 0 0 "><form name="form1" method="post" action="operation.asp?action=getPassword" onsubmit="return checkForm(this)">
                    <table width="760" border="0" cellpadding="4" cellspacing="0" id="form">
                      <tr>
                        <th width="30%">* Member ID:</th>
                        <td><input name="UserCode" type="text" id="UserCode" style="width: 208px" Title="Please enter Member ID!~20:noChinese!" value="" maxlength="20">
                          <br />                          </td>
                      </tr>
                      <tr>
                        <th>* Business Email:</th>
                        <td><input name="Email" type="text" id="Email" style="width: 208px" value="" maxlength="100" Title="Please enter Email!~50:email!">
                          <br>
                          Important: A valid email is required for customers to contact you.</td>
                      </tr>
                      <tr>
                        <td colspan="2">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="30" colspan="2" bgcolor="#F5F5F5" style="padding-left:20px">* Required information</td>
                      </tr>
                      <tr>
                        <td height="40" colspan="2" align="center"><span style="padding:5px 0 5px 0">
                          <input type="submit" name="Submit" value="Complete" style="width:100px">
                        </span></td>
                      </tr>
                    </table>
                  </form></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<!--#include file="footer.asp"-->
</body>
</html>
