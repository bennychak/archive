'����������������������������������
'��                                                              ��
'�� VBScript �������п�	Version 1.0                              ��
'��                                                              ��
'�� Code by Chris.J(�Ƽ�¡)                                      ��
'��                                                              ��
'����������������������������������
'=============================================================================================
'	��ʾ��Ϣ��ҳ�淵��
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
'��ʾ��Ϣ����תҳ��
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
'   ��ҳ�ύҳ���Ƿ����Ա�վ
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
'	���������ַ���
'=============================================================================================
Function DateStr(oDate,sTsep)
	Dim sDate
		sDate = Cstr(Year(oDate))
		sDate = sDate + sTsep + FormatStr(Cstr(Month(oDate)),"0",2)
		sDate = sDate + sTsep + FormatStr(Cstr(Day(oDate)),"0",2)
	DateStr = sDate
End Function

'=============================================================================================
'	����ʱ���ַ���
'=============================================================================================
Function TimeStr(oDate,sTsep)
	Dim sTime
		sTime = Cstr(Hour(oDate))
		sTime = sTime + sTsep + FormatStr(Cstr(Minute(oDate)),"0",2)
		sTime = sTime + sTsep + FormatStr(Cstr(Second(oDate)),"0",2)
	TimeStr = sTime
End Function

'=============================================================================================
'	��������ַ���
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
'	��ʽ���ַ��� formatString("aaa","#",5)  ���� return "##aaa"
'=============================================================================================
Function FormatStr(s1,s2,iLen)
	do while Len(s1)<iLen
		s1 = s2 & s1
	loop
	FormatStr = s1
End Function
'=============================================================================================
'	�ж϶����Ƿ�Ϊempty(������JScript)
'=============================================================================================
Function IsEmptyJ(s)
	IsEmptyJ = IsEmpty(s)
End Function
'=============================================================================================
'	ת�����ַ�	(������JScript)
'=============================================================================================
Function CstrJ(s)
	if IsEmpty(s) then
		CstrJ = ""
	else
		CstrJ = Cstr(s)
	End if
End Function


