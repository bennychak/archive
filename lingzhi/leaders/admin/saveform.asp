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
table=request("table")

If isNE(table) or isempty(request.form()) Then
	response.Write "错误!表单为空或参数不全!"
	response.end
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
	sql="insert into "&table&" ("&fieldstr&") values("&valuestr&")"
	
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
			valuestr=valuestr&"["&reg.replace(items,"$1")&"]='"&values&"',"
		end if
	next
	valuestr=delOtherChar(valuestr)
	valuestr=server.HTMLEncode(valuestr)
	sql="update "&table&" set "&valuestr&" where id="&ID
end if
'response.Write sql
'response.end
set reg=nothing
conn_access.execute(sql)
call msgPage(0,"gourl",returnPage,2)
%>
