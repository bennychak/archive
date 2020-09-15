<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
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
<!--#include file="../Connections/bien.asp" -->
<%
Dim base
Dim base_numRows

Set base = Server.CreateObject("ADODB.Recordset")
base.ActiveConnection = MM_bien_STRING
base.Source = "SELECT * FROM base"
base.CursorType = 0
base.CursorLocation = 2
base.LockType = 1
base.Open()

base_numRows = 0
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Bienfantaisie</title>
<link href="../css/default.css" rel="stylesheet" type="text/css" />
</head>

<body><div align="center"><table align="center" height="440" width="440"><tr><td valign="middle"><div align="center" class="tt_title"><a href="../index.asp" target="_blank"><%=(base.Fields.Item("blogtitle").Value)%></a></div><table align="center" cellspacing="0" cellpadding="0" width="180" border="0">
      <tr><td align="center">Copyright&copy;2007 by<br>
        <a href="http://<%=(base.Fields.Item("address").Value)%>/"><%=(base.Fields.Item("address").Value)%></a><br>
      <a href="mailto:bienfantaisie@163.com">bienfantaisie@163.com</a><br><a href="mailto:bienfantaisie@hotmail.com">bienfantaisie@hotmail.com</a><br>Allrights Reserved<br><a target="_blank" href="http://www.miibeian.gov.cn">Ô¥ICP±¸07003303ºÅ</a></td></tr></table></td></tr></table>

</div>
</body>
</html>
<%
base.Close()
Set base = Nothing
%>
