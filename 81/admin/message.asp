<%@LANGUAGE="VBSCRIPT"%>
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
Dim guaiguai_admin
Dim guaiguai_admin_numRows

Set guaiguai_admin = Server.CreateObject("ADODB.Recordset")
guaiguai_admin.ActiveConnection = MM_bien_STRING
guaiguai_admin.Source = "SELECT * FROM guaiguai_admin"
guaiguai_admin.CursorType = 0
guaiguai_admin.CursorLocation = 2
guaiguai_admin.LockType = 1
guaiguai_admin.Open()

guaiguai_admin_numRows = 0
%>
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
<title>������Ϣ</title>
<link href="../css/default.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.STYLE1 {color: #FFFFFF}
-->
</style>
</head>

<body>
<p class="diary_title">
Chez Bienfantaisie ������Ϣ<br>
��ҳ��<a href="http://<%=(base.Fields.Item("address").Value)%>/" target="_blank">http://<%=(base.Fields.Item("address").Value)%>/</a><br>
�ű���ASP+ACCESS<br>
���ݿ��ַ��http://<%=(base.Fields.Item("address").Value)%>/data/bien.asp<br>
���ݿ������������ϵľ��Ե�ַ��<!--#include file="../data/path.asp"--><br>
��ʾ���ݿ��������ϵ�ַ��path.asp�ļ���ַ��<a href="http://<%=(base.Fields.Item("address").Value)%>/data/path.asp" target="_self">http://<%=(base.Fields.Item("address").Value)%>/data/path.asp</a><br>
���ݿ������ļ���http://<%=(base.Fields.Item("address").Value)%>/Connections/bien.asp<br />
�Թ�ר�����԰壺�û�����<span class="STYLE1"><%=(guaiguai_admin.Fields.Item("guaiguai_name").Value)%> </span>���룺<span class="STYLE1"><%=(guaiguai_admin.Fields.Item("guaiguai_pass").Value)%></span> <a href="../guaiguai/login.asp" target=_blank>���԰��½</a></p>
</body>

</html>
<%
guaiguai_admin.Close()
Set guaiguai_admin = Nothing
%>
<%
base.Close()
Set base = Nothing
%>
