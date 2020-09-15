<%
'┎────────────────────────────┒
'┃　　　　 ※EASY CMS企业网站管理系统V1.0 final   　　　　┃
'┣━━━━━━┯━━━━━━━━━━━━━━━━━━━━━┫
'┃　作    者　│陈文杰　　　　　　　　　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　最后修改　│2005年1月3日9:29:34   　　　　　　　　　　┃
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
'┃广州中山大道棠雅苑　                2005年1月2日21:22:53┃
'┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
%>

<%
'类名：购物车类
Class Cart
	Public sessionName		'Session对像名
	Private errorStr        '错误信息

	'==================================================================
	'Class_Initialize 类的初始化
	'初始化数据
	'
	'==================================================================
	Private Sub Class_Initialize
		sessionName="sessionCart"

		If TypeName(session(sessionName))="Empty" Then
			set session(sessionName)=Server.CreateObject("Scripting.Dictionary")

		Elseif TypeName(session(sessionName))<>"Dictionary" Then
			errorStr=errorStr&"错误!Session内容不是一个Dictionary对像!"
			Call showError()
		End if
		
	End Sub
	'==================================================================
	' 设置 Terminate 事件。
	' 释放对像
	'==================================================================
	Private Sub Class_Terminate 
		On Error Resume Next
	End Sub

	'==================================================================
	'取错误信息
	'==================================================================
	Public Property Get getErrorStr()
		getErrorStr=errorStr
	End Property

	'==================================================================
	'取Dictionary对像
	'==================================================================
	Public Property Get getDictionary()
		set getDictionary=session(sessionName)
	End Property

	'==================================================================
	'取Key数组
	'==================================================================
	Public Property Get getKey()
		getKey=session(sessionName).Keys
	End Property

	'==================================================================
	'取Items数组
	'==================================================================
	Public Property Get getItem()
		set getItem=session(sessionName).Items
	End Property

	'==================================================================
	'取对应Item的数量
	'==================================================================
	Public Function getItemNumber(itemID)
		dim tmpID
		tmpID=cstr(itemID)
		getItemNumber=session(sessionName).item(tmpID)
	End Function

	'==================================================================
	'取记录笔数
	'==================================================================
	Public Function getItemsCount()
		getItemsCount=session(sessionName).count
	End Function

	'==================================================================
	'取Number总和
	'==================================================================
	Public Function getNumberCount()
		dim item		
		For each item in session(sessionName)
			'CLng CDbl
			getNumberCount=getNumberCount+CDbl(session(sessionName).item(item))
		Next
	End Function


	'==================================================================
	'添加
	'==================================================================
	Public Function addItem(ID,number)
		If session(sessionName).Exists(ID) Then
			errorStr=errorStr&"错误!此对像已经存在!"
		Else
			session(sessionName).Add ID,number
		End if
		Call showError()
	End Function
	
	'==================================================================
	'删除
	'==================================================================
	Public Function delItem(ID)
		If session(sessionName).Exists(ID) Then
			session(sessionName).Remove(ID)
		Else
			errorStr=errorStr&"错误!此对像不存在!"
		End if
	End Function

	'==================================================================
	'删除所有
	'==================================================================
	Public Function delAllItem()
		session(sessionName).RemoveAll
	End Function

	'==================================================================
	'修改
	'==================================================================
	Public Function modifyItem(ID,number)
		If session(sessionName).Exists(ID) Then
			session(sessionName).Item(ID)=number
		Else
			errorStr=errorStr&"错误!此对像不存在!"
		End if
	End Function

	'==================================================================
	'检查是否已经存在
	'==================================================================
	Public Function existsItem(ID)
		existsItem=session(sessionName).Exists(cstr(ID))
	End Function

	'==================================================================
	'列表，调试用
	'==================================================================

	Public Function listItem()
		dim item		
		For each item in session(sessionName)
			response.Write item&"->"&session(sessionName).item(item)&"<br>"
		Next

	End Function

	'==================================================================
	'判断变量是否为空
	'==================================================================
	Private Function isNE(str)
		isNE=isnull(str) or isempty(str) or str=""
	End Function

 	'==================================================================
	'错误提示
	'
	'==================================================================
	Private Sub showError()
		 If errorStr <> "" Then
			  call Class_Terminate
			  Response.Write("" & errorStr & "")
			  Response.End
		 End If
	End Sub

End Class
%>