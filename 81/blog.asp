<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="Connections/bien.asp" -->
<!--#include file = "eWebEditor/Include/DeCode.asp"-->
<!--#include file = "inc/forbiddenip.inc"-->
<!--ewebeditor限制 -->
<%
Response.Write eWebEditor_DeCode(sContent, "SCRIPT, OBJECT, STYLE, XML, NAMESPACE")
%>
<!--ewebeditor限制 -->
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
  MM_editRedirectUrl = "blog.asp"
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
Dim blog
Dim blog_numRows

Set blog = Server.CreateObject("ADODB.Recordset")
blog.ActiveConnection = MM_bien_STRING
blog.Source = "SELECT * FROM art ORDER BY article_time DESC"
blog.CursorType = 0
blog.CursorLocation = 2
blog.LockType = 1
blog.Open()

blog_numRows = 0
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
comment_numRows = comment_numRows + Repeat2__numRows
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

Dim blog_total
Dim blog_first
Dim blog_last

' set the record count
blog_total = blog.RecordCount

' set the number of rows displayed on this page
If (blog_numRows < 0) Then
  blog_numRows = blog_total
Elseif (blog_numRows = 0) Then
  blog_numRows = 1
End If

' set the first and last displayed record
blog_first = 1
blog_last  = blog_first + blog_numRows - 1

' if we have the correct record count, check the other stats
If (blog_total <> -1) Then
  If (blog_first > blog_total) Then
    blog_first = blog_total
  End If
  If (blog_last > blog_total) Then
    blog_last = blog_total
  End If
  If (blog_numRows > blog_total) Then
    blog_numRows = blog_total
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

Set MM_rs    = blog
MM_rsCount   = blog_total
MM_size      = blog_numRows
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
blog_first = MM_offset + 1
blog_last  = MM_offset + MM_size

If (MM_rsCount <> -1) Then
  If (blog_first > MM_rsCount) Then
    blog_first = MM_rsCount
  End If
  If (blog_last > MM_rsCount) Then
    blog_last = MM_rsCount
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=(base.Fields.Item("blogtitle").Value)%> - <%=(blog.Fields.Item("article_title").Value)%></title>
<LINK href="css/default.css" type=text/css rel=stylesheet>
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
                    <td height="30" align=center background="image/bg.gif" class="diary_datetitle"><%=(blog.Fields.Item("article_time").Value)%></td>
                  </tr>
                  <tr>
                    <td height="30">
					<br>
					<fieldset style='border:1px solid #AAAAAA'>
					<legend>
					<span class="diary_title"><%=(blog.Fields.Item("article_num").Value)%>&nbsp;&nbsp; </span><span class="diary_title"><A HREF="blog.asp?<%= Server.HTMLEncode(MM_keepNone) & MM_joinChar(MM_keepNone) & "id=" & blog.Fields.Item("id").Value %>" target="_blank"><%=(blog.Fields.Item("article_title").Value)%></A></span>
					</legend>
                    <br><table align="center" width="98%"><tr><td>
					<%=(blog.Fields.Item("article_content").Value)%><br><br>
                 <div align="right" class="diary_poster"><font color="<%=(base.Fields.Item("seasoncolor").Value)%>"><%=(blog.Fields.Item("article_writer").Value)%> 发表于 <%=(blog.Fields.Item("article_time").Value)%></font>&nbsp;&nbsp;<a href="search.asp?search=<%=(blog.Fields.Item("article_belong").Value)%>&select=article_belong&Submit=<%=(blog.Fields.Item("article_belong").Value)%>" target="_top">[<%=(blog.Fields.Item("article_belong").Value)%>]</a>&nbsp;&nbsp;<A HREF="blog.asp?<%= Server.HTMLEncode(MM_keepNone) & MM_joinChar(MM_keepNone) & "id=" & blog.Fields.Item("id").Value %>" target="_blank">[查看]</A>&nbsp;&nbsp;<A HREF="blog.asp?<%= Server.HTMLEncode(MM_keepNone) & MM_joinChar(MM_keepNone) & "id=" & blog.Fields.Item("id").Value %>" target="_blank">[评论]</A>&nbsp;&nbsp;<a target="_blank" href="guest/index.asp">[留言]</a></div></td></tr></table>
				 <br>
				 </fieldset>
				 <br></td>
                  </tr>
                </table>
<% If comment.EOF And comment.BOF Then %>
        本文暂无评论！
  <% End If ' end comment.EOF And comment.BOF %>
  <% If Not comment.EOF Or Not comment.BOF Then %>
    本文共有评论<%=(comment_total)%>条
  <% End If ' end Not comment.EOF Or NOT comment.BOF %>
  <% If Not comment.EOF Or Not comment.BOF Then %>
      <% 
While ((Repeat2__numRows <> 0) AND (NOT comment.EOF)) 
%>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#dddddd">
          <tr>
            <td width="150" height="30" background="image/bg.gif">&nbsp;</td>
                  <td background="image/bg.gif"><span><%=(comment.Fields.Item("comment_name").Value)%>（<%=(comment.Fields.Item("comment_ip").Value)%>）于 <%=(comment.Fields.Item("comment_date").Value)%> 评论本文 </span>
				  <%
				  if comment.Fields.Item("comment_website")<>"" then
				  Response.write("&nbsp;&nbsp;个人博客:")
				  end if
				  				  %>
				  <a target="_blank" href="http://<%=(comment.Fields.Item("comment_website").Value)%>">
				  <%
				  if comment.Fields.Item("comment_website")<>"" then
				  Response.write("http://")&(comment.Fields.Item("comment_website").Value)
				  end if
				  %></a>
	  			    <%=userip%></td>
              </tr>
          <tr bgcolor="#FFFFFF">
            <td bgcolor="#efefef"></td>
                  <td><br><%=(comment.Fields.Item("comment_content").Value)%><br><br></td>
              </tr>
          </table>
<% 
  Repeat2__index=Repeat2__index+1
  Repeat2__numRows=Repeat2__numRows-1
  comment.MoveNext()
Wend
%>
<% End If ' end Not comment.EOF Or NOT comment.BOF %>
<form id="comment" name="comment" method="POST" action="<%=MM_editAction%>">
  <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#efefef">
     <tr>
       <td height="30"></td>
       <td background="image/bg.gif" class="diary_title">&nbsp;评论本文</td>
       </tr>
     <tr>
        <td width="150" height="30"></td>
        <td><!--<textarea name="content" cols="50" rows="10" id="content"></textarea> -->
		 <input type="hidden" name="content" value="">
	  <iframe ID="content" src="ewebeditor/ewebeditor.asp?id=content&style=s_light" frameborder="0" scrolling="no" width="550" HEIGHT="350"></iframe>		</td>
        </tr>
      <tr>
        <td height="30"></td>
        <td background="image/bg.gif"><label>
          &nbsp;个人博客 http://
              <input name="comment_website" type="text" id="comment_website" size="46" maxlength="60" />
        </label></td>
        </tr>
      <tr>
        <td height="30"></td>
        <td background="image/bg.gif">&nbsp;签名 <font color="#FF0000">*</font><input name="name" type="text" id="name" size="12" maxlength="20" />
		<%userip=request.ServerVariables("http_x_forwarded_for")
	IF userip="" Then
	userip=Request.ServerVariables("REmote_ADDR")
	end if
	%>
		<input name="ip" type="hidden" value="<%=userip%>" />
		<input name="articleid" type="hidden" value="<%=Request.QueryString("id")%>" />
		<input name="articletitle" type="hidden" value="<%=(blog.Fields.Item("article_title").Value)%>" /> 
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
        </label>		</td>
        </tr>
      </table>
  
  <input type="hidden" name="MM_insert" value="comment">
</form>  </td>
<td width="20">&nbsp;</td>
  </tr classid=CLSID:CFCDAA03-8BE4-11CF-B84B-0020AFBBCCFA></table>
  <br></td>
<!--#include file="inc/fish.inc" -->
</tr>
</table>
<!--#include file="inc/foot.inc" -->
</body>
</html>
<%
blog.Close()
Set blog = Nothing
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
comment.Close()
Set comment = Nothing
%>
<%
webcollect.Close()
Set webcollect = Nothing
%>
<%
forbiddenip.Close()
Set forbiddenip = Nothing
%>
