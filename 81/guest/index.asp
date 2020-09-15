<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../Connections/bien.asp" -->
<!--#include file = "../inc/forbiddenip.inc"-->
<!--ewebeditor限制 -->
<!--#include file = "../eWebEditor/Include/DeCode.asp"-->
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

If (CStr(Request("MM_insert")) = "guest") Then

  MM_editConnection = MM_bien_STRING
  MM_editTable = "guest"
  MM_editRedirectUrl = "index.asp"
  MM_fieldsStr  = "main|value|content|value|website|value|name|value|ip|value"
  MM_columnsStr = "main|',none,''|content|',none,''|website|',none,''|name|',none,''|ip|',none,''"

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
Dim guest
Dim guest_numRows

Set guest = Server.CreateObject("ADODB.Recordset")
guest.ActiveConnection = MM_bien_STRING
guest.Source = "SELECT * FROM guest ORDER BY time DESC"
guest.CursorType = 0
guest.CursorLocation = 2
guest.LockType = 1
guest.Open()

guest_numRows = 0
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
Dim guaiguai_article
Dim guaiguai_article_numRows

Set guaiguai_article = Server.CreateObject("ADODB.Recordset")
guaiguai_article.ActiveConnection = MM_bien_STRING
guaiguai_article.Source = "SELECT * FROM guaiguai_article ORDER BY id DESC"
guaiguai_article.CursorType = 0
guaiguai_article.CursorLocation = 2
guaiguai_article.LockType = 1
guaiguai_article.Open()

guaiguai_article_numRows = 0
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

Repeat1__numRows = 20
Repeat1__index = 0
guest_numRows = guest_numRows + Repeat1__numRows
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
Dim Repeat4__numRows
Dim Repeat4__index

Repeat4__numRows = 10
Repeat4__index = 0
guaiguai_article_numRows = guaiguai_article_numRows + Repeat4__numRows
%>
<%
Dim Repeat2__numRows
Dim Repeat2__index

Repeat2__numRows = -1
Repeat2__index = 0
belong_numRows = belong_numRows + Repeat2__numRows
%>
<%
'  *** Recordset Stats, Move To Record, and Go To Record: declare stats variables

Dim guest_total
Dim guest_first
Dim guest_last

' set the record count
guest_total = guest.RecordCount

' set the number of rows displayed on this page
If (guest_numRows < 0) Then
  guest_numRows = guest_total
Elseif (guest_numRows = 0) Then
  guest_numRows = 1
End If

' set the first and last displayed record
guest_first = 1
guest_last  = guest_first + guest_numRows - 1

' if we have the correct record count, check the other stats
If (guest_total <> -1) Then
  If (guest_first > guest_total) Then
    guest_first = guest_total
  End If
  If (guest_last > guest_total) Then
    guest_last = guest_total
  End If
  If (guest_numRows > guest_total) Then
    guest_numRows = guest_total
  End If
End If
%>
<%
' *** Recordset Stats: if we don't know the record count, manually count them

If (guest_total = -1) Then

  ' count the total records by iterating through the recordset
  guest_total=0
  While (Not guest.EOF)
    guest_total = guest_total + 1
    guest.MoveNext
  Wend

  ' reset the cursor to the beginning
  If (guest.CursorType > 0) Then
    guest.MoveFirst
  Else
    guest.Requery
  End If

  ' set the number of rows displayed on this page
  If (guest_numRows < 0 Or guest_numRows > guest_total) Then
    guest_numRows = guest_total
  End If

  ' set the first and last displayed record
  guest_first = 1
  guest_last = guest_first + guest_numRows - 1
  
  If (guest_first > guest_total) Then
    guest_first = guest_total
  End If
  If (guest_last > guest_total) Then
    guest_last = guest_total
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

Set MM_rs    = guest
MM_rsCount   = guest_total
MM_size      = guest_numRows
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
guest_first = MM_offset + 1
guest_last  = MM_offset + MM_size

If (MM_rsCount <> -1) Then
  If (guest_first > MM_rsCount) Then
    guest_first = MM_rsCount
  End If
  If (guest_last > MM_rsCount) Then
    guest_last = MM_rsCount
  End If
End If

' set the boolean used by hide region to check if we are on the last record
MM_atTotal = (MM_rsCount <> -1 And MM_offset + MM_size >= MM_rsCount)
%>
<%
' *** Move To Record: update recordset stats

' set the first and last displayed record
guaiguai_article_first = MM_offset + 1
guaiguai_article_last  = MM_offset + MM_size

If (MM_rsCount <> -1) Then
  If (guaiguai_article_first > MM_rsCount) Then
    guaiguai_article_first = MM_rsCount
  End If
  If (guaiguai_article_last > MM_rsCount) Then
    guaiguai_article_last = MM_rsCount
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
Dim guest_TFMcurrentPage
Dim guest_TFMtotalPages
If MM_size > 0 Then
guest_TFMcurrentPage = Round(guest_last/MM_size + .4999)
guest_TFMtotalPages = Round(guest_total/MM_size + .4999)
End If
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--提示填写完整表单-->
<style> 
td 
{ 
word-wrap: break-word; 
} 
</style>
<!--提示填写完整表单-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=(base.Fields.Item("blogtitle").Value)%> - 留言</title>
<LINK href="../css/default.css" type=text/css rel=stylesheet>
<style type="text/css">
<!--
.STYLE1 {color: #003562}
-->
</style>
</head>
<body marginheight="0" marginwidth="0" leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="20">
	<iframe src="../music/exobud.asp" height="20" width="100%" frameborder="0"></iframe>
	</td>
  </tr>
</table>
<table width="100%" height="64" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#<%=(base.Fields.Item("seasoncolor").Value)%>" class="tt_title" onClick="javascript:window.open('http://<%=(base.Fields.Item("address").Value)%>/')">&nbsp;<%=(base.Fields.Item("blogtitle").Value)%></td>
    <td width="100" background="../image/right.gif" bgcolor="#<%=(base.Fields.Item("seasoncolor").Value)%>"><DIV align=right><FONT color=#ffffff>QQ</FONT> <A href="http://wpa.qq.com/msgrd?V=1&amp;Uin=369880993&amp;Menu=yes" target=_blank><FONT color=#ffffff>3698</FONT><FONT color=#<%=(base.Fields.Item("seasoncolor").Value)%>>80993</FONT></A>&nbsp;&nbsp;</DIV></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td height="100%" valign="top" bgcolor="#fefefe">
  <table width="100%-215" cellpadding="0" cellspacing="0" border="0"><tr><td width="15" background="../image/+.gif"></td>
    <td height="15" background="../image/b.gif" colspan="6"></td>
    </tr></table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="15" height="20" background="../image/head2incbg.gif" bgcolor="#FEFEEF">&nbsp;</td>
    <td align="center" background="../image/head2incbg.gif" bgcolor="#FEFEEF"></td>
  </tr>
</table>
    <% If Not guest.EOF Or Not guest.BOF Then %>
      <table border="0" cellpadding="0" cellspacing="0" bgcolor="#fefefe">
        <tr>
          <td height=100% width=20></td>
          <td width="1100"><% 
While ((Repeat1__numRows <> 0) AND (NOT guest.EOF)) 
%>
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="30" background="../image/bg.gif" bgcolor="#eeeeee" class="diary_datetitle"><% response.Write("id" & (guest.Fields.Item("id").Value-67)) %></td>
                    <td background="../image/bg.gif" bgcolor="#eeeeee" class="diary_datetitle"><%=(guest.Fields.Item("time").Value)%>，<%=(guest.Fields.Item("name").Value)%>（<%=(guest.Fields.Item("ip").Value)%>）访问了<%=(base.Fields.Item("blogtitle").Value)%></td>
                  </tr>
                  <tr>
                    <td width="50" height="30" bgcolor="#EEEEEE"></td>
                    <td height="20" width="*" align="left"><span class="diary_title"><%=(guest.Fields.Item("main").Value)%></span></td>
                  </tr>
                  <tr>
                    <td height="30" bgcolor="#EEEEEE"></td>
                    <td align="left"><%=(guest.Fields.Item("content").Value)%></td>
                  </tr>
                  <tr>
                    <td height="30" bgcolor="#EEEEEE"></td>
                    <td align="left"><%=(guest.Fields.Item("website").Value)%></td>
                  </tr>
                </table>
                <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  guest.MoveNext()
Wend
%>
              <div align="center">共<%=(guest_total)%>条留言，当前显示第<%=(guest_first)%>至第<%=(guest_last)%>条
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
For i = 1 to guest_total Step MM_size
TFM_LimitCounter = TFM_LimitCounter + 1
TFM_LimitPageEndCount = i + MM_size - 1
if TFM_LimitPageEndCount > guest_total Then TFM_LimitPageEndCount = guest_total
If TFM_LimitCounter > TFM_startLink AND TFM_LimitCounter <= TFM_endLink Then
if i <> MM_offset + 1 then
Response.Write("<a href=""" & Request.ServerVariables("URL") & "?" & MM_keepMove & "offset=" & i-1 & """>")
Response.Write(TFM_LimitCounter & "</a>")
else
Response.Write("<b><font color=#CCCCCC>" & TFM_LimitCounter & "</font></b>")
End if
if(TFM_LimitPageEndCount <> guest_total AND TFM_endLink <> TFM_LimitCounter) then Response.Write("︱")
end if
next
%>
<% If Not MM_atTotal Then %>
                  <A HREF="<%=MM_moveNext%>">下一页</A> <A HREF="<%=MM_moveLast%>">尾页</A>
                  <% End If ' end Not MM_atTotal %> 
            <a href="#" onClick="location.reload()">刷新</a>              </div></td>
          <td width="20">&nbsp;</td>
        </tr classid=CLSID:CFCDAA03-8BE4-11CF-B84B-0020AFBBCCFA>
      </table>
      <% End If ' end Not guest.EOF Or NOT guest.BOF %>
    <% If guest.EOF And guest.BOF Then %>
      没有任何留言！
  <% End If ' end guest.EOF And guest.BOF %>
<form id="guest" name="guest" method="POST" action="<%=MM_editAction%>">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#efefef">
      <tr>
      <td width="30" height="30"></td>
      <td background="../image/bg.gif">&nbsp;留言大意 <font color="#FF0000">*</font>
        <input name="main" type="text" id="main" size="60" maxlength="100" /></td>
       </tr>
      <tr>
        <td height="30"></td>
        <td><!--<textarea name="content" cols="50" rows="10" id="content"></textarea> -->
		<input type="hidden" name="content" value="">
	  <iframe ID="content" src="../ewebeditor/ewebeditor.asp?id=content&style=s_light" frameborder="0" scrolling="no" width="550" HEIGHT="350"></iframe>		</td> 
      </tr>
      <tr>
        <td height="30"></td>
        <td background="../image/bg.gif">&nbsp;附言（PS.）<input name="website" type="text" id="website" size="60" maxlength="100" /></td>
		 </tr>
      <tr>
        <td height="30"></td>
        <td background="../image/bg.gif">&nbsp;签名 <font color="#FF0000">*</font><input name="name" type="text" id="name" size="20" maxlength="20" />
		<%userip=request.ServerVariables("http_x_forwarded_for")
	IF userip="" Then
	userip=Request.ServerVariables("REmote_ADDR")
	end if
	%>
		<input name="ip" type="hidden" value="<%=userip%>" /> 
		<label>
         <!--提示输入信息-->
<script language=JavaScript> 
function doSubmit(){ 
if (document.guest.main.value==""){ 
alert("请填写留言大意"); 
return false; 
} 
else if (document.guest.name.value==""){ 
alert("请问你是哪位？"); 
return false; 
} 
document.guest.submit(); 
} 
</script> 
<!--提示输入信息-->

          <input type="button" name="btnSubmit" onClick="doSubmit()" value=" 给Bienfantaisie留言" />
        </label>		</td>
		 </tr>
      <tr>
        <td height="30"></td>
        <td width="500" background="../image/bg.gif">&nbsp;留言大意和附言最多允许100字符，签名最多允许20个字符</td>
	    </tr></table>
 
    <input type="hidden" name="MM_insert" value="guest">
  </form>
<!--此处可选插入乖乖留言显示代码（../inc/guaiguaiguest.inc）-->
  </td>
    <td width="200" valign="top" bgcolor="#EEEEEE">
  <table width="200" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="15" width="195" background="../image/w.gif"></td>
    </tr>
</table>
<table width="200" border="0" cellspacing="0" cellpadding="0">
<tr>
<td height="20" background="../image/head2incbg.gif" bgcolor="#FEFEEF"></td>
</tr>
</table>
<table cellpadding="0" cellspacing="0" border="0">
<tr>
  <td height="30" background="../image/bg.gif" class="diary_datetitle"><font color="#999999" class="diary_title">Fishlogo de Moi</font></td>
</tr>
  <tr>
    <td bgcolor="#EEEEEE" width="200" valign="top"><img width="200" border="0" src="<%=(base.Fields.Item("fishlogo").Value)%>"></td>
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
<iframe scrolling="no" src="../inc/calendar.htm" frameborder="0" height="200" width="200"></iframe>
<!--日历-->
<iframe scrolling="no" src="../user/login.asp" frameborder="0" height="120" width="200"></iframe>
</td>
  </tr></table>
<table align="center" cellspacing="0" cellpadding="0" width="180" border="0">
<tr>
  <td height="30" background="../image/bg2.gif" class="diary_title">想说的话</td>
</tr><tr><td><%=(base.Fields.Item("titlemessage").Value)%></td>
</tr></table>
<table align="center" cellspacing="0" cellpadding="0" width="180" border="0"><tr><td height="30" background="../image/bg2.gif" class="diary_title">日志分类</td>
</tr>
  <% 
While ((Repeat2__numRows <> 0) AND (NOT belong.EOF)) 
%>
    <tr>
      <td height="20"><a href="../search.asp?search=<%=(belong.Fields.Item("belong").Value)%>&select=article_belong&Submit=<%=(belong.Fields.Item("belong").Value)%>" target="_blank"><%=(belong.Fields.Item("belong").Value)%></a></td>
    </tr>
    <% 
  Repeat2__index=Repeat2__index+1
  Repeat2__numRows=Repeat2__numRows-1
  belong.MoveNext()
Wend
%>
</table>
<table align="center" cellspacing="0" cellpadding="0" width="180" border="0">
  <tbody>
    <tr>
      <td height="30" align="left" background="../image/bg2.gif" class="diary_title">友情链接</td>
    </tr>
    <% 
While ((Repeat3__numRows <> 0) AND (NOT link.EOF)) 
%>
    <tr>
      <td align="left" height="20"><a target="_blank" href="<%=(link.Fields.Item("link").Value)%>"><%=(link.Fields.Item("name").Value)%></a></td>
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
          <td height="30" align="left" background="../image/bg2.gif" class="diary_title">网摘收藏</td>
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
<table align="center" cellspacing="0" cellpadding="0" width="180" border="0">
	<tr>
      <td height="30" background="../image/bg2.gif" class="diary_title">签名Logo</td>
    </tr><tr><td><a target="_blank" href="http://<%=(base.Fields.Item("address").Value)%>/"><img width="180" border="0" src="<%=(base.Fields.Item("logo").Value)%>"></a></td></tr></table>
	<table align="center" cellspacing="0" cellpadding="0" width="180" border="0">
      <tr><td class="diary_datetitle">Copyright&copy;2007 by<br>
        <a href="http://<%=(base.Fields.Item("address").Value)%>/"><%=(base.Fields.Item("address").Value)%>/</a><br>
      <a href="mailto:bienfantaisie@163.com">bienfantaisie@163.com</a><br><a href="mailto:bienfantaisie@hotmail.com">bienfantaisie@hotmail.com</a><br>Allrights Reserved<br><a target="_blank" href="http://www.miibeian.gov.cn">豫ICP备07003303号</a></td></tr></table>
	</td>
</tr>
</table>
<br>
<table align=center width=100% cellpadding=0 cellspacing=0 border=0>
<tr>
<td align=center height=20 background="../image/musicbg.gif">
<font color=#ffffff>
- <%=(base.Fields.Item("blogtitle").Value)%> -
</font>
</td>
</tr>
</table>
</body>
</html>
<%
guest.Close()
Set guest = Nothing
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
guaiguai_article.Close()
Set guaiguai_article = Nothing
%>
<%
webcollect.Close()
Set webcollect = Nothing
%>
