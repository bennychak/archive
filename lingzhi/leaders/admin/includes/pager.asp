<%
'┎────────────────────────────┒
'┃　　　　 ※EASY CMS企业网站管理系统V1.0 final   　　　　┃
'┣━━━━━━┯━━━━━━━━━━━━━━━━━━━━━┫
'┃　作    者　│陈文杰　　　　　　　　　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　最后修改　│2004年12月25日10:27:48　　　　　　　　　　┃
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
class SplitPager
	Public currPage			'当前页码
	Public recStart         '分页开始的记录位置
	Public recEnd           '分页结束的记录位置
	Public pageCount        '页数
	Public conn             '数据库连接对像
	Public perPageCount     '每页显示的记录个数
	Public recordCount      '总记录数   
	Public tableName        '表或视图名称
	Public condition        '查询条件
	Public orderBy          '排序条件
	Public rs				'得到的分页记录集
	Public URL              '当前页面的url
	Public barInfo          '翻页条
	Public solitudeSQL		'传送单独的sql语句
	Public pageInfo         '统计信息
	Private errorStr        '错误信息


	'==================================================================
	'Class_Initialize 类的初始化
	'初始化当前页的值
	'
	'==================================================================
	Private Sub Class_Initialize
		set rs=server.createobject("ADODB.Recordset")
		Call getPageQueryString
		Call getURL
	End Sub
	'==================================================================
	' 设置 Terminate 事件。
	'
	'==================================================================
	Private Sub Class_Terminate 
		On Error Resume Next
		rs.close
		Set rs=nothing
	End Sub
	'==================================================================
	'计算总页数
	'
	'==================================================================

	'存取一条sql
	Public Property Let setSolitudeSQL(sql)
		solitudeSQL = sql
	End Property

	'取得数据库连接的方法
	Public Property Let setConn(connOBJ)
		set conn = connOBJ
	End Property

	'设定每页显示记录的个数
	Public Property Let setPerPageCount(num)
		perPageCount = num
	End Property

	'设定查询的表名或视图名称
	Public Property Let setTableName(str)
		tableName = str
	End Property

	'设定查询条件
	Public Property Let setCondition(str)
		condition = " " & str
	End Property

	'设定排序依据
	Public Property Let setOrderby(str)
		orderBy = " " & str
	End Property

	'设定当前页码
	Public Property Let setCurrPage(num)
		If not isNE(num) then
			currPage = clng(num)
		else
			currPage = 1
		End If
	End Property

	'取记录集
	Public Property Get getRecordset()
		getRecord()
		set getRecordset=rs
	end Property

	'取记录集
	Public Property Get getBar()
		call buildBar
		getBar=barInfo
	end Property
	
	'取记录集(英文)
	Public Property Get getBarEN()
		call buildBarEN
		getBarEN=barInfo
	end Property

	Private Sub getPageQueryString
		dim page
		page=Request.QueryString("page")&""
		If page="" or not IsNumeric(page) Then
			page=1
		End if
		currPage=clng(page)
	End Sub


	'==================================================================
 	'判断变量是否为空
	'
	'==================================================================
	Private Function isNE(str)
		isNE=isnull(str) or isempty(str)
	End Function

	'==================================================================
	'返回记录集
	'
	'==================================================================
	Private Function getRecord()	
		If isNE(solitudeSQL) then
			If isNE(tableName) Then
				errorStr=errorStr&"没有设置操作表或者SQL语句!<br>"
			End if
			solitudeSQL="select * from "&tableName&" "&condition&" "&orderBy			
		End If

		If isNE(perPageCount) then
			errorStr=errorStr&"设有设置总每页记录笔数!<br>"	
		end if

		Call showError()

		rs.open solitudeSQL,conn_access,1,1

		If not(rs.eof and rs.bof) Then
			rs.PageSize=perPageCount'每页记录数
			recordCount=rs.Recordcount'总记录
			'计算总页数
			pageCount = abs(int(-(recordCount/perPageCount)))
			
			'检查页码合法性
			If currPage < 1 then currPage = 1
			If currPage >pageCount then currPage = pageCount

			'计算记录开始位置
			recStart = clng((currPage-1) * perPageCount)+1
			'计算记录结束位置
			recEnd = clng(recStart-1 + perPageCount)
			if recEnd > clng(recordCount) then recEnd = clng(recordCount)
			
			rs.AbsolutePage=currPage
		else
			recordCount=0
			pageCount=0
			currPage=0
			recEnd=0
			recStart=0

		End if
		
		
	End Function
 	'==================================================================
	'取得当前页面的参数
	'
	'==================================================================
	Private Sub getURL()
		dim pos
		URL = Request.ServerVariables("URL") & "?" & Request.ServerVariables("query_string")
		pos = InStrRev(URL,"&page")-1
		If pos > 0 then
			URL = mid(URL,1,pos)
		End If
		if Request.ServerVariables("query_string") = "" then
			url = Request.ServerVariables("url") & "?1=1"
		end if
	End Sub
 
	Private Sub buildBar()
		barInfo=barInfo& "页："& currPage &" / "& pageCount &" | 记录："& recStart & " - " & recEnd & " / " &recordCount
		barInfo=barInfo& " | "
		If currPage > 1 Then 
			barInfo=barInfo& "<a href="&URL&"&page=1>首页</a>&nbsp;"
			barInfo=barInfo& "<a href="&URL&"&page="&(currPage-1) & ">上页</a>&nbsp;"
		else
			barInfo=barInfo& "<font color=#CCCCCC>首页&nbsp;上页&nbsp;</font>"
			
		End If 
		
		If  pageCount > 1 and currPage <> pageCount Then 
			barInfo=barInfo& "<a href="&URL&"&page="&(currPage+1) & ">下页</a>&nbsp;"
			barInfo=barInfo& "<a href="&URL&"&page="&pageCount & ">末页</a>&nbsp;"
		else
			barInfo=barInfo& "<font color=#CCCCCC>下页&nbsp;末页&nbsp;</font>"

		End If 

	End Sub

	Private Sub buildBarEN()
		'barInfo=barInfo& "Pages:"& currPage &" / "& pageCount &" | Record:"& recStart & " - " & recEnd & " / " &recordCount
		barInfo=barInfo& "Pages:"& currPage &" / "& pageCount
		barInfo=barInfo& " | "
		If currPage > 1 Then 
			barInfo=barInfo& "<a href="&URL&"&page=1>[First Page]</a>&nbsp;"
			barInfo=barInfo& "<a href="&URL&"&page="&(currPage-1) & ">[Previous Page]</a>&nbsp;"
		else
			barInfo=barInfo& "<font color=#CCCCCC>[First Page]&nbsp;[Previous Page]&nbsp;</font>"
			
		End If 
		
		If  pageCount > 1 and currPage <> pageCount Then 
			barInfo=barInfo& "<a href="&URL&"&page="&(currPage+1) & ">[Next Page]</a>&nbsp;"
			barInfo=barInfo& "<a href="&URL&"&page="&pageCount & ">[Last Page]</a>&nbsp;"
		else
			barInfo=barInfo& "<font color=#CCCCCC>[Next Page]&nbsp;[Last Page] &nbsp;</font>"

		End If 

	End Sub


	Public Function getNRURL(ctype)

		If ctype="Pre" Then

			If currPage > 1 Then 
				getNRURL=URL&"&page="&(currPage-1)
				
			else
				getNRURL=URL&"&page="&pageCount
				
			End If 
		
		else
			If  pageCount > 1 AND currPage <> pageCount Then 
				getNRURL=URL&"&page="&(currPage+1)
			else
				getNRURL=URL&"&page=1"

			End If 
		End if
		


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