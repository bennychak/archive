<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../Connections/bien.asp" --><%
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
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = 200
Repeat1__index = 0
ip_numRows = ip_numRows + Repeat1__numRows
%>
<%
'  *** Recordset Stats, Move To Record, and Go To Record: declare stats variables

Dim ip_total
Dim ip_first
Dim ip_last

' set the record count
ip_total = ip.RecordCount

' set the number of rows displayed on this page
If (ip_numRows < 0) Then
  ip_numRows = ip_total
Elseif (ip_numRows = 0) Then
  ip_numRows = 1
End If

' set the first and last displayed record
ip_first = 1
ip_last  = ip_first + ip_numRows - 1

' if we have the correct record count, check the other stats
If (ip_total <> -1) Then
  If (ip_first > ip_total) Then
    ip_first = ip_total
  End If
  If (ip_last > ip_total) Then
    ip_last = ip_total
  End If
  If (ip_numRows > ip_total) Then
    ip_numRows = ip_total
  End If
End If
%>
<%
' *** Recordset Stats: if we don't know the record count, manually count them

If (ip_total = -1) Then

  ' count the total records by iterating through the recordset
  ip_total=0
  While (Not ip.EOF)
    ip_total = ip_total + 1
    ip.MoveNext
  Wend

  ' reset the cursor to the beginning
  If (ip.CursorType > 0) Then
    ip.MoveFirst
  Else
    ip.Requery
  End If

  ' set the number of rows displayed on this page
  If (ip_numRows < 0 Or ip_numRows > ip_total) Then
    ip_numRows = ip_total
  End If

  ' set the first and last displayed record
  ip_first = 1
  ip_last = ip_first + ip_numRows - 1
  
  If (ip_first > ip_total) Then
    ip_first = ip_total
  End If
  If (ip_last > ip_total) Then
    ip_last = ip_total
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

Set MM_rs    = ip
MM_rsCount   = ip_total
MM_size      = ip_numRows
MM_uniqueCol = ""
MM_paramName = ""
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
ip_first = MM_offset + 1
ip_last  = MM_offset + MM_size

If (MM_rsCount <> -1) Then
  If (ip_first > MM_rsCount) Then
    ip_first = MM_rsCount
  End If
  If (ip_last > MM_rsCount) Then
    ip_last = MM_rsCount
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
%><%
Dim ip_TFMcurrentPage
Dim ip_TFMtotalPages
If MM_size > 0 Then
ip_TFMcurrentPage = Round(ip_last/MM_size + .4999)
ip_TFMtotalPages = Round(ip_total/MM_size + .4999)
End If
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>IP</title>
<link href="../css/default.css" rel="stylesheet" type="text/css" />
</head>

<body>
  <% 
While ((Repeat1__numRows <> 0) AND (NOT ip.EOF)) 
%><table border="0" cellspacing="0" cellpadding="0">
    <tr onMouseOver="this.bgColor='#EEEFFF'" onMouseOut="this.bgColor='#ffffff'">
      <td height=30 width="150"><%=(ip.Fields.Item("date").Value)%></td>
      <td width="150"><a target="_blank" href="http://www.baidu.com/s?wd=<%=(ip.Fields.Item("ip").Value)%>"><%=(ip.Fields.Item("ip").Value)%></a></td>
    </tr></table>
    <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  ip.MoveNext()
Wend
%>


<% If MM_offset <> 0 Then %>
  <A HREF="<%=MM_moveFirst%>">��ҳ</A> <A HREF="<%=MM_movePrev%>">��һҳ</A>
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
For i = 1 to ip_total Step MM_size
TFM_LimitCounter = TFM_LimitCounter + 1
TFM_LimitPageEndCount = i + MM_size - 1
if TFM_LimitPageEndCount > ip_total Then TFM_LimitPageEndCount = ip_total
If TFM_LimitCounter > TFM_startLink AND TFM_LimitCounter <= TFM_endLink Then
if i <> MM_offset + 1 then
Response.Write("<a href=""" & Request.ServerVariables("URL") & "?" & MM_keepMove & "offset=" & i-1 & """>")
Response.Write(TFM_LimitCounter & "</a>")
else
Response.Write("<b><font color=#CCCCCC>" & TFM_LimitCounter & "</font></b>")
End if
if(TFM_LimitPageEndCount <> ip_total AND TFM_endLink <> TFM_LimitCounter) then Response.Write("��")
end if
next
%>
<% If Not MM_atTotal Then %>
  <A HREF="<%=MM_moveNext%>">��һҳ</A> <A HREF="<%=MM_moveLast%>">ĩҳ</A>
  <% End If ' end Not MM_atTotal %>
</body>
</html>
<%
ip.Close()
Set ip = Nothing
%>