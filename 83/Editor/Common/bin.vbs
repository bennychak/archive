'★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
'★                                                              ★
'★ VBScript 常用运行库	Version 1.0                              ★
'★                                                              ★
'★ Code by Chris.J(黄嘉隆)                                      ★
'★                                                              ★
'★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
'=============================================================================================
'	提示信息并页面返回
'=============================================================================================
Function MsgBack(s)
	Dim sHTML
	 	sHTML = "<script language='jscript'>"
		sHTML = sHTML & "alert('" & s & "');"
		sHTML = sHTML & "history.back();"
		sHTML = sHTML & "</script>"
		Response.Write(sHTML)
		Response.End()
End Function

'=============================================================================================
'提示信息并跳转页面
'=============================================================================================
Function MsgSkip(s,sUrl)
	Dim sHTML
		sHTML = "<script language='jscript'>"
		sHTML = sHTML & "alert('" & s & "');"
		sHTML = sHTML & "window.location.href='" & sUrl & "';"
		sHTML = sHTML & "</script>"
		Response.Write(sHTML)
		Response.End()
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

'=============================================================================================
'	生成日期字符串
'=============================================================================================
Function DateStr(oDate,sTsep)
	Dim sDate
		sDate = Cstr(Year(oDate))
		sDate = sDate + sTsep + FormatStr(Cstr(Month(oDate)),"0",2)
		sDate = sDate + sTsep + FormatStr(Cstr(Day(oDate)),"0",2)
	DateStr = sDate
End Function

'=============================================================================================
'	生成时间字符串
'=============================================================================================
Function TimeStr(oDate,sTsep)
	Dim sTime
		sTime = Cstr(Hour(oDate))
		sTime = sTime + sTsep + FormatStr(Cstr(Minute(oDate)),"0",2)
		sTime = sTime + sTsep + FormatStr(Cstr(Second(oDate)),"0",2)
	TimeStr = sTime
End Function

'=============================================================================================
'	随机定长字符串
'=============================================================================================
Function RndStr(iLen)
	Dim i,sTemp
		for i=1 to iLen
			Randomize
			sTemp=sTemp&int(9* Rnd)
		next
	RndStr=sTemp
End Function

'=============================================================================================
'	格式化字符串 formatString("aaa","#",5)  返回 return "##aaa"
'=============================================================================================
Function FormatStr(s1,s2,iLen)
	do while Len(s1)<iLen
		s1 = s2 & s1
	loop
	FormatStr = s1
End Function
'=============================================================================================
'	判断对象是否为empty(适用于JScript)
'=============================================================================================
Function IsEmptyJ(s)
	IsEmptyJ = IsEmpty(s)
End Function
'=============================================================================================
'	转换成字符	(适用于JScript)
'=============================================================================================
Function CstrJ(s)
	if IsEmpty(s) then
		CstrJ = ""
	else
		CstrJ = Cstr(s)
	End if
End Function


