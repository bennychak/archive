<%@LANGUAGE="VBSCRIPT"%>
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
' *** Delete Record: declare variables

if (CStr(Request("MM_delete")) = "del" And CStr(Request("MM_recordId")) <> "") Then

  MM_editConnection = MM_bien_STRING
  MM_editTable = "art"
  MM_editColumn = "id"
  MM_recordId = "" + Request.Form("MM_recordId") + ""
  MM_editRedirectUrl = "../seccess.html"

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
' *** Delete Record: construct a sql delete statement and execute it

If (CStr(Request("MM_delete")) <> "" And CStr(Request("MM_recordId")) <> "") Then

  ' create the sql delete statement
  MM_editQuery = "delete from " & MM_editTable & " where " & MM_editColumn & " = " & MM_recordId

  If (Not MM_abortEdit) Then
    ' execute the delete
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
Dim del
Dim del_numRows

Set del = Server.CreateObject("ADODB.Recordset")
del.ActiveConnection = MM_bien_STRING
del.Source = "SELECT * FROM art"
del.CursorType = 0
del.CursorLocation = 2
del.LockType = 1
del.Open()

del_numRows = 0
%>
<%
'  *** Recordset Stats, Move To Record, and Go To Record: declare stats variables

Dim del_total
Dim del_first
Dim del_last

' set the record count
del_total = del.RecordCount

' set the number of rows displayed on this page
If (del_numRows < 0) Then
  del_numRows = del_total
Elseif (del_numRows = 0) Then
  del_numRows = 1
End If

' set the first and last displayed record
del_first = 1
del_last  = del_first + del_numRows - 1

' if we have the correct record count, check the other stats
If (del_total <> -1) Then
  If (del_first > del_total) Then
    del_first = del_total
  End If
  If (del_last > del_total) Then
    del_last = del_total
  End If
  If (del_numRows > del_total) Then
    del_numRows = del_total
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

Set MM_rs    = del
MM_rsCount   = del_total
MM_size      = del_numRows
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
del_first = MM_offset + 1
del_last  = MM_offset + MM_size

If (MM_rsCount <> -1) Then
  If (del_first > MM_rsCount) Then
    del_first = MM_rsCount
  End If
  If (del_last > MM_rsCount) Then
    del_last = MM_rsCount
  End If
End If

' set the boolean used by hide region to check if we are on the last record
MM_atTotal = (MM_rsCount <> -1 And MM_offset + MM_size >= MM_rsCount)
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>删除日志</title>
<link href="../css/default.css" rel="stylesheet" type="text/css" />
</head>

<body>
<form ACTION="<%=MM_editAction%>" METHOD="POST" id="del" name="del">
  <table width="620" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="100">标题</td>
      <td><label>
        <input name="article_title" type="text" id="article_title" value="<%=(del.Fields.Item("article_title").Value)%>" size="50" />
      </label></td>
    </tr>
    <tr>
      <td>作者</td>
      <td><label>
        <input name="article_writer" type="text" id="article_writer" value="<%=(del.Fields.Item("article_writer").Value)%>" size="50" />
      </label></td>
    </tr>
    <tr>
      <td>时间</td>
      <td><label>
        <input name="article_time" type="text" id="article_time" value="<%=(del.Fields.Item("article_time").Value)%>" size="50" />
      </label></td>
    </tr>
    <tr>
      <td>编号</td>
      <td><input name="article_num" type="text" id="article_num" value="<%=(del.Fields.Item("article_num").Value)%>" size="20" /></td>
    </tr>
    <tr>
      <td>分类</td>
      <td><label>
        <input name="article_belong" type="text" id="article_belong" value="<%=(del.Fields.Item("article_belong").Value)%>" size="20" />
      </label></td>
    </tr>
    <tr>
      <td>内容</td>
      <td><label>
        <textarea name="article_content" cols="80" rows="18" id="article_content"><%=(del.Fields.Item("article_content").Value)%></textarea>
      </label></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
                <!--提示输入信息-->
<script language=JavaScript> 
function doSubmit(){ 
if (document.del.article_title.value==""){ 
alert("内容请勿留空，点击确认删除按钮即可删除日志"); 
return false; 
} 
else if (document.del.article_writer.value==""){ 
alert("内容请勿留空，点击确认删除按钮即可删除日志"); 
return false; 
} 
else if (document.del.article_time.value==""){ 
alert("内容请勿留空，点击确认删除按钮即可删除日志"); 
return false; 
} 
else if (document.del.article_num.value==""){ 
alert("内容请勿留空，点击确认删除按钮即可删除日志"); 
return false; 
} 
else if (document.del.article_belong.value==""){ 
alert("内容请勿留空，点击确认删除按钮即可删除日志"); 
return false; 
} 
else if (document.del.article_content.value==""){ 
alert("内容请勿留空，点击确认删除按钮即可删除日志"); 
return false; 
} 
document.del.submit(); 
} 
</script> 
<!--提示输入信息-->

          <input type="button" name="btnSubmit" onClick="doSubmit()" value="确认删除" />
      </label></td>
    </tr>
  </table>

    
  

    
  

    <input type="hidden" name="MM_delete" value="del">
  <input type="hidden" name="MM_recordId" value="<%= del.Fields.Item("id").Value %>">
</form>
</body>
</html>
<%
del.Close()
Set del = Nothing
%>
