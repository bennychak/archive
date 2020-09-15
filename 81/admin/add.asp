<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../Connections/bien.asp" -->
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

If (CStr(Request("MM_insert")) = "add") Then

  MM_editConnection = MM_bien_STRING
  MM_editTable = "art"
  MM_editRedirectUrl = "../seccess.html"
  MM_fieldsStr  = "article_title|value|article_writer|value|article_time|value|article_num|value|article_belong|value|article_content|value"
  MM_columnsStr = "article_title|',none,''|article_writer|',none,''|article_time|',none,NULL|article_num|',none,''|article_belong|',none,''|article_content|',none,''"

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
<%
Dim belong
Dim belong_numRows

Set belong = Server.CreateObject("ADODB.Recordset")
belong.ActiveConnection = MM_bien_STRING
belong.Source = "SELECT * FROM belong"
belong.CursorType = 0
belong.CursorLocation = 2
belong.LockType = 1
belong.Open()

belong_numRows = 0
%>
<%
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = -1
Repeat1__index = 0
belong_numRows = belong_numRows + Repeat1__numRows
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>添加日志</title>
<link href="../css/default.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form ACTION="<%=MM_editAction%>" METHOD="POST" id="add" name="add">
  <table bgcolor="#CCCCCC" cellspacing="1" cellpadding="4">
    <tr bgcolor="#FFFFFF">
      <td width="100">标题 <font color="#FF0000">*</font></td>
      <td><label>
        <input name="article_title" type="text" id="article_title" size="50" />
      </label></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td>作者 <font color="#FF0000">*</font></td>
      <td><label>
        <input name="article_writer" type="text" id="article_writer" value="Bienfantaisie" size="50" />
      </label></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td>时间 <font color="#FF0000">*</font></td>
      <td><label>
        <input name="article_time" type="text" id="article_time" value="<%=now()%>" size="50" />
      </label></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td>编号 <font color="#FF0000">*</font></td>
      <td><input name="article_num" type="text" id="article_num" value="#" size="20" /></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td>分类 <font color="#FF0000">*</font></td>
      <td><label>
        <select name="article_belong" id="article_belong">
          <%
While (NOT belong.EOF)
%>
          <option value="<%=(belong.Fields.Item("belong").Value)%>" <%If (Not isNull((belong.Fields.Item("belong").Value))) Then If (CStr(belong.Fields.Item("belong").Value) = CStr((belong.Fields.Item("belong").Value))) Then Response.Write("selected=""selected""") : Response.Write("")%> ><%=(belong.Fields.Item("belong").Value)%></option>
          <%
  belong.MoveNext()
Wend
If (belong.CursorType > 0) Then
  belong.MoveFirst
Else
  belong.Requery
End If
%>
        </select>
      </label>
现有分类：
<% 
While ((Repeat1__numRows <> 0) AND (NOT belong.EOF)) 
%>
  <%=(belong.Fields.Item("belong").Value)%>&nbsp;
  <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  belong.MoveNext()
Wend
%>
  <a href="belong.asp" target="_self">更改分类</a></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td>内容 <font color="#FF0000">*</font></td>
      <td>
	  <!--<textarea name="article_content" cols="80" rows="18" id="article_content"></textarea> -->
	  <input type="hidden" name="article_content" value="">
	  <iframe ID="article_content" src="../ewebeditor/ewebeditor.asp?id=article_content&style=s_light" frameborder="0" scrolling="no" width="550" HEIGHT="350"></iframe> 
	  </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td>&nbsp;</td>
      <td><label>
        <!--提示输入信息-->
<script language=JavaScript> 
function doSubmit(){ 
if (document.add.article_title.value==""){ 
alert("请填写日志标题"); 
return false; 
} 
else if (document.add.article_writer.value==""){ 
alert("请填写日志作者"); 
return false; 
} 
else if (document.add.article_time.value==""){ 
alert("请填写日志时间"); 
return false; 
} 
else if (document.add.article_num.value==""){ 
alert("请填写日志编号"); 
return false; 
} 
else if (document.add.article_belong.value==""){ 
alert("请填写日志分类"); 
return false; 
} 
document.add.submit(); 
} 
</script> 
<!--提示输入信息-->

          <input type="button" name="btnSubmit" onClick="doSubmit()" value="添加日志" />
          <input type="reset" name="Submit" value="重置" />
      </label></td>
    </tr>
  </table>

    

  <input type="hidden" name="MM_insert" value="add">
</form>
</body>
</html>
<%
belong.Close()
Set belong = Nothing
%>
