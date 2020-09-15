<%
'┎────────────────────────────┒
'┃　　　　 ※EASY CMS企业网站管理系统V1.0 final   　　　　┃
'┣━━━━━━┯━━━━━━━━━━━━━━━━━━━━━┫
'┃　作    者　│陈文杰　　　　　　　　　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　最后修改　│2004年12月25日20:40:51　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　        　│EMAIL:chenwenj@gmail.com　　　　　　　　　┃
'┃　联系方式　│MSN  :oking@live.com  　　　　　　　　　　┃
'┃　　　　　　│QQ   :168909　ICQ:45318946　　　　　　　　┃
'┃　　　　　　│http://kingchan.net       　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　　　　　　│　　　　　　　　　　　　　　　　　　　　　┃
'┃　记    事　│　　　　　　　　　　　　　　　　　　　　　┃
'┃　　　　　　│　　　　　　　　　　　　　　　　　　　　　┃
'┣━━━━━━┷━━━━━━━━━━━━━━━━━━━━━┫
'┃南京汉中门大街康怡花园汉佳办事处　2004年12月25日10:24:11┃
'┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
%>

<%
' 发送者名，主题，内容，接收地址，接收人名
Sub sendMail(fromName, subject, mailBody, recipient, recipientMan, mailType)
	from=mailNoteRecipient
	
	set JMail=Server.CreateOBject( "JMail.Message")

	
	JMail.Logging = true
	JMail.silent = true
	
	'邮件字符集，默认为"US-ASCII"
	JMail.Charset = "utf-8" 
	
	'是否进行ISO编码，默认为True
	'JMail.ISOEncodeHeaders = False
	
	'发送html邮件
	If mailType = "html" then
		JMail.ContentType = "text/html; charset=UTF-8"
	End If	
	
	' 身份验证
	JMail.MailServerUserName = mailUserName ' 身份验证的用户名
	JMail.MailServerPassword = mailPassword ' 身份验证的密码
	
	' 设置优先级，范围从1到5，越大的优先级越高，3为普通
	JMail.Priority = 3
	
	'JMail.AddHeader "Originating-IP", Request.ServerVariables("REMOTE_ADDR")
	
	'response.Write from
	
	JMail.From = from
	JMail.FromName = fromName
	
	'加入一个收件人"变量email：收件人地址"
	'可以同一语句重复加入多个
	'response.Write recipient
	recipient = trim(recipient)
	mailArray=split(recipient,";")		
	num=UBound(mailArray,1)	
	For i=0 to num
		mail = trim(mailArray(i))
		JMail.AddRecipient mail,recipientMan
	Next
	
	JMail.Subject = subject
	JMail.Body = mailBody
	
	if not JMail.Send(smtpServer) then
		dim mailError
		mailError = "<pre>" & JMail.log & "</pre>"
		response.Write mailError
	end if
	
	set JMail=nothing
End Sub

Function getIP() 
	Dim strIPAddr 
	If Request.ServerVariables("HTTP_X_FORWARDED_FOR") = "" OR InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), "unknown") > 0 Then 
	strIPAddr = Request.ServerVariables("REMOTE_ADDR") 
	ElseIf InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ",") > 0 Then 
	strIPAddr = Mid(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), 1, InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ",")-1) 
	ElseIf InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ";") > 0 Then 
	strIPAddr = Mid(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), 1, InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ";")-1) 
	Else 
	strIPAddr = Request.ServerVariables("HTTP_X_FORWARDED_FOR") 
	End If 
	getIP = Trim(Mid(strIPAddr, 1, 30)) 
End Function 


Function mainNote(title, msg)
		fromName=mailNoteFromName
		from=mailUserName
		mailBody=msg
		subject=title
		recipient=mailNoteRecipient
		recipientMan=mailNoteRecipientMan
		
		set jMail=Server.CreateOBject( "JMail.Message")
		JMail.Logging = true
		JMail.silent = true
		
		'邮件字符集，默认为"US-ASCII"
		'JMail.Charset = "gb2312" 
		'是否进行ISO编码，默认为True
		'JMail.ISOEncodeHeaders = False
		
		' 身份验证
		JMail.MailServerUserName = mailUserName ' 身份验证的用户名
		JMail.MailServerPassword = mailPassword ' 身份验证的密码
		
		' 设置优先级，范围从1到5，越大的优先级越高，3为普通
		JMail.Priority = 3
		
		'JMail.AddHeader "Originating-IP", Request.ServerVariables("REMOTE_ADDR")
		
		'response.Write from
		
		JMail.From = from
		JMail.FromName = fromName
		
		'加入一个收件人"变量email：收件人地址"
		'可以同一语句重复加入多个
		'response.Write recipient
		
		JMail.AddRecipient recipient,recipientMan
		
		JMail.Subject = subject
		JMail.Body = mailBody
		
		if not JMail.Send(smtpServer) then
			dim mailError
			mailError = "<pre>" & JMail.log & "</pre>"
			response.Write mailError
		end if
		
		set JMail=nothing	
End Function

'************************
'生成唯一编号
'格式"年月日编号"
'编号为缺省为三位数
'************************
Function createID(id)
	dim t,ts,d,y,tmpid,lastnum
	y=year(now)
	t=month(now)
	d=day(now)
	if t<10 then t="0" & t
	if d<10 then d="0" & d

	lastnum=id
	If IsNumeric(lastnum) Then
		tmpid=lastnum+1
	else
		tmpid=1
	End if
	
	If tmpid<1000 Then
		tmpid="0"&tmpid
	End if

	If tmpid<100 Then
		tmpid="0"&tmpid
	End if

	If tmpid<10 Then
		tmpid="0"&tmpid
	End if
	tmpid=""&tmpid

	ts=y&t&d
	If IsNull(id) Then
		createID=ts&"0001"
	else
		createID=ts&tmpid
	End if
End Function

Function getURL(URLEncode)
	dim thisPage,thisPath
	thisPath=Request.ServerVariables("URL")
	thisPage=split(thisPath,"/")(ubound(split(thisPath,"/")))
	If Request.ServerVariables("Query_String")<>"" Then
		getURL=thisPage & "?" & Request.ServerVariables("Query_String")
	else
		getURL=thisPage
	End if

	If URLEncode Then
		getURL=Server.URLEncode(getURL)
	End if
End Function

Function getURLPara(URLEncode)
	url_str = getURL(false) 
	if instr(url_str,"?") then
		str=split(url_str,"?")(1)
		If URLEncode Then
			getURLPara=Server.URLEncode(str)
		else
			getURLPara=str
		End if
	End if
End Function

'************************
'删除字串中多余的逗号
'************************
Function delOtherChar(str)
	If str="" Then exit function
	If InStrRev(str,",")=len(str) Then			
		str=mid(str,1,len(str)-1)
	End if

	If instr(str,",")=1 Then
		str=mid(str,2,len(str))
	End if
	delOtherChar=str
End Function

'************************
'删除分类函数
'************************
Function delCategory(resultArray)
	dim sql,rows,resultSub,rowNum
	rowNum=ubound(resultArray,2)
	For rows=0 to rowNum
		sql = "select ID,[Image] from Category where ParentID="&resultArray(0,rows)&" order by id"
		set resultSub=server.CreateObject("adodb.recordset")
		resultSub.open sql,conn_access,1,1
		
		If resultSub.RecordCount>0 Then
			delCategory(resultSub.GetRows())
		End if
		
		'删除分类图片
		'If NOT isNE(resultArray(1,rows)) Then
		'	delFile(Server.Mappath("../"&categoryImagePath&resultArray(1,rows)))
		'End if

		'删除产品
		delProductInCategory(resultArray(0,rows))
		
		sql="delete from Category where ID="&resultArray(0,rows)
		conn_access.Execute (sql) 
		

		resultSub.close
		set resultSub=nothing
	Next
End Function

'************************
'从分类中删除产品函数
'************************
Function delProductInCategory(categoryID)
	dim rs,sql,rsPacking
	set rs=Server.CreateObject("Adodb.Recordset")
	set rsPacking=Server.CreateObject("Adodb.Recordset")

	sql="select Simage,Bimage,ID from Products where CategoryID="&categoryID
	rs.open sql,conn_access,1,1
	While(NOT rs.eof)
		'删除缩略图
		If NOT isNE(rs("Simage")) Then
			delFile(Server.Mappath("../"&productImagePath&rs("Simage")))
		End if
		'删除大图
		If NOT isNE(rs("Bimage")) Then
			delFile(Server.Mappath("../"&productImagePath&rs("Bimage")))
		End if

		'删除包装图
		'sql="select [Image] from Packing where ProductID="&rs("ID")
		'rsPacking.open sql,conn_access,1,1
		'While(NOT rsPacking.eof)
		'	delFile(Server.Mappath("../"&productImagePath&rsPacking("Image")))
		'	rsPacking.MoveNext
		'Wend
		'rsPacking.close
		
		rs.MoveNext
	Wend
	rs.close

	set rs=nothing
	set rsPacking=nothing
	sql="delete from Products where CategoryID="&categoryID
	conn_access.Execute(sql)
End Function
'************************
'删除包装函数
'************************
Function delPacking(ID)
	dim rs,sql
	set rs=Server.CreateObject("Adodb.Recordset")

	sql="select image from Packing where ID="&ID
	rs.open sql,conn_access,1,1
	'删除图片
	If NOT isNE(rs("Image")) Then
		delFile(Server.Mappath("../"&productImagePath&rs("Image")))
	End if

	set rs=nothing
	sql="delete from Packing where ID="&ID
	conn_access.Execute(sql)
End Function


'************************
'删除产品函数
'************************
Function delProduct(ID)
	dim rs,sql
	set rs=Server.CreateObject("Adodb.Recordset")

	sql="select Simage,Bimage,ID from Products where ID="&ID
	
	rs.open sql,conn_access,1,1
	'删除缩略图
	If NOT isNE(rs("Simage")) Then
		delFile(Server.Mappath("../"&productImagePath&rs("Simage")))
	End if
	'删除大图
	If NOT isNE(rs("Bimage")) Then
		delFile(Server.Mappath("../"&productImagePath&rs("Bimage")))
	End if
		
	rs.close
	set rs=nothing
	sql="delete from Products where ID="&ID
	conn_access.Execute(sql)
End Function

'************************
'生成目录树(Select)
'************************
function ShowTreeMenu(resultArray,layer,abce)
	dim sql,resultSubArray,rows,output,resultSub,rowNum
	rowNum=ubound(resultArray,2)
	For rows=0 to rowNum
		abce=abce&"　┆"
		'abce=abce&"  | "
		sql = "select ID,Name from Category where ParentID="&resultArray(0,rows)&" order by id"
		set resultSub=server.CreateObject("adodb.recordset")
		resultSub.open sql,conn_access,1,1
		
		If resultSub.RecordCount>0 Then
			output=output&"<OPTION value="&resultArray(0,rows)&">"&abce&resultArray(1,rows)&"</OPTION>"&VbCrlf
			resultSubArray=resultSub.GetRows()
			
			layer=layer+1
			output=output&ShowTreeMenu(resultSubArray,layer,abce)
			layer=layer-1
		else
			output=output&"<OPTION value="&resultArray(0,rows)&">"&abce&resultArray(1,rows)&"</OPTION>"&VbCrlf
		End if

		abce=mid(abce,1,len(abce)-2)
		
		resultSub.close
		set resultSub=nothing

	Next
	
	ShowTreeMenu = output
end function

'************************
'删除文件
'************************
Function delFile(filePath)
	dim FSO
	set FSO=server.CreateObject("scripting.filesystemobject")
	if FSO.fileExists(filePath) then
		FSO.deletefile(filePath)
	end if
	set FSO=nothing
End Function


'************************
'错误页面
'************************
Sub msgPage(msg,ctype,page,delay)
	if page="" then page=Server.URLEncode(Request.ServerVariables("URL"))
	response.Redirect "message.asp?msg="&msg&"&ctype="&ctype&"&page="&page&"&delay="&delay
end Sub

'************************
'判断变量是否为空
'************************
Function isNE(str)
	isNE=isnull(str) or isempty(str) or str=""
End Function

'************************
'显示页面处理时间
'************************
Sub showProcessTime
	response.Write "页面处理时间: "&FormatNumber(timer()-pageStartTime,4,-1)&" 秒."
End Sub


'************************
'子程序名:权限验证(后台)
'************************
Sub isLogin
	If not Session("logined") Then
		response.Redirect "default.asp"
	End If
End Sub

'************************
'子程序名:权限验证(网站)
'************************
Sub memberIsLogin
	If not Session("memberlogined") Then
		call msgPage(7,"gourl","default.asp",5)
	End If
End Sub

'************************
'函数名:中文截取函数
'************************
Function substr(str,lennum)
	If len(str)<=lennum then 
		substr=str
	else
		substr=left(str,lennum)&"...."
	End If
End Function


'************************
'函数名:取得当前文件所带参数
'************************
Function getThisURL()
	 Dim strurl,str_url,i,j,search_str,result_url,str_params
	 search_str="page="
	 
	 strurl=Request.ServerVariables("URL")
	 Strurl=split(strurl,"/")
	 i=UBound(strurl,1)
	 str_url=strurl(i)'得到当前页文件名
	 
	 str_params=Request.ServerVariables("QUERY_STRING")
	 If str_params="" Then
		result_url=str_url & "?page="
	 Else
		If InstrRev(str_params,search_str)=0 Then
			result_url=str_url & "?" & str_params &"&page="
		Else
			j=InstrRev(str_params,search_str)-2
			If j=-1 Then
				result_url=str_url & "?page="
			Else
				str_params=Left(str_params,j)
				result_url=str_url & "?" & str_params &"&page="
			End If
		End If
	 End If
	 getURL=result_url
End Function

'************************
'子程序名：信息提示窗口
'功能：信息提示，并作返回或者转向
'参数：
'str 提示字符串
'stype 处理类型:Back 返回 GoUrl 转向 Close 关闭
'url 转向方向
'************************
Sub msgBox(str,stype,url)
	response.write "<script language=javascript>"
	response.write "alert('"&str&"');"
	select case stype
		case "Back"
			response.write "history.go(-1);"
		case "GoUrl"
			response.write "window.location='"&url&"'"
		case "Close"
			response.write "window.close()"
	End select
	response.write "</script>"
End Sub

'************************
'根据数组array生成选择
'type option或者radio
'name只在生成radio时有效
'************************
Function drawSelect(arrayVal,arrayIndex,stype,name,selectid,otherstr)
	dim i,tmp,str,rstr,flag
	flag=isnull(selectid)

	if ubound(arrayVal)<>ubound(arrayIndex) then 
		response.write "数值和索引值不对应!"
		exit function
		response.end
	end if

	For i=1 to UBound(arrayVal)
		tmp=""
		If not flag Then
			If arrayIndex(i)=selectid Then
				Select Case (stype) 
					Case "option" 
						tmp="selected"
					Case "radio" 
						tmp="checked"
				End Select
			End if
		End if

		Select Case (stype) 
			Case "option" str="<option "&tmp&" value="""&arrayIndex(i)&""">"&arrayVal(i)&"</option>"& vbCrLf
			Case "radio" str="<input "&tmp&" "&otherstr&" name="""&name&""" type=""radio"" value="""&arrayIndex(i)&""">"&arrayVal(i)& vbCrLf
		End Select

		If arrayVal(i)<>"" Then
			rstr=rstr&str
		End if

	Next
		If stype="option" Then
			rstr="<select name="&name&" id="&name&" "&otherstr&">"&rstr&"</select>"
		End if
		
		drawSelect=rstr
End Function


Function LicenseSN()
	dim serverName
	serverName=Request.ServerVariables("SERVER_NAME")
	dim serverIP
	serverIP=Request.ServerVariables("LOCAL_ADDR")
	dim serverPort
	serverPort=Request.ServerVariables("SERVER_PORT")
	dim serverCPUCount
	serverCPUCount=Request.ServerVariables("NUMBER_OF_PROCESSORS")
	dim sn
	sn=serverName&serverIP&serverPort&serverCPUCount
	sn=replace(sn," ","")
	LicenseSN=md5(sn)
End Function



'************************
'函数名:Html编码
'************************
function htmlencode(str)
    dim result
    dim l
    if isNULL(str) then 
       htmlencode=""
       exit function
    end if
    l=len(str)
    result=""
	dim i
	for i = 1 to l
	    select case mid(str,i,1)
	           case "<"
	                result=result+"&lt;"
	           case ">"
	                result=result+"&gt;"
               case chr(13)
	                result=result+"<br>"
	           case chr(34)
	                result=result+"&quot;"
	           case "&"
	                result=result+"&amp;"
               case chr(32)	           
	                'result=result+"&nbsp;"
	                if i+1<=l and i-1>0 then
	                   if mid(str,i+1,1)=chr(32) or mid(str,i+1,1)=chr(9) or mid(str,i-1,1)=chr(32) or mid(str,i-1,1)=chr(9)  then	                      
	                      result=result+"&nbsp;"
	                   else
	                      result=result+" "
	                   end if
	                else
	                   result=result+"&nbsp;"	                    
	                end if
	           case chr(9)
	                result=result+"    "
	           case else
	                result=result+mid(str,i,1)
         end select
     next 
     htmlencode=result
end function

'************************
'函数名：格式化字符串(Edcode)
'功能：消除HTML标记
'参数：
'fString 要处理的字符串
'************************
function HTMLEncode2(fString)
	fString = fString&""
	fString = Replace(fString, CHR(13), "")
	fString = Replace(fString, CHR(10) & CHR(10), "</P><P>")
	fString = Replace(fString, CHR(10), "<BR>")
	'fString = Replace(fString, CHR(32), "&nbsp;")
	HTMLEncode2 = fString
end function

'************************
'函数名：格式化字符串(Decode)
'功能：恢复HTML标记
'参数：
'fString 要处理的字符串
'************************
function HTMLDecode(fString)
	fString = fString&""
	fString = Replace(fString, "",CHR(13))
	fString = Replace(fString, "</P><P>",CHR(10) & CHR(10))
	fString = Replace(fString, "<BR>",CHR(10))
	'fString = Replace(fString, "&nbsp;"," ")

	HTMLDecode = fString
end Function


sub sqlInject(parameterName)
	dim sql_injdata 
	SQL_injdata = "'|and|exec|insert|select|delete|update|count|*|%|chr|mid|master|truncate|char|declare" 
	SQL_inj = split(SQL_Injdata,"|") 
	
	For SQL_Data=0 To Ubound(SQL_inj) 
		if instr(Request(parameterName),SQL_inj(SQL_Data))>0 Then 
			Response.Write "<script>alert('KK！SQL通用防注入系统提示↓nn请不要在参数中包含非法字符尝试注入！');history.back(-1)</Script>" 
			Response.end 
		end if 
	next 
end sub


%>