<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../Connections/bien.asp" -->
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
Dim Repeat3__numRows
Dim Repeat3__index

Repeat3__numRows = -1
Repeat3__index = 0
link_numRows = link_numRows + Repeat3__numRows
%>
<%
Dim Repeat4__numRows
Dim Repeat4__index

Repeat4__numRows = 20
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

Dim guaiguai_article_total
Dim guaiguai_article_first
Dim guaiguai_article_last

' set the record count
guaiguai_article_total = guaiguai_article.RecordCount

' set the number of rows displayed on this page
If (guaiguai_article_numRows < 0) Then
  guaiguai_article_numRows = guaiguai_article_total
Elseif (guaiguai_article_numRows = 0) Then
  guaiguai_article_numRows = 1
End If

' set the first and last displayed record
guaiguai_article_first = 1
guaiguai_article_last  = guaiguai_article_first + guaiguai_article_numRows - 1

' if we have the correct record count, check the other stats
If (guaiguai_article_total <> -1) Then
  If (guaiguai_article_first > guaiguai_article_total) Then
    guaiguai_article_first = guaiguai_article_total
  End If
  If (guaiguai_article_last > guaiguai_article_total) Then
    guaiguai_article_last = guaiguai_article_total
  End If
  If (guaiguai_article_numRows > guaiguai_article_total) Then
    guaiguai_article_numRows = guaiguai_article_total
  End If
End If
%>
<%
' *** Recordset Stats: if we don't know the record count, manually count them

If (guaiguai_article_total = -1) Then

  ' count the total records by iterating through the recordset
  guaiguai_article_total=0
  While (Not guaiguai_article.EOF)
    guaiguai_article_total = guaiguai_article_total + 1
    guaiguai_article.MoveNext
  Wend

  ' reset the cursor to the beginning
  If (guaiguai_article.CursorType > 0) Then
    guaiguai_article.MoveFirst
  Else
    guaiguai_article.Requery
  End If

  ' set the number of rows displayed on this page
  If (guaiguai_article_numRows < 0 Or guaiguai_article_numRows > guaiguai_article_total) Then
    guaiguai_article_numRows = guaiguai_article_total
  End If

  ' set the first and last displayed record
  guaiguai_article_first = 1
  guaiguai_article_last = guaiguai_article_first + guaiguai_article_numRows - 1
  
  If (guaiguai_article_first > guaiguai_article_total) Then
    guaiguai_article_first = guaiguai_article_total
  End If
  If (guaiguai_article_last > guaiguai_article_total) Then
    guaiguai_article_last = guaiguai_article_total
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

Set MM_rs    = guaiguai_article
MM_rsCount   = guaiguai_article_total
MM_size      = guaiguai_article_numRows
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
<title><%=(base.Fields.Item("blogtitle").Value)%> - 乖乖的留言</title>
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
    <td bgcolor="#<%=(base.Fields.Item("seasoncolor").Value)%>" class="tt_title" onclick="javascript:window.open('http://<%=(base.Fields.Item("address").Value)%>/')">&nbsp;<%=(base.Fields.Item("blogtitle").Value)%></td>
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
    <td width="15" height="20" bgcolor="#FEFEEF">&nbsp;</td>
    <td align="center" bgcolor="#FEFEEF"><%=(base.Fields.Item("titlemessage").Value)%></td>
  </tr>
</table>
  <table border="0" cellpadding="0" cellspacing="0" bgcolor="#fefefe">
    <tr><td height=100% width=20></td>
            <td width="1100"><form id="form1" name="form1" action="">
              <% 
While ((Repeat4__numRows <> 0) AND (NOT guaiguai_article.EOF)) 
%>
              <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="30" background="../image/bg.gif" bgcolor="#eeeeee" class="diary_datetitle">&nbsp;</td>
                  <td background="../image/bg.gif" bgcolor="#eeeeee" class="diary_datetitle">我家乖乖于<%=(guaiguai_article.Fields.Item("guaiguai_article_time").Value)%>来踩咯</td>
                </tr>
                <tr>
                  <td width="50" height="30" class="diary_datetitle">主题</td>
                  <td height="20" width="*" align="left">※<span class="diary_title"><%=(guaiguai_article.Fields.Item("guaiguai_article_title").Value)%></span></td>
                </tr>
                <tr>
                  <td height="30" bgcolor="#EEEEEE"><div align="center"><span class="diary_title">留言</span></div></td>
                  <td><%response.Write(replace(replace(guaiguai_article.Fields.Item("guaiguai_article_content").Value,chr(13),"<br>"),chr(32)," ")) %>
                  </td>
                </tr>
              </table>
              <% 
  Repeat4__index=Repeat4__index+1
  Repeat4__numRows=Repeat4__numRows-1
  guaiguai_article.MoveNext()
Wend
%>
              <div align="center">共<%=(guaiguai_article_total)%>条记录，本页显示第<%=(guaiguai_article_first)%>条至第<%=(guaiguai_article_last)%>条记录
                <% If MM_offset <> 0 Then %>
                  <A HREF="<%=MM_moveFirst%>">首页</A> <A HREF="<%=MM_movePrev%>">上一页</A>
                  <% End If ' end MM_offset <> 0 %>
                <% If Not MM_atTotal Then %>
  <A HREF="<%=MM_moveNext%>">下一页</A> <A HREF="<%=MM_moveLast%>">末页</A>
  <% End If ' end Not MM_atTotal %>
</div>
            </form></td>
    </tr classid=CLSID:CFCDAA03-8BE4-11CF-B84B-0020AFBBCCFA></table>
  </td>
    <td width="200" valign="top">
  <table width="200" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="15" width="195" background="../image/w.gif"></td>
    </tr>
</table>
<table width="200" border="0" cellspacing="0" cellpadding="0">
<tr>
<td height="20" bgcolor="#FEFEEF"></td>
</tr>
</table>
<table cellpadding="0" cellspacing="0" border="0">
<tr>
  <td height="30" background="../image/bg.gif" class="diary_datetitle"><font color="#999999" class="diary_title">Fishlogo de Moi</font></td>
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
<table align="center" cellspacing="0" cellpadding="0" width="180" border="0">
	<tr>
      <td height="30" background="../image/bg2.gif" class="diary_title">签名Logo</td>
    </tr><tr><td><a target="_blank" href="http://<%=(base.Fields.Item("address").Value)%>/"><img width="180" border="0" src="<%=(base.Fields.Item("logo").Value)%>"></a></td></tr></table>
	<!--友情链接-->
	<table align="center" cellspacing="0" cellpadding="0" width="180" border="0">
      <tr><td class="diary_datetitle">Copyright&copy;2007 by<br>
        <a href="http://<%=(base.Fields.Item("address").Value)%>/"><%=(base.Fields.Item("address").Value)%>/</a><br>
      <a href="mailto:bienfantaisie@163.com">bienfantaisie@163.com</a><br><a href="mailto:bienfantaisie@hotmail.com">bienfantaisie@hotmail.com</a><br>Allrights Reserved<br><a target="_blank" href="http://www.miibeian.gov.cn">豫ICP备07003303号</a></td></tr></table></td>
</tr>
</table>
<table align=center width=100% cellpadding=0 cellspacing=0 border=0>
<tr>
<td align=center height=20 background="../image/musicbg.gif">
<font color=#ffffff>
- Bienfantaisie -
</font>
</td>
</tr>
</table>
</body>
</html>
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
