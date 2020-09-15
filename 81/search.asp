<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="Connections/bien.asp" -->
<%
Dim artlist__MM_text
artlist__MM_text = "1"
If (request.QueryString("search")   <> "") Then 
  artlist__MM_text = request.QueryString("search")  
End If
%>
<%
Dim artlist__MM_sch
artlist__MM_sch = "1"
If (request.QueryString("select")   <> "") Then 
  artlist__MM_sch = request.QueryString("select")  
End If
%>
<%
Dim artlist
Dim artlist_numRows

Set artlist = Server.CreateObject("ADODB.Recordset")
artlist.ActiveConnection = MM_bien_STRING
artlist.Source = "SELECT *  FROM art  WHERE " + Replace(artlist__MM_sch, "'", "''") + " LIKE '%" + Replace(artlist__MM_text, "'", "''") + "%'  ORDER BY article_time DESC"
artlist.CursorType = 0
artlist.CursorLocation = 2
artlist.LockType = 1
artlist.Open()

artlist_numRows = 0
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
Dim link
Dim link_numRows

Set link = Server.CreateObject("ADODB.Recordset")
link.ActiveConnection = MM_bien_STRING
link.Source = "SELECT * FROM link ORDER BY id ASC"
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
belong.Source = "SELECT * FROM belong ORDER BY id ASC"
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
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = 50
Repeat1__index = 0
artlist_numRows = artlist_numRows + Repeat1__numRows
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

Repeat2__numRows = 10
Repeat2__index = 0
artlist_numRows = artlist_numRows + Repeat2__numRows
%>
<%
'  *** Recordset Stats, Move To Record, and Go To Record: declare stats variables

Dim artlist_total
Dim artlist_first
Dim artlist_last

' set the record count
artlist_total = artlist.RecordCount

' set the number of rows displayed on this page
If (artlist_numRows < 0) Then
  artlist_numRows = artlist_total
Elseif (artlist_numRows = 0) Then
  artlist_numRows = 1
End If

' set the first and last displayed record
artlist_first = 1
artlist_last  = artlist_first + artlist_numRows - 1

' if we have the correct record count, check the other stats
If (artlist_total <> -1) Then
  If (artlist_first > artlist_total) Then
    artlist_first = artlist_total
  End If
  If (artlist_last > artlist_total) Then
    artlist_last = artlist_total
  End If
  If (artlist_numRows > artlist_total) Then
    artlist_numRows = artlist_total
  End If
End If
%>

<%
' *** Recordset Stats: if we don't know the record count, manually count them

If (artlist_total = -1) Then

  ' count the total records by iterating through the recordset
  artlist_total=0
  While (Not artlist.EOF)
    artlist_total = artlist_total + 1
    artlist.MoveNext
  Wend

  ' reset the cursor to the beginning
  If (artlist.CursorType > 0) Then
    artlist.MoveFirst
  Else
    artlist.Requery
  End If

  ' set the number of rows displayed on this page
  If (artlist_numRows < 0 Or artlist_numRows > artlist_total) Then
    artlist_numRows = artlist_total
  End If

  ' set the first and last displayed record
  artlist_first = 1
  artlist_last = artlist_first + artlist_numRows - 1
  
  If (artlist_first > artlist_total) Then
    artlist_first = artlist_total
  End If
  If (artlist_last > artlist_total) Then
    artlist_last = artlist_total
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

Set MM_rs    = artlist
MM_rsCount   = artlist_total
MM_size      = artlist_numRows
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
artlist_first = MM_offset + 1
artlist_last  = MM_offset + MM_size

If (MM_rsCount <> -1) Then
  If (artlist_first > MM_rsCount) Then
    artlist_first = MM_rsCount
  End If
  If (artlist_last > MM_rsCount) Then
    artlist_last = MM_rsCount
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=(base.Fields.Item("blogtitle").Value)%> - 搜索结果</title>
<LINK href="css/default.css" type=text/css rel=stylesheet>
<style type="text/css">
<!--
.STYLE1 {color: #003562}
-->
</style>
</head>
<body marginheight="0" marginwidth="0" leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0">
<!--#include file="inc/topmusic.inc" -->
<!--#include file="inc/head.inc" -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td height="100%" valign="top">
    <!--#include file="inc/head2.inc" -->
  <table cellpadding="0" cellspacing="0" border="0"><tr><td height=100% width=20></td>
            <td width="1100"><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr class="diary_datetitle">
            <td height="30" colspan="5" align=center background="image/bg.gif" class="diary_datetitle">“<%=request.QueryString("search")%>”的搜索结果</td>
          </tr>
       
              <tr bgcolor="#dddddd" class="diary_datetitle">
                <td height="30" background="image/bg.gif"><a href="blog.asp?<%= Server.HTMLEncode(MM_keepNone) & MM_joinChar(MM_keepNone) & "id=" & artlist.Fields.Item("id").Value %>" target="_blank">分类</a></td>
                <td background="image/bg.gif"><a href="blog.asp?<%= Server.HTMLEncode(MM_keepNone) & MM_joinChar(MM_keepNone) & "id=" & artlist.Fields.Item("id").Value %>" target="_blank">编号</a></td>
                <td background="image/bg.gif"><a href="blog.asp?<%= Server.HTMLEncode(MM_keepNone) & MM_joinChar(MM_keepNone) & "id=" & artlist.Fields.Item("id").Value %>" target="_blank">标题</a></td>
                <td background="image/bg.gif"><a href="blog.asp?<%= Server.HTMLEncode(MM_keepNone) & MM_joinChar(MM_keepNone) & "id=" & artlist.Fields.Item("id").Value %>" target="_blank">作者</a></td>
                <td background="image/bg.gif"><a href="blog.asp?<%= Server.HTMLEncode(MM_keepNone) & MM_joinChar(MM_keepNone) & "id=" & artlist.Fields.Item("id").Value %>" target="_blank">时间</a></td>
              </tr>
			     <% 
While ((Repeat1__numRows <> 0) AND (NOT artlist.EOF)) 
%>
              <tr onMouseOver="this.bgColor='#EEEFFF'" onMouseOut="this.bgColor='#ffffff'">
                <td height="30">&nbsp;&nbsp;<%=(artlist.Fields.Item("article_belong").Value)%></td>
                <td><a href="blog.asp?<%= Server.HTMLEncode(MM_keepNone) & MM_joinChar(MM_keepNone) & "id=" & artlist.Fields.Item("id").Value %>" target="_blank">&nbsp;&nbsp;<%=(artlist.Fields.Item("article_num").Value)%></a></td>
                <td><a href="blog.asp?<%= Server.HTMLEncode(MM_keepNone) & MM_joinChar(MM_keepNone) & "id=" & artlist.Fields.Item("id").Value %>" target="_blank">&nbsp;&nbsp;<%=(artlist.Fields.Item("article_title").Value)%></a></td>
                <td><a href="blog.asp?<%= Server.HTMLEncode(MM_keepNone) & MM_joinChar(MM_keepNone) & "id=" & artlist.Fields.Item("id").Value %>" target="_blank">&nbsp;&nbsp;</a><%=(artlist.Fields.Item("article_writer").Value)%></td>
                <td><a href="blog.asp?<%= Server.HTMLEncode(MM_keepNone) & MM_joinChar(MM_keepNone) & "id=" & artlist.Fields.Item("id").Value %>" target="_blank">&nbsp;&nbsp;</a><%=(artlist.Fields.Item("article_time").Value)%></td>
            </tr>
            <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  artlist.MoveNext()
Wend
%>

                  </table>
      <div align="center"> 共<%=(artlist_total)%>条记录，当前显示第<%=(artlist_first)%>条至第<%=(artlist_last)%>条记录
        <% If MM_offset <> 0 Then %>
          <A HREF="<%=MM_moveFirst%>">首页</A> <A HREF="<%=MM_movePrev%>">上一页</A>
          <% End If ' end MM_offset <> 0 %>
        <% If Not MM_atTotal Then %>
  <A HREF="<%=MM_moveNext%>">下一页</A> <A HREF="<%=MM_moveLast%>">尾页</A>
  <% End If ' end Not MM_atTotal %><br>
  <form action="search.asp" method="get" name="form1" target="_top" id="form1">
    <label>
      <input name="search" type="text" id="search" size="30" />
      </label>
    <label>
    <select name="select">
      <option value="article_title">标题</option>
      <option value="article_content">全文</option>
      <option value="article_writer">作者</option>
      <option value="article_time">时间</option>
      <option value="article_num">编号</option>
      <option value="article_belong">分类</option>
    </select>
    </label>
    <label>
    <input type="submit" name="Submit" value="提交" />
    </label>
  </form>
  <a href="http://<%=(base.Fields.Item("address").Value)%>/" target="_top">返回<%=(base.Fields.Item("blogtitle").Value)%>主页</a></div></td>
            <td width="20">&nbsp;</td>
  </tr classid=CLSID:CFCDAA03-8BE4-11CF-B84B-0020AFBBCCFA></table></td>
<!--#include file="inc/fish.inc" -->
</tr>
</table>
<!--#include file="inc/foot.inc" -->
</body>
</html>
<%
artlist.Close()
Set artlist = Nothing
%>
<%
base.Close()
Set base = Nothing
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
