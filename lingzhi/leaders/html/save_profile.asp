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
'┃广州中山大道上社棠雅苑    		 2005年1月1日17:29:00  ┃
'┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
%>

<!--#include file="../admin/includes/config.asp"-->
<!--#include file="../admin/includes/systemsg.asp"--> 
<!--#include file="../admin/includes/md5.asp"--> 

<%
dim sql,rs,table,returnPage
dim userCode,userPassword,reUserPassword
dim values,items,fieldstr,valuestr

userCode=request("LoginId")
userCode=LCase(userCode)

userPassword=request("re_UserPassword")
reUserPassword=request("UserPassword")
returnPage=request("returnPage")


table="members"

If isempty(request.form()) Then
	response.Write "错误!表单为空或参数不全!"
	response.end
End if

'密码处理
If NOT (isNE(userPassword) AND isNE(reUserPassword)) Then
	If userPassword<>reUserPassword Then	
		call msgPage(1,"back","register.asp",-1)
	else
		userPassword=md5(userPassword)
		valuestr="[UserPassword]='"&userPassword&"',"
	End if

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
	values = Replace(values,"'","''")
	if reg.test(items) then
		valuestr=valuestr&"["&reg.replace(items,"$1")&"]='"&values&"',"
	end if
next
set reg=nothing
fieldstr=delOtherChar(fieldstr)
valuestr=delOtherChar(valuestr)
valuestr=server.HTMLEncode(valuestr)

sql="update "&table&" set "&valuestr&" where LoginId='"&session("userCode")&"'"

'response.Write sql
'response.end
conn_access.execute(sql)
call msgPage(6,"gourl",returnPage,2)


%>