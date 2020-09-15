<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
'┎────────────────────────────┒
'┃　　　　 ※EASY CMS企业网站管理系统V1.0 final   　　　　┃
'┣━━━━━━┯━━━━━━━━━━━━━━━━━━━━━┫
'┃　作    者　│陈文杰　　　　　　　　　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　最后修改　│2005年1月1日16:02:17  　　　　　　　　　　┃
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
'┃广州中山大道上社棠雅苑    		 2004年12月30日23:27:29┃
'┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
%>

<!--#include file="../admin/includes/config.asp"-->
<!--#include file="../admin/includes/systemsg.asp"--> 
<!--#include file="../admin/includes/md5.asp"--> 

<%
dim sql,rs,table
dim userCode,userPassword,reUserPassword
dim values,items,fieldstr,valuestr

userCode=request("LoginId")
userCode=LCase(userCode)

userPassword=request("re_UserPassword")
reUserPassword=request("UserPassword")

table="members"

If isempty(request.form()) Then
	response.Write "错误!表单为空或参数不全!"
	response.end
End if

'检查用户名
sql="select count(0) from "&table&" where LoginId='"&userCode&"'"
If cint(conn_access.Execute (sql)(0))>0 Then
	webMessage_cn(0)=replace(webMessage_cn(0),"{userCode}",usercode)
	call msgPage(0,"back","register.asp",-1)
End if

'密码处理
If userPassword<>reUserPassword Then	
	call msgPage(1,"back","register.asp",-1)
else
	userPassword=md5(userPassword)
End if


'---正则判断---
dim reg,pattern,rement
Set reg=new RegExp
'不区分大小写的
reg.IgnoreCase=true
'搜索整个字符串
reg.Global=True
reg.Pattern="basic_(.+?)"

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
sql="insert into "&table&" ("&fieldstr&",[UserPassword],[loginId]) values("&valuestr&",'"&userPassword&"','"&userCode&"')"

'response.Write sql
'response.end
conn_access.execute(sql)
call msgPage(2,"gourl","default.asp",2)


%>