<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../Connections/bien.asp" -->
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
<%
' *** Edit Operations: declare variables

Dim MM_editAction
Dim MM_abortEdit
Dim MM_editQuery
Dim MM_editCmd

Dim MM_editConnection
Dim MM_editTable
Dim MM_editRedirectUrl
Dim MM_editColumn
Dim MM_recordId

Dim MM_fieldsStr
Dim MM_columnsStr
Dim MM_fields
Dim MM_columns
Dim MM_typeArray
Dim MM_formVal
Dim MM_delim
Dim MM_altVal
Dim MM_emptyVal
Dim MM_i

MM_editAction = CStr(Request.ServerVariables("SCRIPT_NAME"))
If (Request.QueryString <> "") Then
  MM_editAction = MM_editAction & "?" & Server.HTMLEncode(Request.QueryString)
End If

' boolean to abort record edit
MM_abortEdit = false

' query string to execute
MM_editQuery = ""
%>
<%
' *** Update Record: set variables

If (CStr(Request("MM_update")) = "form1" And CStr(Request("MM_recordId")) <> "") Then

  MM_editConnection = MM_bien_STRING
  MM_editTable = "base"
  MM_editColumn = "id"
  MM_recordId = "" + Request.Form("MM_recordId") + ""
  MM_editRedirectUrl = "../seccess.html"
  MM_fieldsStr  = "blogtitle|value|address|value|artdisplay|value|seasoncolor|value|logo|value|fishlogo|value|fishlogonote|value|titlemessage|value"
  MM_columnsStr = "blogtitle|',none,''|address|',none,''|artdisplay|',none,''|seasoncolor|',none,''|logo|',none,''|fishlogo|',none,''|fishlogonote|',none,''|titlemessage|',none,''"

  ' create the MM_fields and MM_columns arrays
  MM_fields = Split(MM_fieldsStr, "|")
  MM_columns = Split(MM_columnsStr, "|")
  
  ' set the form values
  For MM_i = LBound(MM_fields) To UBound(MM_fields) Step 2
    MM_fields(MM_i+1) = CStr(Request.Form(MM_fields(MM_i)))
  Next

  ' append the query string to the redirect URL
  If (MM_editRedirectUrl <> "" And Request.QueryString <> "") Then
    If (InStr(1, MM_editRedirectUrl, "?", vbTextCompare) = 0 And Request.QueryString <> "") Then
      MM_editRedirectUrl = MM_editRedirectUrl & "?" & Request.QueryString
    Else
      MM_editRedirectUrl = MM_editRedirectUrl & "&" & Request.QueryString
    End If
  End If

End If
%>
<%
' *** Update Record: construct a sql update statement and execute it

If (CStr(Request("MM_update")) <> "" And CStr(Request("MM_recordId")) <> "") Then

  ' create the sql update statement
  MM_editQuery = "update " & MM_editTable & " set "
  For MM_i = LBound(MM_fields) To UBound(MM_fields) Step 2
    MM_formVal = MM_fields(MM_i+1)
    MM_typeArray = Split(MM_columns(MM_i+1),",")
    MM_delim = MM_typeArray(0)
    If (MM_delim = "none") Then MM_delim = ""
    MM_altVal = MM_typeArray(1)
    If (MM_altVal = "none") Then MM_altVal = ""
    MM_emptyVal = MM_typeArray(2)
    If (MM_emptyVal = "none") Then MM_emptyVal = ""
    If (MM_formVal = "") Then
      MM_formVal = MM_emptyVal
    Else
      If (MM_altVal <> "") Then
        MM_formVal = MM_altVal
      ElseIf (MM_delim = "'") Then  ' escape quotes
        MM_formVal = "'" & Replace(MM_formVal,"'","''") & "'"
      Else
        MM_formVal = MM_delim + MM_formVal + MM_delim
      End If
    End If
    If (MM_i <> LBound(MM_fields)) Then
      MM_editQuery = MM_editQuery & ","
    End If
    MM_editQuery = MM_editQuery & MM_columns(MM_i) & " = " & MM_formVal
  Next
  MM_editQuery = MM_editQuery & " where " & MM_editColumn & " = " & MM_recordId

  If (Not MM_abortEdit) Then
    ' execute the update
    Set MM_editCmd = Server.CreateObject("ADODB.Command")
    MM_editCmd.ActiveConnection = MM_editConnection
    MM_editCmd.CommandText = MM_editQuery
    MM_editCmd.Execute
    MM_editCmd.ActiveConnection.Close

    If (MM_editRedirectUrl <> "") Then
      Response.Redirect(MM_editRedirectUrl)
    End If
  End If

End If
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
<title>基本设置</title>
<link href="../css/default.css" rel="stylesheet" type="text/css" />
</head>

<body>
<form ACTION="<%=MM_editAction%>" METHOD="POST" id="form1" name="form1">
  <table bgcolor="#CCCCCC" cellspacing="1" cellpadding="4">
    <tr bgcolor="#FFFFFF">
      <td width="100">网站标题 <font color="#FF0000">*</font></td>
      <td><label>
        <input name="blogtitle" type="text" id="blogtitle" value="<%=(base.Fields.Item("blogtitle").Value)%>" size="50" maxlength="50" />
      </label></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td>网站地址 <font color="#FF0000">*</font></td>
      <td><label>
        http://<input name="address" type="text" id="address" value="<%=(base.Fields.Item("address").Value)%>" size="44" maxlength="50" />
      </label></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td>首页显示日志数量 <font color="#FF0000">*</font></td>
      <td><label>
        <input name="artdisplay" type="text" id="artdisplay" value="<%=(base.Fields.Item("artdisplay").Value)%>" size="3" maxlength="3" />
      </label></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td>季节颜色 <font color="#FF0000">*</font></td>
      <td><label>#
        <input name="seasoncolor" type="text" id="seasoncolor" value="<%=(base.Fields.Item("seasoncolor").Value)%>" size="10" maxlength="10" />
        参考色：春（99CC66）
      夏（006600）秋（CC9900）冬（C0C0C0）</label></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td>签名Logo <font color="#FF0000">*</font></td>
      <td><label>
        <input name="logo" type="text" id="logo" value="<%=(base.Fields.Item("logo").Value)%>" size="50" />
        （绝对地址,width=180）
      </label></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td>FishLogo <font color="#FF0000">*</font></td>
      <td><label>
        <input name="fishlogo" type="text" id="fishlogo" value="<%=(base.Fields.Item("fishlogo").Value)%>" size="50" />
        （绝对地址,width=200）
      </label></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td>FishLogo说明</td>
      <td><label>
        <input name="fishlogonote" type="text" id="fishlogonote" value="<%=(base.Fields.Item("fishlogonote").Value)%>" size="50" maxlength="100" />
      </label></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td>想说的话 <font color="#FF0000">*</font></td>
      <td><label>
        <textarea name="titlemessage" cols="50" rows="4" id="titlemessage"><%=(base.Fields.Item("titlemessage").Value)%></textarea>
      </label></td>
    </tr>

    <tr bgcolor="#FFFFFF">
      <td>&nbsp;</td>
      <td><label>
                <!--提示输入信息-->
<script language=JavaScript> 
function doSubmit(){ 
if (document.form1.blogtitle.value==""){ 
alert("请填写网站标题"); 
return false; 
} 
else if (document.form1.address.value==""){ 
alert("请填写网站地址"); 
return false; 
} 
else if (document.form1.artdisplay.value==""){ 
alert("请填写首页显示日志数量"); 
return false; 
} 
else if (document.form1.logo.value==""){ 
alert("请填写签名Logo地址"); 
return false; 
} 
else if (document.form1.fishlogo.value==""){ 
alert("请填写FishLogo地址"); 
return false; 
} 
else if (document.form1.titlemessage.value==""){ 
alert("请填写想说的话"); 
return false; 
} 
document.form1.submit(); 
} 
</script> 
<!--提示输入信息-->

          <input type="button" name="btnSubmit" onClick="doSubmit()" value="更改基本设置" />
      </label></td>
    </tr>
  </table>

  <input type="hidden" name="MM_update" value="form1">
  <input type="hidden" name="MM_recordId" value="<%= base.Fields.Item("id").Value %>">
</form>
</body>
</html>
<%
base.Close()
Set base = Nothing
%>
