<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../Connections/bien.asp" -->
<%
' *** Validate request to log in to this site.
MM_LoginAction = Request.ServerVariables("URL")
If Request.QueryString<>"" Then MM_LoginAction = MM_LoginAction + "?" + Server.HTMLEncode(Request.QueryString)
MM_valUsername=CStr(Request.Form("guaiguai_name"))
If MM_valUsername <> "" Then
  MM_fldUserAuthorization=""
  MM_redirectLoginSuccess="index.asp"
  MM_redirectLoginFailed="../index.asp"
  MM_flag="ADODB.Recordset"
  set MM_rsUser = Server.CreateObject(MM_flag)
  MM_rsUser.ActiveConnection = MM_bien_STRING
  MM_rsUser.Source = "SELECT guaiguai_name, guaiguai_pass"
  If MM_fldUserAuthorization <> "" Then MM_rsUser.Source = MM_rsUser.Source & "," & MM_fldUserAuthorization
  MM_rsUser.Source = MM_rsUser.Source & " FROM guaiguai_admin WHERE guaiguai_name='" & Replace(MM_valUsername,"'","''") &"' AND guaiguai_pass='" & Replace(Request.Form("guaiguai_pass"),"'","''") & "'"
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
<title>guaiguai的留言登陆</title>
</head>

<body><div align="center"><img src="http://images.blogcn.com/2007/4/27/10/apparition_dream,20070427100049100.gif" /><br>
<form id="form1" name="form1" method="POST" action="<%=MM_LoginAction%>">
  <label>
  <input name="guaiguai_name" type="password" id="guaiguai_name" size="20" maxlength="50" />
  </label>
  <label>
  <input name="guaiguai_pass" type="password" id="guaiguai_pass" size="20" maxlength="50" />
  </label>
  <label>
  <input type="submit" name="Submit" value="给老公留言去咯" />
  </label>
</form></div>
</body>
</html>
