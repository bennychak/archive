<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
'┎────────────────────────────┒
'┃　　　　 ※EASY CMS企业网站管理系统V1.0 final   　　　　┃
'┣━━━━━━┯━━━━━━━━━━━━━━━━━━━━━┫
'┃　作    者　│陈文杰　　　　　　　　　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　最后修改　│2004年12月25日22:09:46　　　　　　　　　　┃
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
'┃广州天河中山大道棠雅苑          　   2005年1月8日9:35:53┃
'┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
%>

<!--#include file="../admin/includes/config.asp"--> 
<!--#include file="../admin/includes/fileup.asp" -->

<%
dim id,sql,rs,table
dim values,items,fieldstr,valuestr
dim imageFileName
dim multipartForm

Set multipartForm = new FileUp

'限制上传文件大小
multipartForm.GetData (upLoadImageSize)
'设置上传类型的黑名单
multipartForm.AllowExt="jpg;gif;png;bmp"
response.end
table="Purchasing"

'上传小图
If multipartForm.Form("has_image") Then
	imageFileName=multipartForm.AutoSave("purchasingImage",Server.Mappath("../"&purchasingImagePath)&"\")
	If multipartForm.iserr Then 
		response.Write multipartForm.errmessage
		response.end
	End If
Else
End if

'---正则判断---
dim reg,pattern,rement
Set reg=new RegExp
'不区分大小写的
reg.IgnoreCase=true
'搜索整个字符串
reg.Global=True
reg.Pattern="basic_(.+?)"

for each items in multipartForm.Form
	values=multipartForm.Form(items)
	
	'response.Write items&"->"&values&"<br>"
	
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
sql="insert into "&table&" ("&fieldstr&",[Image],UserId) values("&valuestr&",'"&imageFileName&"',"&session("userID")&")"

set multipartForm=nothing
set reg=Nothing
response.write sql
conn_access.execute(sql)
call msgPage(10,"gourl","default.asp",5)

%>
