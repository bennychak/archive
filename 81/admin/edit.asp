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
Dim edit
Dim edit_numRows

Set edit = Server.CreateObject("ADODB.Recordset")
edit.ActiveConnection = MM_bien_STRING
edit.Source = "SELECT * FROM art ORDER BY article_time DESC"
edit.CursorType = 0
edit.CursorLocation = 2
edit.LockType = 1
edit.Open()

edit_numRows = 0
%>
<%
Dim belong
Dim belong_numRows

Set belong = Server.CreateObject("ADODB.Recordset")
belong.ActiveConnection = MM_bien_STRING
belong.Source = "SELECT * FROM belong"
belong.CursorType = 0
belong.CursorLocation = 2
belong.LockType = 1
belong.Open()

belong_numRows = 0
%>
<%
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = -1
Repeat1__index = 0
belong_numRows = belong_numRows + Repeat1__numRows
%>
<%
'  *** Recordset Stats, Move To Record, and Go To Record: declare stats variables

Dim edit_total
Dim edit_first
Dim edit_last

' set the record count
edit_total = edit.RecordCount

' set the number of rows displayed on this page
If (edit_numRows < 0) Then
  edit_numRows = edit_total
Elseif (edit_numRows = 0) Then
  edit_numRows = 1
End If

' set the first and last displayed record
edit_first = 1
edit_last  = edit_first + edit_numRows - 1

' if we have the correct record count, check the other stats
If (edit_total <> -1) Then
  If (edit_first > edit_total) Then
    edit_first = edit_total
  End If
  If (edit_last > edit_total) Then
    edit_last = edit_total
  End If
  If (edit_numRows > edit_total) Then
    edit_numRows = edit_total
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

Set MM_rs    = edit
MM_rsCount   = edit_total
MM_size      = edit_numRows
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
edit_first = MM_offset + 1
edit_last  = MM_offset + MM_size

If (MM_rsCount <> -1) Then
  If (edit_first > MM_rsCount) Then
    edit_first = MM_rsCount
  End If
  If (edit_last > MM_rsCount) Then
    edit_last = MM_rsCount
  End If
End If

' set the boolean used by hide region to check if we are on the last record
MM_atTotal = (MM_rsCount <> -1 And MM_offset + MM_size >= MM_rsCount)
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
  MM_editTable = "art"
  MM_editColumn = "id"
  MM_recordId = "" + Request.Form("MM_recordId") + ""
  MM_editRedirectUrl = "../seccess.html"
  MM_fieldsStr  = "article_title|value|article_writer|value|article_time|value|article_num|value|article_belong|value|article_content|value"
  MM_columnsStr = "article_title|',none,''|article_writer|',none,''|article_time|',none,NULL|article_num|',none,''|article_belong|',none,''|article_content|',none,''"

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
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>编辑日志</title>
<link href="../css/default.css" rel="stylesheet" type="text/css" />
</head>

<body>
<form id="form1" name="form1" method="POST" action="<%=MM_editAction%>">
  <table width="620" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="100">标题 <font color="#FF0000">*</font></td>
      <td><label>
        <input name="article_title" type="text" id="article_title" value="<%=(edit.Fields.Item("article_title").Value)%>" size="50" />
      </label></td>
    </tr>
    <tr>
      <td>作者 <font color="#FF0000">*</font></td>
      <td><label>
        <input name="article_writer" type="text" id="article_writer" value="<%=(edit.Fields.Item("article_writer").Value)%>" size="50" />
      </label></td>
    </tr>
    <tr>
      <td>时间 <font color="#FF0000">*</font></td>
      <td><label>
        <input name="article_time" type="text" id="article_time" value="<%=(edit.Fields.Item("article_time").Value)%>" size="50" />
      </label></td>
    </tr>
    <tr>
      <td>编号 <font color="#FF0000">*</font></td>
      <td><input name="article_num" type="text" id="article_num" value="<%=(edit.Fields.Item("article_num").Value)%>" size="20" /></td>
    </tr>
    <tr>
      <td>分类 <font color="#FF0000">*</font></td>
      <td><label>
        <input name="article_belong" type="text" id="article_belong" value="<%=(edit.Fields.Item("article_belong").Value)%>" size="20" />
      </label>
可选分类：
<% 
While ((Repeat1__numRows <> 0) AND (NOT belong.EOF)) 
%>
  <%=(belong.Fields.Item("belong").Value)%>&nbsp;
  <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  belong.MoveNext()
Wend
%></td>
    </tr>
    <tr>
      <td>内容 <font color="#FF0000">*</font></td>
      <td><textarea name="article_content" cols="80" rows="18" id="article_content"><%=(edit.Fields.Item("article_content").Value)%></textarea></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <!--提示输入信息-->
<script language=JavaScript> 
function doSubmit(){ 
if (document.form1.article_title.value==""){ 
alert("请填写日志标题"); 
return false; 
} 
else if (document.form1.article_writer.value==""){ 
alert("请填写日志作者"); 
return false; 
} 
else if (document.form1.article_time.value==""){ 
alert("请填写日志时间"); 
return false; 
} 
else if (document.form1.article_num.value==""){ 
alert("请填写日志编号"); 
return false; 
} 
else if (document.form1.article_belong.value==""){ 
alert("请填写日志分类"); 
return false; 
} 
else if (document.form1.article_content.value==""){ 
alert("请填写日志内容"); 
return false; 
} 
document.form1.submit(); 
} 
</script> 
<!--提示输入信息-->

          <input type="button" name="btnSubmit" onClick="doSubmit()" value="完成编辑" />
      </label></td>
    </tr>
  </table>

    <input type="hidden" name="MM_update" value="form1">
  <input type="hidden" name="MM_recordId" value="<%= edit.Fields.Item("id").Value %>">
</form>
</body>
</html>
<%
edit.Close()
Set edit = Nothing
%>
<%
belong.Close()
Set belong = Nothing
%>
