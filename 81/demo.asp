<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="Connections/bien.asp" -->
<!--#include file = "inc/forbiddenip.inc"-->
<%
Dim index
Dim index_numRows

Set index = Server.CreateObject("ADODB.Recordset")
index.ActiveConnection = MM_bien_STRING
index.Source = "SELECT * FROM art ORDER BY article_time DESC"
index.CursorType = 0
index.CursorLocation = 2
index.LockType = 1
index.Open()

index_numRows = 0
%>
<%
Dim guestindex
Dim guestindex_numRows

Set guestindex = Server.CreateObject("ADODB.Recordset")
guestindex.ActiveConnection = MM_bien_STRING
guestindex.Source = "SELECT * FROM guest ORDER BY time DESC"
guestindex.CursorType = 0
guestindex.CursorLocation = 2
guestindex.LockType = 1
guestindex.Open()

guestindex_numRows = 0
%>
<%
Dim base
Dim base_numRows

Set base = Server.CreateObject("ADODB.Recordset")
base.ActiveConnection = MM_bien_STRING
base.Source = "SELECT *  FROM base"
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
Dim guaiguai_article
Dim guaiguai_article_numRows

Set guaiguai_article = Server.CreateObject("ADODB.Recordset")
guaiguai_article.ActiveConnection = MM_bien_STRING
guaiguai_article.Source = "SELECT guaiguai_article_time, guaiguai_article_title FROM guaiguai_article ORDER BY id DESC"
guaiguai_article.CursorType = 0
guaiguai_article.CursorLocation = 2
guaiguai_article.LockType = 1
guaiguai_article.Open()

guaiguai_article_numRows = 0
%>
<%
Dim ip
Dim ip_numRows

Set ip = Server.CreateObject("ADODB.Recordset")
ip.ActiveConnection = MM_bien_STRING
ip.Source = "SELECT * FROM ip ORDER BY date DESC"
ip.CursorType = 0
ip.CursorLocation = 2
ip.LockType = 1
ip.Open()

ip_numRows = 0
%>
<%
Dim booklist
Dim booklist_numRows

Set booklist = Server.CreateObject("ADODB.Recordset")
booklist.ActiveConnection = MM_bien_STRING
booklist.Source = "SELECT book_gettime, book_name, id FROM book ORDER BY id DESC"
booklist.CursorType = 0
booklist.CursorLocation = 2
booklist.LockType = 1
booklist.Open()

booklist_numRows = 0
%>
<%
Dim comment
Dim comment_numRows

Set comment = Server.CreateObject("ADODB.Recordset")
comment.ActiveConnection = MM_bien_STRING
comment.Source = "SELECT comment_articleid, comment_content, comment_name, id FROM comment ORDER BY comment_date DESC"
comment.CursorType = 0
comment.CursorLocation = 2
comment.LockType = 1
comment.Open()

comment_numRows = 0
%>
<%
Dim Repeat1__numRows
Dim Repeat1__index

'150行决定demo.asp文章单页显示数目

Repeat1__numRows = 10
Repeat1__index = 0
index_numRows = index_numRows + Repeat1__numRows
%>
<%
Dim Repeat2__numRows
Dim Repeat2__index

Repeat2__numRows = 10
Repeat2__index = 0
guestindex_numRows = guestindex_numRows + Repeat2__numRows
%>
<%
Dim Repeat6__numRows
Dim Repeat6__index

Repeat6__numRows = 10
Repeat6__index = 0
guaiguai_article_numRows = guaiguai_article_numRows + Repeat6__numRows
%>
<%
Dim Repeat7__numRows
Dim Repeat7__index

Repeat7__numRows = 10
Repeat7__index = 0
ip_numRows = ip_numRows + Repeat7__numRows
%>
<%
Dim Repeat9__numRows
Dim Repeat9__index

Repeat9__numRows = 10
Repeat9__index = 0
comment_numRows = comment_numRows + Repeat9__numRows
%>
<%
Dim Repeat8__numRows
Dim Repeat8__index

Repeat8__numRows = 10
Repeat8__index = 0
booklist_numRows = booklist_numRows + Repeat8__numRows
%>
<%
Dim Repeat5__numRows
Dim Repeat5__index

Repeat5__numRows = -1
Repeat5__index = 0
webcollect_numRows = webcollect_numRows + Repeat5__numRows
%>
<%
Dim Repeat4__numRows
Dim Repeat4__index

Repeat4__numRows = -1
Repeat4__index = 0
belong_numRows = belong_numRows + Repeat4__numRows
%>
<%
Dim Repeat3__numRows
Dim Repeat3__index

Repeat3__numRows = -1
Repeat3__index = 0
link_numRows = link_numRows + Repeat3__numRows
%>
<%
'  *** Recordset Stats, Move To Record, and Go To Record: declare stats variables

Dim index_total
Dim index_first
Dim index_last

' set the record count
index_total = index.RecordCount

' set the number of rows displayed on this page
If (index_numRows < 0) Then
  index_numRows = index_total
Elseif (index_numRows = 0) Then
  index_numRows = 1
End If

' set the first and last displayed record
index_first = 1
index_last  = index_first + index_numRows - 1

' if we have the correct record count, check the other stats
If (index_total <> -1) Then
  If (index_first > index_total) Then
    index_first = index_total
  End If
  If (index_last > index_total) Then
    index_last = index_total
  End If
  If (index_numRows > index_total) Then
    index_numRows = index_total
  End If
End If
%>
<%
' *** Recordset Stats: if we don't know the record count, manually count them

If (index_total = -1) Then

  ' count the total records by iterating through the recordset
  index_total=0
  While (Not index.EOF)
    index_total = index_total + 1
    index.MoveNext
  Wend

  ' reset the cursor to the beginning
  If (index.CursorType > 0) Then
    index.MoveFirst
  Else
    index.Requery
  End If

  ' set the number of rows displayed on this page
  If (index_numRows < 0 Or index_numRows > index_total) Then
    index_numRows = index_total
  End If

  ' set the first and last displayed record
  index_first = 1
  index_last = index_first + index_numRows - 1
  
  If (index_first > index_total) Then
    index_first = index_total
  End If
  If (index_last > index_total) Then
    index_last = index_total
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

Set MM_rs    = index
MM_rsCount   = index_total
MM_size      = index_numRows
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
index_first = MM_offset + 1
index_last  = MM_offset + MM_size

If (MM_rsCount <> -1) Then
  If (index_first > MM_rsCount) Then
    index_first = MM_rsCount
  End If
  If (index_last > MM_rsCount) Then
    index_last = MM_rsCount
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
Dim index_TFMcurrentPage
Dim index_TFMtotalPages
If MM_size > 0 Then
index_TFMcurrentPage = Round(index_last/MM_size + .4999)
index_TFMtotalPages = Round(index_total/MM_size + .4999)
End If
%>
<!--写入IP-->
<!--写入IP-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<META content=Bienfantaisie name=keywords>
<title><%=(base.Fields.Item("blogtitle").Value)%> - <%=(base.Fields.Item("titlemessage").Value)%></title>
<LINK href="css/default.css" type=text/css rel=stylesheet>
<style type="text/css">
<!--
.STYLE1 {font-size: small}
-->
</style>
</head>
<body marginheight="0" marginwidth="0" leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0">
<!--#include file="inc/topmusic.inc" -->
<!--#include file="inc/head.inc" -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td height="100%" valign="top" bgcolor="#fefefe">
<!--#include file="inc/head2.inc" -->
    <% If Not index.EOF Or Not index.BOF Then %>
      <table cellpadding="0" cellspacing="0" border="0">
        <tr>
          <td height=100% width=20></td>
          <td width="1100" bgcolor="#FEFEFE"><% 
While ((Repeat1__numRows <> 0) AND (NOT index.EOF)) 
%>
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr class="diary_datetitle">
                    <td height="30" align=center background="image/bg.gif" class="diary_datetitle"><%=(index.Fields.Item("article_time").Value)%></td>
                  </tr>
                  <tr>
                    <td height="30">
					<br>
					<fieldset style='border:1px solid #AAAAAA'>
					<legend>
					<span class="diary_title"><%=(index.Fields.Item("article_num").Value)%>&nbsp;&nbsp; </span><span class="diary_title"><A HREF="blog.asp?<%= Server.HTMLEncode(MM_keepNone) & MM_joinChar(MM_keepNone) & "id=" & index.Fields.Item("id").Value %>" target="_blank"><%=(index.Fields.Item("article_title").Value)%></A></span>
					</legend>
                    <br><table align="center" width="98%"><tr><td>
					<%
nn=2000
str=(index.Fields.Item("article_content").Value)
if len(str)>nn then 
response.write left(str,nn)&"……<br>　　…… ……<br><b>本文超过2000字，点击标题查看全文</b>" 
else 
response.write(str)
end if 
%><br><br>
                 <div align="right" class="diary_poster"><font color="<%=(base.Fields.Item("seasoncolor").Value)%>"><%=(index.Fields.Item("article_writer").Value)%> 发表于 <%=(index.Fields.Item("article_time").Value)%></font>&nbsp;&nbsp;<a href="search.asp?search=<%=(index.Fields.Item("article_belong").Value)%>&select=article_belong&Submit=<%=(index.Fields.Item("article_belong").Value)%>" target="_top">[<%=(index.Fields.Item("article_belong").Value)%>]</a>&nbsp;&nbsp;<A HREF="blog.asp?<%= Server.HTMLEncode(MM_keepNone) & MM_joinChar(MM_keepNone) & "id=" & index.Fields.Item("id").Value %>" target="_blank">[全文]</A>&nbsp;&nbsp;<A HREF="blog.asp?<%= Server.HTMLEncode(MM_keepNone) & MM_joinChar(MM_keepNone) & "id=" & index.Fields.Item("id").Value %>" target="_blank">[评论]</A>&nbsp;&nbsp;<a target="_blank" href="guest/index.asp">[留言]</a></div></td></tr></table>
				 <br>
				 </fieldset>
				 <br>
				 </td>
                  </tr>
                </table>
                <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  index.MoveNext()
Wend
%>
              <div align="center">当前显示第<%=(index_first)%>篇至第<%=(index_last)%>篇日志
                <% If MM_offset <> 0 Then %>
                  <A HREF="<%=MM_moveFirst%>">首页</A> <A HREF="<%=MM_movePrev%>">上一页</A>
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
For i = 1 to index_total Step MM_size
TFM_LimitCounter = TFM_LimitCounter + 1
TFM_LimitPageEndCount = i + MM_size - 1
if TFM_LimitPageEndCount > index_total Then TFM_LimitPageEndCount = index_total
If TFM_LimitCounter > TFM_startLink AND TFM_LimitCounter <= TFM_endLink Then
if i <> MM_offset + 1 then
Response.Write("<a href=""" & Request.ServerVariables("URL") & "?" & MM_keepMove & "offset=" & i-1 & """>")
Response.Write(TFM_LimitCounter & "</a>")
else
Response.Write("<b><font color=#CCCCCC>" & TFM_LimitCounter & "</font></b>")
End if
if(TFM_LimitPageEndCount <> index_total AND TFM_endLink <> TFM_LimitCounter) then Response.Write("︱")
end if
next
%>
<% If Not MM_atTotal Then %>
                  <A HREF="<%=MM_moveNext%>">下一页</A> <A HREF="<%=MM_moveLast%>">尾页</A>
                  <% End If ' end Not MM_atTotal %>
            <a href="all.asp" target="_blank">查看全部日志</a> <a target="_blank" href="http://www.miibeian.gov.cn">豫ICP备07003303号</a></div>            <br></td>
          <td width="20" bgcolor="#FEFEFE">&nbsp;</td>
        </tr classid=CLSID:CFCDAA03-8BE4-11CF-B84B-0020AFBBCCFA>
      </table>
      <% End If ' end Not index.EOF Or NOT index.BOF %>
      <% If index.EOF And index.BOF Then %>
        没有任何日志！
  <% End If ' end index.EOF And index.BOF %>
</td>
<!--左右页面分开点-->
  <td bgcolor="#eeeeee" width="200" valign="top">
  <table width="200" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="15" width="195" background="image/w.gif"></td>
    </tr>
</table>
<table width="200" border="0" cellspacing="0" cellpadding="0">
<tr>
<td height="20" background="image/head2incbg.gif"></td>
</tr>
</table>
<table cellpadding="0" cellspacing="0" border="0">
<tr>
  <td height="30" background="image/bg.gif" class="diary_datetitle"><font color="#999999" class="diary_title">Fishlogo de Moi</font></td>
</tr>
  <tr>
    <td width="200" valign="top"><img width="200" border="0" src="<%=(base.Fields.Item("fishlogo").Value)%>"></td>
  </tr>
  </table>
<table align=center cellpadding="0" cellspacing="0" border="0">
  <tr>
  <td width=180 height=30 class="diary_datetitle"><%=(base.Fields.Item("fishlogonote").Value)%></td>
</tr>
</table>
<table border="0" cellspacing="0" cellpadding="0" width="200">
   <tr>
      <td align=center>
<!--日历-->
<iframe scrolling="no" src="inc/calendar.htm" frameborder="0" height="200" width="200"></iframe>
<iframe scrolling="no" src="user/login.asp" frameborder="0" height="100" width="200"></iframe>
<!--日历-->
</td>
  </tr></table>
<table align="center" cellspacing="0" cellpadding="0" width="180" border="0">
<tr>
  <td height="30" background="image/bg2.gif" class="diary_title">想说的话</td>
</tr><tr><td><%=(base.Fields.Item("titlemessage").Value)%></td>
</tr></table>
<table align="center" cellspacing="0" cellpadding="0" width="180" border="0"><tr><td height="30" background="image/bg2.gif" class="diary_title">日志分类</td>
</tr>
  <% 
While ((Repeat4__numRows <> 0) AND (NOT belong.EOF)) 
%>
    <tr>
      <td height="20"><% If Not belong.EOF Or Not belong.BOF Then %>
          <a href="search.asp?search=<%=(belong.Fields.Item("belong").Value)%>&select=article_belong&Submit=<%=(belong.Fields.Item("belong").Value)%>" target="_blank"><%=(belong.Fields.Item("belong").Value)%></a>
          <% End If ' end Not belong.EOF Or NOT belong.BOF %>
        <% If belong.EOF And belong.BOF Then %>
          没有任何分类！
  <% End If ' end belong.EOF And belong.BOF %>
</td>
    </tr>
    <% 
  Repeat4__index=Repeat4__index+1
  Repeat4__numRows=Repeat4__numRows-1
  belong.MoveNext()
Wend
%>
</table><table align="center" cellspacing="0" cellpadding="0" width="180" border="0"><tr>
  <td height="30" background="image/bg2.gif" class="diary_title">日志搜索</td>
</tr><tr><td height="20"><form action="search.asp" method="get" name="form1" target="_blank" id="form1">
  <label>
  <input name="search" type="text" id="search" size="9" />
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
  <input type="submit" name="Submit" value="搜索" />
  </label>
</form>
</td></tr></table>
<table width="180" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" background="image/bg2.gif"><span class="diary_title">最近购书</span> Rec.10 <a href="book.asp" target="_blank">More</a></td>
  </tr>
  <% 
While ((Repeat8__numRows <> 0) AND (NOT booklist.EOF)) 
%>
    <tr>
      <td height="20"><a href="book.asp" target="_blank"><%=(booklist.Fields.Item("book_name").Value)%></a></td>
    </tr>
    <% 
  Repeat8__index=Repeat8__index+1
  Repeat8__numRows=Repeat8__numRows-1
  booklist.MoveNext()
Wend
%>
</table>

<table align="center" cellspacing="0" cellpadding="0" width="180" border="0">
      <tbody>
	  <tr>
          <td height="30" align="left" background="image/bg2.gif" class="diary_title">友情链接</td>
        </tr>
      <% 
While ((Repeat3__numRows <> 0) AND (NOT link.EOF)) 
%>
        <tr>
          <td align="left" height="20"><% If Not link.EOF Or Not link.BOF Then %>
              <a target="_blank" href="<%=(link.Fields.Item("link").Value)%>"><%=(link.Fields.Item("name").Value)%></a>
              <% End If ' end Not link.EOF Or NOT link.BOF %>
            <% If link.EOF And link.BOF Then %>
              没有任何链接！
  <% End If ' end link.EOF And link.BOF %>
</td>
        </tr>
        <% 
  Repeat3__index=Repeat3__index+1
  Repeat3__numRows=Repeat3__numRows-1
  link.MoveNext()
Wend
%>

      </tbody>
    </table>
	<!--友情链接-->
<table align="center" cellspacing="0" cellpadding="0" width="180" border="0">
      <tbody>
	  <tr>
          <td height="30" align="left" background="image/bg2.gif" class="diary_title">网摘收藏</td>
        </tr>
      <% 
While ((Repeat5__numRows <> 0) AND (NOT webcollect.EOF)) 
%>
        <tr>
          <td align="left" height="20"><% If Not webcollect.EOF Or Not webcollect.BOF Then %>
              <a target="_blank" href="<%=(webcollect.Fields.Item("web_link").Value)%>"><%=(webcollect.Fields.Item("web_name").Value)%></a>
              <% End If ' end Not webcollect.EOF Or NOT webcollect.BOF %>
            <% If webcollect.EOF And webcollect.BOF Then %>
              没有任何网摘！
  <% End If ' end webcollect.EOF And webcollect.BOF %>
</td>
        </tr>
        <% 
  Repeat5__index=Repeat5__index+1
  Repeat5__numRows=Repeat5__numRows-1
  webcollect.MoveNext()
Wend
%>

      </tbody>
    </table>
<table width="180" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" background="image/bg2.gif"><span class="diary_title">新评论</span> Rec.10 </td>
  </tr>
  <% 
While ((Repeat9__numRows <> 0) AND (NOT comment.EOF)) 
%>
    <tr>
      <td height="20"><% If Not comment.EOF Or Not comment.BOF Then %>
          ·<span class="diary_poster"><A HREF="blog.asp?<%= Server.HTMLEncode(MM_keepNone) & MM_joinChar(MM_keepNone) & "id=" & comment.Fields.Item("comment_articleid").Value %>" target="_blank"><font color="orange"><%=(comment.Fields.Item("comment_name").Value)%></font></A></span><br>
  &nbsp;&nbsp; <A HREF="blog.asp?<%= Server.HTMLEncode(MM_keepNone) & MM_joinChar(MM_keepNone) & "id=" & comment.Fields.Item("comment_articleid").Value %>" target="_blank">
  <%
n=10
str=(comment.Fields.Item("comment_content").Value)
if len(str)>n then 
response.write left(str,n)&"..." 
else 
response.write(str)
end if 
  %>
  </A>
  <% End If ' end Not comment.EOF Or NOT comment.BOF %>
        <% If comment.EOF And comment.BOF Then %>
          没有任何评论！
  <% End If ' end comment.EOF And comment.BOF %>
</td>
    </tr>
    <% 
  Repeat9__index=Repeat9__index+1
  Repeat9__numRows=Repeat9__numRows-1
  comment.MoveNext()
Wend
%>
</table>

    <table align="center" cellspacing="0" cellpadding="0" width="180" border="0"><tr>
      <td height="30" background="image/bg2.gif"><span class="diary_title">朋友区</span> Rec.10 <a href="guest/index.asp" target="_blank">More</a> <a href="guest/index.asp" target="_blank">留言</a></td>
    </tr>
      <% 
While ((Repeat2__numRows <> 0) AND (NOT guestindex.EOF)) 
%>
        <tr>
          <td><% If Not guestindex.EOF Or Not guestindex.BOF Then %>
              ·<span class="diary_poster"><%=(guestindex.Fields.Item("name").Value)%>：</span><br>
  &nbsp;&nbsp; <a href="guest/index.asp" target="_blank"><%=(guestindex.Fields.Item("main").Value)%></a>
  <% End If ' end Not guestindex.EOF Or NOT guestindex.BOF %>
            <% If guestindex.EOF And guestindex.BOF Then %>
              没有任何留言！
  <% End If ' end guestindex.EOF And guestindex.BOF %>
</td>
        </tr>
        <% 
  Repeat2__index=Repeat2__index+1
  Repeat2__numRows=Repeat2__numRows-1
  guestindex.MoveNext()
Wend
%>

      </table>
	  <table align="center" cellspacing="0" cellpadding="0" width="180" border="0"><tr>
      <td height="30" background="image/bg2.gif"><span class="diary_title">乖乖区 </span>Rec.10 <a href="guaiguai/show.asp" target="_blank">More</a> <a href="guaiguai/login.asp" target="_blank">留言</a></td>
    </tr>
        <% 
While ((Repeat6__numRows <> 0) AND (NOT guaiguai_article.EOF)) 
%>
          <tr>
            <td>·<span class="diary_poster"><%=(guaiguai_article.Fields.Item("guaiguai_article_time").Value)%></span><br>
            &nbsp;&nbsp; <a href="guaiguai/show.asp" target="_blank">
			<%
n=10
strg=(guaiguai_article.Fields.Item("guaiguai_article_title").Value)
if len(strg)>n then 
response.write left(strg,n)&"..." 
else 
response.write(strg)
end if 
  %></a></td>
          </tr>
          <% 
  Repeat6__index=Repeat6__index+1
  Repeat6__numRows=Repeat6__numRows-1
  guaiguai_article.MoveNext()
Wend
%>

      </table>
	  <table align="center" cellspacing="0" cellpadding="0" width="180" border="0"><tr><td height="30" background="image/bg2.gif" class="diary_title">访问人数</td>
	  </tr><tr><td height="20"><!--#include file="counter.txt" --></td></tr></table><table width="180" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" background="image/bg2.gif" class="diary_title">最近访问IP</td>
  </tr>
<% 
While ((Repeat7__numRows <> 0) AND (NOT ip.EOF)) 
%>
    <tr>
      <td><% If Not ip.EOF Or Not ip.BOF Then %>
          ·<span class="diary_poster"><%=(ip.Fields.Item("date").Value)%></span><br />
          &nbsp;&nbsp;<a target="_blank" href="http://www.baidu.com/s?wd=<%=(ip.Fields.Item("ip").Value)%>"><%=(ip.Fields.Item("ip").Value)%></a>
            <% End If ' end Not ip.EOF Or NOT ip.BOF %>
        <% If ip.EOF And ip.BOF Then %>
          没有任何IP记录！
  <% End If ' end ip.EOF And ip.BOF %></td>
    </tr>
    <% 
  Repeat7__index=Repeat7__index+1
  Repeat7__numRows=Repeat7__numRows-1
  ip.MoveNext()
Wend
%>
      </table>

	 <table align="center" cellspacing="0" cellpadding="0" width="180" border="0">
	<tr>
      <td height="30" background="image/bg2.gif" class="diary_title"><font color="#999999">签名Logo</font></td>
    </tr><tr><td><a target="_blank" href="http://<%=(base.Fields.Item("address").Value)%>/"><img width="180" border="0" src="<%=(base.Fields.Item("logo").Value)%>"></a></td></tr></table><table align="center" cellspacing="0" cellpadding="0" width="180" border="0">
      <tr><td class="diary_datetitle">Copyright&copy;2007 by<br>
        <a href="http://<%=(base.Fields.Item("address").Value)%>/"><%=(base.Fields.Item("address").Value)%></a><br>
      <a href="mailto:bienfantaisie@163.com">bienfantaisie@163.com</a><br><a href="mailto:bienfantaisie@hotmail.com">bienfantaisie@hotmail.com</a><br>Allrights Reserved<br><a target="_blank" href="http://www.miibeian.gov.cn">豫ICP备07003303号</a></td></tr></table>
	</td>
</tr>
</table>
<!--#include file="inc/foot.inc" -->
</body>
</html>
<%
index.Close()
Set index = Nothing
%>
<%
guestindex.Close()
Set guestindex = Nothing
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
<%
guaiguai_article.Close()
Set guaiguai_article = Nothing
%>
<%
ip.Close()
Set ip = Nothing
%>
<%
booklist.Close()
Set booklist = Nothing
%>
<%
comment.Close()
Set comment = Nothing
%>
