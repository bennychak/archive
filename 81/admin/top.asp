<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%
' *** Logout the current user.
MM_Logout = CStr(Request.ServerVariables("URL")) & "?MM_Logoutnow=1"
If (CStr(Request("MM_Logoutnow")) = "1") Then
  Session.Contents.Remove("MM_Username")
  Session.Contents.Remove("MM_UserAuthorization")
  MM_logoutRedirectPage = "index.html"
  ' redirect with URL parameters (remove the "MM_Logoutnow" query param).
  if (MM_logoutRedirectPage = "") Then MM_logoutRedirectPage = CStr(Request.ServerVariables("URL"))
  If (InStr(1, UC_redirectPage, "?", vbTextCompare) = 0 And Request.QueryString <> "") Then
    MM_newQS = "?"
    For Each Item In Request.QueryString
      If (Item <> "MM_Logoutnow") Then
        If (Len(MM_newQS) > 1) Then MM_newQS = MM_newQS & "&"
        MM_newQS = MM_newQS & Item & "=" & Server.URLencode(Request.QueryString(Item))
      End If
    Next
    if (Len(MM_newQS) > 1) Then MM_logoutRedirectPage = MM_logoutRedirectPage & MM_newQS
  End If
  Response.Redirect(MM_logoutRedirectPage)
End If
%>
<%
' *** Restrict Access To Page: Grant or deny access to this page
MM_authorizedUsers=""
MM_authFailedURL="../error.html"
MM_grantAccess=false
If Session("MM_Username") <> "" Then
  If (true Or CStr(Session("MM_UserAuthorization"))="") Or _
         (InStr(1,MM_authorizedUsers,Session("MM_UserAuthorization"))>=1) Then
    MM_grantAccess = true
  End If
End If
If Not MM_grantAccess Then
  MM_qsChar = "?"
  If (InStr(1,MM_authFailedURL,"?") >= 1) Then MM_qsChar = "&"
  MM_referrer = Request.ServerVariables("URL")
  if (Len(Request.QueryString()) > 0) Then MM_referrer = MM_referrer & "?" & Request.QueryString()
  MM_authFailedURL = MM_authFailedURL & MM_qsChar & "accessdenied=" & Server.URLEncode(MM_referrer)
  Response.Redirect(MM_authFailedURL)
End If
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Bienfantaisie</title>
<link href="../css/default.css" rel="stylesheet" type="text/css" />
</head>

<body marginheight="0" marginwidth="0" topmargin="0" leftmargin="0">
<table style="background:#ffffee" width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="padding:5px 10px 4px; border-bottom:#000 1px solid; line-height:20px; font-size:14px;>
	<font>
<a href="main.asp" target="main">管理</a>&nbsp;
<a href="../demo.asp" target="main">预览</a>&nbsp;
<a href="base.asp" target="main">设置</a>&nbsp;
<a href="../eWebEditor/Admin_Default.asp" target="main">eWeb</a>&nbsp;
<a href="addmusic.asp" target="main">音乐</a>&nbsp;
<a href="add.asp" target="main">添加</a>&nbsp;
<a href="list.asp" target="main">编辑</a>&nbsp;
<a href="belong.asp" target="main">分类</a>&nbsp;
<a href="commentdel.asp" target="main">评论</a>&nbsp;
<a href="delguest.asp" target="main">留言</a>&nbsp;
<a href="link.asp" target="main">链接</a>&nbsp;
<a href="webcollect.asp" target="main">网摘</a>&nbsp;
<a href="bookmanage.asp" target="main">书架</a>&nbsp;
<a href="ip.asp" target="main">IP</a>&nbsp;
<a href="forbiddenip.asp" target="main">封IP</a>&nbsp;
<a href="message.asp" target="main">信息</a>&nbsp;
<a href="<%= MM_Logout %>" target="_top">注销</a></font>	</td>
  </tr>
</table>
</body>
</html>
