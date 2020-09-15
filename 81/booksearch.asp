<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="Connections/bien.asp" -->
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
Dim booklist__bookselect
booklist__bookselect = "1"
If (Request.QueryString("bookselect")  <> "") Then 
  booklist__bookselect = Request.QueryString("bookselect") 
End If
%>
<%
Dim booklist__booksearch
booklist__booksearch = "1"
If (Request.QueryString("booksearch")  <> "") Then 
  booklist__booksearch = Request.QueryString("booksearch") 
End If
%>
<%
Dim booklist
Dim booklist_numRows

Set booklist = Server.CreateObject("ADODB.Recordset")
booklist.ActiveConnection = MM_bien_STRING
booklist.Source = "SELECT *  FROM book  WHERE " + Replace(booklist__bookselect, "'", "''") + " like '%" + Replace(booklist__booksearch, "'", "''") + "%'  ORDER BY id DESC"
booklist.CursorType = 0
booklist.CursorLocation = 2
booklist.LockType = 1
booklist.Open()

booklist_numRows = 0
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
Dim webcollect
Dim webcollect_numRows

Set webcollect = Server.CreateObject("ADODB.Recordset")
webcollect.ActiveConnection = MM_bien_STRING
webcollect.Source = "SELECT * FROM web"
webcollect.CursorType = 0
webcollect.CursorLocation = 2
webcollect.LockType = 1
webcollect.Open()

webcollect_numRows = 0
%>
<%
Dim Repeat3__numRows
Dim Repeat3__index

Repeat3__numRows = -1
Repeat3__index = 0
link_numRows = link_numRows + Repeat3__numRows
%>
<%
Dim Repeat5__numRows
Dim Repeat5__index

Repeat5__numRows = -1
Repeat5__index = 0
webcollect_numRows = webcollect_numRows + Repeat5__numRows
%>
<%
Dim Repeat2__numRows
Dim Repeat2__index

Repeat2__numRows = -1
Repeat2__index = 0
booklist_numRows = booklist_numRows + Repeat2__numRows
%>
<%
'  *** Recordset Stats, Move To Record, and Go To Record: declare stats variables

Dim booklist_total
Dim booklist_first
Dim booklist_last

' set the record count
booklist_total = booklist.RecordCount

' set the number of rows displayed on this page
If (booklist_numRows < 0) Then
  booklist_numRows = booklist_total
Elseif (booklist_numRows = 0) Then
  booklist_numRows = 1
End If

' set the first and last displayed record
booklist_first = 1
booklist_last  = booklist_first + booklist_numRows - 1

' if we have the correct record count, check the other stats
If (booklist_total <> -1) Then
  If (booklist_first > booklist_total) Then
    booklist_first = booklist_total
  End If
  If (booklist_last > booklist_total) Then
    booklist_last = booklist_total
  End If
  If (booklist_numRows > booklist_total) Then
    booklist_numRows = booklist_total
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

Set MM_rs    = booklist
MM_rsCount   = booklist_total
MM_size      = booklist_numRows
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
booklist_first = MM_offset + 1
booklist_last  = MM_offset + MM_size

If (MM_rsCount <> -1) Then
  If (booklist_first > MM_rsCount) Then
    booklist_first = MM_rsCount
  End If
  If (booklist_last > MM_rsCount) Then
    booklist_last = MM_rsCount
  End If
End If

' set the boolean used by hide region to check if we are on the last record
MM_atTotal = (MM_rsCount <> -1 And MM_offset + MM_size >= MM_rsCount)
%>
<%
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = -1
Repeat1__index = 0
belong_numRows = belong_numRows + Repeat1__numRows
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=(base.Fields.Item("blogtitle").Value)%> - 书架</title>
<LINK href="css/default.css" type=text/css rel=stylesheet>
</head>
<body marginheight="0" marginwidth="0" leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0">
<!--#include file="inc/topmusic.inc" -->
<!--#include file="inc/head.inc" -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td height="100%" align="center" valign="top">
    <!--#include file="inc/head2.inc" -->

	<table cellpadding="0" cellspacing="0" border="0"><tr><td height=100% width=16></td>
<td><table width="800" border="1" cellpadding="0" cellspacing="0">
<tr>
  <td height="30" colspan="6" background="image/bg.gif"><span class="diary_title">&nbsp;<%=(base.Fields.Item("blogtitle").Value)%>的书架 - 搜索结果</span> </td>
</tr>
<tr>
<td height="30" colspan="6" align="center" valign="middle">
	<form action="booksearch.asp" method="get" name="form1" target="_top" id="form1">
	 <br>
	  <input name="booksearch" type="text" size="30" />
        <label>
        <select name="bookselect" id="bookselect">
          <option value="book_name">书名</option>
          <option value="book_press">出版社</option>
          <option value="book_author">作者</option>
          <option value="book_class">分类</option>
          <option value="book_presstime">出版时间</option>
        </select>
        </label>
        <label>
        <input type="submit" name="Submit" value="重新搜索" />
        </label>
    </form></td>
</tr>
  <tr>
    <td height="30" background="image/bg.gif" class="diary_datetitle">ID</td>
    <td background="image/bg.gif" class="diary_datetitle">书名</td>
    <td background="image/bg.gif" class="diary_datetitle">出版社</td>
    <td background="image/bg.gif" class="diary_datetitle">作者</td>
    <td background="image/bg.gif" class="diary_datetitle">分类</td>
    <td background="image/bg.gif" class="diary_datetitle">出版时间</td>
    </tr>
  <% 
While ((Repeat2__numRows <> 0) AND (NOT booklist.EOF)) 
%>
    <tr onMouseOver="this.bgColor='#EEEFFF'" onMouseOut="this.bgColor='#ffffff'">
      <td height="30" align="left">&nbsp;<%=(booklist.Fields.Item("id").Value)%></td>
      <td align="left">&nbsp;<%=(booklist.Fields.Item("book_name").Value)%></td>
      <td align="left">&nbsp;<%=(booklist.Fields.Item("book_press").Value)%></td>
      <td align="left">&nbsp;<%=(booklist.Fields.Item("book_author").Value)%></td>
      <td align="left">&nbsp;<%=(booklist.Fields.Item("book_class").Value)%></td>
      <td align="left">&nbsp;<%=(booklist.Fields.Item("book_presstime").Value)%></td>
      </tr>
    <% 
  Repeat2__index=Repeat2__index+1
  Repeat2__numRows=Repeat2__numRows-1
  booklist.MoveNext()
Wend
%>
</table><br></td>
<td width="10">&nbsp;</td>
	</tr classid=CLSID:CFCDAA03-8BE4-11CF-B84B-0020AFBBCCFA></table></td>
<!--#include file="inc/fish.inc" -->
</tr>
</table>
<!--#include file="inc/foot.inc" -->
</body>
</html>
<%
booklist.Close()
Set booklist = Nothing
%>
<%
link.Close()
Set link = Nothing
%>
<%
belong.Close()
Set belong = Nothing
%>
<%
webcollect.Close()
Set webcollect = Nothing
%>
<%
base.Close()
Set base = Nothing
%>