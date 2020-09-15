<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="Connections/bien.asp" -->
<%
Dim title
Dim title_numRows

Set title = Server.CreateObject("ADODB.Recordset")
title.ActiveConnection = MM_bien_STRING
title.Source = "SELECT article_title, id FROM art ORDER BY article_time DESC"
title.CursorType = 0
title.CursorLocation = 2
title.LockType = 1
title.Open()

title_numRows = 0
%>
<%
Dim art
Dim art_numRows

Set art = Server.CreateObject("ADODB.Recordset")
art.ActiveConnection = MM_bien_STRING
art.Source = "SELECT * FROM art ORDER BY article_time DESC"
art.CursorType = 0
art.CursorLocation = 2
art.LockType = 1
art.Open()

art_numRows = 0
%>
<%
Dim comment
Dim comment_numRows

Set comment = Server.CreateObject("ADODB.Recordset")
comment.ActiveConnection = MM_bien_STRING
comment.Source = "SELECT comment_articleid, comment_date, comment_name, id FROM comment ORDER BY comment_date DESC"
comment.CursorType = 0
comment.CursorLocation = 2
comment.LockType = 1
comment.Open()

comment_numRows = 0
%>
<%
Dim guest
Dim guest_numRows

Set guest = Server.CreateObject("ADODB.Recordset")
guest.ActiveConnection = MM_bien_STRING
guest.Source = "SELECT id, main, name, time FROM guest ORDER BY time DESC"
guest.CursorType = 0
guest.CursorLocation = 2
guest.LockType = 1
guest.Open()

guest_numRows = 0
%>
<%
Dim link
Dim link_numRows

Set link = Server.CreateObject("ADODB.Recordset")
link.ActiveConnection = MM_bien_STRING
link.Source = "SELECT * FROM link ORDER BY id DESC"
link.CursorType = 0
link.CursorLocation = 2
link.LockType = 1
link.Open()

link_numRows = 0
%>
<%
Dim web
Dim web_numRows

Set web = Server.CreateObject("ADODB.Recordset")
web.ActiveConnection = MM_bien_STRING
web.Source = "SELECT * FROM web ORDER BY id DESC"
web.CursorType = 0
web.CursorLocation = 2
web.LockType = 1
web.Open()

web_numRows = 0
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
<%
Dim belong
Dim belong_numRows

Set belong = Server.CreateObject("ADODB.Recordset")
belong.ActiveConnection = MM_bien_STRING
belong.Source = "SELECT * FROM belong ORDER BY id DESC"
belong.CursorType = 0
belong.CursorLocation = 2
belong.LockType = 1
belong.Open()

belong_numRows = 0
%>
<%
Dim guaiguai
Dim guaiguai_numRows

Set guaiguai = Server.CreateObject("ADODB.Recordset")
guaiguai.ActiveConnection = MM_bien_STRING
guaiguai.Source = "SELECT guaiguai_article_time, guaiguai_article_title FROM guaiguai_article ORDER BY guaiguai_article_time DESC"
guaiguai.CursorType = 0
guaiguai.CursorLocation = 2
guaiguai.LockType = 1
guaiguai.Open()

guaiguai_numRows = 0
%>
<%
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = 10
Repeat1__index = 0
title_numRows = title_numRows + Repeat1__numRows
%>
<%
Dim Repeat4__numRows
Dim Repeat4__index

Repeat4__numRows = 10
Repeat4__index = 0
web_numRows = web_numRows + Repeat4__numRows
%>
<%
Dim Repeat2__numRows
Dim Repeat2__index

Repeat2__numRows = -1
Repeat2__index = 0
art_numRows = art_numRows + Repeat2__numRows
%>
<%
Dim Repeat5__numRows
Dim Repeat5__index

Repeat5__numRows = -1
Repeat5__index = 0
belong_numRows = belong_numRows + Repeat5__numRows
%>
<%
Dim Repeat3__numRows
Dim Repeat3__index

Repeat3__numRows = 10
Repeat3__index = 0
link_numRows = link_numRows + Repeat3__numRows
%>
<%
'  *** Recordset Stats, Move To Record, and Go To Record: declare stats variables

Dim art_total
Dim art_first
Dim art_last

' set the record count
art_total = art.RecordCount

' set the number of rows displayed on this page
If (art_numRows < 0) Then
  art_numRows = art_total
Elseif (art_numRows = 0) Then
  art_numRows = 1
End If

' set the first and last displayed record
art_first = 1
art_last  = art_first + art_numRows - 1

' if we have the correct record count, check the other stats
If (art_total <> -1) Then
  If (art_first > art_total) Then
    art_first = art_total
  End If
  If (art_last > art_total) Then
    art_last = art_total
  End If
  If (art_numRows > art_total) Then
    art_numRows = art_total
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

Set MM_rs    = art
MM_rsCount   = art_total
MM_size      = art_numRows
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
art_first = MM_offset + 1
art_last  = MM_offset + MM_size

If (MM_rsCount <> -1) Then
  If (art_first > MM_rsCount) Then
    art_first = MM_rsCount
  End If
  If (art_last > MM_rsCount) Then
    art_last = MM_rsCount
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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(base.Fields.Item("blogtitle").Value)%></title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!--#include file="inc/bien_head.asp" -->
  <div id="bien_rightmain">
		<ul>
          <% 
While ((Repeat2__numRows <> 0) AND (NOT art.EOF)) 
%>
          <li><A HREF="article.asp?<%= Server.HTMLEncode(MM_keepNone) & MM_joinChar(MM_keepNone) & "id=" & art.Fields.Item("id").Value %>"><%=(art.Fields.Item("article_time").Value)%>&nbsp;&nbsp;<%=(art.Fields.Item("article_title").Value)%>&nbsp;&nbsp;<%=(art.Fields.Item("article_num").Value)%></A></li>
            <% 
  Repeat2__index=Repeat2__index+1
  Repeat2__numRows=Repeat2__numRows-1
  art.MoveNext()
Wend
%>
</ul>
<div class="bien_clear"></div>
  </div>
  <div id="bien_bottom">
<div class="bien_article_title bien_top4">”—«È¡¥Ω”</div>
<div class="linktop">
        <% 
While ((Repeat3__numRows <> 0) AND (NOT link.EOF)) 
%>
        <a href="<%=(link.Fields.Item("link").Value)%>" target="_blank"><%=(link.Fields.Item("name").Value)%></a> | 
          <% 
  Repeat3__index=Repeat3__index+1
  Repeat3__numRows=Repeat3__numRows-1
  link.MoveNext()
Wend
%>
</div>
<div class="bien_article_title bien_top4">Õ¯÷∑¡¥Ω”</div>
<div class="linktop">
        <% 
While ((Repeat4__numRows <> 0) AND (NOT web.EOF)) 
%>
        <a href="<%=(web.Fields.Item("web_link").Value)%>" target="_blank"><%=(web.Fields.Item("web_name").Value)%></a> | 
          <% 
  Repeat4__index=Repeat4__index+1
  Repeat4__numRows=Repeat4__numRows-1
  web.MoveNext()
Wend
%></div>
</div>
<div class="bien_clear"></div>
</body>
</html>
<%
title.Close()
Set title = Nothing
%>
<%
art.Close()
Set art = Nothing
%>
<%
comment.Close()
Set comment = Nothing
%>
<%
guest.Close()
Set guest = Nothing
%>
<%
link.Close()
Set link = Nothing
%>
<%
web.Close()
Set web = Nothing
%>
<%
base.Close()
Set base = Nothing
%>
<%
belong.Close()
Set belong = Nothing
%>
<%
guaiguai.Close()
Set guaiguai = Nothing
%>
