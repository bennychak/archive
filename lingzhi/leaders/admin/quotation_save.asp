<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
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

<!--#include file="includes/config.asp"--> 
<%call isLogin%>

<%
dim ID,sql,table,msg,returnPage
dim values,items,fieldstr,valuestr
ID=request("ID")
returnPage=request("returnPage")
userID=request("userID")
table=request("table")

If isNE(table) or isempty(request.form()) Then
	response.Write "错误!表单为空或参数不全!"
	response.end
End if

Guest=request("Guest")
If isNE(Guest) Then
	Guest=0
End if
'---正则判断---
dim reg,pattern,rement
Set reg=new RegExp
'不区分大小写的
reg.IgnoreCase=true
'搜索整个字符串
reg.Global=True
reg.Pattern="basic_(.+?)"

If ID="" Then
	for each items in request.form
		values=request.form(items)
		if reg.test(items) and values<>"" Then
			values = Replace(values,"'","''")
			fieldstr=fieldstr&",["&reg.replace(items,"$1")&"]"
			valuestr=valuestr&",'"&values&"'"
		end if
	next
	set reg=nothing
	fieldstr=delOtherChar(fieldstr)
	valuestr=delOtherChar(valuestr)
	valuestr=server.HTMLEncode(valuestr)
	sql="insert into "&table&" ([Guest],InDate,"&fieldstr&") values("&Guest&",now(),"&valuestr&")"
	
'保存编辑
else
	If isNE(ID)  Then
		response.Write "错误!参数不全!"
		set reg=nothing
		response.end
	End if

	for each items in request.form
		values=request.form(items)
		values = Replace(values,"'","''")
		if reg.test(items) then
			valuestr=valuestr&reg.replace(items,"$1")&"='"&values&"',"
		end if
	next
	valuestr=delOtherChar(valuestr)
	valuestr=server.HTMLEncode(valuestr)
	sql="update "&table&" set "&valuestr&",[Guest]="&Guest&" where id="&ID
end if
'response.Write sql
'response.end
conn_access.execute(sql)

If isNE(ID) Then
	sql="select top 1 ID from "&table&" order by InDate Desc"
	ID=cint(conn_access.Execute (sql)(0))
End If

If request("next") = "1" Then
	returnPage = "quotation_products_list.asp?QuotationID="&ID
	msgCode = 8
Else
	msgCode = 0
End If

'如果是订单的报价单
If not isNE(request("basic_OrderID")&"") Then
	' 添加产品
	sql = "insert into QuotationProducts(QuotationID,ProductID,NewPrice,QDescription) "
	sql = sql&"select "&ID&" as QuotationID,ID as ProductID,Price as NewPrice,QDescription from Products "
	sql = sql&"where ID in(select ProductID from OrderProducts where OrderID="&request("basic_OrderID")&")"
	conn_access.Execute (sql)
	' 添加用户权限
	sql = "insert into QuotationLevel(MemberID,QuotationID,Status) values("&userID&","&ID&",0)"
	conn_access.Execute (sql)
	
	'修改订单状态
	sql = "update Orders set Status=2 where ID="&request("basic_OrderID")
	conn_access.Execute (sql) 
End If

call msgPage(msgCode,"gourl",returnPage,3)
%>

