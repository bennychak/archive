<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
'┎────────────────────────────┒
'┃　　　　 ※EASY CMS企业网站管理系统V1.0 final   　　　　┃
'┣━━━━━━┯━━━━━━━━━━━━━━━━━━━━━┫
'┃　作    者　│陈文杰　　　　　　　　　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　最后修改　│2005年3月27日16:22:36 　　　　　　　　　　┃
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
'┃广州中山大道上社棠雅苑    		 2005年3月27日16:22:36 ┃
'┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
%>
<!--#include file="../admin/includes/config.asp"-->
<!--#include file="../admin/includes/systemsg.asp"-->
<%
dim msg,ctype,delay,page
msg=Request.QueryString("msg")
If IsNumeric(msg) Then
	msg=webMessage(msg)
End if


ctype=Request.QueryString("ctype")
delay=Request.QueryString("delay")
page=Request.QueryString("page")
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
<%
If ctype="gourl" Then
	response.write "<META HTTP-EQUIV=REFRESH CONTENT="&delay&";URL="&page&">"
End if
%>
</head>
<body>
<!--#include file="head.asp"-->
<table width="100%" border="0" cellpadding="0" cellspacing="0" id="page_toper">
  <tr>
    <td><table width="100%" height="50" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="250"><img src="images/message_title.gif" width="172" height="52"></td>
          <td class="limap"><!--#include file="link_bar.asp"--></td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="100%" cellpadding="0" cellspacing="0">
  <tr>
    <td align="left" valign="top" ><table width="100%" height="210" border="0" cellpadding="8" cellspacing="0" >
        <tr>
          <td height="200" align="center" valign="middle">
<%
response.Write msg
If ctype="gourl" Then
	response.write "<p>And auto return after "&delay&" seconds,(Please chick under button to return if the browser does not support)</p>"	
End if
Select Case (ctype) 
	Case "gourl":
		response.write "<br><br><input type=""button"" name=""back""  value=""Return"" onClick=""location='"&page&"'"">"
	Case "back":
		response.write "<br><br><input type=""button"" name=""back""  value=""Return"" onClick=""javascript:history.back()"">"
	Case "custom":
		response.write "<br><br><input type=""button"" name=""custom""  value="""&delay&""" onClick=""location='"&page&"'"">"
End Select
%>
            </td>
        </tr>
        <tr>
          <td align="right">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
<!--#include file="footer.asp"-->
</body>
</html>
