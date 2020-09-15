<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
'┎────────────────────────────┒
'┃　　　　 ※EASY CMS企业网站管理系统V1.0 final   　　　　┃
'┣━━━━━━┯━━━━━━━━━━━━━━━━━━━━━┫
'┃　作    者　│陈文杰　　　　　　　　　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　最后修改　│2004年12月25日10:27:48　　　　　　　　　　┃
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
'┃南京汉中门大街康怡花园汉佳办事处　2004年12月25日10:24:11┃
'┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
%>

<!--#include file="includes/config.asp"--> 
<!--#include file="includes/systemsg.asp"--> 

<%
dim msg,ctype,delay,page
msg=Request.QueryString("msg")
If IsNumeric(msg) Then
	msg=systemMessage(msg)
End if


ctype=Request.QueryString("ctype")
delay=Request.QueryString("delay")
page=Request.QueryString("page")
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="robots" none="noindex,nofollow">
<title><%=manageCenterTitle%></title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/check_form.js"></script>
<%
If ctype="gourl" Then
	response.write "<META HTTP-EQUIV=REFRESH CONTENT="&delay&";URL="&page&">"
End if
%>
</head>

<body>
<!--#include file="head.asp"-->
<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2" valign="top">
	<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border="0">
      <TBODY>
        <TR>
          <TD height="300" align="center" vAlign=middle>
			<%
			response.Write msg
			If ctype="gourl" Then
			
				response.write delay&"秒后自动返回!(如浏览器不支持跳转请按下面的返回)<br><br>"	
			End if
			Select Case (ctype) 
				Case "gourl":
					response.write "<input type=""button"" name=""back""  value=""返回"" class=button onClick=""location='"&page&"'"">"
				Case "back":
					response.write "<br><input type=""button"" name=""back""  value=""返回"" class=button onClick=""javascript:history.back()"">"
				Case "custom":
					response.write "<br><input type=""button"" name=""custom""  value="""&delay&""" class=button onClick=""location='"&page&"'"">"
			End Select

			%>         
		  </TD>
        </TR>
      </TBODY>
    </TABLE>
	</td>
  </tr>
</table>
<!--#include file="foot.asp" -->
</body>
</html>
