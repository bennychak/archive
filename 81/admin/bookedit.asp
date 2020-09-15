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
  MM_editTable = "book"
  MM_editColumn = "id"
  MM_recordId = "" + Request.Form("MM_recordId") + ""
  MM_editRedirectUrl = "../seccess.html"
  MM_fieldsStr  = "book_name|value|book_press|value|book_author|value|book_gettime|value|book_class|value|book_presstime|value|book_price|value|book_count|value|book_note|value"
  MM_columnsStr = "book_name|',none,''|book_press|',none,''|book_author|',none,''|book_gettime|',none,''|book_class|',none,''|book_presstime|',none,''|book_price|none,none,NULL|book_count|',none,''|book_note|',none,''"

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
Dim bookedit
Dim bookedit_numRows

Set bookedit = Server.CreateObject("ADODB.Recordset")
bookedit.ActiveConnection = MM_bien_STRING
bookedit.Source = "SELECT * FROM book"
bookedit.CursorType = 0
bookedit.CursorLocation = 2
bookedit.LockType = 1
bookedit.Open()

bookedit_numRows = 0
%>
<%
'  *** Recordset Stats, Move To Record, and Go To Record: declare stats variables

Dim bookedit_total
Dim bookedit_first
Dim bookedit_last

' set the record count
bookedit_total = bookedit.RecordCount

' set the number of rows displayed on this page
If (bookedit_numRows < 0) Then
  bookedit_numRows = bookedit_total
Elseif (bookedit_numRows = 0) Then
  bookedit_numRows = 1
End If

' set the first and last displayed record
bookedit_first = 1
bookedit_last  = bookedit_first + bookedit_numRows - 1

' if we have the correct record count, check the other stats
If (bookedit_total <> -1) Then
  If (bookedit_first > bookedit_total) Then
    bookedit_first = bookedit_total
  End If
  If (bookedit_last > bookedit_total) Then
    bookedit_last = bookedit_total
  End If
  If (bookedit_numRows > bookedit_total) Then
    bookedit_numRows = bookedit_total
  End If
End If
%>
<%
Dim MM_paramName 
%>
<%
' *** Move To Record and Go To Record: declare variables

Dim MM_rs
Dim MM_rsCount
Dim MM_size
Dim MM_uniqueCol
Dim MM_offset
Dim MM_atTotal
Dim MM_paramIsDefined

Dim MM_param
Dim MM_index

Set MM_rs    = bookedit
MM_rsCount   = bookedit_total
MM_size      = bookedit_numRows
MM_uniqueCol = "id"
MM_paramName = "id"
MM_offset = 0
MM_atTotal = false
MM_paramIsDefined = false
If (MM_paramName <> "") Then
  MM_paramIsDefined = (Request.QueryString(MM_paramName) <> "")
End If
%>
<%
' *** Move To Specific Record: handle detail parameter

If (MM_paramIsDefined And MM_rsCount <> 0) Then

  ' get the value of the parameter
  MM_param = Request.QueryString(MM_paramName)

  ' find the record with the unique column value equal to the parameter value
  MM_offset = 0
  Do While (Not MM_rs.EOF)
    If (CStr(MM_rs.Fields.Item(MM_uniqueCol).Value) = MM_param) Then
      Exit Do
    End If
    MM_offset = MM_offset + 1
    MM_rs.MoveNext
  Loop

  ' if not found, set the number of records and reset the cursor
  If (MM_rs.EOF) Then
    If (MM_rsCount < 0) Then
      MM_rsCount = MM_offset
    End If
    If (MM_size < 0 Or MM_size > MM_offset) Then
      MM_size = MM_offset
    End If
    MM_offset = 0

    ' reset the cursor to the beginning
    If (MM_rs.CursorType > 0) Then
      MM_rs.MoveFirst
    Else
      MM_rs.Close
      MM_rs.Open
    End If
  End If

End If
%>
<%
' *** Move To Record: if we dont know the record count, check the display range

If (MM_rsCount = -1) Then

  ' walk to the end of the display range for this page
  MM_index = MM_offset
  While (Not MM_rs.EOF And (MM_size < 0 Or MM_index < MM_offset + MM_size))
    MM_rs.MoveNext
    MM_index = MM_index + 1
  Wend

  ' if we walked off the end of the recordset, set MM_rsCount and MM_size
  If (MM_rs.EOF) Then
    MM_rsCount = MM_index
    If (MM_size < 0 Or MM_size > MM_rsCount) Then
      MM_size = MM_rsCount
    End If
  End If

  ' if we walked off the end, set the offset based on page size
  If (MM_rs.EOF And Not MM_paramIsDefined) Then
    If (MM_offset > MM_rsCount - MM_size Or MM_offset = -1) Then
      If ((MM_rsCount Mod MM_size) > 0) Then
        MM_offset = MM_rsCount - (MM_rsCount Mod MM_size)
      Else
        MM_offset = MM_rsCount - MM_size
      End If
    End If
  End If

  ' reset the cursor to the beginning
  If (MM_rs.CursorType > 0) Then
    MM_rs.MoveFirst
  Else
    MM_rs.Requery
  End If

  ' move the cursor to the selected record
  MM_index = 0
  While (Not MM_rs.EOF And MM_index < MM_offset)
    MM_rs.MoveNext
    MM_index = MM_index + 1
  Wend
End If
%>
<%
' *** Move To Record: update recordset stats

' set the first and last displayed record
bookedit_first = MM_offset + 1
bookedit_last  = MM_offset + MM_size

If (MM_rsCount <> -1) Then
  If (bookedit_first > MM_rsCount) Then
    bookedit_first = MM_rsCount
  End If
  If (bookedit_last > MM_rsCount) Then
    bookedit_last = MM_rsCount
  End If
End If

' set the boolean used by hide region to check if we are on the last record
MM_atTotal = (MM_rsCount <> -1 And MM_offset + MM_size >= MM_rsCount)
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<link href="../css/default.css" rel="stylesheet" type="text/css" />
</head>

<body>
<form ACTION="<%=MM_editAction%>" METHOD="POST" id="form1" name="form1">
  <table border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="60">书名</td>
      <td width="600"><label>
        <input name="book_name" type="text" id="book_name" value="<%=(bookedit.Fields.Item("book_name").Value)%>" size="100" maxlength="100" />
      </label></td>
    </tr>
    <tr>
      <td>出版社</td>
      <td><input name="book_press" type="text" id="book_press" value="<%=(bookedit.Fields.Item("book_press").Value)%>" size="50" maxlength="50" /></td>
    </tr>
    <tr>
      <td>作者</td>
      <td><input name="book_author" type="text" id="book_author" value="<%=(bookedit.Fields.Item("book_author").Value)%>" size="50" maxlength="50" /></td>
    </tr>
    <tr>
      <td>得到时间</td>
      <td><input name="book_gettime" type="text" id="book_gettime" value="<%=(bookedit.Fields.Item("book_gettime").Value)%>" size="20" maxlength="20" /></td>
    </tr>
    <tr>
      <td>分类</td>
      <td><input name="book_class" type="text" id="book_class" value="<%=(bookedit.Fields.Item("book_class").Value)%>" size="20" maxlength="20" /></td>
    </tr>
    <tr>
      <td>出版时间</td>
      <td><input name="book_presstime" type="text" id="book_presstime" value="<%=(bookedit.Fields.Item("book_presstime").Value)%>" size="20" maxlength="20" /></td>
    </tr>
    <tr>
      <td>定价</td>
      <td><input name="book_price" type="text" id="book_price" value="<%=(bookedit.Fields.Item("book_price").Value)%>" size="10" maxlength="10" /></td>
    </tr>
    <tr>
      <td>册数</td>
      <td><input name="book_count" type="text" id="book_count" value="<%=(bookedit.Fields.Item("book_count").Value)%>" size="10" maxlength="10" /></td>
    </tr>
    <tr>
      <td>备注</td>
      <td><label>
        <textarea name="book_note" cols="30" rows="3" id="book_note"><%=(bookedit.Fields.Item("book_note").Value)%></textarea>
      </label></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <input type="submit" name="Submit" value="提交" />
      </label></td>
    </tr>
  </table>

  

    <input type="hidden" name="MM_update" value="form1">
  <input type="hidden" name="MM_recordId" value="<%= bookedit.Fields.Item("id").Value %>">
</form>
</body>
</html>
<%
bookedit.Close()
Set bookedit = Nothing
%>
