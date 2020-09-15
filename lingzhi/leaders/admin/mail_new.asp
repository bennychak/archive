<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
'┎────────────────────────────┒
'┃　　　　 ※EASY CMS企业网站管理系统V1.0 final   　　　　┃
'┣━━━━━━┯━━━━━━━━━━━━━━━━━━━━━┫
'┃　作    者　│陈文杰　　　　　　　　　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　最后修改　│2005年1月10日23:14:37 　　　　　　　　　　┃
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
'┃广州天河中山大道棠雅苑　　　　　　2005年1月10日23:14:42 ┃
'┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
%>

<!--#include file="includes/config.asp"--> 
<%call isLogin%>

<%
returnPage=request("returnPage")
userID=request("userID")
quotationID=request("quotationID")

if not isNE(userID) then
	sql="select LastName,FirstName,[Email],JobTitle from Members where ID="&userID
	set rs=conn_access.Execute (sql)
		recipient=rs("Email")
		recipientMan=rs("LastName")&" "&rs("FirstName")
		If NOT isNE(rs("JobTitle")) Then
			'recipientMan=recipientMan&"("&rs("JobTitle")&")"
		End if
	set rs=nothing
end if


if not isNE(quotationID) then
	hash = request("hash")
	sql="select [Email] from Members,QuotationLevel where QuotationLevel.MemberID=Members.ID and QuotationID="&quotationID
	set rs=conn_access.Execute (sql)
	while not rs.eof
		recipient = recipient & rs("Email") & ";"
		rs.MoveNext
	Wend
	if not isNE(recipient) then
		recipient=mid(recipient,1,len(recipient)-1)
	end if
	
	recipientMan="AmayJewelry Member"
	
	mailBody = "http://www.amay-jewelry.com/html/quotation.asp?hash=" & hash
	
	set rs=nothing
end if
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
</head>

<body>
<!--#include file="head.asp"-->
<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="157" valign="top">
	<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border="0">
      <TBODY>
        <TR>
          <TD vAlign=top>
		    <!--#include file="menu.asp"--></TD>
        </TR>
      </TBODY>
    </TABLE>
	</td>
    <td width="84%" rowspan="2" valign="top"><table width="100%"  border="0" cellspacing="5" cellpadding="5">
      <tr>
        <td>发送邮件</td>
      </tr>
      <tr>
        <td align="center"><form name="form1" action="mail_send.asp" method="post" ONSUBMIT="return checkForm(this)">
          <table width="100%"  border="1" cellpadding="5" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse: collapse">
            <tr>
              <td align="center" bgcolor="#003366"><span class="bai">主题</span></td>
              <td align="left">
			  <input name="subject" type="text" id="subject" size="60" title="请输入主题!~200:!"></td>
            </tr>
            <tr>
              <td align="center" bgcolor="#003366" class="bai">发送到</td>
              <td align="left"><input name="recipient" type="text" id="recipient" size="80" value="<%=recipient%>" title="请输入接收地址!~200:noChinese!"></td>
            </tr>
            <tr>
              <td align="center" bgcolor="#003366" class="bai">收件人</td>
              <td align="left"><input name="recipientMan" type="text" id="recipientMan" size="40" value="<%=recipientMan%>"></td>
            </tr>
            <tr>
              <td align="center" bgcolor="#003366" class="bai">发送人</td>
              <td align="left"><input name="fromName" type="text" id="fromName" value="Amay Jewelry" size="40"></td>
            </tr>
            <tr align="left">
              <td colspan="2" class="bai">
			  <textarea name="mailBody" cols="100%" rows="20" id="mailBody" title="请输入内容!~3000:!"><%=mailBody%></textarea>
			  </td>
              </tr>
          </table>
          <br>
          <input name="Submit" type="submit" class="button" value="发送"> 
          <input name="return" type="button" class="button" id="return" onClick="location='<%=returnPage%>'" value="返回">
		  <input type="hidden" name="returnPage" value="<%=returnPage%>">
        </form></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td valign="bottom"><IMG src="img/left_end.gif" width="157" height="160" border="0"></td>
  </tr>
</table>
<!--#include file="foot.asp"-->
</body>
</html>
