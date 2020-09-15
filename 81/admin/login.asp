<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../Connections/bien.asp" -->
<!--#include file="../inc/md5.asp"-->
<%
' *** Validate request to log in to this site.
MM_LoginAction = Request.ServerVariables("URL")
If Request.QueryString<>"" Then MM_LoginAction = MM_LoginAction + "?" + Server.HTMLEncode(Request.QueryString)
MM_valUsername=CStr(Request.Form("name"))
If MM_valUsername <> "" Then
  MM_fldUserAuthorization=""
  MM_redirectLoginSuccess="admin.asp"
  MM_redirectLoginFailed="../error.html"
  MM_flag="ADODB.Recordset"
  set MM_rsUser = Server.CreateObject(MM_flag)
  MM_rsUser.ActiveConnection = MM_bien_STRING
  MM_rsUser.Source = "SELECT name, pass"
  If MM_fldUserAuthorization <> "" Then MM_rsUser.Source = MM_rsUser.Source & "," & MM_fldUserAuthorization
  MM_rsUser.Source = MM_rsUser.Source & " FROM admin WHERE name='" & Replace(MM_valUsername,"'","''") &"' AND pass='" & Replace(md5(Request.Form("pass"),16),"'","''") & "'"
  MM_rsUser.CursorType = 0
  MM_rsUser.CursorLocation = 2
  MM_rsUser.LockType = 3
  MM_rsUser.Open
  If Not MM_rsUser.EOF Or Not MM_rsUser.BOF Then 
    ' username and password match - this is a valid user
    Session("MM_Username") = MM_valUsername
    If (MM_fldUserAuthorization <> "") Then
      Session("MM_UserAuthorization") = CStr(MM_rsUser.Fields.Item(MM_fldUserAuthorization).Value)
    Else
      Session("MM_UserAuthorization") = ""
    End If
    if CStr(Request.QueryString("accessdenied")) <> "" And false Then
      MM_redirectLoginSuccess = Request.QueryString("accessdenied")
    End If
    MM_rsUser.Close
    Response.Redirect(MM_redirectLoginSuccess)
  End If
  MM_rsUser.Close
  Response.Redirect(MM_redirectLoginFailed)
End If
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>BienfantaisieµÄ²©¿ÍµÇÂ½</title>
</head>

<body bgcolor="#EEEEEE"><br><br><br><br>
<table align=center width=600>
<tr>
<td>
<div align="center">
  <form id="admin" name="admin" method="POST" action="<%=MM_LoginAction%>">
    <label>
    <input name="name" style="background-color:#EEE; border:none;" type="password" id="name" size="13" maxlength="13" />
    </label>&nbsp;
    <label>
    <input name="pass" style="background-color:#EEE; border:none;" type="password" id="pass" size="13" maxlength="13" />
    </label>
	<br />
	<img src="../link/bienfantaisie.gif" alt="Bienfantaisie" width="180" height="132" />
	<br />
    <label>
    <input type="submit" name="Submit" value="Enter" />
    </label>
  </form>
</div>
</td>
</tr>
</table>
</body>
</html>
