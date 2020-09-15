<%
call CheckAdmin()

Dim oUploadStream,oTempStream
Class CJ_Upload

	Public	Version,Form,File,Err,Description,Charset
	Private m_TotalBytes,m_Count,m_Path,m_LimitExt,m_LimitExtMode,m_MaxBytes
	Private biPostData,biBoundary,bCrlf

	Public Property Get TotalBytes(): TotalBytes = m_TotalBytes :End Property
	
	Public Property Get Count(): Count= m_Count :End Property
		
	Public Property Get Path(): Path = m_Path :End Property	
	Public Property Let Path(vln)
	Dim x
		if trim(vln)<>"" then m_Path = trim(vln)
		For each x in File
		  File(x).Path = m_Path
		Next
	End Property
	
	Public Property Get LimitExt(): LimitExt = m_LimitExt :End Property	
	Public Property Let LimitExt(vln)
	Dim x
		if trim(vln)<>"" then m_LimitExt = trim(vln)
		For each x in File
		  File(x).LimitExt = m_LimitExt
		Next
	End Property
	
	Public Property Get LimitExtMode(): LimitExtMode = m_LimitExtMode :End Property
	Public Property Let LimitExtMode(vln)
	Dim x
		if trim(vln)<>"" then m_LimitExtMode = trim(vln)
		For each x in File
		  File(x).LimitExtMode = m_LimitExtMode
		Next
	End Property
	
	Public Property Get MaxBytes(): MaxBytes = m_MaxBytes :End Property	
	Public Property Let MaxBytes(vln)
	Dim x
		if trim(vln)<>"" then m_MaxBytes = vln
		For each x in File
		  File(x).MaxBytes = m_MaxBytes
		Next
	End Property
	
	Private Sub Class_Initialize
	
		If Instr(Request.ServerVariables("CONTENT_TYPE"),"multipart/form-data")>0 then
			
			Version = "Chris.J ASP Upload Script v2.2"
						
			Set Form = Server.CreateObject ("Scripting.Dictionary")
			    Form.CompareMode = 1
			Set File = Server.CreateObject ("Scripting.Dictionary")
			    File.CompareMode = 1
			    
			Set oUploadStream = Server.CreateObject ("ADODB.Stream")	
		    Set oTempStream	  = Server.CreateObject ("ADODB.Stream")
		    	
			Charset         = "gb2312"
			Err             = -1
			Description	    = "正常状态"
			bCrLf           = ChrB(13) & ChrB(10)
			
			m_LimitExtMode  = "allow"
			m_LimitExt      = "*"
			m_MaxBytes      = -1
			m_Count         = 0

			m_Path = Left(Request.ServerVariables("PATH_TRANSLATED"),InStrRev(Request.ServerVariables("PATH_TRANSLATED"),"\")-1)
	
			m_TotalBytes = Request.TotalBytes	
					
			SplitData()
					
		Else
			
			Err = 100
			Description="提交表单的MIME编码非multipart/form-data类型."
					
		end if
	End Sub
	
	Private Function getPostData()
		
		oUploadStream.Type = 1
		oUploadStream.Mode = 3
		oUploadStream.Open 
		oUploadStream.Write Request.BinaryRead(TotalBytes)
		oUploadStream.Position = 0
		biPostData=oUploadStream.Read	
		
	End Function
	
	Private	Function SplitData()
	
		Dim iPosBegin,iPosMiddle,iPosEnd,iLenBoundary
		Dim sFormInfo,sFormItem,sValue,sTemp,sUserFileName
		Dim oFileInfo,arrFormInfo,arrTemp
	
		getPostData()
		    
		biBoundary=LeftB(biPostData,InStrB(1,biPostData,bCrLf)-1)		
		iLenBoundary=LenB(biBoundary)
				
		iPosBegin=iLenBoundary+2						
		
		Do	
			
			m_Count=m_Count+1								
		    	iPosMiddle = InStrB(iPosBegin,biPostData,bCrLf & bCrLf)+3	
		   	iPosEnd	   = InStrB(iPosMiddle,biPostData,biBoundary)-1		
				
		    	oTempStream.Type     = 1
		    	oTempStream.Mode     = 3
		    	oTempStream.open
		    	  oUploadStream.position = iPosBegin
		    	  oUploadStream.CopyTo oTempStream,iPosMiddle-iPosBegin
		    	oTempStream.Position = 0
		    	oTempStream.Type     = 2
		    	oTempStream.CharSet  = Charset

		    	sFormInfo  = oTempStream.ReadText				
		    	arrFormInfo= Split(sFormInfo,Chr(13)&Chr(10))			
		    	arrTemp	   = Split(arrFormInfo(0),";")				
		    	sTemp	   = Trim(Split(arrTemp(1),"=")(1))			
							
		    	Execute "sFormItem=" & sTemp
		    							
				'文件	
		    	If Ubound(arrFormInfo)>2 and Instr(arrFormInfo(0),"filename=""")>0 then
							
		    		Set oFileInfo = new CJFile
							
		    		'=========================上传文件的信息=========================================================
							
		    		oFileInfo.iPosBegin  = iPosMiddle				
		    		oFileInfo.TotalBytes = iPosEnd-iPosMiddle-2		
		    		oFileInfo.FormItem   = sFormItem				
								
		    		if UBound(arrTemp)>1 then
			    		sTemp=Trim(Split(arrTemp(2),"=")(1))
			    		Execute "sUserFileName=" & sTemp
			    		
			    		oFileInfo.UserFileName = sUserFileName					
			    		oFileInfo.FileName     = Mid(sUserFileName,InStrRev(sUserFileName,"\")+1)	
			    		oFileInfo.FileExt      = Mid(sUserFileName,InStrRev(sUserFileName,".")+1)
		    		end if
								
		    		oFileInfo.ContentType = Trim(Split(arrFormInfo(1),":")(1))		
								
		    		'================================================================================================
	
		    		oFileInfo.Path			= m_Path
		    		oFileInfo.LimitExt		= m_LimitExt
		    		oFileInfo.LimitExtMode	= m_LimitExtMode
		    		oFileInfo.MaxBytes		= m_MaxBytes	
	
		    		'================================================================================================
				
					'保存文件信息
				
		    		if not File.Exists(sFormItem) then File.add sFormItem,oFileInfo
							
		    		Set oFileInfo=nothing
	
		    	Else   '表单项目
					
		    		oTempStream.Close
		    		oTempStream.Type=1
		    		oTempStream.Mode=3
		    		oTempStream.open
		    		  oUploadStream.position=iPosMiddle
		    		  oUploadStream.CopyTo oTempStream,iPosEnd-iPosMiddle-2
		    		oTempStream.Position = 0
		    		oTempStream.Type = 2
		    		oTempStream.CharSet = Charset
		    		
		    		sValue=oTempStream.ReadText																						'当前表单项目的值
				
					'保存项目信息		
		    		if not Form.Exists(sFormItem) then
		    			Form.add sFormItem,sValue
		    		else
		    			Form(sFormItem)=Form(sFormItem) & "," & sValue
		    		end if
						
		    	End if
					
		    	oTempStream.Close
		
			iPosBegin = iPosEnd+iLenBoundary+2	
				
		Loop Until (iPosBegin+2) >= TotalBytes		

	End Function
	
	Public Function ClearError()
		Err = -1
		Description	= "正常状态"
	End Function

	Private Sub Class_Terminate()
	
		Form.RemoveAll:Set Form = Nothing
		File.RemoveAll:Set File = Nothing
		
		if oUploadStream.state=1 then oUploadStream.Close
		Set oTempStream   = Nothing
		if oUploadStream.state=1 then oUploadStream.Close
		Set oUploadStream = Nothing
				
		biPostData = ""
		
	End Sub

End Class

'===========================================================
'文件类:提供已上传文件的文件信息
'===========================================================

Class CJFile

	Public  Err,Description
	Private	m_Path,m_LimitExt,m_LimitExtMode,m_MaxBytes,m_FileName,m_FileExt
	Public 	FormItem,UserFileName,ContentType,TotalBytes	
	Public	iPosBegin
	
	Public Property Get Binary()
		oUploadStream.Position = iPosBegin
		Binary = oUploadStream.Read(TotalBytes)
	End Property
	
	Public Property Get FileName():	FileName = m_FileName :End Property
	Public Property Let FileName(vln)
		if trim(vln)<>"" then m_FileName = trim(vln)
	End Property	
	
	Public Property Get FileExt():	FileExt = m_FileExt :End Property
	Public Property Let FileExt(vln)
		if trim(vln)<>"" then m_FileExt = trim(vln)
	End Property
	
	Public Property Get Path(): Path = m_Path :End Property	
	Public Property Let Path(vln)
		if trim(vln)<>"" then m_Path = trim(vln)
	End Property

	Public Property Get LimitExt(): LimitExt = m_LimitExt :End Property	
	Public Property Let LimitExt(vln)
		if trim(vln)<>"" then m_LimitExt = trim(vln)
	End Property

	Public Property Get LimitExtMode(): LimitExtMode = m_LimitExtMode :End Property
	Public Property Let LimitExtMode(vln)
		if trim(vln)<>"" then m_LimitExtMode = trim(vln)
	End Property

	Public Property Get MaxBytes(): MaxBytes = m_MaxBytes :End Property	
	Public Property Let MaxBytes(vln)
		if trim(vln)<>"" then m_MaxBytes = vln
	End Property
	
	Public Function IsValid()
	Dim bPass
        bPass = false 
	    if CheckFileSize then
			if LimitExt="" then
				bPass = true
			elseif FileExt<>"" then
				select case lcase(LimitExtMode)
				case "allow","1",1
					if LimitExt = "*" then
					   bPass=true
					elseif InStr(lcase(LimitExt),lcase(FileExt))>0 then
					   bPass=true
					else
					   Err = 300
					   Description = "上传文件格式仅支持 " & LimitExt & " 格式!"
					end if
				case "deny","0",0
					if LimitExt = "*" then
					   Err = 800
					   Description = "禁止上传任何文件!"
					elseif InStr(lcase(LimitExt),lcase(FileExt))>0 then
					   Err = 400
					   Description = "禁止上传文件格式为 " & LimitExt & " 的文件!"
					else
					   bPass=true
					end if
				case else
					Err = 500
					Description = "未设置文件后缀的校验模式!"
				end select
			else
				Err = 600
				Description = "无上传文件!"
			end if
	    end if
	IsValid=bPass
	End Function
	
	Public Function CheckFileSize()
	
		if MaxBytes = -1 Then
			CheckFileSize=true
		elseIf TotalBytes = 0 Then
			CheckFileSize=true
			Err = 700
			Description = "上传的文件为空文件!"
		elseif TotalBytes<=MaxBytes then
			CheckFileSize=true
		else
			CheckFileSize=false
			Err = 200
			Description = "上传的文件过大,系统仅允许上传 " & FormatNumber(MaxBytes/(1024*1024),2) & "M 的文件!"
		end if
	
	End Function

	Public Function ClearError()
		Err = -1
		Description	= "正常状态"
	End Function
		
	'保存
	Public Function Save()

		if Right(Path,1)<>"\" then Path=Trim(Path)&"\"
		SaveAs Path & FileName

	End Function
	
	'另存
	Public Function SaveAs(sSaveAsPath)
	
		oTempStream.Type = 1
		oTempStream.Mode = 3
		oTempStream.Open
		  oUploadStream.Position = iPosBegin
		  oUploadStream.CopyTo oTempStream,TotalBytes
		oTempStream.SaveToFile sSaveAsPath,2
		oTempStream.Close
	  
	End Function
	
	Private Sub Class_Initialize
		Err = -1
	End Sub
	
End Class

Sub CheckAdmin()
  if session("AdminName")="" or session("UserName")="" or session("AdminPurview")="" or session("LoginSystem")<>"Succeed" then
     response.write "您还没有登录或登录已超时，请<a href='AdminLogin.asp' target='_parent'><font color='red'>返回登录</font></a>!"
     response.end
  end if
End Sub
%>