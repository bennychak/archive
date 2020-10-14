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
' *** Insert Record: set variables

If (CStr(Request("MM_insert")) = "form1") Then

  MM_editConnection = MM_bien_STRING
  MM_editTable = "book"
  MM_editRedirectUrl = "../seccess.html"
  MM_fieldsStr  = "book_name|value|book_press|value|book_author|value|book_gettime|value|book_class|value|book_presstime|value|book_price|value|book_count|value|book_note|value|book_dadsay|value|book_momsay|value|book_getprice|value|book_isbn|value|book_cnClassification|value|book_usClassification|value"
  MM_columnsStr = "book_name|',none,''|book_press|',none,''|book_author|',none,''|book_gettime|',none,''|book_class|',none,''|book_presstime|',none,''|book_price|none,none,NULL|book_count|',none,''|book_note|',none,''|book_dadsay|',none,''|book_momsay|',none,''|book_getprice|',none,''|book_isbn|',none,''|book_cnClassification|',none,''|book_usClassification|',none,''"

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
' *** Insert Record: construct a sql insert statement and execute it

Dim MM_tableValues
Dim MM_dbValues

If (CStr(Request("MM_insert")) <> "") Then

  ' create the sql insert statement
  MM_tableValues = ""
  MM_dbValues = ""
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
      MM_tableValues = MM_tableValues & ","
      MM_dbValues = MM_dbValues & ","
    End If
    MM_tableValues = MM_tableValues & MM_columns(MM_i)
    MM_dbValues = MM_dbValues & MM_formVal
  Next
  MM_editQuery = "insert into " & MM_editTable & " (" & MM_tableValues & ") values (" & MM_dbValues & ")"

  If (Not MM_abortEdit) Then
    ' execute the insert
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>添加图书</title>
<link href="../css/default.css" rel="stylesheet" type="text/css" />
</head>

<body>
<form id="form1" name="form1" method="POST" action="<%=MM_editAction%>">
  <table border="0" cellspacing="0" cellpadding="2">
    <tr>
      <td>书名</td>
      <td><label>
        <input name="book_name" type="text" id="book_name" size="100" maxlength="100" />
      </label></td>
    </tr>
    <tr>
      <td>出版社</td>
      <td><input name="book_press" type="text" id="book_press" size="50" maxlength="50" /></td>
    </tr>
    <tr>
      <td>作者</td>
      <td><input name="book_author" type="text" id="book_author" size="50" maxlength="100" /></td>
    </tr>
    <tr>
      <td>得到时间</td>
      <td><input name="book_gettime" type="text" id="book_gettime" value="<%=date()%>" size="20" maxlength="20" /></td>
    </tr>
    <tr>
      <td>分类</td>
      <td><input name="book_class" type="text" id="book_class" size="20" maxlength="20" /></td>
    </tr>
    <tr>
      <td>出版时间</td>
      <td><input name="book_presstime" type="text" id="book_presstime" size="20" maxlength="20" /></td>
    </tr>
    <tr>
      <td>定价</td>
      <td><input name="book_price" type="text" id="book_price" value="0" size="10" maxlength="10" /></td>
    </tr>
    <tr>
      <td>得到价格</td>
      <td><input name="book_getprice" type="text" id="book_getprice" value="0" size="10" maxlength="10" /></td>
    </tr>
    <tr>
      <td>ISBN</td>
      <td><input name="book_isbn" type="text" id="book_isbn" value="0" size="16" maxlength="16" /></td>
    </tr>
    <tr>
      <td>中国国家图书馆分类号（CLC）</td>
      <td><input name="book_cnClassification" type="text" id="book_cnClassification" size="16" maxlength="16" /></td>
    </tr>
    <tr>
      <td>美国国会图书馆分类号（LCC）</td>
      <td><input name="book_usClassification" type="text" id="book_usClassification" size="16" maxlength="16" /></td>
    </tr>
    <tr>
      <td>册数</td>
      <td><input name="book_count" type="text" id="book_count" value="1" size="10" maxlength="10" /></td>
    </tr>
    <tr>
      <td>备注</td>
      <td><label>
        <textarea name="book_note" cols="60" rows="2" id="book_note"></textarea>
      </label></td>
    </tr>
    <tr>
      <td>爸爸说</td>
      <td><label>
        <textarea name="book_dadsay" cols="60" rows="5" id="book_dadsay"></textarea>
      </label></td>
    </tr>
    <tr>
      <td>妈妈说</td>
      <td><label>
        <textarea name="book_momsay" cols="60" rows="5" id="book_momsay"></textarea>
      </label></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <input type="submit" name="Submit" value="提交" />
      </label></td>
    </tr>
  </table>

  <input type="hidden" name="MM_insert" value="form1">
</form>
</body>
</html>
