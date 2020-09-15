<!--#include file="common/CLS_CjUpload.asp"-->
<HTML>
<HEAD>
<TITLE>文件上传</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
body, a, table, div, span, td, th, input, select{font:9pt;font-family: "宋体", Verdana, Arial, Helvetica, sans-serif;}
body {padding:0px;margin:0px}
</style>
<script language="JavaScript" src="dialog/dialog.js"></script>
</head>
<body bgcolor=menu>
<%
sAction = trim(Request("action"))
sType = trim(Request("type"))
sID = trim(Request("id"))
sPath = trim(Request("path"))

if sType="" then
	Response.Write("无效的类型!")
	Response.end
end if
if sID="" then
	Response.Write("无效的ID!")
	Response.end
end if

Set oXmlTemplate = Server.CreateObject("MicroSoft.XmlDom")
	oXmlTemplate.async = false
	oXmlTemplate.load(Server.MapPath("template/" + sID + ".xml"))

Set	node_Config = oXmlTemplate.selectSingleNode("/Editor/Config")

sUploadPath = node_Config.selectSingleNode("UploadPath").text
if(sPath<>"") then sUploadPath = sPath

Select Case LCase(sType)
	Case "image"
		sAllowExt = node_Config.selectSingleNode("IMAGEALLOWEXT").text
		iMaxSize = Clng(node_Config.selectSingleNode("IMAGEMAXSIZE").text)
	Case "flash"
		sAllowExt = node_Config.selectSingleNode("FLASHALLOWEXT").text
		iMaxSize = Clng(node_Config.selectSingleNode("FLASHMAXSIZE").text)
	Case "media"
		sAllowExt = node_Config.selectSingleNode("MEDIAALLOWEXT").text
		iMaxSize = Clng(node_Config.selectSingleNode("MEDIAMAXSIZE").text)
	Case "files"
		sAllowExt = node_Config.selectSingleNode("FILESALLOWEXT").text
		iMaxSize = Clng(node_Config.selectSingleNode("FILESMAXSIZE").text)
End Select

Select Case LCase(sAction)
	Case "save"
		Call ShowForm()
		Call SaveFile()
	Case Else
		Call ShowForm()
End Select
%>

<%

Sub ShowForm()
	sActionUrl = "?action=save&type="&sType&"&id="&sID&"&path="&sPath
%>
	<form action="<%=sActionUrl%>" method=post name=myform enctype="multipart/form-data" onSubmit="return CheckUploadForm()">
	<input type=file name=uploadfile size=1 style="width:100%">
	<input type=submit>
	</form>
	<script language=javascript>
	var sAllowExt = "<%=sAllowExt%>";
	function CheckUploadForm()
	{
		if (!IsAllowExt(document.myform.uploadfile.value,sAllowExt)){
			parent.UploadError("操作提示：\n\n请选择一个有效的文件!\n\n本系统支持的格式有（"+sAllowExt+"）!");
			return false;
		}
		return true;
	}
	try {
		parent.UploadLoaded();
	}
	catch(e){
	}
	</script>
<%

End Sub

Function SaveFile()

	iServerScriptTimeOut = Server.ScriptTimeOut
	iSessionTimeOut = Session.Timeout
	Server.ScriptTimeOut = 1800
	Session.Timeout = 60
	
	Set oCJUP = new CJ_Upload
	
	if not IsSelfRefer then
		Call OutScript("parent.UploadError('非法提交!!!\n\n您提交的表单来源无效!')")
		Response.end
	end if

	Set oUploadFile = oCJUP.File("uploadfile")
		oUploadFile.Path = Server.Mappath(sUploadPath)
		oUploadFile.MaxBytes = iMaxSize*1024
		oUploadFile.LimitExt = sAllowExt
		oUploadFile.LimitExtMode = "allow"

	if oUploadFile.IsValid and oUploadFile.TotalBytes>0 then 
		sFileName = GetFileName(oUploadFile.FileExt)
		if(Right(sUploadPath,1) = "/" or Right(sUploadPath,1) = "\") then
			sPathFileName = sUploadPath & sFileName
		else
			sPathFileName = sUploadPath & "/" & sFileName
		end if
		oUploadFile.FileName = sFileName
		oUploadFile.save()
		Call OutScript("parent.UploadSaved('" & sFileName & "')")
	else
		Select Case oUploadFile.Err
			Case 200 
				Call OutScript("parent.UploadError('上传的文件的大小超出了限制（" & iMaxSize & "KB）！')")
			Case 300
				Call OutScript("parent.UploadError('请选择有效的上传文件！')")
		End Select
	end if

	Server.ScriptTimeOut = iServerScriptTimeOut
	Session.Timeout = iSessionTimeOut
	
End Function

Sub OutScript(str)
	Response.Write "<script language=javascript>" & str & ";history.back()</script>"
End Sub
Sub OutScriptNoBack(str)
	Response.Write "<script language=javascript>" & str & "</script>"
End Sub

Function GetFileName(sExt)
	Dim sRnd
	Randomize timer
	sRnd = Int(9000 * Rnd) + 1000
	GetFileName = year(now)&"."&month(now)&"."&day(now)&"_"&hour(now)&"."&minute(now)&"."&Second(now)&"_"&sRnd&"."&sExt
End Function

Function ActiveXInstalled(sClassID)
	On Error Resume Next
	ActiveXInstalled = False
	Err = 0
	Dim ActiveXObject
	Set ActiveXObject = Server.CreateObject(sClassID)
	If 0 = Err Then ActiveXInstalled = True
	Set ActiveXObject = Nothing
	Err = 0
End Function
'=============================================================================================
'   检页提交页面是否来自本站
'=============================================================================================
Function IsSelfRefer()
	Dim sHTTP_REFERER,sSERVER_NAME,sSERVER_NAME_Refer
	sHTTP_REFERER = Cstr(trim(Request.ServerVariables("HTTP_REFERER")))
	sSERVER_NAME = Cstr(trim(Request.ServerVariables("SERVER_NAME")))
	sSERVER_NAME_Refer =  Mid(sHTTP_REFERER, 8, Len(sSERVER_NAME))
	if sSERVER_NAME = sSERVER_NAME_Refer then
		IsSelfRefer = true
	else
		IsSelfRefer = false
	end if
End Function
%>
</body>
</html>