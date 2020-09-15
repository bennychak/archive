<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="Connections/bien.asp" -->
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

If (CStr(Request("MM_insert")) = "comment") Then

  MM_editConnection = MM_bien_STRING
  MM_editTable = "comment"
  MM_editRedirectUrl = "article.asp"
  MM_fieldsStr  = "content|value|comment_website|value|name|value|ip|value|articleid|value|articletitle|value"
  MM_columnsStr = "comment_content|',none,''|comment_website|',none,''|comment_name|',none,''|comment_ip|',none,''|comment_articleid|',none,''|comment_articletitle|',none,''"

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
Dim comment__MMColParam
comment__MMColParam = "1"
If (Request.QueryString("id") <> "") Then 
  comment__MMColParam = Request.QueryString("id")
End If
%>
<%
Dim comment
Dim comment_numRows

Set comment = Server.CreateObject("ADODB.Recordset")
comment.ActiveConnection = MM_bien_STRING
comment.Source = "SELECT * FROM comment WHERE comment_articleid = '" + Replace(comment__MMColParam, "'", "''") + "' ORDER BY comment_date DESC"
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
Dim comment2
Dim comment2_numRows

Set comment2 = Server.CreateObject("ADODB.Recordset")
comment2.ActiveConnection = MM_bien_STRING
comment2.Source = "SELECT comment_content, comment_date, comment_name, id FROM comment ORDER BY comment_date DESC"
comment2.CursorType = 0
comment2.CursorLocation = 2
comment2.LockType = 1
comment2.Open()

comment2_numRows = 0
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
Dim Repeat5__numRows
Dim Repeat5__index

Repeat5__numRows = -1
Repeat5__index = 0
belong_numRows = belong_numRows + Repeat5__numRows
%>
<%
Dim Repeat2__numRows
Dim Repeat2__index

Repeat2__numRows = (base.Fields.Item("artdisplay").Value)
Repeat2__index = 0
art_numRows = art_numRows + Repeat2__numRows
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

Dim comment_total
Dim comment_first
Dim comment_last

' set the record count
comment_total = comment.RecordCount

' set the number of rows displayed on this page
If (comment_numRows < 0) Then
  comment_numRows = comment_total
Elseif (comment_numRows = 0) Then
  comment_numRows = 1
End If

' set the first and last displayed record
comment_first = 1
comment_last  = comment_first + comment_numRows - 1

' if we have the correct record count, check the other stats
If (comment_total <> -1) Then
  If (comment_first > comment_total) Then
    comment_first = comment_total
  End If
  If (comment_last > comment_total) Then
    comment_last = comment_total
  End If
  If (comment_numRows > comment_total) Then
    comment_numRows = comment_total
  End If
End If
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
' *** Recordset Stats: if we don't know the record count, manually count them

If (comment_total = -1) Then

  ' count the total records by iterating through the recordset
  comment_total=0
  While (Not comment.EOF)
    comment_total = comment_total + 1
    comment.MoveNext
  Wend

  ' reset the cursor to the beginning
  If (comment.CursorType > 0) Then
    comment.MoveFirst
  Else
    comment.Requery
  End If

  ' set the number of rows displayed on this page
  If (comment_numRows < 0 Or comment_numRows > comment_total) Then
    comment_numRows = comment_total
  End If

  ' set the first and last displayed record
  comment_first = 1
  comment_last = comment_first + comment_numRows - 1
  
  If (comment_first > comment_total) Then
    comment_first = comment_total
  End If
  If (comment_last > comment_total) Then
    comment_last = comment_total
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
<div id="bien_logo"><a href="http://<%=(base.Fields.Item("address").Value)%>"><img src="<%=(base.Fields.Item("fishlogo").Value)%>" alt="<%=(base.Fields.Item("fishlogonote").Value)%>" /></a></div>
<div id="bien_banner" class="tt_title">
<%=(base.Fields.Item("blogtitle").Value)%>
</div>
<div id="bien_lefttop">
<div class="bien_lefttopcontainer">
<div class="bien_article_title bien_top4">各种链接</div>
	<ul>
      <% 
While ((Repeat5__numRows <> 0) AND (NOT belong.EOF)) 
%>
      <li><A HREF="sch.asp?<%= Server.HTMLEncode(MM_keepURL) & MM_joinChar(MM_keepURL) & "belong=" & belong.Fields.Item("belong").Value %>"><%=(belong.Fields.Item("belong").Value)%></A></li>
        <% 
  Repeat5__index=Repeat5__index+1
  Repeat5__numRows=Repeat5__numRows-1
  belong.MoveNext()
Wend
%>
<li><a href="all.asp">全部</a></li>
<li><a href="demo.asp">旧版</a></li>
</ul>
</div>
</div>
<div id="bien_righttop">
  <div class="bien_righttopcontainer">
		<div class="bien_article_title bien_top4">最新评论人</div>
        <%=(comment2.Fields.Item("comment_name").Value)%> &nbsp;<%=(comment2.Fields.Item("comment_date").Value)%><br />
        <A HREF="article.asp?<%= "id=" & comment2.Fields.Item("id").Value %>">查看该评论</A></div>
	<div class="bien_righttopcontainer">
		<div class="bien_article_title bien_top4">最新留言</div>
		<%=(guest.Fields.Item("name").Value)%> &nbsp;<%=(guest.Fields.Item("time").Value)%><br />主题：<%=(guest.Fields.Item("main").Value)%><br /><a href="guest/index.asp" target="_blank">查看或留言</a>
	</div>
  <div class="bien_righttopcontainer">
  		<div class="bien_article_title bien_top4">老婆专区</div>
  <%=(guaiguai.Fields.Item("guaiguai_article_time").Value)%><br />主题：<%=(guaiguai.Fields.Item("guaiguai_article_title").Value)%><br /><a href="guaiguai/show.asp" target="_blank">查看</a> &nbsp;<a href="guaiguai/login.asp" target="_blank">留言</a>
  </div>
</div>
<div id="bien_leftmain">
	<ul>
		<li class="bien_article_title bien_top4">更新文章列表 - <a style="display:inline; text-decoration:none; font-size:12px;" href="all.asp">全部文章</a></li>
		
        <% 
While ((Repeat1__numRows <> 0) AND (NOT title.EOF)) 
%>
        <li><A HREF="article.asp?<%= Server.HTMLEncode(MM_keepURL) & MM_joinChar(MM_keepURL) & "id=" & title.Fields.Item("id").Value %>"><%=(title.Fields.Item("article_title").Value)%></A></li>
          <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  title.MoveNext()
Wend
%>
    </ul>
</div>


  <div id="bien_rightmain">
    <div class="bien_article_title"><A target="_blank" HREF="article.asp?<%= Server.HTMLEncode(MM_keepNone) & MM_joinChar(MM_keepNone) & "id=" & art.Fields.Item("id").Value %>"><%=(art.Fields.Item("article_num").Value)%>&nbsp;<%=(art.Fields.Item("article_title").Value)%></A></div>
    <%=(art.Fields.Item("article_content").Value)%>
    <div class="bien_article_bottom"><%=(art.Fields.Item("article_writer").Value)%> 发表于 <%=(art.Fields.Item("article_time").Value)%> [<%=(art.Fields.Item("article_belong").Value)%>] <a href="guest/index.asp" target="_blank">[留言]</a>&nbsp;</div>
  </div>
<!--show comment -->
<div id="bien_comment_show">
<ul>
<li class="bien_article_title">
<% If comment.EOF And comment.BOF Then %>
        本文暂无评论！
  <% End If ' end comment.EOF And comment.BOF %>
  <% If Not comment.EOF Or Not comment.BOF Then %>
    本文共有评论<%=(comment_total)%>条
  <% End If ' end Not comment.EOF Or NOT comment.BOF %>
</li>

  <% If Not comment.EOF Or Not comment.BOF Then %>
      <% 
While ((Repeat5__numRows <> 0) AND (NOT comment.EOF)) 
%>
<li class="bien_comment_author"> | 
<%=(comment.Fields.Item("comment_name").Value)%> 于 <%=(comment.Fields.Item("comment_date").Value)%> 评论本文 <a target="_blank" href="http://<%=(comment.Fields.Item("comment_website").Value)%>">
				  <%
				  if comment.Fields.Item("comment_website")<>"" then
				  Response.write("博客")
				  end if
				  %></a>

</li>
<li class="bien_indent">
	  			    <%=userip%>
					<%=(comment.Fields.Item("comment_content").Value)%>
</li>
				  
<% 
  Repeat5__index=Repeat5__index+1
  Repeat5__numRows=Repeat5__numRows-1
  comment.MoveNext()
Wend
%>
<% End If ' end Not comment.EOF Or NOT comment.BOF %>
</ul>
</div>
<!--show comment end -->
<!--comment -->
<div id="bien_comment">
<form id="comment" name="comment" method="POST" action="<%=MM_editAction%>">
<input type="hidden" name="content" value="">
<iframe ID="content" src="ewebeditor/ewebeditor.asp?id=content&style=s_mini" frameborder="0" scrolling="no" width="550" HEIGHT="350"></iframe>
<label>
<ul>
<li>
博客 http://<input name="comment_website" type="text" id="comment_website" size="46" maxlength="60" /></label>
</li>
<li>
签名 <input name="name" type="text" id="name" size="12" maxlength="20" />

<%userip=request.ServerVariables("http_x_forwarded_for")
	IF userip="" Then
	userip=Request.ServerVariables("REmote_ADDR")
	end if
%>
<input name="ip" type="hidden" value="<%=userip%>" />
<input name="articleid" type="hidden" value="<%=Request.QueryString("id")%>" />
<input name="articletitle" type="hidden" value="<%=(art.Fields.Item("article_title").Value)%>" />
<label>
<!--提示输入信息-->
<script language=JavaScript> 
function doSubmit(){ 
if (document.comment.name.value==""){ 
alert("请问你是哪位？"); 
return false; 
} 
document.comment.submit(); 
} 
</script> 
<!--提示输入信息-->
<input type="button" name="btnSubmit" onClick="doSubmit()" value="发表评论" />

</label>
</li>
</ul>
<input type="hidden" name="MM_insert" value="comment">

</form>
</div>
<!--comment end -->
  <div id="bien_bottom">
<div class="bien_article_title bien_top4">友情链接</div>
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
<div class="bien_article_title bien_top4">网址链接</div>
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
comment2.Close()
Set comment2 = Nothing
%>
<%
guaiguai.Close()
Set guaiguai = Nothing
%>
