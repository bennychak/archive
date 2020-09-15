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
Dim list
Dim list_numRows

Set list = Server.CreateObject("ADODB.Recordset")
list.ActiveConnection = MM_bien_STRING
list.Source = "SELECT * FROM art ORDER BY article_time DESC"
list.CursorType = 0
list.CursorLocation = 2
list.LockType = 1
list.Open()

list_numRows = 0
%>
<%
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = 30
Repeat1__index = 0
list_numRows = list_numRows + Repeat1__numRows
%>
<%
'  *** Recordset Stats, Move To Record, and Go To Record: declare stats variables

Dim list_total
Dim list_first
Dim list_last

' set the record count
list_total = list.RecordCount

' set the number of rows displayed on this page
If (list_numRows < 0) Then
  list_numRows = list_total
Elseif (list_numRows = 0) Then
  list_numRows = 1
End If

' set the first and last displayed record
list_first = 1
list_last  = list_first + list_numRows - 1

' if we have the correct record count, check the other stats
If (list_total <> -1) Then
  If (list_first > list_total) Then
    list_first = list_total
  End If
  If (list_last > list_total) Then
    list_last = list_total
  End If
  If (list_numRows > list_total) Then
    list_numRows = list_total
  End If
End If
%>
<%
' *** Recordset Stats: if we don't know the record count, manually count them

If (list_total = -1) Then

  ' count the total records by iterating through the recordset
  list_total=0
  While (Not list.EOF)
    list_total = list_total + 1
    list.MoveNext
  Wend

  ' reset the cursor to the beginning
  If (list.CursorType > 0) Then
    list.MoveFirst
  Else
    list.Requery
  End If

  ' set the number of rows displayed on this page
  If (list_numRows < 0 Or list_numRows > list_total) Then
    list_numRows = list_total
  End If

  ' set the first and last displayed record
  list_first = 1
  list_last = list_first + list_numRows - 1
  
  If (list_first > list_total) Then
    list_first = list_total
  End If
  If (list_last > list_total) Then
    list_last = list_total
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

Set MM_rs    = list
MM_rsCount   = list_total
MM_size      = list_numRows
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
' *** Move To Record: handle 'index' or 'offset' parameter

if (Not MM_paramIsDefined And MM_rsCount <> 0) then

  ' use index parameter if defined, otherwise use offset parameter
  MM_param = Request.QueryString("index")
  If (MM_param = "") Then
    MM_param = Request.QueryString("offset")
  End If
  If (MM_param <> "") Then
    MM_offset = Int(MM_param)
  End If

  ' if we have a record count, check if we are past the end of the recordset
  If (MM_rsCount <> -1) Then
    If (MM_offset >= MM_rsCount Or MM_offset = -1) Then  ' past end or move last
      If ((MM_rsCount Mod MM_size) > 0) Then         ' last page not a full repeat region
        MM_offset = MM_rsCount - (MM_rsCount Mod MM_size)
      Else
        MM_offset = MM_rsCount - MM_size
      End If
    End If
  End If

  ' move the cursor to the selected record
  MM_index = 0
  While ((Not MM_rs.EOF) And (MM_index < MM_offset Or MM_offset = -1))
    MM_rs.MoveNext
    MM_index = MM_index + 1
  Wend
  If (MM_rs.EOF) Then 
    MM_offset = MM_index  ' set MM_offset to the last possible record
  End If

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
list_first = MM_offset + 1
list_last  = MM_offset + MM_size

If (MM_rsCount <> -1) Then
  If (list_first > MM_rsCount) Then
    list_first = MM_rsCount
  End If
  If (list_last > MM_rsCount) Then
    list_last = MM_rsCount
  End If
End If

' set the boolean used by hide region to check if we are on the last record
MM_atTotal = (MM_rsCount <> -1 And MM_offset + MM_size >= MM_rsCount)
%>
<%
' *** Go To Record and Move To Record: create strings for maintaining URL and Form parameters

Dim MM_keepNone
Dim MM_keepURL
Dim MM_keepForm
Dim MM_keepBoth

Dim MM_removeList
Dim MM_item
Dim MM_nextItem

' create the list of parameters which should not be maintained
MM_removeList = "&index="
If (MM_paramName <> "") Then
  MM_removeList = MM_removeList & "&" & MM_paramName & "="
End If

MM_keepURL=""
MM_keepForm=""
MM_keepBoth=""
MM_keepNone=""

' add the URL parameters to the MM_keepURL string
For Each MM_item In Request.QueryString
  MM_nextItem = "&" & MM_item & "="
  If (InStr(1,MM_removeList,MM_nextItem,1) = 0) Then
    MM_keepURL = MM_keepURL & MM_nextItem & Server.URLencode(Request.QueryString(MM_item))
  End If
Next

' add the Form variables to the MM_keepForm string
For Each MM_item In Request.Form
  MM_nextItem = "&" & MM_item & "="
  If (InStr(1,MM_removeList,MM_nextItem,1) = 0) Then
    MM_keepForm = MM_keepForm & MM_nextItem & Server.URLencode(Request.Form(MM_item))
  End If
Next

' create the Form + URL string and remove the intial '&' from each of the strings
MM_keepBoth = MM_keepURL & MM_keepForm
If (MM_keepBoth <> "") Then 
  MM_keepBoth = Right(MM_keepBoth, Len(MM_keepBoth) - 1)
End If
If (MM_keepURL <> "")  Then
  MM_keepURL  = Right(MM_keepURL, Len(MM_keepURL) - 1)
End If
If (MM_keepForm <> "") Then
  MM_keepForm = Right(MM_keepForm, Len(MM_keepForm) - 1)
End If

' a utility function used for adding additional parameters to these strings
Function MM_joinChar(firstItem)
  If (firstItem <> "") Then
    MM_joinChar = "&"
  Else
    MM_joinChar = ""
  End If
End Function
%>
<%
' *** Move To Record: set the strings for the first, last, next, and previous links

Dim MM_keepMove
Dim MM_moveParam
Dim MM_moveFirst
Dim MM_moveLast
Dim MM_moveNext
Dim MM_movePrev

Dim MM_urlStr
Dim MM_paramList
Dim MM_paramIndex
Dim MM_nextParam

MM_keepMove = MM_keepBoth
MM_moveParam = "index"

' if the page has a repeated region, remove 'offset' from the maintained parameters
If (MM_size > 1) Then
  MM_moveParam = "offset"
  If (MM_keepMove <> "") Then
    MM_paramList = Split(MM_keepMove, "&")
    MM_keepMove = ""
    For MM_paramIndex = 0 To UBound(MM_paramList)
      MM_nextParam = Left(MM_paramList(MM_paramIndex), InStr(MM_paramList(MM_paramIndex),"=") - 1)
      If (StrComp(MM_nextParam,MM_moveParam,1) <> 0) Then
        MM_keepMove = MM_keepMove & "&" & MM_paramList(MM_paramIndex)
      End If
    Next
    If (MM_keepMove <> "") Then
      MM_keepMove = Right(MM_keepMove, Len(MM_keepMove) - 1)
    End If
  End If
End If

' set the strings for the move to links
If (MM_keepMove <> "") Then 
  MM_keepMove = Server.HTMLEncode(MM_keepMove) & "&"
End If

MM_urlStr = Request.ServerVariables("URL") & "?" & MM_keepMove & MM_moveParam & "="

MM_moveFirst = MM_urlStr & "0"
MM_moveLast  = MM_urlStr & "-1"
MM_moveNext  = MM_urlStr & CStr(MM_offset + MM_size)
If (MM_offset - MM_size < 0) Then
  MM_movePrev = MM_urlStr & "0"
Else
  MM_movePrev = MM_urlStr & CStr(MM_offset - MM_size)
End If
%>
<%
Dim list_TFMcurrentPage
Dim list_TFMtotalPages
If MM_size > 0 Then
list_TFMcurrentPage = Round(list_last/MM_size + .4999)
list_TFMtotalPages = Round(list_total/MM_size + .4999)
End If
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>编辑列表</title>
<link href="../css/default.css" rel="stylesheet" type="text/css" />
</head>

<body>
<form id="form1" name="form1" method="post" action="">
  <table bgcolor="#CCCCCC" cellspacing="1" cellpadding="4">
           <tr bgcolor="#FFFFEE" class="diary_datetitle">
             <td width="100">分类</td>
             <td width="200">时间</td>
             <td>标题</td>
          <td width="60">动作</td>
        </tr>
    <% 
While ((Repeat1__numRows <> 0) AND (NOT list.EOF)) 
%>		
      <tr bgcolor="#FFFFFF">
        <td bgcolor="#EEEFFF"><a href="../blog.asp?<%= Server.HTMLEncode(MM_keepNone) & MM_joinChar(MM_keepNone) & "id=" & list.Fields.Item("id").Value %>" target="_blank">&nbsp;&nbsp;<%=(list.Fields.Item("article_belong").Value)%></a></td>
        <td><a href="../blog.asp?<%= Server.HTMLEncode(MM_keepNone) & MM_joinChar(MM_keepNone) & "id=" & list.Fields.Item("id").Value %>" target="_blank">&nbsp;&nbsp;<%=(list.Fields.Item("article_time").Value)%></a></td>
        <td bgcolor="#EEEFFF"><A HREF="../blog.asp?<%= Server.HTMLEncode(MM_keepNone) & MM_joinChar(MM_keepNone) & "id=" & list.Fields.Item("id").Value %>" target="_blank"> &nbsp;&nbsp;<%=(list.Fields.Item("article_title").Value)%></A></td>
        <td align="center"><label><A HREF="edit.asp?<%= Server.HTMLEncode(MM_keepNone) & MM_joinChar(MM_keepNone) & "id=" & list.Fields.Item("id").Value %>" target="_self">编辑</A></label>
          <A HREF="del.asp?<%= Server.HTMLEncode(MM_keepNone) & MM_joinChar(MM_keepNone) & "id=" & list.Fields.Item("id").Value %>">删除</A></td>
      </tr>
      <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  list.MoveNext()
Wend
%>

    <tr bgcolor="#FFFFFF">
      <td>&nbsp;</td>
          <td colspan="2"><% If MM_offset <> 0 Then %>
          <A HREF="<%=MM_moveFirst%>">首页</A>
          <% End If ' end MM_offset <> 0 %>
        <% If MM_offset <> 0 Then %>
          <A HREF="<%=MM_movePrev%>">上一页</A>
          <% End If ' end MM_offset <> 0 %>
          <%
TFM_MiddlePages = 10
TFM_startLink = MM_offset/MM_size - int(TFM_middlePages/2)
TFM_endLink = MM_offset/MM_size + int(TFM_middlePages/2) 
If TFM_MiddlePages/2 <> int(TFM_MiddlePages/2) Then TFM_endLink = TFM_endLink + 1
If TFM_startLink < 0 then 
   TFM_startLink = 0
   TFM_endLink = TFM_middlePages 
End If
TFM_LimitCounter = 0
For i = 1 to list_total Step MM_size
TFM_LimitCounter = TFM_LimitCounter + 1
TFM_LimitPageEndCount = i + MM_size - 1
if TFM_LimitPageEndCount > list_total Then TFM_LimitPageEndCount = list_total
If TFM_LimitCounter > TFM_startLink AND TFM_LimitCounter <= TFM_endLink Then
if i <> MM_offset + 1 then
Response.Write("<a href=""" & Request.ServerVariables("URL") & "?" & MM_keepMove & "offset=" & i-1 & """>")
Response.Write(TFM_LimitCounter & "</a>")
else
Response.Write("<b><font color=#CCCCCC>" & TFM_LimitCounter & "</font></b>")
End if
if(TFM_LimitPageEndCount <> list_total AND TFM_endLink <> TFM_LimitCounter) then Response.Write("︱")
end if
next
%>
<% If Not MM_atTotal Then %>
          <A HREF="<%=MM_moveNext%>">下一页</A>
          <% End If ' end Not MM_atTotal %>
        <% If Not MM_atTotal Then %>
          <A HREF="<%=MM_moveLast%>">末页</A>
          <% End If ' end Not MM_atTotal %> 
      共<%=(list_total)%>篇日志，当前显示第<%=(list_first)%>至第<%=(list_last)%>篇</td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form>
</body>
</html>
<%
list.Close()
Set list = Nothing
%>
